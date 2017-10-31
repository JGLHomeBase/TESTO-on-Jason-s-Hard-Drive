<cfparam name="URL.project" default="0">
<cfif SESSION.authLevel GT 5>
  <cfabort>
</cfif>

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<!--- Get Project List --->
<cfinvoke component="knex.projects" 
        method="getList"
        DataSource = "#DataSource#"
        returnVariable = "getProjectlist"
        whatFields = "docReview"
        Join = "ICoCAgency"
        Where = "thisCoC"
        Order = "CityAgencyLongName">
<!---/ Get Project List --->

<cfoutput>

<div class="panel">
  <div class="row">
    <div class="large-12 columns">
      <form action="#CurrentPage#">
        <select name="project"  onchange='this.form.submit()'>
          <option value="0"<cfif GetProjectList.projectID EQ 0>SELECTED</cfif>>Select a Project</option>
          <cfloop query="GetProjectList">
            <option value="#GetProjectList.projectID#"<cfif GetProjectList.projectID EQ URL.project>SELECTED</cfif>>#GetProjectList.CoCCity# - #GetProjectList.agencyLongName# - #GetProjectList.projectLongName#</option>
          </cfloop>
        </select>
        
      </form>
    </div>
  </div>
  <cfif URL.project NEQ 0>
    <div class="row">
      <div class="large-6 columns">
          <!--- Get Docs --->
          <cfinvoke component="knex.docs" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getDoc"
                whatFields = "*"
                Where = "ThisProject"
                Order = "docName ASC">
          <!---/ Get Docs --->
        <cfif getDocs.RecordCount GT 0>
          <h2 class="">Supplemental Materials</h2>
          <ul>
            <cfloop query="getDocs">
              <cfoutput>
                <li><a href="#getDocs.docBox#" target="BoomBoomFrame">#getDocs.docName#</a></li>
              </cfoutput>
            </cfloop>
          </ul>
        </cfif>
      </div>
      <div class="large-6 columns">
          <h3 class="">Applicant Profile</h3>
          <ul>
            <li><a href="http://goo.gl/4WU97n" target="_blank">Duns</a></li>
            <li><a href="http://goo.gl/YyiNyx" target="_blank">SAM</a></li>
          </ul>
          <h3 class="">Code of Conduct</h3>
          <ul>
            <li><a href="http://goo.gl/VY6sMe" target="_blank">HUD List</a></li>
          </ul>
      </div>
    </div>
  </cfif>
</div>


<iframe name="BoomBoomFrame" width="100%" height="100%" frameborder="0" url=""></iframe>

</cfoutput>
