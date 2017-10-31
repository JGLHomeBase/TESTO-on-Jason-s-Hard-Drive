<!--- 
Filename: errorLog.cfc
Version: 1.0
--->

<cfcomponent displayname="errorLog" hint="Log Error" output="false">
  <!--- New Error --->
	<cffunction name="new" access="public" description="Logs new error" output="false">
        <cfargument name="DataSource" default="" type="string">
        <cfargument name="CurrentPage" default="" type="string">
        <cfargument name="exception" default="">    
        <!--- Slack --->
        <cfif SESSION.authLevel GT 0>
            <cfsavecontent variable="slackMessage">
                 <cfoutput>
                    :speak_no_evil: Ooops...  <mailto:#SESSION.userEmail#|#SESSION.userFirst# #SESSION.userLast#> ran into some :shit: on <https://#cgi.server_name##cgi.script_name#?#cgi.query_string#|#CurrentPage#> #timeFormat(now(),"h:mm tt")# on #DateFormat(now(),"dddd")#. 
                </cfoutput>
            </cfsavecontent>
             <cfinvoke component="knex.slacker"
                      method="post"
                      DataSource="#DataSource#"
                      slackMessage="#slackMessage#">
        </cfif>
        <!---/ Slack --->
             
        <cfquery name="getSlackURL" maxrows="1">
        SELECT settingValue FROM settings WHERE settingName = <cfqueryparam value="slackURL">    
        </cfquery>
        <cfset slackURL = getSlackURL.settingValue>
        
	</cffunction>
  <!---/ New Error --->
</cfcomponent>
