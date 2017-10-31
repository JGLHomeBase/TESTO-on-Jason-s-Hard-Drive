<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.APR" default="0">
<cfparam name="URL.type" default="0">
<cfparam name="URL.who" default="0">
<cfparam name="URL.what" default="0">
<cfparam name="URL.whaa" default="0">
<cfparam name="URL.viz" default="bar">
<cfparam name="URL.group" default="project">
<!---/ Variables --->

<!--- Security --->
<cfif SESSION.AuthLevel GT 8>
  <cflocation url="#AbsoluteURL#pages/login.cfm">
</cfif>
<!---/ Security --->


<!--- Header Row --->
<div class="hide-for-print">
    <div class="CFSmallBox">
        <div class="row">
          <div class="large-12 columns">
            <cfoutput>
                <h1 class="CFHeader"><br>
                    #AppShortName# Data Explorer
                 </h1>
            </cfoutput>
          </div>
        </div>
    </div>
</div>
<!---/ Header Row --->


<cfoutput>
<div class="panel hide-for-print">
    <!--- APR Set Menu --->
    <div class="row">
        <div class="medium-4 columns">
            &nbsp;
        </div>
        <div class="medium-2 columns">
            <cfif URL.action NEQ "glossary">
                 <a href="#CurrentPage#?action=glossary&apr=#URL.apr#&who=#URL.who#&type=#URL.type#&what=#URL.what#&whaa=#URL.whaa#" class="button small"><img src="#AbsoluteURL#img/icons/glossary.svg" width="30" alt="Print" > Glossary</a>
            <cfelse>
            &nbsp;
            </cfif>
        </div>
        <div class="medium-2 columns">
            <cfif URL.APR NEQ 0 AND URL.who NEQ 0 AND URL.what NEQ 0>
                 <a href="#CurrentPage#?action=excel&apr=#URL.apr#&who=#URL.who#&type=#URL.type#&what=#URL.what#&whaa=#URL.whaa#" class="button small"><img src="#AbsoluteURL#img/icons/xls.svg" width="30" alt="Excel" > Excel</a>
            <cfelse>
            &nbsp;
            </cfif>
        </div>
        <div class="medium-2 columns">
             <a href="javascript:window.print()" class="button small"><img src="#AbsoluteURL#fonts/svgs/fi-print.svg" width="30" alt="Print" > Print</a>
        </div>
        <div class="medium-2 columns">
            <cfif URL.action EQ "glossary">
                <a href="#CurrentPage#?&apr=#URL.apr#&who=#URL.who#&type=#URL.type#&what=#URL.what#&whaa=#URL.whaa#" class="button small"><img src="#AbsoluteURL#img/icons/explore.svg" width="30" alt="Print" > Explore</a>
            </cfif>
                <a href="##" class="button small secondary pageNavHideButton"><img src="#AbsoluteURL#img/icons/settings.svg" width="30" alt="Settings" > Hide</a>
                <a href="##" class="button small pageNavButton"><img src="#AbsoluteURL#img/icons/settings.svg" width="30" alt="Settings" class="MakeWhite" > Show</a>
        </div>
    </div>
    <div class="row pageNav">
        <cfif SESSION.cocID NEQ 0>
          <div class="medium-12 columns">
          <!--- APR Set Dropdown--->
          <!--- Get APR Set List --->
          <cfinvoke component="knex.aprSet" 
              method="get"
              DataSource = "#DataSource#"
              returnVariable = "getAPR"
                whatFields = "APRSetName, aprID"
                Join = "LCoC"
                Where = "SessionCoC">
          <!---/ Get APR Set List --->
            <cfif URL.APR EQ 0 AND getAPR.RecordCount GT 0>
                <cfif IsDefined("URL.comp")>
                    <cflocation url="#CurrentPage#?APR=#getAPR.aprID#&action=#URL.action#&comp=#URL.comp#">
                <cfelseif IsDefined("URL.agency")>
                    <cflocation url="#CurrentPage#?APR=#getAPR.aprID#&action=#URL.action#&agency=#URL.agency#">
                <cfelse>
                    <cflocation url="#CurrentPage#?APR=#getAPR.aprID#&action=#URL.action#">
                </cfif>
                
            </cfif>
            <form action="#CurrentPage#">
                  <label>Switch #SESSION.cocCity# APRs</label>
                   <select name="APR" onchange="this.form.submit()">
                       <cfif getAPR.RecordCount EQ 0>
                           <option value="0"></option>
                       </cfif>
                    <cfloop query="getAPR">
                        
                      <option value="#getAPR.aprID#" <cfif URL.APR EQ getAPR.aprID>SELECTED<cfset APRSetName = getAPR.APRSetName></cfif>>#getAPR.APRSetName#</option>
                    </cfloop>
                  </select>
                
              
            </form>
            <hr>
            <!--- APR Set Dropdown--->
            <cfif URL.apr NEQ 0>
            <!--- Data Explorer Menu --->
            <cfoutput>
                <div class="row"><div class="large-12 columns">
                <form action="#CurrentPage#" id="labform">
                    <div class="row">
                        <div class="medium-4 columns">
                                <h4>Who?</h4>
                                <cfquery name="getGroups">
                                SELECT pmGroupID, pmGroupLongName
                                FROM performgroup
                                WHERE active = '1'
                                ORDER BY pmGroupLongName
                                </cfquery>
                                <select name="who" onchange="this.form.submit()">
                                    <option value="0"></option>
                                    <cfloop query="getGroups">
                                        <cfset selected = "">
                                        <cfif getGroups.pmGroupID EQ URL.who><cfset selected = " selected"></cfif>
                                        <option value="#getGroups.pmGroupID#"#selected#>#getGroups.pmGroupLongName#</option>
                                    </cfloop>
                                </select>
                                <input type="hidden" name="APR" value="#URL.APR#">

                                <cfquery name="getComponents">
                                SELECT DISTINCT  projectcomponent.projectComponentID, projectcomponentLongName
                                FROM projectcomponent
                                LEFT JOIN projects ON projectcomponent.projectComponentID = projects.projectComponentID
                                LEFT JOIN dataapr01 ON dataapr01.projectID = projects.projectID
                                WHERE projectcomponent.active = '1'
                                    AND projects.active = '1'
                                    AND dataapr01.aprID = <cfqueryparam value="#URL.APR#">
                                ORDER BY projectComponentLongName
                                </cfquery>
                                <select name="type" onchange="this.form.submit()">
                                    <option value="0">All Component Types</option>
                                    <cfloop query="getComponents">
                                        <cfset selected = "">
                                        <cfif URL.type EQ getComponents.projectComponentID><cfset selected="  selected"></cfif>
                                            <option value="#getComponents.projectComponentID#"#selected#>#getComponents.projectComponentLongName#</option>
                                    </cfloop>
                                </select>
                        </div>
                        <div class="medium-8 columns">
                                <h4>What?</h4>
                                <cfquery name="getMeasures">
                                SELECT pmID, pmLongName
                                FROM performmeasure
                                WHERE active = '1'
                                    AND pmGroupID = <cfqueryparam value="#URL.who#">
                                    AND formatType <> <cfqueryparam value="varchar">
                                ORDER BY pmLongName
                                </cfquery>
                                <select name="what" onchange="this.form.submit()">
                                    <option value="0"></option>
                                    <cfloop query="getMeasures">
                                        <cfif Left(getMeasures.pmLongName, 32) NEQ "Answer to Supplementary Question">
                                            <cfset selected = "">
                                            <cfif getMeasures.pmID EQ URL.what><cfset selected = " selected"></cfif>
                                            <option value="#getMeasures.pmID#"#selected#>#getMeasures.pmLongName#</option>
                                        </cfif>
                                    </cfloop>
                                </select>

                                <select name="whaa" onchange="this.form.submit()">
                                    <option value="0"></option>
                                    <cfloop query="getMeasures">
                                        <cfif getMeasures.pmID NEQ URL.what AND  Left(getMeasures.pmLongName, 32) NEQ "Answer to Supplementary Question">
                                            <cfset selected = "">
                                            <cfif getMeasures.pmID EQ URL.whaa><cfset selected = " selected"></cfif>
                                            <option value="#getMeasures.pmID#"#selected#>#getMeasures.pmLongName#</option>
                                        </cfif>
                                    </cfloop>
                                </select>
                        </div>
                    </div>
                </form>
                </div></div>
            </cfoutput>
            <!---/ Data Explorer Menu --->
            </cfif>
          </div>
          
        <cfelse>
          <div class="medium-12 columns">
            <div class="text-center">First, select a community from the <i>Select a Community</i> dropdown menu above.</div>
          </div>
        </cfif>
    </div>
    <!--- APR Set Menu --->
    </div>
