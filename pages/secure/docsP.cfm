<!--- Variables --->
<cfparam name="URL.doc" default ="0">
<cfparam name="URL.project" default ="0">
<cfparam name="URL.comp" default ="#SESSION.compID#">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Program Doc --->
    <cfinvoke component="knex.docsP" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.docID)#">
      <!---/ Nuke Program Doc --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "doc deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.docID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Program Doc --->
      <cfinvoke component="knex.docsP" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Program Doc --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.docName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.docID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Program Doc --->
      <cfinvoke component="knex.docsP" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Program Doc --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.docName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Documents
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->


<div class="row">
  <div class="medium-2 columns">
    <cfoutput>
      <!--- doc Navigation --->
      <ul class="menu vertical">
        <!--- Manage comps --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>Back to Project</label></li>
           <li <cfif URL.action EQ "new">class="active"</cfif>><a href="projects.cfm?action=list">Project Settings</a></li>
          <li><label>Documents</label></li>
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=newt&project=#URL.project#">Add doc</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list&project=#URL.project#">Manage Documents</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage comps --->
      </ul>
      <!--- doc Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <!--- Get Docs --->
      <cfinvoke component="knex.docs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getdoc"
            whatFields = "*"
            Where = "ThisProject"
            Order = "docName ASC">
      <!---/ Get Docs --->
      <cfoutput><h1>#SESSION.compName# Documents</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>doc</th>
          <th></th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getdoc"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getdoc.docName#</b> (#getdoc.docName#)</td>
              <td></td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?doc=#getdoc.docID#&project=#URL.project#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?doc=#getdoc.docID#&action=delete&project=#URL.project#">
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
          <cfset pageRecordCount = getdoc.RecordCount>
          <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
        <!---/ Pagination --->
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.doc NEQ "" AND SESSION.authLevel LTE 3>
      <!--- Get Docs --->
      <cfinvoke component="knex.docs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getdoc"
            whatFields = "docID, docName"
            Where = "ThisDoc">
      <!---/ Get Docs --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete an doc. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#URL.project#" name="projectID">
                <input type="hidden" value="#getdoc.docID#" name="docID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getdoc.docName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- doc Profile Form --->
      <!--- Get Docs --->
      <cfinvoke component="knex.docs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getdoc"
            whatFields = "*"
            Where = "ThisDoc">
      <!---/ Get Docs --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.doc EQ 0>
            <h1>Add an doc</h1>
          <cfelse>
            <h1>Update doc Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?project=#URL.project#" data-abide>
          <div class="row">
            <div class="medium-12 columns">
              <label>Document Title</label>
              <input type="text" 
                     name="docName" 
                     value="#getdoc.docName#" 
                     placeholder="Springfield Applicant Handbook"
                     maxlength="256"
                     required
                     >
              <small class="form-error">Enter the full name of the doc</small>
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
              <label>Document Description</label>
              <textarea name="docDesc">#getdoc.docDesc#</textarea>
            </div>
          </div>
          <div class="row">
            <div class="large-10 columns">
              <label>Public Box Link (URL)</label>
              <input type="url" 
                     name="docBox" 
                     value="#getdoc.docBox#"
                     placeholder="https://hombase.box.com/PUBLICLINK"
                     maxlength="256"
                     required>
              <small class="form-error">Enter a public Box link URL for the document</small>
            </div>
            <div class="large-2 columns">
              <label>Hidden?</label>
              <select name="docPrivate" required>
                 <option value="1" <cfif getdoc.docPrivate EQ 1>selected</cfif>>Yes</option>
                 <option value="0" <cfif getdoc.docPrivate EQ 0>selected</cfif>>No</option>
              </select>
            </div>
          </div>

         
       

          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.doc#" name="docID">
              <cfif getdoc.compID NEQ "" AND getdoc.compID NEQ 0>
                <input type="hidden" value="#getdoc.compID#" name="compID">
              <cfelse>
                <input type="hidden" value="#SESSION.compID#" name="compID">
              </cfif>
              <input type="hidden" value="#URL.project#" name="projectID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.doc EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ doc Profile Form --->
    </cfif>

  </div>
</div>