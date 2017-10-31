<!--- 
Filename: tomtom.cfc
Version: 1.0
--->

<cfcomponent displayname="tomtom" hint="Geocodes" output="false">
  <!--- Send SMS --->
	<cffunction name="geocode" access="public" description="Fetches geocode for a project">
    <!--- Arguments --->
    <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true">
    <cfargument name="project" hint="Target ProjectID" required="true">
    <!---/ Arguments --->
    
    <!--- Check for Geocode --->
    <cfquery name="getAddress">
        SELECT projectID, ProjectStreet1, ProjectCity, ProjectState, ProjectZip, ProjectGeoCode FROM projects WHERE projectID = <cfqueryparam value="#project#">
    </cfquery>
    <!---/ Check for Geocode --->
    
    <!--- Get Geocode --->
    <cfset geocode = getAddress.ProjectGeoCode>
    <cfif getAddress.RecordCount GT 0 AND getAddress.ProjectStreet1 NEQ "">
        <cfif getAddress.ProjectCity EQ "" AND getAddress.ProjectZip EQ "">
            <cfset ProjectCity = SESSION.cocCity>
        <cfelse>
            <cfset ProjectCity = getAddress.ProjectCity>
        </cfif>
        <cfif getAddress.ProjectState EQ "" AND getAddress.ProjectZip EQ "">
            <cfset ProjectState = SESSION.cocState>
        <cfelse>
            <cfset ProjectState = getAddress.ProjectState>
        </cfif>
        <cfif getAddress.ProjectZip EQ "">
            <cfset fulladdress = "#getAddress.ProjectStreet1#, #ProjectCity#, #ProjectState#">
        <cfelse>
            <cfset fulladdress = "#getAddress.ProjectStreet1#, #ProjectCity#, #ProjectState#, #getAddress.ProjectZip#">
        </cfif>
        
        <cfhttp url="http://maps.googleapis.com/maps/api/geocode/json?address=#URLEncodedFormat(fulladdress)#&sensor=false"></cfhttp>
        <cfset response = DeserializeJSON(cfhttp.FileContent)>
        <cftry>
            <cfset point = response["results"][1]["geometry"]["location"]>
            <cfset FORM.projectID = getAddress.projectID>
            <cfset FORM.ProjectGeoCode = "#point.lat#,#point.lng#">
            <cfupdate datasource="#datasource#" tablename="projects" formfields="projectID, ProjectGeoCode">
        <cfcatch>
            <cfset FORM.projectID = getAddress.projectID>
            <cfset FORM.ProjectGeoCode = "0,0">
            <cfupdate datasource="#datasource#" tablename="projects" formfields="projectID, ProjectGeoCode">
        </cfcatch>
        </cftry>
        <cfset geocode = FORM.ProjectGeoCode>
    </cfif>
    <cfreturn geocode>
    <!---/ Get Geocode --->
    </cffunction>
</cfcomponent>
