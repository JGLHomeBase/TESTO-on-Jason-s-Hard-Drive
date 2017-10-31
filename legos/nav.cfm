<!--- Switch Scope --->
<cfif URL.action EQ "cocswitch" AND SESSION.usercocID EQ 0>
    <cfparam name="URL.coc" default="0">
    <cfset SESSION.cocID = URL.coc>
    <cfquery name="getCoC">
        SELECT *
        FROM coc
        WHERE
            active = '1' AND
            coc.cocID = <cfqueryparam value="#URL.coc#">
    </cfquery>                  
    <cfset SESSION.cocLongName = getCoC.cocLongName>
    <cfset SESSION.cocName = getCoC.cocName>
    <cfset SESSION.cocCity = getCoC.cocCity>
    <cfset SESSION.cocState = getCoC.cocState>
    <cfset SESSION.compID = 0>
    <cfset SESSION.agencyID = 0>
    <cfset SESSION.projectID = 0>
<cfelseif URL.action EQ "compswitch" AND SESSION.usercompID EQ 0>
    <cfparam name="comp" default="0">
    <cfset SESSION.compID = URL.comp>
    <!--- Get Comp --->
    <cfquery name="getComp">
        SELECT compLongName, compName 
        FROM comp 
        WHERE compID = <cfqueryparam value="#URL.comp#">
    </cfquery>
    <!---/ Get Comp --->
        <cfset SESSION.compLongName = getComp.compLongName>
        <cfset SESSION.compName = getComp.compName>
        <cfset SESSION.agencyID = 0>
        <cfset SESSION.projectID = 0>
<cfelseif URL.action EQ "agencyswitch" AND SESSION.useragencyID EQ 0>
    <cfparam name="agency" default="0">
    <cfset SESSION.agencyID = URL.agency>
    <!--- Get Agency --->
    <cfinvoke component="knex.agency" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAgencies"
            whatFields = "agencyLongName, agencyName"
            Where = "ThisAgency">
    <!---/ Get Agency --->
        <cfset SESSION.agencyLongName = getAgencies.agencyLongName>
        <cfset SESSION.agencyName = getAgencies.agencyName>
        <cfset SESSION.projectID = 0>
<cfelseif URL.action EQ "projectswitch" AND SESSION.userprojectID EQ 0>
    <cfparam name="project" default="0">
    <cfset SESSION.projectID = URL.project>
    <!--- Get Project --->
    <cfinvoke component="knex.projects" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjects"
            whatFields = "projectLongName, projectName"
            Where = "ThisProject">
    <!---/ Get Project --->
    <cfset SESSION.projectLongName = getProjects.projectLongName>
    <cfset SESSION.projectName = getProjects.projectName>
    <cfif getProjects.ProjectName EQ "">
        <cfset SESSION.projectName = getProjects.projectLongName>
    </cfif>
</cfif>
<!---/ Switch Scope --->

