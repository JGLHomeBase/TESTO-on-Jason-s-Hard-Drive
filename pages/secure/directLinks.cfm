<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>#SESSION.cocCity# Direct Report Links</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<!--- Get Agencies --->
<cfinvoke component="knex.agency" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getAgencies"
        whatFields = "agencyID, agencyLongName"
        Where = "ThisCoC"
        Order = "cocID, agencyLongName">
<!---/ Get Agencies --->

<cfoutput>
  <div class="row">
    <div class="medium-12 columns">
      <h2 class=""><br>#SESSION.cocCity# Direct Report Links</h2>
      <cfloop query="getAgencies">
          <!--- Get Links --->
          <cfinvoke component="knex.projects" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getProjects"
                whatFields = "projectLongName, reportID, goldenTicket, projectID"
                Where = "ThisCoCAgency"
                Order = "projectLongName ASC"
                sortingHat = "#getAgencies.agencyID#">
          <!---/ Get Links --->       
        <h3>#agencyLongName# Projects</h3>
        <ul>
          <cfloop query="getProjects">
              <cfif getProjects.goldenTicket EQ "23FQBcv21">
                <!--- Update Project --->
                <cfinvoke component = "knex.directlinks"
                          method = "update"
                          DataSource = "#DataSource#"
                          projectID = "getProjects.projectID">
                <!---/ Update Project --->                  
                <cfset getProjects.goldenTicket = rndString>
              </cfif> 
            <li>
              <a href="#FullURL#pages/directReport.cfm?project=#getProjects.projectID#&report=#getProjects.reportID#&goldenTicket=#getProjects.goldenTicket#">
                #projectLongName#
              </a>
            </li>
          </cfloop>
        </ul>
        <hr>
      </cfloop>
    </div>
  </div>
</cfoutput>
