<!--- Variables --->
<cfparam name=URL.appSettings.cfm default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
  <cfquery datasource="#datasource#" name="getsettings">
    SELECT settingID, settingFullName
    FROM settings
    WHERE settingID = <cfqueryparam value="#FORM.settingID#"> AND settingRequired = <cfqueryparam value="0">\
    ORDER BY settingFullName
  </cfquery>
  <cfif getsettings.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM settings WHERE settingID = <cfqueryparam value="#getsettings.settingID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getsettings.settingFullName#"
          EventDesc = "Setting Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Setting deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.settingID EQ 0 AND SESSION.authLevel LTE 1>
    <cfset FORM.lcUserID = SESSION.userID>
    <cfset FORM.lcIP = CGI.REMOTE_ADDR>
    <cfset FORM.lcDateTime = now()>
    <cfinsert datasource="#datasource#" tablename="settings" formfields="lcDateTime, lcUserID,  lcIP, settingFullName, settingName, settingValue, settingRequired, settingNotes">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new setting (#FORM.settingFullName#)"
          EventDesc = "New Setting" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.settingFullName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.settingID NEQ 0 AND SESSION.authLevel LTE 1>
  <cfset FORM.lcUserID = SESSION.userID>
  <cfset FORM.lcIP = CGI.REMOTE_ADDR>
  <cfset FORM.lcDateTime = now()>
  <cfupdate datasource="#datasource#" tablename="settings" formfields="settingID, lcDateTime, lcUserID, lcIP, settingFullName, settingName, settingValue, settingRequired, settingNotes">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new setting (#FORM.settingFullName#)"
          EventDesc = "New Setting" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.settingFullName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage #AppShortNAme# Settings
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
          <li><label>#AppShortName# Settings</label></li>
            <cfif SESSION.authLevel LTE 1>
                <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Setting</a></li>
            </cfif>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage #AppShortNAme# Settings</a></li>
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
      <cfquery datasource="#datasource#" name="getsettings">
        SELECT * from settings 
        ORDER BY settingFullName ASC
      </cfquery>
      <cfoutput><h1>#AppShortName# Settings</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Application Setting</th>
          <th>Variable Name</th>
          <th>Current Value</th>
          <cfif SESSION.authLevel LTE 1>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getsettings"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getsettings.settingFullName#</b></td>
              <td>#getsettings.settingName#</td>
              <td><i>
                    #Left(getsettings.settingValue,32)#<cfif Len(getSettings.settingValue) GT 32>&hellip;</cfif>
                  </i>
              </td>
              <cfif SESSION.authLevel LTE 1>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?appSettings.cfm=#getsettings.settingID#">
                         <i class="fi-pencil"></i>
                      </a>
                        <cfif SESSION.authLevel LTE 1 AND getsettings.settingRequired EQ 0>
                            &nbsp; | &nbsp;
                            <a href="#CurrentPage#?appSettings.cfm=#getsettings.settingID#&action=delete">
                               <i class="fi-trash"></i>
                            </a>
                        </cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!--- Pagination --->
        <cfset pageRecordCount = getsettings.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.appSettings.cfm NEQ "" AND SESSION.authLevel LTE 1>
      <cfquery datasource="#datasource#" name="getsettings">
          SELECT settingID, settingFullName FROM settings WHERE settingID = <cfqueryparam value="#URL.appSettings.cfm#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a setting. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getsettings.settingID#" name="settingID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getsettings.settingFullName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getsettings">
        SELECT * FROM settings WHERE settingID = <cfqueryparam value="#URL.appSettings.cfm#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.appSettings.cfm EQ 0>
            <h1>Add a Setting</h1>
          <cfelse>
            <h1>Update Setting Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-6 columns">
              <label>Setting Name</label>
              <input type="text" 
                     name="settingFullName" 
                     value="#getsettings.settingFullName#" 
                     placeholder="Google Analytics ID"
                     required>
              <small class="form-error">Enter a name for the setting</small>
            </div>
            <div class="medium-3 columns">
              <label>Setting Nickname</label>
              <input type="text" 
                     name="settingName" 
                     value="#getsettings.settingName#" 
                     placeholder="GoogleID"
                     required>
              <small class="form-error">Give the setting a short nickname</small>
            </div>
            <div class="medium-3 columns">
                <!--- settingRequired --->
                <label>Required?</label>
                <select name="settingRequired" required>
                       <option value="1" <cfif getSettings.settingRequired EQ 1>selected</cfif>>Yes</option>
                       <option value="0" <cfif getSettings.settingRequired EQ 0>selected</cfif>>No</option>
                </select>
                <!---/ settingRequired --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
                <hr>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <!--- settingValue --->
              <label>Setting Value</label>
              <input type="text"
                     name="settingValue"
                     value="#getSettings.settingValue#"
                     placeholder="UA-00000000-0"
                     maxlength="256">
              <!---/ settingValue --->
            </div>  
          </div>
           <div class="row">
            <div class="large-12 columns">
                <hr>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
             <!--- settingNotes --->
            <label>Notes</label>
            <textarea name="settingNotes"
                   placeholder="Setting Notes" >#getSettings.settingNotes#</textarea>
            <!---/ settingNotes --->
            </div>  
          </div
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.appSettings.cfm#" name="settingID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.appSettings.cfm EQ 0>
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