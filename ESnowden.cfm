<!---
***** DANGER *****
THIS DOCUMENT CONTAINS INFORMATION THAT IS SUPER-DUPER SECRET. DO *NOT* UPLOAD THIS DOCUMENT TO GITHUB OR ANY OTHER PUBLIC REPOSITORY. 
***** DANGER *****
 --->

<cfif IsDefined("APIKey") IS FALSE>
	<!--- API Keys --->
	<cfset APIKey = StructNew()>
	<cfset APIKey.Google = "AIzaSyDJG7ALW_qDughG-ov9iZhD-H78Jh_0Qlg">
	<cfset APIKey.TwilioID = "AC4c3dbd58bd4a5ae50209893d86660391">
    <cfset APIKey.TwilioFrom = "+14157809165">
	<cfset APIKey.TwilioAuthToken = "086b76e03ff653a4991b3dab1763cd73">
    <cfset APIKey.BoxView = "4b87gu9ii4966u4e7u4d1eecnunwvyae">
	<cfset APIKey.BitlyToken = "0b2359bf5f14698cf05643c769d1a5c40d222b33">
	<!---/ API Keyns --->

	<!--- SMTP Settings --->
	<cfset EmailSettings = StructNew()>
	<cfset EmailSettings.Server = "smtp-relay.gmail.com">
	<cfset EmailSettings.UserName = "presto@homebaseccc.org">
	<cfset EmailSettings.Password = "1W0KazujEvBBC4enqz8udk9ssRgjyDnUQgvcnGc8Xd1gihEeg0Q7lGtlOnYKaKv8">
	<cfset EmailSettings.Port = "587">
	<cfset EmailSettings.ReqSSL = "true">
	<cfset EmailSettings.ReqTLS = "true">
	<!---/ SMTP Settings --->
</cfif>