<!--- Top Bar Navigation --->
<cfif (not listContainsNoCase("print,share", url.action))>
    <cfoutput>
        <!--- Top Bar --->
        <div class="top-bar hide-for-print" id="main-menu">
            <!--- Collapsed Menu --->
            <div class="top-bar-title">
                <span data-responsive-toggle="responsive-menu" data-hide-for="large">
                  <button class="menu-icon dark" type="button" data-toggle></button>
                </span>
                <!--- App Logo --->
                <a href="#AbsoluteURL#">
                    <img src="#AbsoluteURL#img/icons/icon_door_shadow50.png" width="35">
                    <span class="presto">#AppShortName#</span>
                </a>
                <!---/ App Logo --->
            </div>
            <!---/ Collapsed Menu --->
            <!--- Expanded Menu --->
            <div id="responsive-menu">
                <!--- Left Side Menu --->
                
                <cfif SESSION.authLevel LT 5>
                
                <div class="top-bar-left">
                  <ul class="menu vertical medium-horizontal" data-responsive-menu="drilldown medium-dropdown">
                      <!--- Authenticated Users --->
					  <cfif SESSION.authLevel LT 10>
                        <!--- Panelists --->
                        <cfif SESSION.authLevel EQ 7>
                            <li>
                                <a href="#AbsoluteURL#pages/secure/scoreHome.cfm">
                                    #SESSION.cocCity# :: #SESSION.compName#
                                </a>
                            </li>
                        </cfif>
                        <!---/ Panelists --->
                          
                        <!--- Non-Panelists --->
                        <cfif SESSION.authLevel NEQ 7>
                            <!--- CoC --->
                                <!--- CoC Label Only --->
                                <cfif SESSION.authLevel GT 5>
                                    <li>
                                      #SESSION.cocCity#
                                    </li>
                                </cfif>
                                <!---/ CoC Label Only --->
                                <!--- CoC Menu --->
                                <cfif SESSION.authLevel LTE 5>
                                    <li>
                                      <a href="##">
                                          <cfif SESSION.cocID EQ 0>
                                              <i class="fi-web"></i> <i>All Communities</i>
                                            <cfelse>
                                                #Left(SESSION.cocCity, 20)#<cfif Len(SESSION.cocCity) GT 20>&hellip;</cfif>
                                            </cfif>
                                        </a>
                                      <ul class="menu vertical">
                                        <cfif SESSION.usercocID EQ 0>
                                            <cfif SESSION.cocID EQ 0>
                                                <li><label>Select a Community</label></li>
                                            <cfelse>
                                                <li><label>Switch Communities</label></li>
                                            </cfif>
                                            <!--- Get CoC --->
                                            <cfinvoke component="knex.cocs" 
                                                    method="get"
                                                    DataSource = "#DataSource#"
                                                    returnVariable = "getCoC"
                                                    whatFields = "coc.cocCity, coc.cocID"
                                                    Where = "Active"
                                                    Order = "coc.cocName">
                                            <!---/ Get CoC --->										
                                            <cfloop query="getCoC">
                                                <cfif SESSION.cocID NEQ getCoC.cocID>
                                                    <li><a href="#CurrentPage#?action=cocswitch&coc=#cocID#">#cocCity#</a></li>
                                                </cfif>
                                            </cfloop>
                                            <cfif SESSION.cocID NEQ 0>
                                                <li>
                                                    <a href="#CurrentPage#?action=cocswitch&coc=0">
                                                        <i class="fi-web"></i> All Communities
                                                    </a>
                                                </li>
                                            </cfif>
                                        </cfif>
                                        <li><label>Manage Communities</label></li>
                                        <cfif SESSION.cocID NEQ 0>
                                            <li>
                                                <a href="#AbsoluteURL#pages/secure/cocs.cfm?coc=#SESSION.cocID#">
                                                   Community Settings
                                                </a>
                                            </li>
                                        </cfif>
                                        <li>
                                            <a href="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
                                                <cfif SESSION.usercocID EQ 0>Manage Communities</cfif>
                                            </a>
                                        </li>
                                      </ul>
                                    </li>
                                </cfif>
                                <!---/ CoC Menu --->
                            <!---/ CoC --->
                            <cfif SESSION.cocID NEQ 0>
                                <!--- Comp ---->
                                <li>
                                    <a href="##">
                                      <cfif SESSION.compID EQ 0>
                                            <i>Competition</i>
                                        <cfelse>
                                            #Left(SESSION.compName, 15)#<cfif Len(SESSION.compName) GT 15>&hellip;</cfif>
                                        </cfif>
                                    </a>
                                    <ul class="menu vertical">
                                        <cfif SESSION.compID NEQ 0>
                                            <li><label>Competition Info</label></li>
                                            <li>
                                                <a href="#AbsoluteURL#pages/secure/scoreHome.cfm">
                                                    Panelist Instructions
                                                </a>
                                            </li>
                                        </cfif>
                                        <cfif SESSION.usercompID EQ 0>
                                            <!--- Get Comp --->
                                            <cfinvoke component="knex.comp" 
                                                    method="get"
                                                    DataSource = "#DataSource#"
                                                    returnVariable = "getCompList"
                                                    whatFields = "compName, compID"
                                                    Where = "ThisCoC">
                                            <!---/ Get Comp --->
                                            <cfif SESSION.compID EQ 0 AND getCompList.RecordCount GT 0>
                                                <li><label>#SESSION.cocCity# Agencies</label></li>
                                            <cfelseif getCompList.RecordCount GT 1>
                                                <li><label>Switch Competitions</label></li>
                                            </cfif>
                                            <cfloop query="getCompList">
                                                <cfif SESSION.compID NEQ getCompList.compID>
                                                    <li><a href="#CurrentPage#?action=compswitch&comp=#compID#">#compName#</a></li>
                                                </cfif>
                                            </cfloop>
                                        </cfif>
                                        <cfif SESSION.authLevel LTE 3>
                                            <li><label>Manage Competitions</label></li>
                                            <cfif SESSION.compID NEQ 0>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/raw/scoreEliIsTheMan.cfm" target="_blank">
                                                       Review Panel
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/comp.cfm?comp=#SESSION.compID#">
                                                        Competition Settings
                                                    </a>
                                                </li>
                                            </cfif>
                                             <cfif SESSION.userCompID EQ 0>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/comp.cfm?action=list">
                                                       Manage Competitions
                                                    </a>
                                                </li>
                                            </cfif>
                                        </cfif>
                                    </ul>
                                </li>
                                <!---/ Comp ---->
                                        
                                <!--- Agency ---->
                                <cfif SESSION.authLevel LTE 5>
                                    <li class="has-submenu">
                                        <a href="##">
                                            <cfif SESSION.agencyID EQ 0>
                                                <i>Agency</i>
                                            <cfelse>
                                                <cfif SESSION.projectID EQ 0>
                                                    <cfset navComp = SESSION.agencyName>
                                                <cfelse>
                                                    <cfset navComp = "#SESSION.projectName# :: #SESSION.agencyName#">
                                                </cfif>
                                                    #Left(navComp, 15)#<cfif Len(navComP) GT 15>&hellip;</cfif>
                                            </cfif>
                                        </a>
                                        <ul class="menu vertical">
                                            <cfif SESSION.useragencyID EQ 0>
                                                <!--- Get Agency --->
                                                <cfinvoke component="knex.agency" 
                                                        method="get"
                                                        DataSource = "#DataSource#"
                                                        returnVariable = "getAgencies"
                                                        whatFields = "agencyName, agencyID"
                                                        Where = "ThisCoC"
                                                        Order="agencyName">
                                                <!---/ Get Agency --->
                                                <!--- Current Agency --->
                                                 <cfif SESSION.agencyID NEQ 0>
                                                    <li><label>Current Agency</label></li>
                                                     <li class="has-submenu">
                                                       <a href="##">
                                                           #SESSION.agencyName# Projects
                                                        </a>
                                                        <ul class="menu vertical">
                                                            <cfif SESSION.userprojectID EQ 0>
                                                                    <!--- Get Project --->
                                                                    <cfinvoke component="knex.projects" 
                                                                            method="get"
                                                                            DataSource = "#DataSource#"
                                                                            returnVariable = "getProjects"
                                                                            whatFields = "projectName, projectID, projectLongName"
                                                                            Where = "ActiveCoCAgency">
                                                                    <!---/ Get Project --->
                                                                    <cfif getProjects.RecordCount EQ 0 AND SESSION.userprojectID EQ 0>
                                                                        <li>
                                                                            <a href="#AbsoluteURL#pages/secure/projects.cfm?action=new">
                                                                                <i>No Projects Found</i>
                                                                            </a>
                                                                        </li>
                                                                    </cfif>
                                                                    <cfif SESSION.projectID NEQ 0>
                                                                        <li><label>Current Project</label></li>
                                                                        <li>
                                                                            <a href="##">#SESSION.projectName# </a>
                                                                        </li> 
                                                                    </cfif>
                                                                    <li><label><cfif SESSION.projectID NEQ 0>Switch </cfif> #SESSION.agencyName# Projects</label></li>
                                                                    <cfloop query="getProjects">
                                                                        <cfif SESSION.projectID NEQ getProjects.projectID>
                                                                            <li>
                                                                                <a href="#CurrentPage#?action=projectswitch&project=#projectID#">
                                                                                    <cfif getProjects.projectName NEQ "">
                                                                                        #getProjects.projectName#
                                                                                    <cfelse>
                                                                                        #getProjects.projectLongName#
                                                                                    </cfif>
                                                                                </a>
                                                                            </li>
                                                                        </cfif>
                                                                    </cfloop>
                                                                <cfif SESSION.projectID NEQ 0 AND SESSION.userprojectID EQ 0>
                                                                    <li><a href="#CurrentPage#?action=projectswitch&project=0">View All</a></li>
                                                                </cfif>
                                                                <cfif SESSION.authLevel LTE 5>
                                                                    <li><label>Manage</label></li>
                                                                    <cfif SESSION.userprojectID EQ 0>
                                                                        <li>
                                                                             <a href="#AbsoluteURL#pages/secure/projects.cfm?action=new">
                                                                                Add Project
                                                                            </a>
                                                                        </li>
                                                                    </cfif>
                                                                    <li>
                                                                        <a href="#AbsoluteURL#pages/secure/projects.cfm?action=list">
                                                                            <cfif SESSION.userprojectID EQ 0>Manage Projects<cfelse>Project Settings</cfif>
                                                                        </a>
                                                                    </li>
                                                               </cfif>
                                                            </cfif>
                                                        </ul>
                                                    </li>
                                                </cfif>
                                                <!---/ Current Agency --->
                                                <cfif SESSION.agencyID EQ 0 AND getAgencies.RecordCount GT 0>
                                                    <li><label>#SESSION.cocCity# Agencies</label></li>
                                                <cfelseif getAgencies.RecordCount GT 1>
                                                    <li><label>Switch Agencies</label></li>
                                                </cfif>
                                                <!--- Toggle Sub Menus --->
                                                <cfif getAgencies.RecordCount LTE 6>
                                                    <!--- <=6 Agencies --->
                                                    <cfloop query="getAgencies">
                                                        <cfif SESSION.agencyID NEQ getAgencies.agencyID>
                                                            <li><a href="#CurrentPage#?action=agencyswitch&agency=#agencyId#">#agencyName#</a>
                                                            </li>
                                                        </cfif>
                                                    </cfloop>
                                                    <!---/ <=6 Agencies --->
                                                <cfelse>
                                                    <!--- <6 Agencies --->
                                                    <cfset AgencyGroupMaxSize = 7>
                                                    <cfset AgencyGroupCount = Ceiling(getAgencies.RecordCount/AgencyGroupMaxSize)>
                                                    <cfset AgencyGroupStart = 1>
                                                    <cfset AgencyGroupEnd = AgencyGroupMaxSize>
                                                    <cfloop index="AgencyGroup" from="1" to="#AgencyGroupCount#">
                                                        <cfif AgencyGroupEnd GT getAgencies.RecordCount>
                                                            <cfset AgencyGroupEnd = getAgencies.RecordCount>
                                                        </cfif>
                                                        <li class="has-submenu">
                                                            <a href="##">
                                                                Agencies <i>#Left(getAgencies.agencyName["#AgencyGroupStart#"],2)#</i>
                                                                &mdash; <i>#Left(getAgencies.agencyName["#AgencyGroupEnd#"],2)#</i>
                                                            </a>
                                                            <ul class="submenu menu vertical" data-submenu>
                                                                <cfloop query="getAgencies" startRow="#AgencyGroupStart#" endRow="#AgencyGroupEnd#">
                                                                    <cfif SESSION.agencyID NEQ getAgencies.agencyID>
                                                                        <li><a href="#CurrentPage#?action=agencyswitch&agency=#agencyId#">#agencyName#</a>
                                                                        </li>
                                                                    </cfif>
                                                                </cfloop>
                                                            </ul>
                                                        </li>
                                                        <cfset AgencyGroupStart = AgencyGroupStart+AgencyGroupMaxSize>
                                                        <cfset AgencyGroupEnd = AgencyGroupEnd+AgencyGroupMaxSize>
                                                    </cfloop>
                                                    <!---/ <6 Agencies --->
                                                </cfif>
                                                <!---/ Toggle Sub Menus --->
                                                <cfif SESSION.agencyID NEQ 0 AND SESSION.useragencyID EQ 0>
                                                    <li><a href="#CurrentPage#?action=agencyswitch&agency=0">View All</a></li>
                                                </cfif>
                                            </cfif>
                                            <cfif SESSION.authLevel LTE 5>
                                                <li><label>Manage</label></li>
                                                <cfif SESSION.authLevel LTE 3>
                                                    <li>
                                                        <a href="#AbsoluteURL#pages/secure/agency.cfm?action=list">
                                                            <cfif SESSION.userAgencyID EQ 0>Manage Agencies<cfelse>Agency Settings</cfif>
                                                        </a>
                                                    </li>
                                                </cfif>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/projects.cfm?action=list">
                                                        <cfif SESSION.userprojectID EQ 0>Manage Projects<cfelse>Project Settings</cfif>
                                                    </a>
                                                </li>
                                            </cfif>
                                        </ul>
                                    </li>
                                </cfif>
                                <!---/ Agency ---->
                                
                            </cfif>
                        </cfif>
                        <!---/ Non-Panelists --->
                        
                        <!--- All Authenticated Users --->
                            <!-- Access Check --->
                            <cfif SESSION.authLevel LT 3 OR SESSION.cocID NEQ 0>
                                <!--- Reports --->
                                <cfif SESSION.authLevel LTE 7>
                                    <li class="has-submenu">
                                        <a href="##">
                                           <i class="fi-graph-trend"></i> Reports
                                        </a>
                                        <ul class="submenu menu vertical" data-submenu>
                                            <cfif SESSION.authLevel LTE 5>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/reports.cfm?action=list">
                                                        Manage Reports
                                                    </a>
                                                </li>
                                            </cfif>
                                            <cfif SESSION.cocID NEQ 0>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/lab.cfm">
                                                        Data Explorer
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/lab.cfm?action=glossary&apr=0&who=0&type=0&what=0&whaa=0">
                                                        Performance Measure Glossary
                                                    </a>
                                                </li>
                                            </cfif>
                                        </ul>
                                    </li>
                                </cfif>
                                <!---/ Reports --->



                                <!--- Data ---->
                                <cfif SESSION.authLevel LTE 5>
                                <li class="has-submenu">
                                    <a href="##">
                                        <i class="fi-list-number"></i> Data
                                    </a>
									<cfif SESSION.authLevel LTE 5>
                                    <ul class="submenu menu vertical" data-submenu>
                                        <li><label>Data Entry</label></li>
                                        <li>
                                            <a href="#AbsoluteURL#pages/secure/dataentry.cfm?action=list">
                                                Data Entry Tool
                                            </a>
                                        </li>
										<li><label>Data Sets</label></li>
                                        <li>
                                            <a href="#AbsoluteURL#pages/secure/aprset.cfm?action=list">
                                                Manage APR Sets
                                            </a>
                                        </li>
                                    </ul>
									</cfif>
                                </li>
                                </cfif>
                                <!---/ Data ---->

                                <!--- Settings ---->
                                <cfif SESSION.authLevel LTE 3>
                                    <li class="has-submenu">
                                        <a href="##">
                                            <i class="fi-widget"></i> Admin
                                        </a>
                                        <ul class="submenu menu vertical" data-submenu>

                                            <li><label>Manage Users</label></li>
                                            <li>
                                                <a href="#AbsoluteURL#pages/secure/users.cfm?user=0">
                                                    Add User
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#AbsoluteURL#pages/secure/users.cfm?action=list">
                                                    Manage Users
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#AbsoluteURL#pages/secure/users.cfm?action=monitor">
                                                    Active Users
                                                </a>
                                            </li>
                                            <cfif SESSION.authLevel LTE 1>

                                                 <!--- Performance Measurement Settings --->
                                                <li><label>Performance Measurement Settings</label></li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/performCat.cfm?action=list">
                                                        Performance Categories
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/performGroup.cfm?action=list">
                                                        Measurement Groups
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/performMeasure.cfm?action=list">
                                                       Performance Measures
                                                    </a>
                                                </li>
                                                   <li><label>#AppShortName# Settings</label></li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/component.cfm?action=list">
                                                        Program Components
                                                    </a>
                                                </li>
                                                <!---/ Performance Measurement Settings --->
                                                <li><label>Database Structure</label></li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/table.cfm?action=list">
                                                        Manage Tables
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/field.cfm?action=list">
                                                        Manage Fields
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#AbsoluteURL#pages/secure/table.cfm?code=0">
                                                        Code Snippets
                                                    </a>
                                                </li>
                                            </cfif>
                                        </ul>
                                    </li>
                                </cfif>
                                <!---/ Settings ---->
                            </cfif>
                            <!---/ Access Check --->  
                            <!--- User Menu (Small Screens) --->
                            <cfif SESSION.authLevel LT 10>
                                <li class="hide-for-large">
                                  <a href="##">
                                         &nbsp;&nbsp;
                                        <img width="35" 
                                             height="35" 
                                             class="UserPicSmall"
                                             src="https://www.gravatar.com/avatar/#lcase(Hash(lcase(SESSION.userEmail)))#?d=#FullURL#img/profile/default75.jpg" 
                                             alt="#SESSION.userFirst# #SESSION.userLast#">
                                        #SESSION.userFirst#
                                    </a>
                                  <ul class="menu vertical">
                                      <li><label>Signed-in as #SESSION.userFirst# #SESSION.userLast#</label></li>
                                    <li>
                                        <a href="#CurrentPage#?action=logout">
                                            Logout
                                        </a>
                                    </li>
                                    <li><label>Account Settings</label></li>
                                    <li>
                                        <a href="#AbsoluteURL#pages/secure/users.cfm?user=#SESSION.userID#">
                                            Update Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#AbsoluteURL#pages/login.cfm?action=reset">
                                            Change Password
                                        </a>
                                    </li>
                                  </ul>
                                </li>
                            </cfif>						
                            <!---/ User Menu (Small Screens) --->
                        <!---/ All Authenticated Users --->
                        <!--- God Mode (BETA MENU) ---->
                        <cfif SESSION.authLevel LT 1>
                            <li class="has-submenu">
                                <a href="##">
                                    <i class="fi-cloud"></i>
                                </a>
                                <ul class="submenu menu vertical" data-submenu>
                                    <li><label>God Menu</label></li>
                                    <!--- Settings --->
                                    <li><label>Application Settings</label></li>
                                    <li>
                                        <a href="#AbsoluteURL#pages/secure/appSettings.cfm?action=list">
                                            #AppShortName# Settings
                                        </a>
                                    </li>
                                    <!---/ Settings --->
                                    <!--- Surveys --->
                                    <li><label>Survey</label></li>
                                    <li>
                                        <a href="#AbsoluteURL#pages/secure/survey.cfm?action=list">
                                            Surveys
                                        </a>
                                    </li>
                                    <!---/ Surveys --->
                                </ul>
                            </li>
                        </cfif>
                        <!---/ God Mode (BETA MENU) ---->
                      </cfif>
                      <!---/ Authenticated Users --->
                      <cfif SESSION.authLevel GTE 10>
                        <li class="hide-for-large"><a href="#AbsoluteURL#pages/login.cfm" class="button secondary" data-open="login">Login</a></li>
                      </cfif>
                  </ul>
                </div>
                                                    
                                                    
            </cfif>
                                                    
                <!---/ Left Side Menu --->
            </div>
            <!---/ Expanded Menu --->
                <!--- Right Side Menu --->
                <div class="top-bar-right show-for-large">
                    <ul class="menu vertical medium-horizontal" data-responsive-menu="drilldown medium-dropdown">
                        <!--- Login Button and Window --->
                        <cfif SESSION.authLevel GTE 10 AND CurrentPage NEQ "login.cfm">
                            <li><a href="##" class="button secondary" data-open="login">Login</a></li>
                            <!--- Login Window --->
                            <div id="login" class="reveal small BGPrimary" data-reveal>
                                <cfoutput>
                                    <form action="#CurrentPage#" method="post" data-abide>
                                        <div class="row">
                                            <div class='large-12 columns'>
                                                <h2 class="MakeWhite">
                                                    welcome back.
                                                </h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class='large-5 columns'>
                                                <input type="email" 
                                                       name="email" 
                                                       placeholder="email address"
                                                       required="yes"
                                                       maxlength="256">
                                                <span class="form-error">Enter your email address.</span>
                                            </div>
                                            <div class='large-5 columns'>
                                                <input type="password" 
                                                       name="password"
                                                       placeholder="password"
                                                       required="yes"
                                                       maxlength="512">
                                                <span class="form-error">Enter your password.</span>
                                            </div>
                                            <div class='large-2 columns'>
                                                <input type="hidden" value="login" name="action">
                                                <input type="submit" value="login" name="submit" class="small button secondary">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="large-12 columns">
                                                <div class="small MakeWhite text-left"><small><strong>Forget your password?</strong> <a href="#AbsoluteURL#pages/login.cfm?action=recover" class="MakeWhite">Reset it here</a>.</small></div>
                                            </div>
                                        </div>
                                    </form>
                                </cfoutput>
                              <button class="close-button" data-close aria-label="Close reveal" type="button">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <!---/ Login Window --->
                        </cfif>
                        <!---/ Login Button and Window --->
                        
                        <!--- User Menu (large Screen Up) --->
                        <cfif SESSION.authLevel LT 10>
                            <li>
                              <a href="##">
                                    #SESSION.userFirst# &nbsp;&nbsp;
                                    <img width="35" 
                                         height="35" 
                                         class="UserPicSmall"
                                         src="https://www.gravatar.com/avatar/#lcase(Hash(lcase(SESSION.userEmail)))#?d=#FullURL#img/profile/default75.jpg" 
                                         alt="#SESSION.userFirst# #SESSION.userLast#">
                                </a>
                              <ul class="menu vertical">
                                <li><label>Signed-in as #SESSION.userFirst# #SESSION.userLast#</label></li>
                                <li>
                                    <a href="#CurrentPage#?action=logout">
                                        Logout
                                    </a>
                                </li>
                                <li><label>Account Settings</label></li>
                                <li>
                                    <a href="#AbsoluteURL#pages/secure/users.cfm?user=#SESSION.userID#">
                                        Update Profile
                                    </a>
                                </li>
                                <li>
                                    <a href="#AbsoluteURL#pages/login.cfm?action=reset">
                                        Change Password
                                    </a>
                                </li>
                              </ul>
                            </li>
                        </cfif>						
                        <!---/ User Menu (large Screen Up) --->
                  </ul>
                </div>
                <!---/ Right Side Menu --->
            
        </div>
        <!---/ Top Bar --->
    </cfoutput>
</cfif>
<!---/ Top Bar Navigation --->
        
        
        
