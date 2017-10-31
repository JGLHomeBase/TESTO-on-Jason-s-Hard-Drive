<!--- 
Filename: sortinghat.cfc
Version: 1.0
--->


<cfcomponent displayname="Score" hint="Insert, update, and select Score records" output="true">

    <!--- Get Score and Panelist Info For Review Panel Page--->
	<cffunction name="getReviewPanel" access="public" description="Selects the panelists and their scores, for each factor on the Review Panel page" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
            
            <!--- Select Panelists and Scores --->
            <cfquery name="getScore">
            SELECT score.Score, comppanel.seat, comppanel.scoreInclude, users.userFirst, users.userLast, users.userEmail, scorefactor.factorLongName, scorefactor.factorDesc, scorefactor.maxPoints, comppanel.compPanelID
            FROM score
            INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
            INNER JOIN users on comppanel.userID = users.userID
            INNER JOIN scorefactor ON score.factorID = scorefactor.factorID
            WHERE score.compAppID = <cfqueryparam value="#URL.app#">
                AND score.factorID = <cfqueryparam value="#URL.factor#">
            ORDER BY comppanel.seat, comppanel.scoreInclude DESC, users.userLast
            </cfquery>
            <!---/ Select Panelists and Scores --->
            
        <cfreturn getScore>
	</cffunction>
    <!---/ Get Score and Panelist Info For Review Panel Page --->
                
    <!--- Get Scores by Factor and Panelist for Score Card--->
	<cffunction name="getScores" access="public" description="Selects the individual factor scores for each panelist" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="appID" hint="Identifies the compAppID of the applicant to select scores for" type="numeric" required="true" >
        <cfargument name="factorID" hint="Identifies the factorID of the factor to select scores for" type="numeric" required="true" >
        <!---/ Arguments --->
            
            <!--- Create Default Scores --->
            <cfquery datasource="#datasource#" name="getPanelists">
                SELECT compPanelID, userID
                FROM comppanel
                WHERE compID = <cfqueryparam value="#SESSION.compID#" />
              </cfquery>
            <cfloop query="getPanelists">
                <cfquery datasource="#datasource#" name="getScore">
                    SELECT score.score
                    FROM score
                    WHERE compAppID =  <cfqueryparam value="#appID#" /> AND factorID = <cfqueryparam value="#factorID#" / > AND compPanelID = <cfqueryparam value="#getPanelists.compPanelID#" />
                  </cfquery>
                <cfif getScore.RecordCount EQ 0>
                    <cfset defaultvalue = "0">
                    <!--- Score Scales --->
                    <cfquery datasource="#DataSource#" name="getFactor">
                    SELECT scaled, pmID FROM scorefactor WHERE factorID = <cfqueryparam value="#factorID#" />
                    </cfquery>
                    <cfif getFactor.scaled EQ 1>
                        <cfset AppPtScore = 0>
                        <cfquery name="getScales">
                                SELECT * FROM scorescale
                                WHERE factorID = <cfqueryparam value="#factorID#" />
                                ORDER BY minValue ASC
                                </cfquery>
                        <cfquery name="getPMInfo">
                                SELECT comp.aprDefaultID, compapp.projectID
                                FROM compapp
                                INNER JOIN comp ON comp.compID = compapp.compID
                                WHERE compapp.compAppID = <cfqueryparam value="#app#" />
                                </cfquery>
                                <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#getPMInfo.aprDefaultID#"
                                                  project="#getPMInfo.projectID#"
                                                  pm="#getFactor.pmID#"
                                                  returnvariable="pm">
                        <cfloop query="getScales">
                            <cfif getScales.minValue LTE pm.value>
                                <cfset AppPtScore = NumberFormat(getScales.ptScore) />
                            </cfif>    
                        </cfloop>
                    </cfif>
                    <!---/ Score Scales --->
                    <cfif getFactor.scaled EQ 1>
                        <cfset defaultValue = AppPtScore />
                    </cfif>
                    <cfinvoke component="knex.sortinghat"
                      method="post"
                      DataSource = "#DataSource#"
                      compAppID = "#appID#"
                      compPanelID = "#getPanelists.compPanelID#"
                      factorID = "#factorID#"
                      score = "#defaultvalue#" />
                </cfif>
            </cfloop>
            <!---/ Create Default Scores ---->
            
            <!--- Select Panelists and Scores --->
            <cfquery name="getScores">
                SELECT score.score, score.comppanelID, score.scoreNote, comppanel.scoreInclude
                FROM score
                INNER JOIN comppanel ON score.comppanelID = comppanel.comppanelID
                WHERE compAppID =  <cfqueryparam value="#appID#"> AND factorID = <cfqueryparam value="#factorID#"> AND compID = <cfqueryparam value="#SESSION.compID#" />
                ORDER BY comppanel.seat
            </cfquery>
            <!---/ Select Panelists and Scores --->
                
            
        <cfreturn getScores>
	</cffunction>
    <!---/ Get Scores by Factor and Panelist for Score Card --->
                
    <!--- Get Average Panel Score for a Factor--->
	<cffunction name="getPanelAvg" access="public" description="Selects the average panel score for a factor, by applicant" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="appID" hint="Identifies the compAppID of the applicant to select scores for" type="numeric" required="true" >
        <cfargument name="factorID" hint="Identifies the factorID of the factor to select scores for" type="numeric" required="true" >
        <!---/ Arguments --->
            
            <!--- Select Panelists and Scores --->
            <cfquery name="getPanelAvg">
                SELECT AVG(score.score) as panelAvg
                FROM score
                INNER JOIN comppanel ON score.comppanelID = comppanel.comppanelID
                WHERE compAppID =  <cfqueryparam value="#appID#"> AND factorID = <cfqueryparam value="#factorID#"> AND comppanel.scoreInclude = "1"
            </cfquery>
            <!---/ Select Panelists and Scores --->
            
        <cfreturn getPanelAvg>
	</cffunction>
    <!---/ Get Average Panel Score for a Factor --->
                
    <!--- Get Total Panelist Score --->
	<cffunction name="getPanelistScore" access="public" description="Selects the total score for a single project, for a panelist" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compAppID" hint="ID of applicant whose score is being calculated" type="numeric" required="true" >
        <!---/ Arguments --->
            
            <!--- Select List of Modules --->
                 <cfquery name="getPayload">
                      SELECT report.reportPayload AS modList
                      FROM report
                      RIGHT JOIN compapp ON report.reportID = compapp.reportID
                      WHERE compapp.compappID = <cfqueryparam value="#compAppID#">
                 </cfquery> 
            <!---/ Select List of Modules --->
            <!--- Select Total Score --->     
                 <cfquery name="getScore">
                      SELECT SUM(Score) as Score
                      FROM score
                      INNER JOIN comppanel ON comppanel.compPanelID = score.compPanelID
                      INNER JOIN users ON users.userID = comppanel.userID
                      INNER JOIN scorefactor ON score.factorID = scorefactor.factorID
                      INNER JOIN reportmod ON score.factorID = reportmod.factorID
                      WHERE score.compAppID = <cfqueryparam value="#compAppID#">
                          AND comppanel.userID = <cfqueryparam value="#SESSION.userID#">
                          AND reportmod.reportModID IN (<cfqueryparam value="#getPayload.modList#" list="true">)
                 </cfquery>
            <!---/ Select Total Score --->
            
        <cfreturn getScore>
	</cffunction>
    <!---/ Get Total Panelist Score --->
    
    <!--- Get Total Panelist Scores for Score Card --->
	<cffunction name="getPanelTotals" access="public" description="Selects the total score for a single project, for a panelist" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compAppID" hint="ID of applicant whose score is being calculated" type="numeric" required="true" >
        <cfargument name="compPanelID" hint="ID of panelists for whom to calculate total scores" type="numeric" required="true" >
        <!---/ Arguments --->
    
        <!--- Get List of Report Modules --->
        <cfinvoke component="knex.reports"
                  method="get"
                  datasource="#datasource#"
                  returnVariable="getReport"
                  whatFields="report.reportPayload AS modList, compapp.compAppID AS compAppID"
                  Join="compapp"
                  Where="thisApp">
        <!---/ Get List of Report Modules --->
    
        <!--- Get Total Scores --->        
                <cfquery name="getPanelTotals">
                    SELECT SUM(score) AS panelTotal
                    FROM score
                    JOIN scorefactor ON score.factorID = scorefactor.factorID
                    JOIN reportmod ON scorefactor.factorID = reportmod.factorID 
                    WHERE compPanelID = <cfqueryparam value="#compPanelID#"> AND compAppID = <cfqueryparam value="#compAppID#"> AND reportmod.reportModID IN (<cfqueryparam value="#getReport.modList#" list="true">)
                </cfquery>  
        <!---/ Get Total Scores --->  
            
        <cfreturn getPanelTotals>
	</cffunction>
    <!---/ Get Total Panelist Scores for Score Card --->                    
                     
    <!--- Get Total Project Score --->
	<cffunction name="getProjectScore" access="public" description="Selects the total competition score for a single applicant" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compAppID" hint="ID of applicant whose score is being calculated" type="numeric" required="true" >
        <!---/ Arguments --->
            
            <!--- Select Total Score --->     
                 <cfquery name="getProjectScore">
                      SELECT score
                      FROM compapp
                      WHERE compapp.compAppID = <cfqueryparam value="#compAppID#">
                 </cfquery>
            <!---/ Select Total Score --->
            
        <cfreturn getProjectScore>
	</cffunction>
    <!---/ Get Total Project Score --->    
                     
    <!--- Get Average Score by Component Type --->
	<cffunction name="getTypeAvg" access="public" description="Selects the average score on a factor for a project component type" output="true" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="factorID" hint="ID of factor to get an average score for" type="numeric" required="true" >
        <cfargument name="componentID" hint="ID of project component type to get an average score for" type="numeric" required="true" >
        <!---/ Arguments --->
            
            <!--- Select Avg Score --->     
            <cfquery name="getTypeAvg">
                SELECT AVG(score.score) AS typeAvg
                FROM score
                INNER JOIN comppanel ON score.comppanelID = comppanel.comppanelID
                JOIN compapp ON score.compAppID = compapp.compAppID
                JOIN projects ON compapp.projectID = projects.projectID
                WHERE score.factorID = <cfqueryparam value="#factorID#"> AND comppanel.scoreInclude = "1" AND projects.projectComponentID = <cfqueryparam value="#componentID#">
            </cfquery>
            <!---/ Select Avg Score --->
            
        <cfreturn getTypeAvg>
	</cffunction>
    <!---/ Get Average Score by Component Type --->    

    <!--- Post Record --->
	<cffunction name="post" access="public" description="Handles new or updated score, when entered by a panelist" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compAppID" hint="ID of the Applicant being scored" type="numeric" required="true" >
        <cfargument name="compPanelID" hint="ID of the panelist who is scoring" type="numeric" required="true" >
        <cfargument name="factorID" hint="ID of the factor being scored" type="numeric" required="true" >
        <cfargument name="Score" hint="ColdFusion DataSource Name" type="numeric" required="true" default="0">
        <cfargument name="scoreNote" hint="Note entered by the panelist" type="string" required="false" default="">
        <!---/ Arguments --->
            
        <cfquery name="getMax">
        SELECT maxPoints
        FROM scorefactor
        WHERE factorID = <cfqueryparam value="#factorID#">
        </cfquery>    
        
        <!--- Check for Record --->
        <cfquery name="getScore">
        SELECT * FROM score
        WHERE compAppID = <cfqueryparam value="#compAppID#">
            AND compPanelID = <cfqueryparam value="#compPanelID#">
            AND factorID = <cfqueryparam value="#factorID#">
        </cfquery>
        <!---/ Check for Record --->
        
        <!--- Add Record --->
        <cfset FORM.compAppID = compAppID>
        <cfset FORM.compPanelID = compPanelID>
        <cfset FORM.factorID = factorID>
        <cfif Score GT getMax.maxPoints>
             <cfset FORM.Score = getMax.maxPoints>
        <cfelse>
             <cfset FORM.Score = Score>
        </cfif>
        <cfset FORM.scoreNote = scoreNote>
        <cfif getScore.RecordCount EQ 1>
            <cfset FORM.scoreID = getScore.scoreID>
            <cfupdate datasource="#DataSource#" tablename="score" formfields="scoreID, compAppID, compPanelID, factorID, Score, ScoreNote">
        <cfelse>
            <cfinsert datasource="#DataSource#" tablename="score" formfields="compAppID, compPanelID, factorID, Score, ScoreNote">
        </cfif>
        <!---/ Add Record --->
            
        <!--- Update Project Score --->
        <cfset PanelScore = 0>
        <cfquery name="getPayload">
        SELECT report.reportPayload AS modList
        FROM report
        RIGHT JOIN compapp ON report.reportID = compapp.reportID
        WHERE compapp.compappID = <cfqueryparam value="#compAppID#">
        </cfquery> 
            
        <cfquery name="getFactors">
        SELECT DISTINCT score.factorID
        FROM score
        INNER JOIN scorefactor ON score.factorID = scorefactor.factorID
        INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
        INNER JOIN reportmod ON score.factorID = reportmod.factorID
        WHERE score.compAppID = <cfqueryparam value="#compAppID#"> AND reportmod.reportModID IN (<cfqueryparam value="#getPayload.modList#" list="true">)
        </cfquery>
        <cfloop query="getFactors">
            <cfquery name="getProjectScore">
            SELECT AVG(Score) as PanelScore
            FROM score
            INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
            WHERE score.compAppID = <cfqueryparam value="#compAppID#">
                AND comppanel.scoreInclude = '1'
                AND score.factorID = <cfqueryparam value="#getFactors.factorID#">
            </cfquery>
            <cfif getProjectScore.PanelScore EQ "">
                <cfset NewScore = 0>
                    <cfelse>
                        <cfset NewScore = getProjectScore.PanelScore>
                            </cfif>
            <cfset PanelScore = PanelScore+NewScore>
        </cfloop>
        <cfset FORM.compAppID = compAppID>
        <cfset FORM.score = NumberFormat(PanelScore,"0.000")>
        <cfupdate datasource="#DataSource#" tablename="compapp" formfields="compAppID, score">
        <!---/ Update Project Score --->
            
            
        <cfreturn score>
	</cffunction>
    <!---/ Post Record --->

    <!--- Update Comp Scores --->
	<cffunction name="scoreComp" access="public" description="Updates the total panel score for each applicant in a competition, outside of panelist scoring" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compID" hint="ID of the competition whose scores you want to update" type="numeric" required="true" >
        <!---/ Arguments --->   
        
        <!--- Update Competition Scores --->

        <cfquery name="getPayload">
        SELECT report.reportPayload AS modList, compapp.compAppID AS compAppID
        FROM report
        RIGHT JOIN compapp ON report.reportID = compapp.reportID
        WHERE compapp.compID = <cfqueryparam value="#compID#">
        </cfquery>
        <cfloop query ="getPayload">
        <cfset PanelScore = 0>
            <cfquery name="getFactors">
            SELECT DISTINCT score.factorID
            FROM score
            INNER JOIN scorefactor ON score.factorID = scorefactor.factorID
            INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
            INNER JOIN reportmod ON score.factorID = reportmod.factorID
            WHERE score.compAppID = <cfqueryparam value="#getPayload.compAppID#"> AND reportmod.reportModID IN (<cfqueryparam value="#getPayload.modList#" list="true">)
            </cfquery>

        <cfloop query="getFactors">
                <cfquery name="getProjectScore">
                SELECT AVG(Score) as PanelScore
                FROM score
                INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
                WHERE score.compAppID = <cfqueryparam value="#getPayload.compAppID#">
                    AND comppanel.scoreInclude = '1'
                    AND score.factorID = <cfqueryparam value="#getFactors.factorID#">
                </cfquery>
                    <cfif getProjectScore.PanelScore EQ "">
                        <cfset NewScore = 0>
                            <cfelse>
                                <cfset NewScore = getProjectScore.PanelScore>
                                    </cfif>
                    <cfset PanelScore = PanelScore+NewScore>       
        </cfloop>
                <cfset FORM.compAppID = #getPayload.compAppID#>
                <cfset FORM.score = #NumberFormat(PanelScore,"0.000")#>
                <cfupdate datasource="#DataSource#" tablename="compapp" formfields="compAppID, score">
        </cfloop>
        <!---/ Update Competition Scores --->
            
            
        <cfreturn scoreComp>
	</cffunction>
    
    <!---/ Update Comp Scores --->
</cfcomponent>