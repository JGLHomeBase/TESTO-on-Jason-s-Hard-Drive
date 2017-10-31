<cfcomponent>
    <!---
    ==========================================
    Application Settings and Default Variables
    ==========================================
    --->

    <!--- Application Settings --->
    <cfset This.name = "PRESTO">
	<cfset variables.isLocalDev = cgi.remote_addr eq "127.0.0.1">
	<cfset variables.htProtocol = "https">
	<cfif variables.isLocalDev>
		<cfset This.datasource = "scrumdidilyumptious">
		<cfset variables.serverName = "dev.">
		<cfset variables.environmentDirectory = "presto">
		<cfset AppShortName = "TESTO">
	<cfelse>
		<cfif listContainsNoCase(cgi.script_name, "slugworth", "/")>
			<cfset This.name = "SLUGWORTH">
			<cfset This.datasource = "sizzler">
			<cfset variables.environmentDirectory = "slugworth">
			<cfset AppShortName = "TESTO">
		<cfelse>
			<cfset This.datasource = "scrumdidilyumptious">
			<cfset variables.environmentDirectory = "presto">
			<cfset AppShortName = "PRESTO">
		</cfif>
		
		<cfset variables.serverName = "www.">
	</cfif>
    
    <cfset AbsoluteURL = "/app/#variables.environmentDirectory#/">
	
    <cfset FullURL = "#variables.htProtocol#://#variables.serverName#homebaseccc.org/app/#variables.environmentDirectory#/">
    
    <cfset AppLongName = "Program Evaluation and Scoring Tool">
    <cfset This.Sessionmanagement = TRUE>
    <cfset This.Sessiontimeout="#createtimespan(0,1,42,42)#">
    <cfset This.applicationtimeout="#createtimespan(0,0,60,0)#">
    <cfset DataSource = This.datasource>
