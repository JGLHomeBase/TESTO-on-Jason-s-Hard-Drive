<!--- Variables --->
<cfparam name=URL.field default ="0">
<cfparam name="defaultTable" default="0">
<cfparam name="URL.table" default="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
    <!--- Nuke Field --->
    <cfinvoke component="knex.field" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#FORM.fieldID#">
      <!---/ Nuke Field --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Field deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.fieldID EQ 0 AND SESSION.authLevel LTE 1>
    <!--- New Field --->
      <cfinvoke component="knex.field" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Field --->
    <cfset URL.action = "new">
    <cfset defaultTable = FORM.tableID>
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Field (#FORM.fieldLongName#) created successfully.">

<cfelseif FORM.action EQ "process" AND FORM.fieldID NEQ 0 AND SESSION.authLevel LTE 1>
    <!--- Update Field --->
      <cfinvoke component="knex.field" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Field --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Field (#FORM.fieldLongName#) created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
              Database Structure
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
        
          <li class="divider"></li>
          <!--- Tables --->
          <cfif SESSION.authLevel LTE 1>
            <li><label>Tables</label></li>
               <li><a href="table.cfm?action=new">Add Table</a></li>
               <li><a href="table.cfm?code=0">Code Snippets</a></li>
            <li><a href="table.cfm?action=list">Manage Table</a></li>
            <li class="divider"></li>
          </cfif>
          <!---/ Tables --->
          <!--- Manage field --->
          <li><label>Fields</label></li>
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Field</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Field</a></li>
          <!---/ Manage field --->
          <li class="divider"></li>
        
      </ul>
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <cfset URL.maxrows=25>
      <!--- Get Fields --->
      <cfinvoke component="knex.field" 
            method="getJoin"
            DataSource = "#DataSource#"
            returnVariable = "getFields"
            whatFields = "*"
            Join = "LTables"
            Where = "depends"
            Order = "tables.projectData ASC, tables.tableName ASC, fields.fieldKey DESC, fields.fieldName ASC">
      <!---/ Get Fields --->
      <cfoutput><h1>#AppShortName# Data Fields</h1></cfoutput>
      <hr>
      <!--- Get Tables --->
      <cfinvoke component="knex.table" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getTables"
            whatFields = "tableID, tableName, projectData"
            order = "projectData, tableName">
      <!---/ Get Tables --->
      <cfoutput>
        <form action="#CurrentPage#">
          <select onchange="this.form.submit()" name="table">
            <cfif getTables.tableID EQ 0>
                <cfset selected = " selected">
              <cfelse>
                <cfset selected = "">
              </cfif>
            <option value="0"#selected#>Show All Tables</option>
            <cfloop query="getTables">
              <cfif getTables.tableID EQ URL.table>
                <cfset selected = " selected">
              <cfelse>
                <cfset selected = "">
              </cfif>
              <option value="#getTables.tableID#"#selected#>#getTables.tableName#</option>
            </cfloop>
          </select>
          <input type="hidden" name="action" value="list">
        </form>
      </cfoutput>
      
      <table width="100%">
        <thead>
          <th width="3"></th>
          <th>Field</th>
          <th>Table</th>
          <th>Data Type</th>
          <th>Length</th>
          <th class="text-right" width="50">Edit</th>
        </thead>
        <tbody>
          <cfoutput query="getfields" startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td>
                  <cfif getFields.fieldKey EQ "1">
                      <span data-tooltip class="has-tip" title="Primary Key"><i class="fi-key"></i></span>
                  </cfif>
              </td>
              <td>
                <b>#getfields.fieldLongName#</b> <cfif getfields.fieldLongName NEQ getfields.fieldName>
                (#getfields.fieldName#)</cfif><cfif getFields.fieldReq EQ "1"><span data-tooltip class="has-tip MakeYellow" title="Required (Not Null)"><i class="fi-star"></i></span></cfif>
                <cfif getFields.fav EQ "1"><span data-tooltip class="has-tip MakeRed" title="Favorite"><i class="fi-heart"></i></span></cfif>
              </td>
              
              <td>#getfields.tableName#</td>
              <td>#getfields.fieldDataType#</td>
              <td>#getfields.fieldLength#</td>
                <td class="text-right" width="75">
                    <div class="tableLink">
                      <a href="#CurrentPage#?field=#getfields.fieldID#&table=#URL.table#">
                         <i class="fi-pencil"></i>
                      </a>
                      &nbsp; | &nbsp;
                      <a href="#CurrentPage#?field=#getfields.fieldID#&action=delete">
                         <i class="fi-trash"></i>
                      </a>
                    </div>
                </td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!---/ List --->
       <!--- Pagination --->
        <cfset pageRecordCount = getfields.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->
    <cfelseif URL.action EQ "delete" AND URL.field NEQ "" AND SESSION.authLevel LTE 1>
          <!--- Get Fields --->
          <cfinvoke component="knex.field" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getfield"
                whatFields = "*"
                Where = "ThisField">
          <!---/ Get Fields --->  
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a field. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post" required>
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getfield.fieldID#" name="fieldID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getfield.fieldLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- field Profile Form --->
          <!--- Get Fields --->
          <cfinvoke component="knex.field" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getfield"
                whatFields = "*"
                Where = "ThisField">
          <!---/ Get Fields --->  
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.field EQ 0>
            <h1>Add a Field</h1>
          <cfelse>
            <h1>Update Field Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?table=#URL.table#&page=#URL.page#" data-abide>
          <div class="row">
            <div class="large-12 columns">
              <!--- Get Tables --->
              <cfinvoke component="knex.table" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getTables"
                    whatFields = "tableID, tableName, projectData"
                    order = "projectData, tableName">
              <!---/ Get Tables --->
              <label>Table</label>
              <select name="tableID">
                <cfloop query="getTables">
                  <option value="#getTables.tableID#"<cfif getfield.tableID EQ getTables.tableID OR getTables.tableID EQ defaultTable>selected</cfif>>#getTables.tableName#</option>
                </cfloop>
              </select>
            </div>
          </div>

          <div class="row">
            <div class="large-8 columns">
              <label>Full Name of Field</label>
              <input type="text" 
                     name="fieldLongName" 
                     value="#getfield.fieldLongName#" 
                     placeholder="Field Name"
                     maxlength="256"
                     required>
              <small class="form-error">Enter a name fpr the field</small>
            </div>
            <div class="large-4 columns">
              <label>Database Column Name</label>
              <input type="text" 
                     name="fieldName" 
                     value="#getfield.fieldName#"
                     placeholder="field"
                     maxlength="128"
                     required>
              <small class="form-error">Enter the name of the table column</small>
            </div>
          </div>

          <div class="row">
            <div class="medium-4 columns">
              <label>Data Type</label>
              <select name="fieldDataType" required>
                <option <cfif getfield.fieldDataType EQ "decimal">selected</cfif> value="decimal">Decimal</option>
                <option <cfif getfield.fieldDataType EQ "int">selected</cfif> value="int">Integer</option>
                <option <cfif getfield.fieldDataType EQ "text">selected</cfif> value="text">Text</option>
                <option <cfif getfield.fieldDataType EQ "varchar">selected</cfif> value="varchar">Variable Character</option>
                <option <cfif getfield.fieldDataType EQ "timestamp">selected</cfif> value="timestamp">Timestamp</option>
                <option <cfif getfield.fieldDataType EQ "date">selected</cfif> value="date">Date</option>
                <option <cfif getfield.fieldDataType EQ "time">selected</cfif> value="time">Time</option>
                <option <cfif getfield.fieldDataType EQ "datetime">selected</cfif> value="datetime">DateTime</option>
                <option <cfif getfield.fieldDataType EQ "URL">selected</cfif> value="URL">Website URL</option>
              </select>
              <small class="form-error">Data type is required</small>
            </div>
            <div class="medium-2 columns">
              <label>Format</label>
              <select name="fieldDataFormat">
                <option value="General" <cfif getField.fieldDataFormat EQ "None" OR getField.fieldDataFormat EQ "">selected</cfif>>General</option>
                <option value="Currency" <cfif getField.fieldDataFormat EQ "Currency">selected</cfif>>Currency</option>
                <option value="Percentage" <cfif getField.fieldDataFormat EQ "Percentage">selected</cfif>>Percentage</option>
                <option value="Number" <cfif getField.fieldDataFormat EQ "Number">selected</cfif>>Number</option>
              </select>
            </div>
            <div class="medium-2 columns">
              <label>Field Length</label>
              <input type="text" value="#getfield.fieldLength#" name="fieldLength" maxlength="11">
              <small class="form-error">Enter the length of the field</small>
            </div>
            <div class="medium-2 columns">
              <label>Primary Key</label>
              <select name="fieldKey">
                <option value="1" <cfif getField.fieldkey EQ "1">selected</cfif>>Yes</option>
                <option value="0" <cfif getField.fieldkey NEQ "1">selected</cfif>>No</option>
              </select>
            </div>
            <div class="medium-2 columns">
              <label>Required</label>
              <select name="fieldReq">
                <option value="1" <cfif getField.fieldReq EQ "1">selected</cfif>>Yes</option>
                <option value="0" <cfif getField.fieldReq NEQ "1">selected</cfif>>No</option>
              </select>
            </div>
          </div>

          <div class="row">
            <div class="medium-6 columns">
              <label>Default Value</label>
              <input type="number" name="fieldDefault" value="#getField.fieldDefault#" maxlength="256" placeholder="Default Value">
            </div>
            <div class="medium-3 columns">
             <label>Favorite</label>
              <select name="fav" required>
                <option value="0" <cfif getField.fav EQ 0>selected</cfif>>No</option>
                <option value="1" <cfif getField.fav EQ 1>selected</cfif>>Yes</option>
              </select>
            </div>
            <div class="medium-3 columns">
              <label>Validate</label>
              <select name="fieldValid">
                <option value="" <cfif getField.fieldValid EQ "">selected</cfif>>None</option>
                <option value="Row Total" <cfif getField.fieldValid EQ "Row Total">selected</cfif>>Row Total</option>
                <option value="Column Total" <cfif getField.fieldValid EQ "Column Total">selected</cfif>>Column Total</option>
                <option value="Client" <cfif getField.fieldValid EQ "Client">selected</cfif>>Total Clients</option>
                <option value="Adult" <cfif getField.fieldValid EQ "Adult">selected</cfif>>Total Adults</option>
                <option value="Child" <cfif getField.fieldValid EQ "Child">selected</cfif>>Total Children</option>
                <option value="Leaver" <cfif getField.fieldValid EQ "Leaver">selected</cfif>>Total Leavers</option>
                <option value="Stayer" <cfif getField.fieldValid EQ "Stayer">selected</cfif>>Total Stayers</option>
              </select>
            </div>
          </div>

          <div class="row">
            <div class="large-12 columns">
              <label>Field Notes</label>
              <textarea name="fieldNotes" placeholder="Notes">#getField.fieldNotes#</textarea>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.field#" name="fieldID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.field EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ field Profile Form --->
    </cfif>
    </div>
  </div>
</div>