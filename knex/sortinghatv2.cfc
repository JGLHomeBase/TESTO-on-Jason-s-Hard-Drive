<!--- 
Filename: sortinghat.cfc
Version: 1.0
--->


<cfcomponent displayname="Score" hint="Insert and update Score records" output="false">
    <!--- Post Record --->
	<cffunction name="post" access="public" description="Handles new or updated score" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compAppID" hint="ColdFusion DataSource Name" type="numeric" required="true" >
        <cfargument name="compPanelID" hint="ColdFusion DataSource Name" type="numeric" required="true" >
        <cfargument name="factorID" hint="ColdFusion DataSource Name" type="numeric" required="true" >
        <cfargument name="Score" hint="ColdFusion DataSource Name" type="numeric" required="true" default="0">
        <cfargument name="scoreNote" hint="ColdFusion DataSource Name" type="string" required="false" default="">
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
        <cfquery name="getPay">
        SELECT reportPayload
        FROM compapp
        INNER JOIN report ON compapp.reportID = report.reportID
        WHERE compapp.compAppID = <cfqueryparam value="#compAppID#">
        </cfquery>
        <cfset FactorList = "">
        <cfloop list="#getPay.reportPayload#" index="modID">
            <cfquery name="getFactorList">
            SELECT factorID
            FROM reportmod
            WHERE reportModID = <cfqueryparam value="#modID#"> AND factorID <> '0'
            </cfquery>
            <cfif getFactorList.RecordCount GT 0>
                <cfset FactorList = ListAppend(FactorList,"#getFactorList.factorID#")>
            </cfif>
        </cfloop>
        <cfloop list="#FactorList#" index="factor">
            <cfquery name="getProjectScore">
            SELECT AVG(Score) as PanelScore
            FROM score
            INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
            WHERE score.compAppID = <cfqueryparam value="#compAppID#">
                AND comppanel.scoreInclude = '1'
                AND score.factorID = <cfqueryparam value="#factor#">
            </cfquery>
            <cfif getProjectScore.PanelScore EQ "">
                <cfset IndScore = 0>
            <cfelse>
                <cfset IndScore = getProjectScore.PanelScore>
            </cfif>
            <cfset PanelScore = IndScore>
        </cfloop>
        <cfset FORM.compAppID = compAppID>
        <cfset FORM.score = PanelScore>
        <cfupdate datasource="#DataSource#" tablename="compapp" formfields="compAppID, score">
        <!---/ Update Project Score --->
            
            
        <cfreturn score>
	</cffunction>
    <!---/ Post Record --->
</cfcomponent>