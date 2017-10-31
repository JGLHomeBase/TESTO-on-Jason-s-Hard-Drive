<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name=URL.performGroup.cfm default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
  <cfquery datasource="#datasource#" name="getperformgroup">
    SELECT pmGroupID, pmGroupLongName FROM performgroup WHERE pmGroupID = <cfqueryparam value="#FORM.pmGroupID#">
  </cfquery>
  <cfif getperformgroup.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM performgroup WHERE pmGroupID = <cfqueryparam value="#getperformgroup.pmGroupID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getperformgroup.pmGroupLongName#"
          EventDesc = "Measurement Group Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Measurement Group deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.pmGroupID EQ 0 AND SESSION.authLevel LTE 1>
  <cfset FORM.cocID = SESSION.cocID>
  <cfinsert datasource="#datasource#" tablename="performgroup" formfields="pmGroupDesc, pmGroupLongName, pmGroupName">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new measurement group (#FORM.pmGroupLongName#)"
          EventDesc = "New Measurement Group" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.pmGroupLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.pmGroupID NEQ 0 AND SESSION.authLevel LTE 1>
  <cfupdate datasource="#datasource#" tablename="performgroup" formfields="pmGroupID, pmGroupDesc, pmGroupLongName, pmGroupName">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new measurement group (#FORM.pmGroupLongName#)"
          EventDesc = "New Measurement Group" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.pmGroupLongName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Measurement Groups
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
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="performGroup.cfm?action=new">Add Measurement Group</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="performGroup.cfm?action=list">Manage Measurement Group</a></li>
          <li class="divider"></li>
          <li><label>Performance Measures</label></li>
          <li><a href="performMeasure.cfm?action=new">Add Performance Measure</a></li>
          <li><a href="performMeasure.cfm?action=list">Manage Performance Measure</a></li>
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
      <cfquery datasource="#datasource#" name="getperformgroup">
        SELECT * from performgroup WHERE active = '1'
        ORDER BY pmGroupLongName ASC
      </cfquery>
      <cfoutput><h1>Measurement Groups</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Measurement Group</th>
          <cfif SESSION.authLevel LTE 1>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getperformgroup"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getperformgroup.pmGroupLongName#</b></td>
              <cfif SESSION.authLevel LTE 1>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?performGroup.cfm=#getperformgroup.pmGroupID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?performGroup.cfm=#getperformgroup.pmGroupID#&action=delete">
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
        <cfset pageRecordCount = getperformgroup.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.performGroup.cfm NEQ "" AND SESSION.authLevel LTE 1>
      <cfquery datasource="#datasource#" name="getperformgroup">
          SELECT pmGroupID, pmGroupLongName FROM performgroup WHERE pmGroupID = <cfqueryparam value="#URL.performGroup.cfm#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a measurement group. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getperformgroup.pmGroupID#" name="pmGroupID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getperformgroup.pmGroupLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getperformgroup">
        SELECT * FROM performgroup WHERE pmGroupID = <cfqueryparam value="#URL.performGroup.cfm#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.performGroup.cfm EQ 0>
            <h1>Add a Measurement Group</h1>
          <cfelse>
            <h1>Update Measurement Group Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-8 columns">
              <label>Measurement Group</label>
              <input type="text" 
                     name="pmGroupLongName" 
                     value="#getperformgroup.pmGroupLongName#" 
                     placeholder=""
                     required>
              <small class="form-error"></small>
            </div>
            <div class="medium-4 columns">
              <label>Group Nickname</label>
                <input type="text"
                       name="pmGroupName"
                       value="#getperformGroup.pmGroupName#"
                       placeholder="Group Nickname"
                       required
                      maxlength="128">
                <small class="form-error">This field is requried</small>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
                <label>Description of this Group</label>
                <input type="text"
                       name="pmGroupDesc"
                       value="#getperformGroup.pmGroupDesc#"
                       placeholder="Description of this Group"
                       required
                      maxlength="256">
                <small class="form-error">This field is requried</small>
            </div>  
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.performGroup.cfm#" name="pmGroupID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.performGroup.cfm EQ 0>
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