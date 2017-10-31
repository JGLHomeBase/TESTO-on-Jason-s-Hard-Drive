<!--- 
Filename: compApp.cfc
Version: 1.0
--->

<cfcomponent displayname="compApp" hint="Log Error" output="false">
  <!--- New Error --->
	<cffunction name="getApps" access="public" description="Logs new error" output="false">
        
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Enter the fields to select from the table" type="string" required="true" >
        <cfargument name="Join" hint="Identifies tables to join to the query, as indicated by the cfif statements" type="string" required="false" default="none">
        <cfargument name="Where" hint="Identifies which records to select, as indicated by the cfif statements" type="string" required="true" >
        <cfargument name="Order" hint="Enter the fields to order by" type="string" required="false" default="compapp.appname" >
        <!---/ Arguments --->
        
        <!--- Get Applicants --->
          <cfquery name="getApps">
          SELECT #whatFields#
          FROM compapp
            INNER JOIN projects ON compapp.projectID = projects.projectID
            INNER JOIN agency ON projects.agencyID = agency.agencyID
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
            INNER JOIN comp ON compapp.compID = comp.compID
          WHERE
          <cfif Where is "thisComp">
            compapp.active = '1'
            AND compapp.compID = <cfqueryparam value="#SESSION.compID#">
          </cfif>
            <cfif Where is "thisApp">
            compapp.compAppID = <cfqueryparam value="#URL.app#">
          </cfif>
            ORDER BY #Order#
          </cfquery>
          <!--- Get Applicants --->
        <cfreturn getApps>
	</cffunction>
  <!---/ New Error --->
</cfcomponent>
