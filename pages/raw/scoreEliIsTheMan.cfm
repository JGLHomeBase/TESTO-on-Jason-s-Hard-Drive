<cfinclude template="#AbsoluteURL#legos/head.cfm">

<!-- Get Comp Info --->
<cfquery name="getComp">
SELECT compID, compLongName
FROM comp
WHERE compID = <cfqueryparam value="#SESSION.compID#">    
</cfquery>
<!---/ Get Comp Info --->
    
<!--- Get Applicant List --->
<cfquery name="getAppList">
SELECT compapp.appName, 
     compapp.compAppID,
     compapp.projectID,
     agency.agencyName,
     compapp.fundAward,
     compapp.fundReq,
     compapp.reportID,
     comp.aprDefaultID,
     projects.projectLongName
FROM compapp
    INNER JOIN projects ON compapp.projectID = projects.projectID
    INNER JOIN agency ON projects.agencyID = agency.agencyID
    INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
    INNER JOIN comp ON compapp.compID = comp.compID
WHERE compapp.active = '1'
  AND compapp.compID = <cfqueryparam value="#SESSION.compID#">
  ORDER BY projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC
</cfquery>
<!---/ Get Applicant List --->
    
<!--- Get Applicant Info --->
<cfparam name="URL.app" default="#getAppList.compAppID#">
<cfquery name="getApp">
SELECT compapp.appName, 
     compapp.compAppID,
     compapp.projectID,
     agency.agencyName,
     compapp.fundAward,
     compapp.fundReq,
     compapp.reportID,
     comp.aprDefaultID,
     projects.projectLongName
FROM compapp
    INNER JOIN projects ON compapp.projectID = projects.projectID
    INNER JOIN agency ON projects.agencyID = agency.agencyID
    INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
    INNER JOIN comp ON compapp.compID = comp.compID
WHERE compAppID = <cfqueryparam value="#URL.app#">
</cfquery>
<!---/ Get Applicant Info --->

<cfquery name="getPay">
SELECT reportPayload
FROM compapp
INNER JOIN report ON compapp.reportID = report.reportID
WHERE compapp.compAppID = <cfqueryparam value="#URL.app#">
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
<cfparam name="URL.factor" default="#ListFirst(FactorList)#">
    
<!--- Get Scores --->
<cfinvoke component="knex.sortinghat"
          method="getReviewPanel"
          datasource="#datasource#"
          returnVariable="getScore">
<!---/ Get Scores --->
    
    
<cfif SESSION.authLevel GT 5>
    <!--- Unauthorized Users --->
    <div class="row">
        <div class="large-12 columns">
            <br><br>
            <div class="BGorange panel text-center">
                <h1>Woops.</h1>
                <p>You are not authorized to view this page.</p>
            </div>
        </div>
    </div>
    <!---/ Unauthorized Users --->
<cfelseif SESSION.compID EQ 0>
    <!--- No competition selected --->
     <div class="row">
        <div class="large-12 columns">
            <div class="BGorange panel text-center">
                <h1>Woops.</h1>
                <p>Please select a competition.</p>
            </div>
        </div>
    </div>
    <!---/ No competition selected --->
