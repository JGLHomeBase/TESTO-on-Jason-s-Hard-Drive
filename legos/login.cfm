<cfif URL.action EQ "logout" AND Session.authLevel LT 10>
	<cfset SESSION.message = "message">
     <cfset SESSION.messageText = "Good bye, #SESSION.userFirst#.">
	<!--- Log Event --->
  	<cfinvoke component="knex.eventLog" 
  			method="newEvent"
  			DataSource = "#DataSource#"
  			EventType = "Logout" 
  			EventDetail = "#SESSION.userFirst# #SESSION.userLast# successfully logged out as"
  			EventDesc = "Logut" >
    <!---/ Log Event --->
    <!--- Session Monitor: Logout --->
    <cfparam name="APPLICATION.activeUsers" default="">
    <cfset ListTarget = ListFind(APPLICATION.activeUsers,SESSION.userID)>
    <cfif ListTarget NEQ 0>
        <cfset APPLICATION.activeUsers = ListDeleteAt(APPLICATION.activeUsers,ListTarget)>
    </cfif>
    <!---/ Session Monitor: Logout --->
    
	<cfset StructClear(Session)>
	<cfset SESSION.authLevel = 10>
    
	<cflocation url="#AbsoluteURL#pages/login.cfm" >
</cfif>

<cfif FORM.action EQ "recover">
    <cfquery name="getUser">
    SELECT * FROM users WHERE userEmail = <cfqueryparam value="#FORM.email#">
    </cfquery>
    <cfif getUser.RecordCount GT 0>
        <cfset FORM.password = left(generateSecretKey("Blowfish",32),6)>
        <cfset FORM.userPassword = Hash(FORM.password,"SHA-512")>
        <cfset FORM.requireReset = 1>
        <cfset FORM.userID = getUser.userID>
        <cfupdate datasource="#DataSource#" tablename="users" formfields="userPassword, requireReset, userID">

        <cfsavecontent variable="message">
            <cfoutput>
            <h2>Hello #getUser.userFirst#.</h2>
            <p>We've created a new temporary #AppShortName# password for you: <b>#FORM.password#</b>.</p>
            <p>
                Once you  <a href="#FullURL#/pages/login.cfm">login</a> you'll be prompted to set a new password.</p>
            <p>If you did not request this change please <a href="mailto:#HelpEmail#">let us know</a> right away.</p>
            <p>Thanks,<br>Team #AppShortName#</p>
            </cfoutput>
        </cfsavecontent>  
        <cfinvoke component="knex.gopostal" 
                  method="send"
                  DataSource = "#DataSource#"
                  HelpEmail="#HelpEmail#"
                  AppShortName="#AppShortName#"
                  FullURL="#FullURL#"
                  force="yes"
                  emailTo="#FORM.email#"
                  emailSubject="Your new #AppShortName# password"
                  emailSubjectShort="Password Reset"
                  emailBody="#message#">

        <!--- Log Event --->
        <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "Update" 
            EventDetail = "A password reset was performed for #getUser.userFirst# #getUser.userLast# (#FORM.password#)"
            EventDesc = "Password Reset" >
        <!---/ Log Event --->
    <cfelse>
        <!--- Log Event --->
        <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "Update" 
            EventDetail = "A password reset was requested for an email that is not associated with a current user"
            EventDesc = "Password Reset Error" >
        <!---/ Log Event --->
    </cfif>
</cfif>