</cfoutput>


<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<cfif URL.action EQ "glossary">
    <div class="globalPad">
        <div class="row">
            <div class="large-12 columns">
                <cfinclude template="#AbsoluteURL#takeout/secure/pmGlossary.cfm">
            </div>
        </div>
    </div>
<cfelseif URL.action EQ "excel">
    <cflocation url="#AbsoluteURL#takeout/secure/labResults.cfm?action=excel&apr=#URL.apr#&who=#URL.who#&type=#URL.type#&what=#URL.what#&whaa=#URL.whaa#">
<cfelseif URL.APR NEQ 0 AND SESSION.cocID NEQ 0>
  
    <!--- Results --->
    <cfif URL.APR NEQ 0 AND URL.who NEQ 0 AND URL.what NEQ 0>
        <div class="globalPad">
            <div class="row">
                <div class="large-12 columns">
                    <cfinclude template="#AbsoluteURL#takeout/secure/labResults.cfm">
                </div>
            </div>
        </div>
    <cfelse>
        <div class="globalPad">
            <div class="row">
                <div class="large-12 columns">
                    <div class="panel">
                        <cfoutput>
                            <h2>Welcome to the #AppShortName# Data Explorer</h2>
                            <h4>A few notes before you jump in:</h4>
                            <p>
                                <ul>
                                    <li>Only use complete APR Sets&mdash;calculations assume entered APR data is accurate and complete for all programs in the selected reporting group.</li>
                                    <li>A reference of available calculations can be found in the <a href="#CurrentPage#?action=glossary&apr=#URL.apr#&who=#URL.who#&type=#URL.type#&what=#URL.what#&whaa=#URL.whaa#">Performance Measure Glossary</a> </li>
                                </ul>
                            </p>
                        </cfoutput>
                    </div>
                </div>
            </div>
        </div>
    </cfif>
    <!---/ Results --->
                        
   
<cfelse>
  <div class="row">
    <div class="large-12 columns text-center">
      <br><br><br>
      <h1 class="">Select an APR Data Set</h1>
      <br><br><br>
    </div>
  </div>
</cfif>





