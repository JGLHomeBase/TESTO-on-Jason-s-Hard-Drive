<cfset token = "0b2359bf5f14698cf05643c769d1a5c40d222b33" />

<cfset href = "http://dev.homebaseccc.org/app/presto/pages/secure/display.cfm?app=225&score=inline" />
<!---<cfdump var="#href#" abort=true>--->
<cfhttp method="get" url="https://api-ssl.bitly.com/v3/shorten" result="res">
	<cfhttpparam type="url" name="access_token" value="#token#" />
	<cfhttpparam type="url" name="longUrl" value="#href#" />
	<cfhttpparam name="Host" value="api-ssl.bitly.com" type="header">
</cfhttp>

<cfdump var="#deserializeJson(res.filecontent)#" />
<!---
<cfset apikey = "AIzaSyAviXmhfGb5lI6PyY9XYoj4d2RCPobl9Ls" />

<cfset href = "http://dev.homebaseccc.org/app/presto/pages/secure/display.cfm?app=225&score=inline" />

<cfhttp method="post" url="https://www.googleapis.com/urlshortener/v1/url" result="res">
	<cfhttpparam type="header" name="longUrl" value="#serializeJson(href)#" />
	<cfhttpparam type="header" name="key" value="#apikey#" /> 
</cfhttp>

<cfdump var="#deserializeJson(res.filecontent)#" />--->