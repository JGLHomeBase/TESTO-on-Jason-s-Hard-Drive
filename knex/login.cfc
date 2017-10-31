<!--- 
Filename: login.cfc
Version: 1.0
--->


<cfcomponent displayname="Login" hint="Updates" output="false">

    <!--- Update Password --->
	<cffunction name="Update" access="public" description="Updates user fields" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
          <cfset FORM.userID = SESSION.userID>
          <cfset FORM.userPassword = FORM.password>
          <cfset FORM.requireReset = 0>
          <cfupdate datasource="#datasource#" tablename="users" formfields="userID, userPassword, requireReset">
          <cfset SESSION.requireReset = 0>
          <!--- Log Event --->
          <cfinvoke component="knex.eventLog" 
              method="newEvent"
              DataSource = "#DataSource#"
              EventType = "Update" 
              EventDetail = "#SESSION.userFirst# #SESSION.userLast# updated their password."
              EventDesc = "Password Change" >
          <!---/ Log Event --->
	
    </cffunction>
    <!---/ Update Password --->
              
</cfcomponent>