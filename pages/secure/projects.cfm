<!--- Variables --->
<cfparam name="URL.project" default ="0">
<cfparam name="URL.comp" default ="#SESSION.compID#">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Project --->
    <cfinvoke component="knex.projects" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.projectID)#">
    <!---/ Nuke Project --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Project deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.projectID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Project --->
      <cfinvoke component="knex.projects" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Project --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.projectLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.projectID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Project --->
      <cfinvoke component="knex.projects" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Project --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.projectLongName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Projects
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<div class="globalPad">
<div class="row">
  <div class="medium-2 columns">
    <cfoutput>
      <!--- Navigation --->
      <ul class="menu vertical">
        <!--- Manage --->
        <cfif SESSION.authLevel LTE 3 AND SESSION.userprojectID EQ 0>
          <li><label>Projects</label></li>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Project</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Project</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage --->
      </ul>
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list" AND SESSION.userprojectID EQ 0>
      <!--- List --->
      <!--- Get Project --->
      <cfinvoke component="knex.projects" 
          method="getProjectA"
          DataSource = "#DataSource#"
          returnVariable = "getProjects">
      <!---/ Get Project --->
      <cfoutput><h1>Projects</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Project</th>
          <th>Agency</th>
          <th>Component</th>
          <th>Documents</th>
          <cfif SESSION.authLevel LTE 3>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getProjects"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td>
                <cfif getProjects.active EQ "1">
                  <b>#getprojects.projectLongName#</b> 
                <cfelse>
                  #getprojects.projectLongName# <i class="MakeGray">[inactive]</i>
                </cfif>
              </td>
              <td>#getprojects.agencyName#</td>
              <td>#getprojects.projectComponentName#</td>
               <td>
                    <div class="tableLink">
                    <a href="docsP.cfm?project=#getprojects.projectID#">
                         <i class="fi-page"></i> Documents
                      </a>
                   </div>
              </td>
              <cfif SESSION.authLevel LTE 3>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?project=#getprojects.projectID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?project=#getprojects.projectID#&action=delete">
                           <i class="fi-trash"></i>
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!--- Pagination --->
        <cfset pageRecordCount = getprojects.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.project NEQ "" AND SESSION.authLevel LTE 3>
      <!--- Get Project --->
      <cfinvoke component="knex.projects" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjects"
            whatFields = "*"
            Where = "ThisProject"
            Order = "projectComponentID">
      <!---/ Get Project --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARING!</h1>
            <p class="MakeWhite">You are about to delete a project. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getprojects.projectID#" name="projectID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getprojects.projectLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <!--- Get Project --->
      <cfinvoke component="knex.projects" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjects"
            whatFields = "*"
            Where = "ThisProject"
            Order = "projectComponentID">
      <!---/ Get Project --->
      <div class="row">
       
          <cfif URL.project EQ 0>
             <div class="large-12 columns">
            <h1>Add a Project</h1>
            </div>
          <cfelse>
            <div class="large-10 columns">
            <h1>Update Project Profile</h1>
            </div>
            <cfoutput>
              <div class="large-2 columns">
            <a href="#absoluteurl#pages/secure/dataentry.cfm?project=#getProjects.projectID#" class="small button secondary">Data Entry</a>
            </div>
            </cfoutput>
          </cfif>
          
        
      </div>
      <hr>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-7 columns">
              <!--- projectLongName --->
              <label>Project Name</label>
              <input type="text"
                     name="projectLongName"
                     value="#getProjects.projectLongName#"
                     placeholder="Project Name"
                     required
                    maxlength="256">
              <small class="form-error">This field is required</small>
              <!---/ projectLongName --->
            </div>
            <div class="medium-3 columns">
              <label>Project Nickname</label>
              <input type="text"
                     name="projectName"
                     value="#getProjects.projectName#"
                     placeholder="Project Nickname"
                     required
                    maxlength="15">
                <small class="form-error">Enter a short (&le;15 character) nickname for the project</small>
              <!---/ projectName --->
            </div>
            <div class="medium-2 columns">
              <!--- active --->
              <label>Active</label>
              <select name="active">
                     option <cfif getProjects.active EQ "">selected</cfif>></option>
                     <option value="1" <cfif getProjects.active EQ 1>selected</cfif>>Yes</option>
                     <option value="0" <cfif getProjects.active EQ 0>selected</cfif>>No</option>
              </select>
              <!---/ active --->
            </div>
          </div>
          <div class="row">
            <div class="medium-3 columns">
              <!--- projectNew --->
              <label>New Project</label>
              <select name="projectNew" required>
                     <option value="0" <cfif getProjects.projectNew EQ 0>selected</cfif>>No</option>
                     <option value="1" <cfif getProjects.projectNew EQ 1>selected</cfif>>Yes</option>
              </select>
              <!---/ projectNew --->
            </div>
            <div class="medium-3 columns">
              <!--- coordinatedAssessment --->
              <label>Coordinated Assessment</label>
              <select name="coordinatedAssessment" required>
                     <option value="0" <cfif getProjects.coordinatedAssessment EQ 0>selected</cfif>>N/A</option>
                     <option value="1" <cfif getProjects.coordinatedAssessment EQ 1>selected</cfif>>Participant</option>
              </select>
              <!---/ coordinatedAssessment --->
            </div>
            <div class="medium-3 columns">
              <!--- housingFirst --->
              <label>Housing First</label>
              <select name="housingFirst" required>
                     <option value="0" <cfif getProjects.housingFirst EQ 0>selected</cfif>>No</option>
                     <option value="1" <cfif getProjects.housingFirst EQ 1>selected</cfif>>Yes</option>
              </select>
              <!---/ housingFirst --->
            </div> 
            <div class="medium-3 columns">
              <!--- onlyCH --->
              <label>Only Chronically Homeless</label>
              <select name="onlyCH" required>
                    <option value="0" <cfif getProjects.onlyCH EQ 0>selected</cfif>>No</option>
                    <option value="1" <cfif getProjects.onlyCH EQ 1>selected</cfif>>Yes</option>
              </select>
              <!---/ onlyCH --->
            </div> 
          </div>

           <div class="row">
            <div class="large-12 columns">
              <hr>
              <!--- Get Templates --->
              <cfinvoke component="knex.reports" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getReport"
                    whatFields = "reportName, reportID"
                    Where = "ThisCoC"
                    Order = "reportName ASC">
              <!---/ Get Templates --->
              <label>Default Report Template</label>
              <select name="reportID" required>
                <cfloop query="getReport">
                  <option value="#getReport.reportID#" <cfif getReport.reportID EQ getProjects.reportID>selected</cfif>>#getReport.reportName#</option>
                </cfloop>
              </select>
            </div>
          </div>

          <div class="row">
            <div class="large-12 columns">
              <hr>
                  <!--- Get Agency List --->
                  <cfinvoke component="knex.agency" 
                        method="get"
                        DataSource = "#DataSource#"
                        returnVariable = "getAgencies"
                        whatFields = "agencyName, agencyID"
                        Where = "ThisCoC">
                  <!---/ Get Agency List --->
              <label>Sponsoring Agency</label>
              <select name="agencyID" required>
                <cfloop query="getAgencies">
                  <option value="#getAgencies.AgencyID#" <cfif getAgencies.agencyID EQ getProjects.agencyID>selected</cfif>>#getAgencies.agencyName#</option>
                </cfloop>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="medium-6 columns">
                  <!--- Get Project Components --->
                  <cfinvoke component="knex.component" 
                        method="get"
                        DataSource = "#DataSource#"
                        returnVariable = "getProjectCom"
                        whatFields = "projectComponentLongName, projectComponentID"
                        Order = "projectComponentLongName" >
                        
                  <!---/ Get Project Components --->

              <label>Program Component</label>
              <select name="projectComponentID" required>
                <cfloop query="getProjectCom">
                  <option value="#getProjectCom.projectComponentID#" <cfif getProjectCom.projectComponentID EQ getProjects.projectComponentID>selected</cfif>>#getProjectCom.projectComponentLongName#</option>
                </cfloop>
              </select>
            </div>
             <div class="medium-6 columns">
                <label>Target Population</label>
                <select name="targetPop" required>
                  <option value="SM" <cfif getProjects.targetPop EQ "SM">selected</cfif>>Single Males 18 years old and over</opton>
                  <option value="SM" <cfif getProjects.targetPop EQ "SF">selected</cfif>>Single Females 18 years old and over</opton>
                  <option value="SMF" <cfif getProjects.targetPop EQ "SMF" OR getProjects.targetPop EQ "Adults">selected</cfif>>Single Males and Females 18 years old and over</opton>
                  <option value="CO" <cfif getProjects.targetPop EQ "CO">selected</cfif>>Couples Only, No Children</opton>
                  <option value="HC" <cfif getProjects.targetPop EQ "HC" OR getProjects.targetPop EQ "Families">selected</cfif>>Households with Children</opton>
                  <option value="SMHC" <cfif getProjects.targetPop EQ "SMHC">selected</cfif>>Single Males 18 years old and over and Households with Children</opton>
                  <option value="SFHC" <cfif getProjects.targetPop EQ "SFHC">selected</cfif>>Single Females 18 years old and over and Households with Children</opton>
                  <option value="SMF+HC " <cfif getProjects.targetPop EQ "SMF+HC ">selected</cfif>>Single Males and Females 18 years old and over plus Households with Children</opton>
                  <option value="YM" <cfif getProjects.targetPop EQ "YM">selected</cfif>>Unaccompanied Males under 18 years old</opton>
                  <option value="YF" <cfif getProjects.targetPop EQ "YF">selected</cfif>>Unaccompanied Females under 18 years old