<!---/ Application Settings --->

    <!--- Mappings --->
    <cfset this.mappings = structNew() />
    <cfset this.mappings["/knex"] = getDirectoryFromPath(getCurrentTemplatePath()) & "knex/" />
    <!---/ Mappings --->


    <!--- API Keys --->
    <cfinclude template="ESnowden.cfm">
    <!---/ API Keys --->

    <!--- Set VARs --->
    <cfquery name="GetSettings" datasource="#DataSource#">
    SELECT SettingName, SettingValue
    FROM settings    
    </cfquery>
    <cfloop query="GetSettings">
        <cfset VARIABLES[ SettingName ] = SettingValue />
    </cfloop>
    <!---/ Set VARs --->

    <!--- Request --->
    <cfset ahora = now()>
    <cfparam name="URL.action" default="none">
    <cfparam name="Form.action" default="none">
    <!--- Pagination --->
    <cfparam name="URL.page" default=1>
    <cfparam name=URL.maxrows default=10>
    <cfset maxpages = URL.maxrows>
    <cfset startRow = maxrows*(URL.page-1)>
    <cfif startRow LT 1>
        <cfset startRow = 1>    
    </cfif>
    <!---/ Pagination --->

    <cfset CurrentPage=GetFileFromPath(GetBaseTemplatePath())>
    <cfset CurrentPageVar=GetFileFromPath(GetBaseTemplatePath()) & "?" & cgi.query_string>
    <cfset pathRoot=ExpandPath(AbsoluteURL)>
    <!---/ Request --->

     <!--- User Account --->
    <cfparam name="Session.authLevel" default="10">
    <cfparam name="SESSION.goldenTicket" default="">
    <cfparam name="FORM.goldenTicket" default="Slugworth">
    <cfparam name="SESSION.userFirst" default="Guest">
    <cfparam name="SESSION.userEmail" default="Guest">
    <cfparam name="SESSION.userID" default="0">
    <cfparam name="SESSION.requireReset" default="0">
    <cfparam name="SESSION.staff" default="0">
    <cfparam name="SESSION.cocID" default="0">
    <cfparam name="SESSION.usercocID" default="">
    <cfparam name="SESSION.compID" default="0">
    <cfparam name="SESSION.usercompID" default="">
    <cfparam name="SESSION.agencyID" default="0">
    <cfparam name="SESSION.useragencyID" default="">
    <cfparam name="SESSION.projectID" default="0">
    <cfparam name="SESSION.userprojectID" default="">
    <!---/ User Account --->  

    <!--- Browser Info --->
    <cfset SESSION.userIP = "#CGI.REMOTE_ADDR#">
    <cfset SESSION.SSLConnection = cgi.server_port_secure>
    <cfset SESSION.browser="#CGI.HTTP_USER_AGENT#">
    <CFIF FindNoCase('MSIE','#CGI.HTTP_USER_AGENT#') GREATER THAN 0 AND FindNoCase('Opera','#CGI.HTTP_USER_AGENT#') LESS THAN 1>
      <CFSET SESSION.browser = 'IE'>
    </CFIF>
    <CFIF FindNoCase('MSIE 9','#CGI.HTTP_USER_AGENT#') GREATER THAN 0 AND FindNoCase('Opera','#CGI.HTTP_USER_AGENT#') LESS THAN 1>
      <CFSET SESSION.browser = 'IE9'>
    </CFIF>
    <!---/ Browser Info --->


    <!---/
    ======================
    Application Start/Stop
    ======================
    --->
    <cffunction name="onApplicationStart">
	       
    </cffunction>


    <cffunction name="onApplicationEnd">
        <cfargument name="ApplicationScope" required=true/>
    </cffunction>



    <!---
    ================
    Session Handling
    ================
    --->        
    <cffunction name="onSessionStart">

    </cffunction>

    <cffunction name="onSessionEnd">
        <cfargument name = "SessionScope" required=true/>
    </cffunction>



    <!---
    ================
    Request Handlings
    ================
    --->
    <!--- BEFORE --->
    <cffunction name="onRequestStart">

        <!--- Auth --->
        <cfargument name = "targetPage" type="String" required=true />
		
		<!--- <URL REDIRECTION to test.homebaseccc.org> --->
		<cfset variables.rUrl = "http://test.homebaseccc.org#cgi.script_name#" />
		<cfset variables.rUrl = replaceNoCase(variables.rUrl, "slugworth", "presto", "all")>
		<cfset variables.rUrl = len(trim(cgi.query_string)) eq 0 ? variables.rUrl : "#variables.rUrl#?#cgi.query_string#" />
		<cflocation url="#variables.rUrl#" addtoken="false" />
		
		<!--- </REDIRECTION to test.homebaseccc.org> --->
		
		<!--- force https --->
		<cfif cgi.https neq "on">
			<cfif not variables.isLocalDev>
				<cfset variables.rUrl = "https://#cgi.server_name##cgi.script_name#" />
				<cfset variables.rUrl = len(trim(cgi.query_string)) eq 0 ? variables.rUrl : "#variables.rUrl#?#cgi.query_string#" />
				<cflocation url="#variables.rUrl#" addtoken="false" />
			</cfif>
		</cfif>
		
		<cfset variables.forceLogin = false />
		
        <cfset SESSION.targetPage = Arguments.targetPage>
        <cfinclude template="legos/login.cfm"></cfinclude>
        <cfif SESSION.requireReset EQ 1 AND SESSION.authLevel LT 10 AND FORM.action NEQ "reset" and url.action NEQ "reset">
            <cflocation url="#AbsoluteURL#pages/login.cfm?action=reset">
        </cfif>
        
        <cfif FindNoCase("pages/secure",SESSION.targetPage) NEQ 0 OR FindNoCase("takeout/secure",SESSION.targetPage) NEQ 0>
			<cfif structKeyExists(url, "report") and structKeyExists(url, "action") and structKeyExists(url, "apr") and structKeyExists(url, "project")>
		   		<cfif url.report and url.apr and url.project and url.action eq "share">
				   	<!--- get coc info (id, city) --->
					<cfset oReport = createObject("component", "knex.reports") />
					<cfset qReport = oReport.getReportCoc(DataSource, url.report) />
					
					<cfif qReport.recordCount>
						<cfparam name="Session.authLevel" default="10">
						<cfparam name="Session.cocID" default="0" />
						<cfset session.cocID_prior = session.cocID />
						<cfset SESSION.cocCity_prior = structKeyExists(session, "cocCity") ? session.cocCity : "" />
						
						<cfset session.cocID = qReport.cocID />
			   			<cfset session.cocCity = qReport.coCCity />
					<cfelse>
						<cfthrow type="Custom" message="Unable to share a report URL" detail="A cocID was not found for reportID #url.report#" /> 
					</cfif>
				<cfelse>
					<cfset variables.forceLogin = true />
				</cfif>
			<cfelse>
				<cfset variables.forceLogin = true />
			</cfif>
			
            <cfif Session.authLevel GT 7>
               <cfset SESSION.AuthtargetPage = SESSION.targetPage & "?" & cgi.query_string>
               				
				<cfif forceLogin>
					<cflocation url="#AbsoluteURL#pages/login.cfm">
				</cfif>		   
            </cfif>
        </cfif>
        <!---/ Auth --->

        <!--- Set VARs --->

        <!---/ Set VARs --->

        <cfif FindNoCase("raw/",SESSION.targetPage) EQ 0 AND FindNoCase("takeout/",SESSION.targetPage) EQ 0>
            <!--- Top of Page --->
                <!--- Page Head --->
                <cfinclude template="legos/head.cfm"></cfinclude>
                <!--- Top Nav --->
                <cfinclude template="legos/nav.cfm"></cfinclude>
            <!---/ Top of Page --->
         </cfif>
    </cffunction>
    <!---/ BEFORE --->

    <!--- REQUEST --->
    <cffunction name="onRequest">
        <cfargument name = "targetPage" type="String" required=true/>
        <cfsavecontent variable="content">
            <cfinclude template=#Arguments.targetPage#>
        </cfsavecontent>
        <cfoutput>
            #content#
        </cfoutput>
    </cffunction>
    <!---/ REQUEST --->

    <!--- AFTER --->
    <cffunction name="onRequestEnd">
        <cfif FindNoCase("raw/",SESSION.targetPage) EQ 0 AND FindNoCase("takeout/",SESSION.targetPage) EQ 0>
            <cfinclude template="legos/foot.cfm"></cfinclude>
        </cfif>
    </cffunction>
    <!---/ AFTER --->





    <!---
    ==============
    Error Handling
    ============== 
    --->
    <cffunction name="onError">
        <cfargument name="Exception" required=true/>
        <cfargument type="String" name = "EventName" required=true/>
        <!--- Some exceptions, including server-side validation errors, do not
                 generate a rootcause structure. --->
        <cfif isdefined("exception.rootcause")>

        </cfif>    
        <!--- Display an error message if there is a page context. --->
        <cfif NOT (Arguments.EventName IS onSessionEnd) OR 
                (Arguments.EventName IS onApplicationEnd)>
           <cfoutput>
                <div class="row">
                    <div class="large-12 columns">
                        <h1>Woops.</h1>
                        <h2>Something's not right... Try again?</h2>
                        <cfif SESSION.authLevel LTE 7>
                          <hr>
                          <p><cfdump var=#exception#></p>
                        </cfif>
                    </div>
                </div>
               <cfif FindNoCase("raw/",SESSION.targetPage) EQ 0 AND FindNoCase("takeout/",SESSION.targetPage) EQ 0>
                <cfinclude template="legos/foot.cfm"></cfinclude>
            </cfif>
            </cfoutput>
           <!--- Handle Error --->
            <cfinvoke component="knex.errorLog"
                      method="new"
                      DataSource="#DataSource#"
                      CurrentPage="#CurrentPage#"
                      error="#arguments.exception#">
            <!---/ Handle Error --->
        </cfif>
     </cffunction>
    <cffunction name="onMissingTemplate">
        <cflocation url="#AbsoluteURL#pages/raw/404.cfm">
    </cffunction>
</cfcomponent>
