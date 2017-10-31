<!--- REMOVE THIS --->

    <cfabort>
    <!--- TABLE DATA EDIT TEMPLATE --->
    <!--- FIND AND REPLACE VARIABLES


    VAR-URLSHORT (i.e. template.cfm)
    VAR-PRIMARYKEY 
    VAR-FORMFIELDS
    VAR-tablename
    VAR-LONGNAMEFIELD
    VAR-UNIT-LOWERCASE - (i.e. competition)
    VAR-UNIT-UPPERCASE - (i.e. VAR-UNIT-UPPERCASE)
    VAR-AUTHLEVEL-DELETE
    VAR-AUTHLEVEL-EDIT
    --->
    
<!---/ REMOVE THIS --->


<!--- Variables --->
<cfparam name=URL.VAR-URLSHORT default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE VAR-AUTHLEVEL-DELETE>
  <cfquery datasource="#datasource#" name="getVAR-tablename">
    SELECT VAR-PRIMARYKEY, VAR-LONGNAMEFIELD FROM VAR-tablename WHERE VAR-PRIMARYKEY = <cfqueryparam value="#FORM.VAR-PRIMARYKEY#">
  </cfquery>
  <cfif getVAR-tablename.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM VAR-tablename WHERE VAR-PRIMARYKEY = <cfqueryparam value="#getVAR-tablename.VAR-PRIMARYKEY#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getVAR-tablename.VAR-LONGNAMEFIELD#"
          EventDesc = "VAR-UNIT-UPPERCASE Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "VAR-UNIT-UPPERCASE deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.VAR-PRIMARYKEY EQ 0 AND SESSION.authLevel LTE VAR-AUTHLEVEL-EDIT>
  <cfset FORM.cocID = SESSION.cocID>
  <cfinsert datasource="#datasource#" tablename="VAR-tablename" formfields="VAR-FORMFIELDS">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new VAR-UNIT-LOWERCASE (#FORM.VAR-LONGNAMEFIELD#)"
          EventDesc = "New VAR-UNIT-UPPERCASE" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.VAR-LONGNAMEFIELD# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.VAR-PRIMARYKEY NEQ 0 AND SESSION.authLevel LTE VAR-AUTHLEVEL-EDIT>
  <cfupdate datasource="#datasource#" tablename="VAR-tablename" formfields="VAR-PRIMARYKEY, VAR-FORMFIELDS">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new VAR-UNIT-LOWERCASE (#FORM.VAR-LONGNAMEFIELD#)"
          EventDesc = "New VAR-UNIT-UPPERCASE" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.VAR-LONGNAMEFIELD# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage VAR-UNIT-UPPERCASEs
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
        <cfif SESSION.authLevel LTE VAR-AUTHLEVEL-EDIT>
          <li><label>VAR-UNIT-UPPERCASEs</label></li>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add VAR-UNIT-UPPERCASE</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage VAR-UNIT-UPPERCASE</a></li>
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
      <cfquery datasource="#datasource#" name="getVAR-tablename">
        SELECT * from VAR-tablename WHERE active = '1'
        ORDER BY VAR-LONGNAMEFIELD ASC
      </cfquery>
      <cfoutput><h1>VAR-UNIT-UPPERCASEs</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>VAR-UNIT-UPPERCASE</th>
          <cfif SESSION.authLevel LTE VAR-AUTHLEVEL-EDIT>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getVAR-tablename"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getVAR-tablename.VAR-LONGNAMEFIELD#</b></td>
              <cfif SESSION.authLevel LTE VAR-AUTHLEVEL-EDIT>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?VAR-URLSHORT=#getVAR-tablename.VAR-PRIMARYKEY#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE VAR-AUTHLEVEL-DELETE>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?VAR-URLSHORT=#getVAR-tablename.VAR-PRIMARYKEY#&action=delete">
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
        <cfset pageRecordCount = getVAR-tablename.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.VAR-URLSHORT NEQ "" AND SESSION.authLevel LTE VAR-AUTHLEVEL-DELETE>
      <cfquery datasource="#datasource#" name="getVAR-tablename">
          SELECT VAR-PRIMARYKEY, VAR-LONGNAMEFIELD FROM VAR-tablename WHERE VAR-PRIMARYKEY = <cfqueryparam value="#URL.VAR-URLSHORT#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a VAR-UNIT-LOWERCASE. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getVAR-tablename.VAR-PRIMARYKEY#" name="VAR-PRIMARYKEY">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getVAR-tablename.VAR-LONGNAMEFIELD#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getVAR-tablename">
        SELECT * FROM VAR-tablename WHERE VAR-PRIMARYKEY = <cfqueryparam value="#URL.VAR-URLSHORT#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.VAR-URLSHORT EQ 0>
            <h1>Add a VAR-UNIT-UPPERCASE</h1>
          <cfelse>
            <h1>Update VAR-UNIT-UPPERCASE Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-12 columns">
              <label>VAR-UNIT-UPPERCASE</label>
              <input type="text" 
                     name="VAR-LONGNAMEFIELD" 
                     value="#getVAR-tablename.VAR-LONGNAMEFIELD#" 
                     placeholder=""
                     required>
              <small class="form-error"></small>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.VAR-URLSHORT#" name="VAR-PRIMARYKEY">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.VAR-URLSHORT EQ 0>
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