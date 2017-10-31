<!--- Variables --->
<cfparam name=URL.user default ="0">
<cfparam name=URL.comp default ="#SESSION.compID#">
<!---/ Variables --->
    
<!-- Get Comp Info --->
<cfquery name="getComp">
SELECT compID, compLongName
FROM comp
WHERE compID = <cfqueryparam value="#URL.comp#">    
</cfquery>
<!---/ Get Comp Info --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 5>
    <cfinvoke component="knex.compPanel"
              method="nuke"
              datasource="#datasource#"
              compPanelID="#FORM.compPanelID#">
<cfelseif FORM.action EQ "process" AND SESSION.authLevel LTE 5>
    <!--- Process Panelist --->
        <!--- Process Users --->
            <cfif FORM.compPanelID EQ 0 AND FORM.userID EQ "new" AND FORM.userEmail NEQ "">
                <!--- Check for Existing User --->
                <cfquery name="userCheck">
                SELECT userID
                FROM users
                WHERE userEmail = <cfqueryparam value="#FORM.userEmail#">
                </cfquery>
                <!---/ Check for Existing User --->
                <cfif userCheck.RecordCount GT 0>
                    <cfset FORM.userID = userCheck.userID>
                <cfelse>
                <!--- Add New User --->
                    <cfset FORM.cocID = SESSION.cocID>
                    <cfset FORM.authLevel = 7>
                    <cfset FORM.password = left(generateSecretKey("Blowfish",32),6)>
                    <cfset FORM.userPassword = Hash(FORM.password,"SHA-512")>
                    <cfset FORM.requireReset = "1">
                    <cfinsert datasource="#datasource#" 
                              tablename="users" 
                              formfields="userEmail, userFirst, userLast, compID, cocID, authLevel, userPassword, requireReset">
                    <!--- Fetch New UserID --->
                    <cfquery name="userCheck">
                    SELECT userID
                    FROM users
                    WHERE userEmail = <cfqueryparam value="#FORM.userEmail#">
                    </cfquery>
                    <cfset FORM.userID = userCheck.userID>
                    <!---/ Fetch New UserID --->
                <!---/ Add New User --->
                </cfif>

            </cfif>
        <!---/ Process Users --->    
    
        <cfif FORM.compPanelID EQ 0>
            <!--- Insert Record --->
            <cfinsert datasource="#DataSource#" tablename="comppanel" formfields="scoreAllow, scoreInclude, seat, UserID, compID">
            <!---/ Insert Record --->
            <!--- Update Competition Scores --->
            <cfinvoke component="knex.sortinghat" 
                    method="scoreComp"
                    DataSource = "#DataSource#"
                    compID="#SESSION.compID#">
            <!---/ Update Competition Scores --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog"
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) added a new panelist"
                  EventDesc = "New Panelist" >
            <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Panelist added successfully.">
        <cfelse>
            <!--- Update Record --->
            <cfupdate datasource="#DataSource#" tablename="comppanel" formfields="scoreAllow, scoreInclude, seat, compID, compPanelID">
            <!---/ Update Record --->
            <!--- Update Competition Scores --->
            <cfinvoke component="knex.sortinghat" 
                    method="scoreComp"
                    DataSource = "#DataSource#"
                    compID="#SESSION.compID#">
            <!---/ Update Competition Scores --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Update" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) updated a panelist"
                  EventDesc = "Updated Panelist" >
            <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Update successful.">
        </cfif>
        
    <!---/ Process App --->
            
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Competition Settings
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
      <!--- Navigation --->
      <cfinclude template="#AbsoluteURL#legos/compMenu.cfm">
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "delete" AND URL.user NEQ "" AND SESSION.authLevel LTE 5>
      <cfquery datasource="#datasource#" name="getPanelists">
          SELECT compPanelID, comppanel.userID, users.userFirst, users.userLast
          FROM comppanel
          INNER JOIN users ON comppanel.userID = users.userID
          WHERE compPanelID = <cfqueryparam value="#URL.user#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">
                <cfoutput>
                    You are about to delete a panelist (#getPanelists.userFirst# #getPanelists.userLast#). This cannot be undone. Are you sure?
                </cfoutput>
            </p>
            <cfoutput>
              <form action="#CurrentPage#?comp=#URL.comp#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getPanelists.compPanelID#" name="compPanelID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete Panelist" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
        <hr>
    </cfif>
     <!--- List --->
   
   <cfquery name="getPanelists">
   SELECT comppanel.compPanelID, users.userFirst, users.userLast, users.userEmail, comppanel.userID, comppanel.scoreAllow, comppanel.scoreInclude, comppanel.seat
   FROM comppanel
   INNER JOIN users ON users.userID = comppanel.userID
   WHERE comppanel.active = '1' 
         AND comppanel.compID = <cfqueryparam value="#URL.comp#">
   ORDER BY seat, comppanel.scoreAllow DESC, comppanel.scoreInclude DESC, users.userLast
   </cfquery>
      <cfset PanelList = ValueList(getPanelists.userID)>
    <cfoutput>
        <div class="row">
            <div class="large-12 columns">
                <br><br>
                <h1>#SESSION.cocCity# #getComp.compLongName#</h1>
                <h3>Included Projects</h3>
                <p>There <cfif getPanelists.RecordCount EQ 1>is <b>#getPanelists.RecordCount#</b> panelist<cfelse>are <b>#getPanelists.RecordCount#</b> panelists</cfif><cfif getPanelists.RecordCount EQ 0>.<cfelse>:</cfif></p>
            </div>
        </div>
        <div class="row">
            <div class="large-12 columns">
                <cfloop query="getPanelists">
                    <div class="panel BGLightGray">
                        <div class="row">
                            <div class="medium-1 columns text-left">
                                    <img width="60" 
                                         height="60" 
                                         class="UserPicSmall"
                                         src="http://www.gravatar.com/avatar/#lcase(Hash(lcase(getPanelists.userEmail)))#?d=#FullURL#img/profile/default100.jpg" 
                                         alt="#getPanelists.userFirst# #getPanelists.userLast#">
                            </div>
                            <div class="medium-7 columns">
                                <h4>#getPanelists.userFirst# #getPanelists.userLast#</h4>
                                    <i>
                                    </i>
                                    <br><br>
                            </div>
                            <div class="medium-4 columns text-right">
                                <h3>
                                    <a href="mailto:#getPanelists.userEmail#" class="panelLink button small" style="display: none;"><i class="fi-mail"></i></a>
                                    <a href="users.cfm?user=#getPanelists.userID#" class="panelLink button small success" style="display: none;"><i class="fi-pencil"></i></a>
                                    <a href="#CurrentPageVar#&action=delete&user=#getPanelists.compPanelID#" class="panelLink button small alert" style="display: none;"><i class="fi-x"></i></a>
                                </h3>
                            </div>
                        </div>
                        <div class="panelLink">
                            <cfset FormType = "update">
                            <cfinclude template="#AbsoluteURL#legos/compPanelForm.cfm">
                        </div>
                    </div>
                </cfloop>
                <div class="row">
                    <div class="large-12 columns">
                        <br><br><hr>
                        <h3>Add a Panelist</h3>
                        <div class="panel">
                            <div class="">
                                <cfset FormType = "new">
                                <cfinclude template="#AbsoluteURL#legos/compPanelForm.cfm">
                            </div>
                        </div>
                        <br><br>
                    </div>
            
            </div>
        </div>
        </div>
    </cfoutput>
    <!---/ List --->
  </div>
</div>