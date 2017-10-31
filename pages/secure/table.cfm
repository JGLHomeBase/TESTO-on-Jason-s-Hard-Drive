<!--- Variables --->
<cfparam name="URL.table" default ="0">
<cfparam name="URL.code" default="">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
    <!--- Nuke Table --->
    <cfinvoke component="knex.table" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.tableID)#">
      <!---/ Nuke Table --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Table deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.tableID EQ 0 AND SESSION.authLevel LTE 1>
    <!--- New Table --->
      <cfinvoke component="knex.table" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Table --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.tableName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.tableID NEQ 0 AND SESSION.authLevel LTE 1>
    <!--- Update Table --->
      <cfinvoke component="knex.table" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Table --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.tableName# updated successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Tables
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
        <!--- Tables --->
        <cfif SESSION.authLevel LTE 1>
          <li><label>Tables</label></li>
            <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Table</a></li>
            <li <cfif URL.action EQ "code">class="active"</cfif>><a href="#CurrentPage#?code=0">Code Snippets</a></li>
            <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Table</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Tables --->
        <!--- fields --->
          <li><label>Fields</label></li>
          <li><a href="field.cfm?action=new">Add Field</a></li>
          <li><a href="field.cfm?action=list">Manage Field</a></li>
        <!---/ fields --->
      </ul>
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <cfset URL.maxrows=25>
          <!--- Get Tables --->
          <cfinvoke component="knex.table" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getTables"
                whatFields = "*"
                order = "tableName ASC">
          <!---/ Get Tables --->
      <cfoutput><h1>Tables</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Table</th>
          <cfif SESSION.authLevel LTE 1>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getTables"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getTables.tableName#</b></td>
              <cfif SESSION.authLevel LTE 1>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?table=#getTables.tableID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?table=#getTables.tableID#&action=delete">
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
        <cfset pageRecordCount = getTables.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.table NEQ "" AND SESSION.authLevel LTE 1>
          <!--- Get Tables --->
          <cfinvoke component="knex.table" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getTables"
                whatFields = "*"
                Where = "thisTable">
          <!---/ Get Tables --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a table. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getTables.tableID#" name="tableID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getTables.tableName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>


    <cfelseif URL.code NEQ "">
      <!--- Get Table Name --->
      <cfinvoke component="knex.table" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getTables"
                whatFields = "tableName, tableID"
                Where = "code"
                Order = "projectData, tableName">
      <!---/ Get Table Name --->
      <!--- Get Fields --->
        <cfinvoke component="knex.field" 
            method="getJoin"
            DataSource = "#DataSource#"
            returnVariable = "getFields"
            whatFields = "*"
            Join = "LTables"
            Where = "code"
            Order = "fieldKey DESC">
      <!---/ Get Fields --->
      <!--- Code Snippets --->
      <div class="row">
        <div class="large-12 columns">
          <h1>Code Snippets</h1>
          <hr>
        </div>
      </div>
      <!---/ Code Snippets --->
      <div class="row">
        <div class="large-12 columns">
          <h2><cfoutput>#getFields.tableName#</cfoutput></h2>
          <cfoutput>
            <form action="#CURRENTPAGE#?action=code">
              <cfif URL.code EQ 0>
                <label>#AppShortName# Tables</label>
              <cfelse>
                <label>Switch Tables</label>
              </cfif>
              <select name="code" onchange="this.form.submit()">
                  <option value = "0"><i>Select a Table</i></option>
                <cfloop query="getTables">
                  <option value = "#getTables.tableID#">#getTables.tableName#</option>
                </cfloop>
              </select>
            </form>
          </cfoutput>
          <hr>
        </div>
      </div>
      <!--- Sub Nav --->
        <div class="row">
            <div class="large-12 columns">
                <div data-magellan-expedition="fixed" id="magellan_bar"> 
                  <dl class="sub-nav">
                        <dd data-magellan-arrival="create"><a href="#create">Create Table</a></dd>
                        <dd data-magellan-arrival="insert"><a href="#insert">Insert</a></dd>
                        <dd data-magellan-arrival="update"><a href="#update">Update</a></dd>
                        <dd data-magellan-arrival="fields"><a href="#fields">Input Fields</a></dd>
                  </dl>
                </div>
            </div>
        </div>
      <!---/ Sub Nav --->
      <div class="row">
        <div class="large-12 columns">
          <a name="create"></a>
          <h3 data-magellan-destination="create">Create Table</h3>
          <div class="panel code">
            <cfif getFields.RecordCount GT 0>
              <cfoutput>
                CREATE TABLE `#getFields.tableName#`(<br>
                  <cfloop query="getFields">
                    `#getFields.fieldName#` #getFields.fieldDataType#<cfif getFields.fieldLength NEQ "">(#getFields.fieldLength#)</cfif><cfif getFields.fieldReq EQ "1"> NOT NULL</cfif><cfif getFields.fieldKey EQ "1"> AUTO_INCREMENT</cfif><cfif getFields.fieldDefault NEQ ""> DEFAULT #getFields.fieldDefault#</cfif>,
                    <cfif getFields.fieldKey EQ "1"><cfset PrimaryKey = getFields.fieldName></cfif>
                    <br>
                  </cfloop>
                  PRIMARY KEY (`#PrimaryKey#`)<br>
                );
              </cfoutput>
            <cfelse>
              <i>Select a Table</i>
            </cfif>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="large-12 columns">
          <a name="insert"></a>
          <h3 data-magellan-destination="insert">Insert Row</h3>
          <div class="panel code">
            <cfif getFields.RecordCount GT 0>
              <cfoutput>
                  </p>
                  &lt;cfinsert datasource=&quot;##DataSource##&quot; tablename=&quot;#LCase(getFields.tableName)#&quot; formfields=&quot;<cfloop query="getFields" startrow="2">#getFields.fieldName#<cfif getFields.currentrow LT getFields.RecordCount>, </cfif></cfloop>&quot;&gt;
                  </p>
              </cfoutput>
            <cfelse>
              <i>Select a Table</i>
            </cfif>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="large-12 columns">
          <a name="update"></a>
          <h3 data-magellan-destination="update">Update Row</h3>
          <div class="panel code">
            <cfif getFields.RecordCount GT 0>
              <cfoutput>
                  <p>
                    &lt;cfupdate datasource=&quot;##DataSource##&quot; tablename=&quot;#LCase(getFields.tableName)#&quot; formfields=&quot;<cfloop query="getFields">#getFields.fieldName#<cfif getFields.currentrow LT getFields.RecordCount>, </cfif></cfloop>&quot;&gt;
                  </p>
              </cfoutput>
            <cfelse>
              <i>Select a Table</i>
            </cfif>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="large-12 columns">
          <a name="fields"></a>
          <h3 data-magellan-destination="fields">Input Fields</h3>
          <div class="panel code">
            <cfif getFields.RecordCount GT 0>
              <cfoutput>
                
                <cfloop query="getFields" startrow="2">
                  <a href="#AbsoluteURL#pages/secure/field.cfm?field=#getFields.fieldID#" class="button tiny right">Edit Field</a>
                  <cfif getFields.fieldDataType EQ "int" AND getFields.fieldLength EQ "1">
                    <p>
                      &lt;!--- #getFields.fieldName# ---&gt;<br>
                      &lt;label&gt;#getFields.fieldLongName#&lt;/label&gt;<br>
                      &lt;select name=&quot;#getFields.fieldName#&quot;<cfif getFields.fieldReq EQ 1> required</cfif>&gt;<br>
                      <cfif getFields.fieldReq EQ 0><br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option &lt;cfif get#getFields.tableName#.#getFields.fieldName# EQ &quot;&quot;&gt;selected&lt;/cfif&gt;&gt;&lt;/option&gt;<br>
                       </cfif>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option value=&quot;1&quot; &lt;cfif get#getFields.tableName#.#getFields.fieldName# EQ 1&gt;selected&lt;/cfif&gt;&gt;Yes&lt;/option&gt;<br>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;option value=&quot;0&quot; &lt;cfif get#getFields.tableName#.#getFields.fieldName# EQ 0&gt;selected&lt;/cfif&gt;&gt;No&lt;/option&gt;<br>
                      &lt;/select&gt;<br>
                       &lt;!---/ #getFields.fieldName# ---&gt;
                    </p>
                  <cfelseif getFields.fieldDataType EQ "text">
                    
                    <p>
                    &lt;!--- #getFields.fieldName# ---&gt;<br>
                    &lt;label&gt;#getFields.fieldLongName#&lt;/label&gt;<br>
                    &lt;textarea name=&quot;#getFields.fieldName#&quot;<Br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;placeholder=&quot;<cfif getFields.fieldDataType EQ "int" OR getFields.fieldDataType EQ "decimal">0<cfelse>#getFields.fieldLongName#</cfif>&quot;
                      <cfif getFields.fieldReq EQ 1><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;required</cfif>&gt;##get#getFields.tableName#.#getFields.fieldName###&lt;/textarea&gt;<br>
                      <cfif getFields.fieldReq EQ 1>
                        <br>&lt;small class=&quot;error&quot;&gt;This field is requried&lt;/small&gt;<br>
                      </cfif>
                    &lt;!---/ #getFields.fieldName# ---&gt;
                    </p>
                  <cfelse>
                    <p>
                      &lt;!--- #getFields.fieldName# ---&gt;<br>
                      &lt;label&gt;#getFields.fieldLongName#&lt;/label&gt;<br>
                        &lt;input type=&quot;<cfif getFields.fieldDataType EQ "int">number<cfelseif getFields.fieldDataType EQ "decimal">number<cfelseif getFields.fieldDataType EQ "datetime">date<cfelseif getFields.fieldDataType EQ "timestamp">datetime<cfelse>text</cfif>&quot;<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;name=&quot;#getFields.fieldName#&quot;<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;value=&quot;##get#getFields.tableName#.#getFields.fieldName###&quot;<br>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;placeholder=&quot;<cfif getFields.fieldDataType EQ "int" OR getFields.fieldDataType EQ "decimal">0<cfelse>#getFields.fieldLongName#</cfif>&quot;<cfif getFields.fieldReq EQ 1 AND getFields.fieldDefault NEQ "0"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;required</cfif><cfif getFields.fieldLength GT 0><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;maxlength=&quot;#getFields.fieldLength#&quot;</cfif>&gt;<br>
                      <cfif getFields.fieldDataType EQ "decimal" AND getFields.fieldDataFormat NEQ "currency">
                        &lt;small class=&quot;error&quot;&gt;Must be a number&lt;/small&gt;<br>
                      <cfelseif getFields.fieldDataType EQ "int">
                        &lt;small class=&quot;error&quot;&gt;Must be a whole number&lt;/small&gt;<br>
                      <cfelseif getFields.fieldDataType EQ "date" OR getFields.fieldDataType EQ "date">
                        &lt;small class=&quot;error&quot;&gt;Must be a date (YYYY-MM-DD)&lt;/small&gt;<br>
                      <cfelseif getFields.fieldDataType EQ "date" OR getFields.fieldDataType EQ "time">
                        &lt;small class=&quot;error&quot;&gt;Must be a time (HH:MM:SS)&lt;/small&gt;<br>
                        <cfelseif getFields.fieldDataType EQ "date" OR getFields.fieldDataType EQ "date">
                        &lt;small class=&quot;error&quot;&gt;Must be a valid URL (https://homebaseccc.org)&lt;/small&gt;<br>
                      <cfelseif getFields.fieldReq EQ 1>
                        &lt;small class=&quot;error&quot;&gt;This field is requried&lt;/small&gt;<br>
                      </Cfif>
                      &lt;!---/ #getFields.fieldName# ---&gt;
                    </p>
                  </cfif>
                  <hr>
                </cfloop>
              </cfoutput>
            <cfelse>
              <i>Select a Table</i>
            </cfif>
          </div>
        </div>
      </div>

    <cfelse>
      <!--- Profile Form --->
          <!--- Get Tables --->
          <cfinvoke component="knex.table" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getTables"
                whatFields = "*"
                Where = "thisTable">
          <!---/ Get Tables --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.table EQ 0>
            <h1>Add a Table</h1>
          <cfelse>
            <h1>Update Table Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-8 columns">
              <label>Table Name</label>
              <input type="text" 
                     name="tableName" 
                     value="#getTables.tableName#" 
                     placeholder=""
                     maxlength="128"
                     required>
              <small class="form-error"></small>
            </div>
            <div class="medium-2 columns">
              <label>APR ? ##</label>
              <input type="number" 
                     name="APRQuestion" 
                     value="#getTables.APRQuestion#" 
                     placeholder="1"
                     maxlength="6">
              <small class="Enter the APR question as a whole number"></small>
            </div>
            <div class="medium-2 columns">
              <label>Project Data ?<label>
              <select name="projectData">
                <option value="1" <cfif getTables.projectData EQ "1">selected</cfif>>Yes</option>
                <option value="0" <cfif getTables.projectData EQ "0" OR getTables.projectData EQ "">selected</cfif>>No</option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="large-10 columns">
              <label>APR Question (Text)</label>
              <input type="text"
                     name="tableAPRQTitle"
                     value="#getTables.tableAPRQTitle#"
                     placeholder="APR Question Title"
                     maxlength="256">
            </div>
            <div class="large-2 columns">
              <label>Priority</label>
              <select name="tableAPRPriority">
                <option value="req" <cfif getTables.tableAPRPriority EQ "req">SELECTED</cfif>>Required</option>
                <option value="opt" <cfif getTables.tableAPRPriority EQ "opt" OR getTables.tableAPRPRiority EQ "">SELECTED</cfif>>Optional</option>
                <option value="hide" <cfif getTables.tableAPRPriority EQ "hide">SELECTED</cfif>>Hide</option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <label>Table Notes</label>
              <textarea name="tableNotes" placeholder="Notes">#getTables.tableNotes#</textarea>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
      <!--- Get Components --->
      <cfinvoke component="knex.component" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getProjectCom"
            whatFields = "projectComponentLongName, projectComponentID"
            Order = "projectComponentLongName ASC">
      <!---/ Get Components --->
              <label>Applicable HUD Program Components (APR Data Tables Only):</label>
              <cfloop query="#getProjectCom#">
                <cfif listFind(getTables.programComponentList, "#getProjectCom.projectComponentID#") GT 0>
                  <cfset checked="checked">
                <cfelse>
                  <cfset checked="">
                </cfif>
                <input type="checkbox" name="programComponentList" value="#getProjectCom.projectComponentID#" #checked#>
                  #getProjectCom.projectComponentLongName#
                </input><br>
              </cfloop>
                </div>
              </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.table#" name="tableID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.table EQ 0>
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