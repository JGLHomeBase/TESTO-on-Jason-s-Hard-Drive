<!--- TABLE DATA EDIT TEMPLATE --->
<!--- FIND AND REPLACE VARIABLES

URL.component
projectComponentID 
projectComponentDesc, projectComponentLongName, projectComponentName, projectComponentSource, projectComponentSourceURL
projectComponent
projectComponentLongName
component - (i.e. competition)
Component - (i.e. Component)
getProjectCom - (i.e. getProjectCom)
1
3
--->


<!--- Variables --->
<cfparam name=URL.component default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
    <!--- Nuke Project Component --->
    <cfinvoke component="knex.component" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.projectComponentID)#">
    <!---/ Nuke Project Component --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Component deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.projectComponentID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Project Component --->
      <cfinvoke component="knex.component" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Project Component --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.projectComponentLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.projectComponentID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Project Component --->
      <cfinvoke component="knex.component" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Project Component --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.projectComponentLongName# updated successfully.">
  </cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Components
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
        <cfif SESSION.authLevel LTE 3>
          <li><label>Components</label></li>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Component</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Component</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage --->
      </ul>
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <!--- Get Components --->
      <cfinvoke component="knex.component" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjectCom"
            whatFields = "*"
            Where = "Active"
            Order = "projectComponentLongName ASC">
      <!---/ Get Components --->
      <cfoutput><h1>Program Components</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Component</th>
          <th>Category</th>
          <cfif SESSION.authLevel LTE 3>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getProjectCom"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getProjectCom.projectComponentLongName#</b></td>
              <td>#getProjectCom.projectCompCategory#</td>
              <cfif SESSION.authLevel LTE 3>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?component=#getProjectCom.projectComponentID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?component=#getProjectCom.projectComponentID#&action=delete">
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
        <cfset pageRecordCount = getProjectCom.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.component NEQ "" AND SESSION.authLevel LTE 1>
      <!--- Get Components --->
      <cfinvoke component="knex.component" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjectCom"
            whatFields = "projectComponentLongName, projectComponentID"
            Where = "ThisComponent">
      <!---/ Get Components --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a component. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getProjectCom.projectComponentID#" name="projectComponentID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getProjectCom.projectComponentLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <!--- Get Components --->
      <cfinvoke component="knex.component" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjectCom"
            whatFields = "*"
            Where = "ThisComponent">
      <!---/ Get Components --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.component EQ 0>
            <h1>Add a Component</h1>
          <cfelse>
            <h1>Update Component Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-6 columns">
              <!--- projectComponentLongName --->
              <label>Program Component Name</label>
              <input type="text"
                     name="projectComponentLongName"
                     value="#getProjectCom.projectComponentLongName#"
                     placeholder="Program Component Name"
                     required
                    maxlength="256">
              <small class="form-error">This field is requried</small>
              <!---/ projectComponentLongName --->
            </div>
            <div class="medium-3 columns">
              <!--- projectComponentName --->
              <label>Program Component Nickname</label>
              <input type="text"
                     name="projectComponentName"
                     value="#getProjectCom.projectComponentName#"
                     placeholder="Program Component Nickname"
                     required
                    maxlength="32">
              <small class="form-error">This field is requried</small>
              <!---/ projectComponentName --->
            </div>
            <div class="medium-3 columns">
              <!--- projectCompCategory --->
              <label>Cateogry</label>
                <select name="projectCompCategory">
                    <option value="PH"<cfif getProjectCom.projectCompCategory EQ "PH"> selected</cfif>>Permanent Housing</option>
                    <option value="TH"<cfif getProjectCom.projectCompCategory EQ "TH"> selected</cfif>>Transitional Housing</option>
                    <option value="SSO"<cfif getProjectCom.projectCompCategory EQ "SSO"> selected</cfif>>Supportive Services Only</option>
                    <option value="Other"<cfif getProjectCom.projectCompCategory EQ "Other" OR getProjectCom.projectCompCategory EQ ""> selected</cfif>>Other</option>
                </select>
              <!---/ projectCompCategory --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- projectComponentDesc --->
              <label>Description</label>
              <textarea name="projectComponentDesc"
                     placeholder="Description" >#getProjectCom.projectComponentDesc#</textarea>
              <!---/ projectComponentDesc --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- projectComponentSource --->
              <label>Source (Name)</label>
              <input type="text"
                     name="projectComponentSource"
                     value="#getProjectCom.projectComponentSource#"
                     placeholder="Source (Name)"
                    maxlength="256">
              <!---/ projectComponentSource --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
             <!--- projectComponentSourceURL --->
            <label>Source (URL)</label>
            <input type="url"
                   name="projectComponentSourceURL"
                   value="#getProjectCom.projectComponentSourceURL#"
                   placeholder="Source (URL)"
                  maxlength="256">
            <!---/ projectComponentSourceURL --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.component#" name="projectComponentID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.component EQ 0>
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