</opton>
                  <option value="YMF" <cfif getProjects.targetPop EQ "YMF">selected</cfif>>Unaccompanied Males and Females under 18 years old</opton>
                  <option value="none" <cfif getProjects.targetPop EQ "none">selected</cfif>>None</option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <hr>
              <!--- ProjectHood --->
              <label>Neighborhood</label>
              <input type="text"
                     name="ProjectHood"
                     value="#getProjects.ProjectHood#"
                     placeholder="Neighborhood"
                    maxlength="256">
              <!---/ ProjectHood --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- ProjectHood --->
              <!--- ProjectStreet1 --->
              <label>Street Address 1</label>
              <input type="text"
                     name="ProjectStreet1"
                     value="#getProjects.ProjectStreet1#"
                     placeholder="Street Address 1"
                    maxlength="256">
              <!---/ ProjectStreet1 --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- ProjectStreet2 --->
              <label>Street Address 2</label>
              <input type="text"
                     name="ProjectStreet2"
                     value="#getProjects.ProjectStreet2#"
                     placeholder="Street Address 2"
                    maxlength="256">
              <!---/ ProjectStreet2 --->

            </div>
          </div>
          <div class="row">
            <div class="medium-7 columns">
              <!--- ProjectCity --->
              <label>City</label>
              <input type="text"
                     name="ProjectCity"
                     value="#getProjects.ProjectCity#"
                     placeholder="City"
                    maxlength="128">
              <!---/ ProjectCity --->
            </div>
            <div class="medium-2 columns">
              <!--- ProjectState --->
              <label>state</label>
              <input type="text"
                     name="ProjectState"
                     value="#getProjects.ProjectState#"
                     placeholder="state"
                    maxlength="2">
              <!---/ ProjectState --->
            </div>
            <div class="medium-3 columns">
              <!--- ProjectZip --->
              <label>Zip Code</label>
              <input type="text"
                     name="ProjectZip"
                     value="#getProjects.ProjectZip#"
                     placeholder="Zip Code"
                     pattern="^\d{5}$"
                    maxlength="5">
              <small class="form-error">Must be a five-digit zipcode</small>
              <!---/ ProjectZip --->
            </div>
          </div>
           <div class="row">
            <div class="medium-9 columns">
              <!--- ProjectGeoCode --->
              <label>Geo-coded Location</label>
              <input type="text"
                     name="ProjectGeoCode"
                     value="#getProjects.ProjectGeoCode#"
                     placeholder="Geo-coded Location"
                    maxlength="256"
                     class="BGLightGray"
                     readonly>
              <!---/ ProjectGeoCode --->
            </div>
            <div class="medium-3 columns">
              <!--- ProjectGeoHeading --->
              <label>Map Heading</label>
              <input type="number"
                     name="ProjectGeoHeading"
                     value="#getProjects.ProjectGeoHeading#"
                     placeholder="Map Heading"
                    maxlength="3">
              <small class="form-error">Must be a whole number</small>
              <!---/ ProjectGeoHeading --->
            </div>
          </div>

          <div class="row">
            <div class="large-12 columns">
              <hr>
              <!--- projectOverview --->
              <label>Project Overview</label>
              <textarea name="projectOverview"
                     placeholder="Project Overview" >#getProjects.projectOverview#</textarea>
              <!---/ projectOverview --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- popServed --->
              <label>Population Served</label>
              <textarea name="popServed"
                     placeholder="Population Served" >#getProjects.popServed#</textarea>
              <!---/ popServed --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- VenuesForService --->
              <label>Venues for Service</label>
              <textarea name="VenuesForService"
                     placeholder="Venues for Service" >#getProjects.VenuesForService#</textarea>
              <!---/ VenuesForService --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- HousingProvided --->
              <label>Housing Provided</label>
              <textarea name="HousingProvided"
                     placeholder="Housing Provided" >#getProjects.HousingProvided#</textarea>
              <!---/ HousingProvided --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- ServicesProvided --->
              <label>Services Provided</label>
              <textarea name="ServicesProvided"
                     placeholder="Services Provided" >#getProjects.ServicesProvided#</textarea>
              <!---/ ServicesProvided --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#SESSION.cocID#" name="cocID">
              <input type="hidden" value="#URL.project#" name="projectID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.project EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/  Profile Form --->
    </cfif>
    </div>
  </div>
</div>