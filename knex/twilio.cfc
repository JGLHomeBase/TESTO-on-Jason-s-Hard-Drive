<!--- 
Filename: twilio.cfc
Version: 1.0
--->

<cfcomponent displayname="twilio" hint="Send SMS Messages" output="false">
  <!--- Send SMS --->
	<cffunction name="sendSMS" access="public" description="Sends a text message" output="false">
    <!--- Arguments --->
    <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true">
    <cfargument name="TwilioID" hint="Twilio AccountSid" type="string" required="true">
    <cfargument name="TwilioAuthToken" hint="Twilio AuthToken" type="string" required="true">
    <cfargument name="Message" hint="Message Body" type="string" required="true">
    <cfargument name="From" hint="Sent From" type="string" required="true">
    <cfargument name="To" hint="Sent To" type="string" required="true">
    <!---/ Arguments --->
    <cfhttp method="post" url="https://api.twilio.com/2010-04-01/Accounts/#TwilioID#/Messages.json" username="#TwilioID#" password="#TwilioAuthToken#" authType="basic">
      <cfhttpparam name="From" type="formField" value="#From#">
      <cfhttpparam name="To" type="formField" value="#To#">
      <cfhttpparam name="Body" type="formField" value="#Left(Message, 960)#">
    </cfhttp>
    <!--- Log Event --->
    <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "SMS" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) sent a text message (Sent To: #To# | #Message#)"
          EventDesc = "Text Message Sent" >
    <!---/ Log Event --->
	</cffunction>
  <!---/ Send SMS --->
  <!--- Read SMS --->
  <cffunction name="read" 
              access="public"
              description="Reads a text message"
              output="false"
              returntype="xml">
    <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true">
    <cfargument name="TwilioID" hint="Twilio AccountSid" type="string" required="true">
    <cfparam name="FORM.AccountSid" default="">
    <cfif FORM.AccountSid EQ #TwilioID#>
        <cfset form.IP = CGI.REMOTE_ADDR>
        <cfset TextMessage = StructNew()>
        <cfset TextMessage.MessageSid = FORM.MessageSid>
        <cfset TextMessage.SmsSid = FORM.SmsSid>
        <cfset TextMessage.From = FORM.From>
        <cfset TextMessage.To = FORM.To>
        <cfset TextMessage.Body = FORM.Body>
        <cfset TextMessage.NumMedia = FORM.NumMedia>
        
        <cfset response = "">
        <cfxml variable="response"  casesensitive="true">
          <root>
            <Response>
              <Message>Hello World!</Message>
            </Response>
          </root>
        </cfxml>        
        <cfreturn response>
    <cfelse>
      <cfset response = "">
        <cfxml variable="response">
          <root>
            <Response>
              <Message>Error: Hello World!</Message>
            </Response>
          </root>
        </cfxml>        
        <cfreturn response>
    </cfif>
        
  </cffunction>
  <!---/ Read SMS --->
</cfcomponent>
