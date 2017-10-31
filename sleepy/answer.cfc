<!--- 
Filename: answer.cfc
Version: 1.0
--->

<cfcomponent displayname="answer" hint="Answers the phone" output="false">
  <!--- Read SMS --->
  <cffunction name="/read" 
              restPath="read"
              access="remote"
              description="Reads a text message"
              output="false"
              returntype="xml">
    <cfif FORM.AccountSid EQ 0>
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