<cfparam name="SESSION.loginAttempts" default="0">
<cfparam name="FORM.goldenTicket" default="void">
<cfif FORM.action EQ "login" AND SESSION.loginAttempts LTE 5>
  <cfset FORM.password = HASH(FORM.password,"SHA-512")>
  <!--- Verify Login Credentials --->
  <!--- Get Users --->
  <cfinvoke component="knex.users" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUser"
            whatFields = "users.HBStaff, users.authLevel, users.userID, users.userFirst, users.userLast, users.userEmail, users.requireReset, users.HBStaff, users.cocID, users.compID, users.agencyID, users.projectID, coc.cocLongName, coc.cocName, coc.cocCity, coc.cocState, comp.compName, agency.agencyName, projects.projectName"
            Join = "LCoCCompAgencyProjects"
            Where = "thisLogIn">
  <!---/ Get Users --->
  <!--- Verify Login Credentials --->
  <cfif getUser.RecordCount EQ 1 AND getUser.authLevel LT 10>
    <!--- Login User --->
      <cfset SESSION.staff = getUser.HBStaff>
      <cfset SESSION.authLevel = getUser.authLevel>
      <cfset SESSION.goldenTicket = generateSecretKey("Blowfish",448)>
      <cfset SESSION.userID = getUser.userID>
      <cfset SESSION.userFirst = getUser.userFirst>
      <cfset SESSION.userLast = getUser.userLast>
      <cfset SESSION.userEmail = getUser.userEmail>
      <cfset SESSION.RequireReset = getUser.requireReset>
      <cfset SESSION.Staff = getUser.HBStaff>
      
      <cfset SESSION.usercocID = getUser.cocID>
      <cfset SESSION.usercompID = getUser.compID>
      <cfset SESSION.useragencyID = getUser.agencyID>
      <cfset SESSION.userprojectID = getUser.projectID>
      
      <cfset SESSION.cocID = getUser.cocID>
      <cfset SESSION.cocLongName = getUser.cocLongName>
      <cfset SESSION.cocName = getUser.cocName>
      <cfset SESSION.cocCity = getUser.cocCity>
      <cfset SESSION.cocState = getUser.cocState>
      
      <cfset SESSION.compID = getUser.compID>
      <cfset SESSION.compName = getUser.compName>
      <cfset SESSION.agencyID = getUser.agencyID>
      <cfset SESSION.agencyName = getUser.agencyName>
      <cfset SESSION.projectID = getUser.projectID>
      <cfset SESSION.projectName = getUser.projectName>
      
      <!--- Update Last Login Info --->
          <cfset FORM.userID = SESSION.userID>
          <cfset FORM.loginIP = CGI.REMOTE_ADDR>
          <cfset FORM.loginTime = now()>
          <cfset form.loginBrowser = Left(CGI.HTTP_USER_AGENT,128)>
          <cfif FindNoCase('MSIE','#CGI.HTTP_USER_AGENT#') GREATER THAN 0 AND FindNoCase('Opera','#CGI.HTTP_USER_AGENT#') LESS THAN 1>
              <cfset form.loginBrowser = 'IE'>
          </cfif>
          <cfif FindNoCase('MSIE 9','#CGI.HTTP_USER_AGENT#') GREATER THAN 0 AND FindNoCase('Opera','#CGI.HTTP_USER_AGENT#') LESS THAN 1>
              <CFSET form.loginBrowser = 'IE9'>
          </cfif>
          <cfupdate datasource="#DataSource#" tablename="users" formfields="userID, loginTime, loginIP, loginBrowser">
      <!---/ Update Last Login Info --->
     
<!--- Session Monitor --->
<cfparam name="APPLICATION.activeUsers" default="">
<cfparam name="APPLICATION.sessionTimeout" default="#createtimespan(0,1,42,42)#">
<cfset ListCount = 0>
<cfloop list="#APPLICATION.activeUsers#" index="userID">
    <cfset ListCount++>
    
    <cfquery name="getUser">
    SELECT loginTime, userID FROM users WHERE userID = <cfqueryparam value="#userID#">
    </cfquery>
    
    <cfif getUser.recordCount and DateCompare(getUser.loginTime+APPLICATION.Sessiontimeout, now(),"n") EQ 1 AND SESSION.userID NEQ userID>
    
    <cfelse>
        <cfset APPLICATION.activeUsers = ListDeleteAt(APPLICATION.activeUsers,ListCount)>
        <cfset ListCount = ListCount-1>
    </cfif>
	
</cfloop>
<cfset APPLICATION.activeUsers = ListAppend(APPLICATION.activeUsers,SESSION.userID)>
    <!--- Send Notifications Every 5 Users --->
    <cfif ListLen(APPLICATION.activeUsers) MOD 5 EQ 0>
        <!--- Slack --->
        <cfsavecontent variable="slackMessage">
            <cfoutput>
                <cfif ListLen(APPLICATION.activeUsers) GT 50>
                    <cfset slackIcon = ":fireworks:">
                <cfelseif ListLen(APPLICATION.activeUsers) GT 25>
                    <cfset slackIcon = ":tada:">
                <cfelseif ListLen(APPLICATION.activeUsers) GT 10>
                    <cfset slackIcon = ":loudspeaker:">
                <cfelse>
                    <cfset slackIcon = ":mega:">
                </cfif>
               #slackIcon# <#FullURL#pages/secure/users.cfm?action=monitor|*#ListLen(APPLICATION.activeUsers)# Users*> are currently using <#FullURL#|#AppShortName#>.
            </cfoutput>
        </cfsavecontent>
        <cfinvoke component="knex.slacker"
                  method="post"
                  DataSource="#DataSource#"
                  slackMessage="#slackMessage#">
        <!---/ Slack --->
    </cfif>
    <!---/ Send Notifications Every 5 Users --->
