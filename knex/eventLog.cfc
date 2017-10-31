<!--- 
Filename: eventLog.cfc
Version: 1.0
--->


<cfcomponent displayname="Event Log" hint="Record and display events from the event log" output="false">
	<cffunction name="newEvent" access="public" description="Record a new event in the log" output="false" >
		<cfargument name="EventType" default="General Information" hint="Type of event" type="string" displayname="Event Type">
		<cfargument name="EventPriority" default="7" hint="Importance of event on a 1-10 scale" type="numeric" displayname="Event Priority">
		<cfargument name="EventDetail" default="none" hint="Detailed description of event" type="string" displayname="Event Detail">
		<cfargument name="EventDescription" default="none" hint="Brief description of event" type="string" displayname="Event Description">
		<cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
		<!--- Set Variables --->
		<cfset form.EventDesc = EventDesc>
		<cfset form.EventPriority = EventPriority>
		<cfset form.EventType = EventType>
		<cfset form.EventDetail = EventDetail>
		<cfparam name="SESSION.userID" default="0">
		<cfset form.userID = SESSION.userID>
        <cfif SESSION.userID EQ "">
            <cfset form.USERID = 0>
        </cfif>
		<cfparam name="SESSION.authLevel" default="10">
		<cfset form.UserAuthLevel = SESSION.authLevel>
		<cfset form.Page = GetFileFromPath(GetBaseTemplatePath())>
		<cfset form.Browser = CGI.HTTP_USER_AGENT>
		<CFIF FindNoCase('MSIE','#CGI.HTTP_USER_AGENT#') GREATER THAN 0 AND FindNoCase('Opera','#CGI.HTTP_USER_AGENT#') LESS THAN 1>
		  <CFSET form.browser = 'IE'>
		</CFIF>
		<CFIF FindNoCase('MSIE 9','#CGI.HTTP_USER_AGENT#') GREATER THAN 0 AND FindNoCase('Opera','#CGI.HTTP_USER_AGENT#') LESS THAN 1>
		  <CFSET form.browser = 'IE9'>
		</CFIF>
		<cfset form.SSLConnection = cgi.server_port_secure>
		<cfset form.IP = CGI.REMOTE_ADDR>
		<cfset form.Referer = cgi.HTTP_REFERER>
		<!--- Write Event--->
		<cfinsert datasource="#DataSource#" tablename="eventlog" formfields="EventDesc, EventPriority, EventType, EventDetail, userID, UserAuthLevel, Page, Browser, SSLConnection, IP, Referer">
	</cffunction>
</cfcomponent>