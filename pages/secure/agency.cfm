<!--- Variables --->
<cfparam name=URL.agency default ="#SESSION.agencyID#">
<cfif SESSION.useragencyID NEQ 0>
  <cfset URL.agency = #SESSION.useragencyID#>
</cfif>
<cfif URL.action EQ "new" AND SESSION.useragencyID EQ 0 AND SESSION.authLevel LTE 5>
  <cfset URL.agency = 0>
</cfif>
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>   
    <!--- Nuke Agency --->
    <cfinvoke component="knex.agency" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.agencyID)#">
      <!---/ Nuke Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Agency deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.agencyID EQ 0 AND SESSION.authLevel LTE 3 AND SESSION.useragencyID EQ 0>
    <!--- New Agency --->
      <cfinvoke component="knex.agency" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.agencyLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.agencyID NEQ 0 AND SESSION.authLevel LTE 3 AND SESSION.useragencyID EQ 0>
    <!--- Update Agency --->
      <cfinvoke component="knex.agency" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.agencyLongName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
              <cfif SESSION.useragencyID EQ 0>
                Manage Agencies
              <cfelse>
                Agency Settings
              </cfif>
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
      <!--- agency Navigation --->
      <ul class="menu vertical">
        <!--- Manage comps --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>Agencies</label></li>
          <cfif  SESSION.useragencyID EQ 0>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Agency</a></li>
          </cfif>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Agencies</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage comps --->
      </ul>
      <!--- agency Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list" AND SESSION.useragencyID EQ 0>
      <!--- List --->
      <!--- Get Agencies --->
      <cfinvoke component="knex.agency" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAgencies"
            whatFields = "*"
            Where = "ThisCoC"
            Order = "agencyLongName ASC">
      <!---/ Get Agencies --->
      <cfoutput><h1>#SESSION.cocCity# Agencies</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Agency</th>
          <cfif SESSION.authLevel LTE 5>
              <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getagencies"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getagencies.agencyLongName#</b> (#getagencies.agencyName#)</td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?agency=#getagencies.agencyID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?agency=#getagencies.agencyID#&action=delete">
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
          <cfset pageRecordCount = getagencies.RecordCount>
          <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
        <!---/ Pagination --->
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.agency NEQ "" AND SESSION.authLevel LTE 3>
      <!--- Get Agencies --->
      <cfinvoke component="knex.agency" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAgencies"
            whatFields = "agency.agencyID, agency.agencyLongName, projects.projectLongName"
            Where = "Children"
            Order = "projects.projectLongName">
      <!---/ Get Agencies --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNINGG!</h1>
              <p class="MakeWhite">You are about to delete an agency. <b>This cannot be undone. Are you sure?</b></p> <p class="MakeWhite">The following projects will also be deleted:</p> <cfloop query="getAgencies"><p class="MakeWhite"><cfoutput>#getAgencies.projectLongName#</cfoutput></p></cfloop></b>
      <cfinvoke component="knex.agency" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAgencies"
            whatFields = "agency.agencyID, agency.agencyLongName"
            Where = "ThisAgency">
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getAgencies.agencyID#" name="agencyID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getAgencies.agencyLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- agency Profile Form --->
      <!--- Get Agencies --->
      <cfinvoke component="knex.agency" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAgencies"
            whatFields = "*"
            Where = "ThisAgency">
      <!---/ Get Agencies --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.agency EQ 0>
            <h1>Add an Agency</h1>
          <cfelse>
            <h1>Update Agency Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-9 columns">
              <label>Full Name of the Agency</label>
              <input type="text" 
                     name="agencyLongName" 
                     value="#getAgencies.agencyLongName#" 
                     placeholder="Acme Housing Authority"
                     maxlength="256"
                     required
                     >
              <small class="form-error">Enter the full name of the agency</small>
            </div>
            <div class="medium-3 columns">
              <label>Nickname for the Agency</label>
              <input type="text" 
                     name="agencyName" 
                     value="#getAgencies.agencyName#"
                     placeholder="AHA"
                     maxlength="128"
                     required>
              <small class="form-error">Enter a brief nickname for the agency</small>
            </div>
          </div>

          <div class="row">
            <div class="large-12 columns">
              <label>Agency Website (URL)</label>
              <input type="url" 
                     name="agencyURL" 
                     value="#getAgencies.agencyURL#"
                     placeholder="https://acmehomeless.org"
                     maxlength="256">
              <small class="form-error">Enter a valid URL for the website</small>
            </div>
          </div>

          
          <div class="row">
            <div class="large-12 columns">
              <label>Agency Tagline</label>
              <input type="text" 
                     name="agencyMoto" 
                     value="#getAgencies.agencyMoto#"
                     maxlength="256"
                     placeholder="Advancing Solutions to Homelessness">
                  <small class="form-error">Enter percent cut of ARD</small>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <label>About the Agency</label>
              <textarea name="agencyAbout" placeholder="HomeBase is a non-profit, public policy law firm that works with communities to develop effective and humane responses to homelessness.">#getAgencies.agencyAbout#</textarea>
            </div>
          </div>
           <div class="row">
            <div class="large-12 columns">
              <label>Mission Statement</label>
              <textarea name="agencyMission" placeholder="HomeBase's mission is to end homelessness, prevent its recurrence, and decrease its effect on communities.">#getAgencies.agencyMission#</textarea>
            </div>
          </div>
           <div class="row">
            <div class="large-12 columns">
              <label>Agency History</label>
              <textarea name="agencyHistory" placeholder="With over 25 years of experience with homelessness and legal issues,...">#getAgencies.agencyHistory#</textarea>
            </div>
          </div>

          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.agency#" name="agencyID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.agency EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ agency Profile Form --->
    </cfif>
    </div>
  </div>
</div>