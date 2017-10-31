<!--- 
Filename: slacker.cfc
Version: 1.0
--->


<cfcomponent displayname="Slacker" hint="Interacts with the Slack API" output="false">
    
    <!--- Update Record --->
	<cffunction name="post" access="public" description="Posts message to Slack incoming webhook URL" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true">
        <cfargument name="slackMessage" hint="Message" required="true">
        <!---/ Arguements --->
        
        <cfquery name="getSlackURL" maxrows="1">
        SELECT settingValue FROM settings WHERE settingName = <cfqueryparam value="slackURL">    
        </cfquery>
        <cfif getSlackURL.RecordCount GT 0 AND getSlackURL.settingValue NEQ "">
            <cfset slackURL = getSlackURL.settingValue>
            <cfset slackMessage = REReplace(slackMessage,"#chr(13)#|#chr(9)#|\n|\r","","all")>    
            <Cfset slackPayload = {
                   "text": "#JSStringFormat(slackMessage)#"
                   } />
            <cfset slackPayload = #SerializeJSON(slackPayload)#>       

            <!--- Post Message --->
            <cfhttp url="#slackURL#"
                    method="post"
                    charset="utf-8">
                <cfhttpparam type="header"
                             name="Content-Type"
                             value="application/x-www-form-urlencoded; charset=UTF-8">
                <cfhttpparam type="body"
                             value="#slackPayload#">
            </cfhttp>
            <!--- Post Message --->
        </cfif>
    </cffunction>
    <!---/ Update Record --->
   
</cfcomponent>
