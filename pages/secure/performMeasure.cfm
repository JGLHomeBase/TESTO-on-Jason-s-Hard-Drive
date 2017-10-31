<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.performMeasure.cfm" default ="0">
<cfparam name="SESSION.pmCatID" default="0">
<cfparam name="URL.pmCat" default="#SESSION.pmCatID#">
<cfset SESSION.pmCatID = URL.pmCat>
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
  <cfquery datasource="#datasource#" name="getperformmeasure">
    SELECT pmID, pmLongName FROM performmeasure WHERE pmID = <cfqueryparam value="#FORM.pmID#">
  </cfquery>
  <cfif getperformmeasure.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM performmeasure WHERE pmID = <cfqueryparam value="#getperformmeasure.pmID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getperformmeasure.pmLongName#"
          EventDesc = "Performance Measure Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Performance Measure deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.pmID EQ 0 AND SESSION.authLevel LTE 1>
  <cfset FORM.cocID = SESSION.cocID>
  <cfinsert datasource="#datasource#" tablename="performmeasure" formfields="pmLongName, pmName, pmDesc, sourceField, formatMask, pmCatID, pmGroupID, formatType, cocID">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new performance measure (#FORM.pmLongName#)"
          EventDesc = "New Performance Measure" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.pmLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.pmID NEQ 0 AND SESSION.authLevel LTE 1>
  <cfupdate datasource="#datasource#" tablename="performmeasure" formfields="pmID, pmLongName, pmName, pmDesc, sourceField, formatMask, pmCatID, pmGroupID, formatType, cocID">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new performance measure (#FORM.pmLongName#)"
          EventDesc = "New Performance Measure" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.pmLongName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Performance Measures
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
        <cfif SESSION.authLevel LTE 1>
          <li><label>Performance Categories</label></li>
             <li><a href="performCat.cfm?action=new">Add Performance Category</a></li>
            <li><a href="performCat.cfm?action=list">Manage Performance Category</a></li>
          <li class="divider"></li>
          <li><label>Measurement Groups</label></li>
            <li><a href="performGroup.cfm?action=new">Add Measurement Group</a></li>
            <li><a href="performGroup.cfm?action=list">Manage Measurement Group</a></li>
          <li class="divider"></li>
          <li><label>Performance Measures</label></li>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="performMeasure.cfm?action=new">Add Performance Measure</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="performMeasure.cfm?action=list">Manage Performance Measure</a></li>
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
      <cfquery datasource="#datasource#" name="getperformmeasure">
        SELECT pmLongName, pmID, pmCatLongName, performmeasure.pmCatID, performmeasure.cocID, cocLongName from performmeasure
        INNER JOIN performcat ON performmeasure.pmCatID = performcat.pmCatID
        LEFT JOIN coc ON performmeasure.cocID = coc.cocID
        WHERE performmeasure.active = '1'
          <cfif SESSION.pmCatID NEQ 0>
              AND performmeasure.pmCatID = <cfqueryparam value="#SESSION.pmCatID#">
          </cfif> 
        ORDER BY pmCatLongName, pmLongName ASC
      </cfquery>
      <cfoutput><h1>Performance Measures</h1></cfoutput>
      <hr>
      <cfoutput>
        <cfquery name="getCat0">
          SELECT pmCatLongName, pmCatID
          FROM performcat
          WHERE parentID = '0' AND active = '1'
          ORDER BY pmCatLongNAme
        </cfquery>
        <form action="#CurrentPage#">
            <label>Filter by Category</label>
            <select name="pmCat"  onchange="this.form.submit()" >
                <cfset selected = "">
                <cfif SESSION.pmCatID EQ 0><cfset selected = " selected"></cfif>
                <option value="0"#selected#>-- Show All --</option>
                <cfloop query="getCat0">
                    <cfset selected = "">
                    <cfif SESSION.pmCatID EQ getCat0.pmCatID><cfset selected = " selected"></cfif>
                    <option value="#getCat0.pmCatID#"#selected#>#getCat0.pmCatLongName#</option>
                    <cfquery name="getCat1">
                      SELECT pmCatLongName, pmCatID
                      FROM performcat
                      WHERE parentID = <cfqueryparam value="#getCat0.pmCatID#"> AND active = '1'
                      ORDER BY pmCatLongNAme
                    </cfquery>
                    <cfloop query="getCat1">
                        <cfset selected = "">
                        <cfif SESSION.pmCatID EQ getCat1.pmCatID><cfset selected = " selected"></cfif>
                        <option value="#getCat1.pmCatID#"#selected#>#getCat0.pmCatLongName#: #getCat1.pmCatLongName#</option>
                    </cfloop>
                </cfloop>
            </select>
            <input type="hidden" name="action" value="list">
        </form>
      </cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Performance Measure</th>
          <th>Category</th>
          <th>Community</th>
          <cfif SESSION.authLevel LTE 1>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getperformmeasure"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getperformmeasure.pmLongName#</b></td>
              <td>#getperformmeasure.pmCatLongName#</td>
              <td>
                  <cfif getperformmeasure.cocID EQ 0>
                    <i>All Communities</i>
                  <cfelse>
                      #getperformmeasure.cocLongName#
                  </cfif>
              </td>
              <cfif SESSION.authLevel LTE 1>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?performMeasure.cfm=#getperformmeasure.pmID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?performMeasure.cfm=#getperformmeasure.pmID#&action=delete">
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
        <cfset pageRecordCount = getperformmeasure.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.performMeasure.cfm NEQ "" AND SESSION.authLevel LTE 1>
      <cfquery datasource="#datasource#" name="getperformmeasure">
          SELECT pmID, pmLongName FROM performmeasure WHERE pmID = <cfqueryparam value="#URL.performMeasure.cfm#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a performance measure. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getperformmeasure.pmID#" name="pmID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getperformmeasure.pmLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getperformmeasure">
        SELECT * FROM performmeasure WHERE pmID = <cfqueryparam value="#URL.performMeasure.cfm#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.performMeasure.cfm EQ 0>
            <h1>Add a Performance Measure</h1>
          <cfelse>
            <h1>Update Performance Measure Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-8 columns">
              <label>Performance Measure</label>
              <input type="text" 
                     name="pmLongName" 
                     value="#getperformmeasure.pmLongName#" 
                     placeholder=""
                     required>
              <small class="form-error"></small>
            </div>
            <div class="medium-4 columns">
              <label>Performance Measure Nickname</label>
                <input type="text"
                       name="pmName"
                       value="#getperformMeasure.pmName#"
                       placeholder="Performance Measure Nickname"
                       required
                      maxlength="128">
                <small class="form-error">This field is requried</small>
            </div>
          </div>
        <div class="row">
            <div class="medium-6 columns">
                <label>Category</label>
                <select name="pmCatID">
                    <cfquery name="getCat">
                    SELECT pmCatID, pmCatLongName FROM performcat WHERE parentID = '0' ORDER BY pmCatLongName
                    </cfquery>
                    <cfloop query="getCat">
                        <cfset selected = "">
                        <cfif getCat.pmCatID EQ getperformMeasure.pmCatID>
                            <cfset selected = " selected">
                        </cfif>
                        <option value="#getCat.pmCatID#"#selected#>#getCat.pmCatLongName#</option>
                        <cfquery name="getKids">
                        SELECT pmCatID, pmCatLongName FROM performcat WHERE parentID = <cfqueryparam value="#getCat.pmCatID#"> ORDER BY pmCatLongName
                        </cfquery>
                        <cfloop query="getKids">
                            <cfset selected = "">
                            <cfif getKids.pmCatID EQ getperformMeasure.pmCatID>
                                <cfset selected = " selected">
                            </cfif>
                            <option value="#getKids.pmCatID#"#selected#>#getCat.pmCatLongName#: #getKids.pmCatLongName#</option>
                        </cfloop>
                    </cfloop>
                </select>
            </div>
            <div class="medium-2 columns">
                <cfquery name="getGroups">
                    SELECT pmGroupID, pmGroupName FROM performgroup ORDER BY pmGroupLongName
                    </cfquery>
                <label>Measurement Group</label>
                <select name="pmGroupID">
                    <cfloop query="getGroups">
                        <cfset selected = "">
                            <cfif getGroups.pmGroupID EQ getperformMeasure.pmGroupID>
                                <cfset selected = " selected">
                            </cfif>
                        <option value="#getGroups.pmGroupID#"#selected#>#getGroups.pmGroupName#</option>
                    </cfloop>
                </select>
            </div>
            <div class="medium-2 columns">
                <label>Format Mask</label>
                <input type="text"
                       name="formatMask"
                       value="#getperformMeasure.formatMask#"
                       placeholder="Format Mask"
                      maxlength="32">
            </div>
            <div class="medium-2 columns">
                <label>Format Type</label>
                <select name="formatType">
                    <cfset select = "">
                    <cfif getperformMeasure.formatType EQ "number"><cfset select = " selected"></cfif>
                    <option value="number"#select#>Number (0.0)</option>
                    <cfset select = "">
                    <cfif getperformMeasure.formatType EQ "percent"><cfset select = " selected"></cfif>
                    <option value="percent"#select#>Percentage (0.0&##37;)</option>
                    <cfset select = "">
                    <cfif getperformMeasure.formatType EQ "money"><cfset select = " selected"></cfif>
                    <option value="money"#select#>Currency (&##36;0.00)</option>
                    <cfset select = "">
                    <cfif getperformMeasure.formatType EQ "varchar"><cfset select = " selected"></cfif>
                    <option value="varchar"#select#>Text (ABC123)</option>
                    <cfset select = "">    
                    <cfif getperformMeasure.formatType EQ "yesno"><cfset select = " selected"></cfif>
                    <option value="yesno"#select#>Yes/No (Yes)</option>
                </select>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
                <label>Community</label>
                <cfquery name="getCoc">
                SELECT cocID, cocCity, cocLongName
                FROM coc
                WHERE active = '1'
                ORDER BY cocCity, cocLongName
                </cfquery>
                <select name="cocID">
                    <option value="0">All Communities</option>
                    <cfloop query="getCoC">
                        <cfset selected = "">
                        <cfif getperformmeasure.cocID EQ getCoC.cocID><cfset selected = " selected"></cfif>
                        <option value="#getCoC.cocID#"#selected#>#getCoC.cocCity# - #getCoC.cocLongName#</option>
                        
                    </cfloop>
                </select>
            </div>  
          </div>
          <div class="row">
            <div class="large-12 columns">
                <label>Description of the Performance Measure</label>
                <input type="text"
                       name="pmDesc"
                       value="#getperformMeasure.pmDesc#"
                       placeholder="Description of the Performance Measure"
                       required
                      maxlength="256">
                <small class="form-error">This field is requried</small>
            </div>  
          </div>
          <div class="row">
            <div class="medium-12 columns">
                <label>MySQL Query</label>
                <textarea name="sourceField" placeholder="Name of Variable for this Performance Measure" maxlength="2000" required>#getperformMeasure.sourceField#</textarea>
                <small class="form-error">This field is requried</small>
            </div>
        </div>
        
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.performMeasure.cfm#" name="pmID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.performMeasure.cfm EQ 0>
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