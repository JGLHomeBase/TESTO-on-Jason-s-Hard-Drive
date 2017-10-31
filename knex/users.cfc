<!--- 
Filename: users.cfc
Version: 1.0
--->


<cfcomponent displayname="Users" hint="Insert update and delete agency records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif FORM.userPassword EQ FORM.confirmpassword>        
        
        <cfset FORM.userPassword = hash(FORM.userPassword,"SHA-512")>
          <cfif FORM.role GT SESSION.authLevel>
            <cfset FORM.authLevel = FORM.role>
          <cfelse>
            <cfset FORM.authLevel = 10>
          </cfif>
          <cfif SESSION.usercocID NEQ 0>
            <cfset FORM.cocID = SESSION.usercocID>
          </cfif>
        <cfif SESSION.usercompID EQ 0>
            <cfif FORM.compID NEQ 0>
              <cfquery datasource="#datasource#" name="getCoCID">
                SELECT cocID FROM comp WHERE compID = <cfqueryparam value="#FORM.compID#">
              </cfquery>
              <cfset FORM.cocID = getCoCID.cocID>
            </cfif>
          <cfelse>
            <cfset FORM.compID = SESSION.usercompID>
          </cfif>
         <cfif SESSION.userAgencyID EQ 0>
            <cfif FORM.AgencyID NEQ 0>
              <cfquery datasource="#datasource#" name="getAgencyID">
                SELECT cocID FROM agency WHERE agencyID = <cfqueryparam value="#FORM.agencyID#">
              </cfquery>
              <cfset FORM.cocID = getAgencyID.cocID>
            </cfif>
          <cfelse>
            <cfset FORM.agencyID = SESSION.userAgencyID>
          </cfif>
        <cfif SESSION.userprojectID EQ 0>
            <cfif FORM.projectID NEQ 0>
              <cfquery datasource="#datasource#" name="getprojectID">
                SELECT cocID, agencyID FROM projects WHERE projectID = <cfqueryparam value="#FORM.projectID#">
              </cfquery>
              <cfset FORM.cocID = getprojectID.cocID>
              <cfset FORM.agencyID = getprojectID.agencyID>

            </cfif>
      <cfelse>
        <cfset FORM.projectID = SESSION.userprojectID>
      </cfif>
        <cfset form.CellPhone = REReplace(form.CellPhone, "[^0-9]", "", "ALL") />
        <cfif SESSION.authLevel LTE 3>
          <cfinsert datasource="#datasource#" tablename="users" formfields="userPassword, userFirst, userLast, userEmail, requireReset, authLevel, cocID, compID, agencyID, projectID, CellPhone">
          <!--- Log Event --->
          <cfinvoke component="knex.eventLog" 
              method="newEvent"
              DataSource = "#DataSource#"
              EventType = "New" 
              EventDetail = "#SESSION.userFirst# #SESSION.userLast# created a new account (#FORM.userFirst# #FORM.userLast#)"
              EventDesc = "New user added" >
          <!---/ Log Event --->
            <!--- Slack --->
            <cfsavecontent variable="slackMessage">
                <cfoutput>
                    #SESSION.userFirst# #SESSION.userLast# created an account for *#FORM.userFirst# #FORM.userLast#* (#FORM.userEmail#)
                </cfoutput>
            </cfsavecontent>
            <cfinvoke component="knex.slacker"
                      method="post"
                      DataSource="#DataSource#"
                      slackMessage="#slackMessage#">
            <!---/ Slack --->
        </cfif>

          <cfset SESSION.message = "success">
          <cfset SESSION.messageText = "#FORM.userFirst# #FORM.userLast# added as a new user.">
        <cfelse>
          <cfset SESSION.message = "alert">
          <cfset SESSION.messageText = "Account creation failed. Passwords do not match.">
        </cfif>              

	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="numeric" required="true" >
        <!---/ Arguments --->

          <cfquery datasource="#datasource#" name="getUser">
            SELECT userID, authLevel FROM users WHERE userID = <cfqueryparam value="#URL.user#">
          </cfquery>
          <cfif getUser.RecordCount EQ 1 AND getUser.authLevel GTE SESSION.authLevel>
            <cfquery datasource="#datasource#" name="deleteuser">
              DELETE FROM users WHERE userID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "User deleted successfully.">
              <!--- Log Event --->
              <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted user #URL.user#"
                  EventDesc = "User Deleted" >
              <!---/ Log Event --->
              <!--- Slack --->
            <cfsavecontent variable="slackMessage">
                <cfoutput>
                    :fire: #SESSION.userFirst# #SESSION.userLast# deleted an account :fire:
                </cfoutput>
            </cfsavecontent>
            <cfinvoke component="knex.slacker"
                      method="post"
                      DataSource="#DataSource#"
                      slackMessage="#slackMessage#">
            <!---/ Slack --->
             <cfset URL.action = "list">
            </cfif>
	</cffunction>
    <!---/ Nuke Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
    <cfparam name="FORM.requireReset" default="0">        
    <cfif FORM.userID EQ SESSION.userID>
      <cfset FORM.authLevel = SESSION.authLevel>
    <cfelseif FORM.role GT SESSION.authLevel>
      <cfset FORM.authLevel = FORM.role>
    <cfelse>
      <cfset FORM.authLevel = 10>
    </cfif>

    <cfif SESSION.usercocID NEQ 0>
        <cfset FORM.cocID = SESSION.usercocID>
      </cfif>
    <cfif FORM.compID NEQ 0>
      <cfquery datasource="#datasource#" name="getCoCID">
        SELECT cocID FROM comp WHERE compID = <cfqueryparam value="#FORM.compID#">
      </cfquery>
      <cfset FORM.cocID = getCoCID.cocID>
    </cfif>
     <cfif FORM.agencyID NEQ 0>
      <cfquery datasource="#datasource#" name="getagencyID">
        SELECT agencyID FROM agency WHERE agencyID = <cfqueryparam value="#FORM.agencyID#">
      </cfquery>
      <cfset FORM.agencyID = getagencyID.agencyID>
    </cfif>
    <cfif FORM.projectID NEQ 0>
      <cfquery datasource="#datasource#" name="getprojectID">
        SELECT projectID FROM projects WHERE projectID = <cfqueryparam value="#FORM.projectID#">
      </cfquery>
      <cfset FORM.projectID = getprojectID.projectID>
    </cfif>
    <cfset form.CellPhone = REReplace(form.CellPhone, "[^0-9]", "", "ALL") />
    <cfupdate datasource="#datasource#" tablename="users" formfields="userID, userFirst, userLast, userEmail, requireReset, authLevel, cocID, compID, agencyID, projectID, CellPhone">            
    
            <cfparam name="FORM.userPassword" default="">
            <cfparam name="FORM.confirmPassword" default="0">
            <cfif FORM.userPassword NEQ "" AND FORM.userPassword EQ FORM.confirmpassword>
              <cfset FORM.userPassword = hash(FORM.userPassword,"SHA-512")>

          <cfupdate datasource="#datasource#" tablename="users" formfields="userID, userPassword">
          <!--- Log Event --->
          <cfinvoke component="knex.eventLog" 
              method="newEvent"
              DataSource = "#DataSource#"
              EventType = "Update" 
              EventDetail = "#SESSION.userFirst# #SESSION.userLast# updated #FORM.userFirst# #FORM.userLast#'s password."
              EventDesc = "Password Change" >
          <!---/ Log Event --->
              </cfif>
              
<cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Profile updated successfully.">
      <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Update" 
          EventDetail = "#SESSION.userFirst# #SESSION.userLast# updated #FORM.userFirst# #FORM.userLast#'s profile."
          EventDesc = "User Profile Update" >
      <!---/ Log Event --->              

    </cffunction>
    <!---/ Update Record --->

    <!--- Get Specific User --->
	     <cffunction name="getUser" access="public" description="Grabs information for all users" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->

	     <cfquery datasource="#datasource#" name="userCheck">
		    SELECT scoreID 
		    FROM scores 
		    WHERE userID = <cfqueryparam value="#FORM.userID#">
	   	    AND projectID = <cfqueryparam value="#FORM.projectID#"> 
            <cfif SESSION.cocID NEQ 0>
              AND cocID = <cfqueryparam value="#SESSION.cocID#">
            </cfif>
            <cfif SESSION.compID NEQ 0>
              AND compID = <cfqueryparam value="#SESSION.compID#">
            </cfif>
	     </cfquery>  
      <cfreturn userCheck> 
        
	   </cffunction>
    <!---/ Get Specific User --->                                         
                
    <!--- Get Users --->
        <cffunction name="get" access="public" description="Grabs project component for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Join" hint="Selects tables to join, and how" type="string" required="true" default="No" >
            <cfargument name="Where" hint="Sets which users the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="userID ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getUser">
                SELECT #whatFields#
                FROM users
                <cfif Join is "LCoCCompAgencyProjects">
                    LEFT JOIN coc ON users.cocID = coc.cocID
                    LEFT JOIN comp ON users.compID = comp.compID
                    LEFT JOIN agency ON users.agencyID = agency.agencyID
                    LEFT JOIN projects ON users.projectID = projects.projectID
                <cfelseif Join is "comppanel">
                    INNER JOIN comppanel ON users.userID = comppanel.userID
                </cfif>
                WHERE
                    <cfif Where is "ThisUser">
                    userID = <cfqueryparam value="#URL.user#">
                    <cfelseif Where is "Depends" AND SESSION.usercocID NEQ 0>
                    cocID = <cfqueryparam value="#SESSION.usercocID#">
                    
                    <cfelseif Where is "Depends" AND SESSION.usercompID NEQ 0>
                    compID = <cfqueryparam value="#SESSION.usercompID#">
                    
                    <cfelseif Where is "Depends" AND SESSION.useragencyID NEQ 0>
                    agencyID = <cfqueryparam value="#SESSION.useragencyID#">
                    
                    <cfelseif Where is "Depends" AND SESSION.userprojectID NEQ 0>
                    projectID = <cfqueryparam value="#SESSION.userprojectID#">
                    
                    <cfelseif Where is "thisEmail">
                    userEmail = <cfqueryparam value="#FORM.email#">
                    <cfelseif Where is "thisPW">
                    users.userEmail = <cfqueryparam value="#FORM.email#">
                    AND userPassword = <cfqueryparam value="#FORM.password#">    
                    <cfelseif Where is "thisLogin">
                    users.userEmail = <cfqueryparam value="#FORM.email#">
                    AND users.userPassword = <cfqueryparam value="#FORM.password#">    
                    <cfelseif Where is "thisCompScores">
                    comppanel.compID = <cfqueryparam value="#SESSION.compID#">
                    <cfelse>
                    0=0
                        <cfif SESSION.cocID NEQ 0>
                        AND users.cocID = <cfqueryparam value="#SESSION.cocID#">
                        </cfif>
                        <cfif SESSION.compID NEQ 0>
                        AND (users.compID = <cfqueryparam value="#SESSION.compID#"> OR users.compID = '0')
                        </cfif>
                    </cfif>
                ORDER BY #Order#                                          
            </cfquery>                  
                <cfreturn getUser>
        </cffunction>
   	<!---/ Get Users --->

</cfcomponent>
                
                