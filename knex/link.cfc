<!--- 
Filename: link.cfc
Version: 1.0
--->

<cfcomponent displayname="link" hint="Manages direct report links" output="false">
    <!--- Update Record --->
	<cffunction name="get" access="public" description="Get (and if necessary creates) direct report links " >
        <!--- Arguements --->
        <cfargument name="compAppID" hint="Competition Application ID" required="true">
        <cfargument name="expireDate" hint="Link expiration date" required="true">
        <cfargument name="linkNote" hint="Link note" required="true">
        <cfargument name="roleApp" hint="Applicant rights" required="true" default="0">
        <cfargument name="singleUse" hint="Single use only" required="true" default="0">
        <cfargument name="projectID" hint="ProjectID" required="true" default="0">
        <cfargument name="aprID" hint="aprID" required="true" default="0">
        <cfargument name="reportID" hint="reportID" required="true" default="0">
        <!---/ Arguements --->
    </cffunction>
    <!---/ Update Record --->
</cfcomponent>
