<!--- 
Filename: compPanel.cfc
Version: 1.0
--->


<cfcomponent displayname="compPanel" hint="Insert update and delete records in the compPanel table" output="false">

    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Deletes panelist record, and associated user from the user table if the user type is panelist (AuthLevel=7)" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true">
        <cfargument name="compPanelID" hint="ID of panelist to delete" type="numeric" required="true">  
        <!---/ Arguements --->
          <cfquery datasource="#datasource#" name="getPanelists">
            SELECT compPanelID, users.authLevel, users.compID, comppanel.userID 
            FROM comppanel
            INNER JOIN users ON comppanel.userID = users.userID
            WHERE compPanelID = <cfqueryparam value="#compPanelID#">
          </cfquery>
          <cfif getPanelists.RecordCount EQ 1>
            <cfquery datasource="#datasource#" name="deletePanelist">
              DELETE FROM comppanel WHERE compPanelID = <cfqueryparam value="#getPanelists.compPanelID#">
            </cfquery>
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
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a rank and review panelist"
                  EventDesc = "Panelist Deleted" >
              <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Panelist deleted successfully.">
            <cfif getPanelists.authLevel EQ "7" and getPanelists.compID EQ URL.comp>
                <cfquery datasource="#datasource#" name="deleteUser">
                  DELETE FROM users WHERE userID = <cfqueryparam value="#getPanelists.userID#">
                     AND users.compID = <cfqueryparam value="#URL.comp#">
                    AND users.authLevel = '7'
                </cfquery>
                <!--- Log Event --->
              <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a user account (#getPanelists.userID#)"
                  EventDesc = "User Deleted" >
              <!---/ Log Event --->
            </cfif>
          </cfif>
	</cffunction>
    <!---/ Nuke Record --->

</cfcomponent>