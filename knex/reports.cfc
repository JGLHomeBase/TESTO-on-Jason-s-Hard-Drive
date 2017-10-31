<!--- 
Filename: reports.cfc
Version: 1.0
--->


<cfcomponent displayname="Report Templates" hint="Insert update and delete report template records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>   
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#DataSource#" tablename="report" formfields="reportShortName, reportName, ReportDesc, cocID, joyRide, parentReportID, reportPayload">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new report template (#FORM.reportShortName#)"
                  EventDesc = "New Report Template" >
            <!---/ Log Event --->  
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>    
            <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM report WHERE ReportID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a report template (Module ID: #redshirt#)"
                  EventDesc = "Report Deleted" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ Nuke Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfupdate datasource="#DataSource#" tablename="report" formfields="reportID, reportShortName, reportName, ReportDesc, cocID, joyRide, reportPayload, parentReportID">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new report template (#FORM.reportShortName#)"
                  EventDesc = "New Report Template" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->
 
    <!--- Secondary Update --->
	<cffunction name="updateTwo" access="public" description="Updates report ID and Payload" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfupdate datasource="#datasource#" tablename="report" formfields="ReportID, reportPayload">
        <cfif SESSION.compID NEQ "0">
            <!--- Update Competition Scores --->
            <cfinvoke component="knex.sortinghat" 
                    method="scoreComp"
                    DataSource = "#DataSource#"
                    compID="#SESSION.compID#">
            <!---/ Update Competition Scores --->
        </cfif>
            
    </cffunction>
    <!---/ Secondary Update --->           
            
    <!--- Get Report/Report Template --->
        <cffunction name="get" access="public" description="Grabs templates and information themabout" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Join" hint="Joins tables to the query as indicated" type="string" required="false" default="none">
            <cfargument name="Where" hint="Sets which templates the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="report.reportID, report.reportName ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getReport">
                SELECT #whatFields#
                FROM report
                <cfif Join is "compapp">
                    RIGHT JOIN compapp ON report.reportID = compapp.reportID
                </cfif>
                WHERE
                    <cfif Where is "ThisReport">
                    ReportID = <cfqueryparam value="#URL.report#">
                    <cfelseif Where is "ThisCoC">
                    cocID = <cfqueryparam value="#SESSION.cocID#"> OR cocID = <cfqueryparam value="0">
                    <cfelseif Where is "thisApp">
                    compapp.compappID = <cfqueryparam value="#URL.app#">
                    <cfelse>
                    0=0
                    </cfif>
                ORDER BY #Order#                                          
            </cfquery>                  
                <cfreturn getReport>
        </cffunction>
   	<!---/ Get Report/Report Template --->

	<cffunction name="getReportCoc" access="public" description="gets a cocID for a report" output="false" returntype="query">
		<cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
		<cfargument name="reportID" type="numeric" required="true">
		
		<cfset local.qRead = "">
		
		<cfquery datasource="#arguments.DataSource#" name="local.qRead">
		SELECT
			r.cocID, c.CoCCity
		FROM
			report r
				INNER JOIN coc c ON c.cocID = r.cocID
		WHERE
			r.reportID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.reportID#">
		</cfquery>
		
		<cfreturn local.qRead>
	</cffunction>
</cfcomponent>