<!---/ Session Monitor --->
    
            
		<cfset form.SSLConnection = cgi.server_port_secure>
		<cfset form.IP = CGI.REMOTE_ADDR>
          
      <!--- Log Event --->
  	<cfinvoke component="knex.eventLog" 
  			method="newEvent"
  			DataSource = "#DataSource#"
  			EventType = "Login" 
  			EventDetail = "#SESSION.userFirst# #SESSION.userLast# successfully logged in after #SESSION.loginAttempts# attempt(s)."
  			EventDesc = "Successful Login Attempt" >
    <!---/ Log Event --->
    <cfset SESSION.loginAttempts = 0>
    <!--- /Login User --->
    <cfif IsDefined("SESSION.AuthtargetPage")>
      <cflocation url="#SESSION.AuthtargetPage#">
    </cfif>
    <cfset SESSION.message = "message">
    <cfset SESSION.messageText = "Welcome back, #SESSION.userFirst#.">
  <cfelse>
  	<!--- Log Event --->
  	<cfinvoke component="knex.eventLog" 
  			method="newEvent"
  			DataSource = "#DataSource#"
  			EventType = "Login Failure" 
  			EventDetail = "A user failed to login as #FORM.email# after #SESSION.loginAttempts# attempt(s)."
  			EventDesc = "Unsuccessful Login Attempt" >
    <!---/ Log Event --->
    <cfset SESSION.loginAttempts = SESSION.loginAttempts+1>
    <cfset SESSION.message = "alert">
    <cfset SESSION.messageText = "Invalid login credentials. Please try again">
  </cfif>

<cfelseif FORM.action EQ "reset" AND SESSION.authLevel LT 10>
  <!--- Reset Password --->
  <cfparam name="FORM.password" default="">
  <cfparam name="FORM.confirmpassword" default="confirm">
  <cfif FORM.password EQ FORM.confirmpassword AND FORM.goldenTicket EQ SESSION.goldenTicket>
    <!--- Check Past Passwords --->
    <cfset FORM.password = HASH(FORM.password,"SHA-512")>
      <!--- Get Users --->
      <cfinvoke component="knex.users" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUser"
            whatFields = "userID"
            Where = "thisPW">
      <!---/ Get Users --->
    <!---/ Check Past Passwords --->
    <cfif getUser.RecordCount EQ 0>
      <!--- Set New Password --->
      
        <!--- Update User --->
      <cfinvoke component="knex.login" 
          method="Update"
          DataSource = "#DataSource#">
      <!--- Update User --->
     <!--- Get Users --->
      <cfinvoke component="knex.users" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUser"
            whatFields = "userID, userFirst, userLast"
            Where = "thisLogin">
      <!---/ Get Users --->
      <!--- Send Email --->
      <cfsavecontent variable="message">
            <cfoutput>
            <h2>Hi #getUser.userFirst#.</h2>
            <p>Thanks for updating your password on #AppShortName#.</p>
            <p>
                Next time you visit  <a href="#FullURL#/pages/login.cfm">#AppShortName#</a> you'll be prompted to login with your new credentials.</p>
            <p>If you did not request this change please <a href="mailto:#HelpEmail#">let us know</a> right away.</p>
            <p>Thanks,<br>Team #AppShortName#</p>
            </cfoutput>
        </cfsavecontent>  
        <cfinvoke component="knex.gopostal" 
                  method="send"
                  DataSource = "#DataSource#"
                  HelpEmail="#HelpEmail#"
                  AppShortName="#AppShortName#"
                  FullURL="#FullURL#"
                  force="yes"
                  emailTo="#FORM.email#"
                  emailSubject="Thanks for updating your #AppShortName# password"
                  emailSubjectShort="Password Change"
                  emailBody="#message#">
     <!---/ Send Email --->
     <!--- Slack --->
        <cfsavecontent variable="slackMessage">
            <cfoutput>
               :key: <#FullURL#pages/secure/users.cfm?user=#getUser.userID#|*#getUser.userFirst# #getUser.userLast#*> changed their <#FullURL#|#AppShortName#> password.
            </cfoutput>
        </cfsavecontent>
        <cfinvoke component="knex.slacker"
                  method="post"
                  DataSource="#DataSource#"
                  slackMessage="#slackMessage#">
        <!---/ Slack --->

            
      <cfset SESSION.message = "success">
      <cfset SESSION.messageText = "Password successfully updated.">
      <!---/ Set New Password --->
    <cfelse>
      <!--- Repeat Password Error --->
      <cfset SESSION.message = "alert">
      <cfset SESSION.messageText = "Entered password is the same as the current password. Please enter a new password.">
      <!---/ Repeat Password Error --->
    </cfif>
  <cfelseif FORM.goldenTicket NEQ SESSION.goldenTicket>
    <cfset SESSION.message = "alert">
    <cfset SESSION.messageText = "Form expired. Please refresh the pagea and try again.">
  <cfelseif FORM.password NEQ FORM.confirmpassword>
    <cfset SESSION.message = "alert">
    <cfset SESSION.messageText = "Woops. Passwords do not match.">
  </cfif>
  <!---/ Reset Password --->
</cfif>