<cfelse>
    <!--- Authorized Users --->
    <div class="panel BGLightBlue">
        <div class="row">
            <div class="large-9 columns">
                <cfoutput>
                    <h2 class="MakeWhite">#GetApp.appName#</h2>
                </cfoutput>
            </div>
            <div class="large-3 columns text-right">
                <cfoutput>
                    <p class="MakeWhite">#SESSION.cocCity# #getComp.compLongName#</p>
                </cfoutput>
            </div>
        </div>
    </div>
    <cfoutput>
        <div class="row">
            <div class="large-12 columns">
                <div class="panel">
                    <form action="#CurrentPage#">
                        <div class="row">
                            <div class="medium-6 columns">
                                <label>Project Applicant</label>
                                <select name="app" onchange="this.form.submit()">
                                    <cfloop query="getAppList">
                                        <cfif getAppList.compAppID EQ URL.app>
                                            <cfset selected = " selected">
                                        <cfelse>
                                            <cfset selected = "">
                                        </cfif>
                                        <option value="#getAppList.compAppID#"#selected#>#getAppList.appName#</option>
                                    </cfloop>
                                </select>
                            </div>
                            <div class="medium-6 columns">
                                <label>Scoring Factor</label>
                                <select name="factor" onchange="this.form.submit()">
                                    <cfloop list="#FactorList#" index="factor">
                                        <cfquery name="getFactorName">
                                        SELECT factorLongName, factorID
                                        FROM scorefactor
                                        WHERE factorID = <cfqueryparam value="#factor#">
                                        </cfquery>
                                        <cfif getFactorName.factorID EQ URL.factor>
                                            <cfset selected = " selected">
                                        <cfelse>
                                            <cfset selected = "">
                                        </cfif>
                                        <option value="#getFactorName.factorID#"#selected#>#getFactorName.factorLongName#</option>
                                    </cfloop>
                                </select>
                            </div>
                        </div>
                    </form>
            </div>
        </div>
    </div>
    </cfoutput>
   
    <div class="row">
        <div class="large-12 columns">
            <div class="callout">
                <cfoutput>
                    <div class="row">
                        <div class="small-10 columns">
                            <h2>#getScore.factorLongName#</h2>
                        </div>
                        <div class="small-2 columns text-right">
                            <cfif Right(DecimalFormat(getScore.maxPoints),2) EQ "00">
                                <cfset MaxPoints = NumberFormat(getScore.maxPoints,"0")>
                            <cfelseif Right(DecimalFormat(getScore.maxPoints),1) EQ "0">
                                <cfset MaxPoints = NumberFormat(getScore.maxPoints,"0.0")>
                            <cfelse>
                               <cfset MaxPoints = getScore.maxPoints>
                            </cfif>
                            <h2>#MaxPoints#<small>Pts.</small></h2>
                            
                        </div>
                    </div>
                        <cfloop query="getScore">
                            <div class="row">
                                <div class="small-2 columns text-right">
                                    <h4>#getScore.userFirst# #getScore.userLast#</h4>
                                </div>
                                <div class="small-1 columns">
                                        <cfif MaxPoints NEQ 0>
                                            <cfset BarPer = NumberFormat((getScore.score/MaxPoints)*100,0)>
                                        <cfelse>
                                            <cfset BarPer = "0">
                                        </cfif>
                                        <img width="60" 
                                             height="60" 
                                             class="UserPicSmall"
src="http://www.gravatar.com/avatar/#lcase(Hash(lcase(getScore.userEmail)))#?d=#FullURL#img/profile/default100.jpg">
                                </div>
                                <div class="small-8 columns text-left">
                                    <div class="BGDarkGray">
                                     <img src="#AbsoluteURL#IMG/icons/BarBG.png"
                                          style="max-height: 60px;
                                                 width:#BarPer#%;"
                                          alt="#getScore.userFirst# #getScore.userLast#"
                                          class="scorebar">
                                    </div>
                                   
                                </div>
                                <div class="small-1 columns text-right">
                                    <form action="#AbsoluteURL#takeout/secure/score.cfm" method="post" class="scoreForm">
                                        <cfset defaultValue = getScore.score>
                                        <cfif Right(NumberFormat(defaultValue,"0.000"),3) EQ "000">
                                            <cfset defaultValue = NumberFormat(defaultValue,"0")>
                                        <cfelseif Right(DecimalFormat(defaultValue),2) EQ "00">
                                            <cfset defaultValue = NumberFormat(defaultValue,"0.00")>
                                        <cfelseif Right(DecimalFormat(defaultValue),1) EQ "0">
                                            <cfset defaultValue = NumberFormat(defaultValue,"0.0")>
                                        </cfif>
                                        <input type="hidden"
                                               name="maxValue"
                                               value="#getScore.maxPoints#"
                                               class="maxValue">
                                        <input type="number"
                                               name="Score"
                                               min="0"
                                               max="#getScore.maxPoints#"
                                               class="scoreField"
                                               value="#defaultValue#"
                                               id="#getScore.compPanelID#"
                                               required>
                                        <input type="hidden"
                                               name="compAppID"
                                               value="#URL.app#">
                                        <input type="hidden"
                                               name="compPanelID"
                                               value="#getScore.compPanelID#">
                                        <input type="hidden"
                                               name="factorID"
                                               value="#URL.factor#">
                                    </form>
                                </div>
                            </div>
                        
                        </cfloop>
                    
                </cfoutput>
            </div>
        </div>
    </div>
    
   
    <!---/ Authorized Users --->
</cfif>
    
<cfinclude template="#AbsoluteURL#legos/foot.cfm">
    
    
<cfoutput>
    <script>
    $(document).ready(function () {
        $(".scoreField").on("change", function () {
            $(this).addClass("AJAXStart");
            $.post( "#AbsoluteURL#takeout/secure/score.cfm", $(this).closest(".scoreForm").serialize() );
            var result = parseFloat(parseInt($(this).val(), 10) * 100)/ parseInt($(this).closest(".maxValue").val(), 10);
            $(this).closest(".scorebar").width(result||'');
            $(this).removeClass("AJAXStart");
        });
    });
    </script>    
</cfoutput>  