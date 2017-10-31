<!--- 
Filename: modules.cfc
Version: 1.0
--->


<cfcomponent displayname="Modules" hint="Insert update and delete module records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>
            <cfset FORM.cocID = SESSION.cocID>
            <cfparam name="FORM.mergeFields" default="0">
            <cfinsert datasource="#datasource#" tablename="reportmod" formfields="ModName, modShortName, cocID, RideTitle, RideText, reportID, file, content, modType, modCat, parentModID, mergeFields, panel, chartID1, chartID2, chartID3, chartID4, chartID5, height">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new report module (#FORM.ModName#)"
                  EventDesc = "New Report Module" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a new record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM reportmod WHERE ReportModID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted an image (Module ID: #redshirt#)"
                  EventDesc = "Report Module Deleted" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ Nuke Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfparam name="FORM.mergeFields" default="0">
            <cfupdate datasource="#datasource#" tablename="reportmod" formfields="ReportModID, ModName, modShortName, cocID, RideTitle, RideText, reportID, file, content, modType, modCat, parentModID, mergeFields, panel, chartID1, chartID2, chartID3, chartID4, chartID5, height">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) updated a report module (#FORM.ModName#)"
                  EventDesc = "Report Module Updated" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->
            
    <!--- Get Modules --->
        <cffunction name="get" access="public" description="Grabs info on modules" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="modID" hint="Defines Module ID" type="string" required="true" default="No" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which modules the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false"  default="modCat, cocID, ModName ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getReportMod">
                SELECT #whatFields#
                FROM reportmod
                WHERE
                    <cfif Where is "ThisCoC">
                    factorID = '0' AND (cocID = <cfqueryparam value="#SESSION.cocID#"> OR cocID = '0')
                    <cfelseif Where is "ThisModule">
                    factorID = '0' AND ReportModID = <cfqueryparam value="#URL.mod#">
                    <cfelseif Where is "ThisReport">
                    factorID = '0' AND ReportID = <cfqueryparam value="#URL.report#">
                    <cfelseif Where is "NamedModule">
                    ReportModID = <cfqueryparam value="#modID#">    
                    <cfelseif Where is "Builder" AND SESSION.cocID EQ 0>
                    factorID = '0' AND cocID = <cfqueryparam value="0">
                    AND reportID = <cfqueryparam value="0">
                      <cfif URL.report NEQ 0>
                        OR reportID = <cfqueryparam value="#URL.report#">
                      </cfif>
                    <cfelseif Where is "Builder" AND SESSION.cocID NEQ 0>
                    factorID = '0' AND (cocID = <cfqueryparam value="0">
                    OR cocID = <cfqueryparam value="#SESSION.cocID#">)    
                    AND reportID = <cfqueryparam value="0">    
                      <cfif URL.report NEQ 0>
                        OR reportID = <cfqueryparam value="#URL.report#">
                      </cfif>                                                
                    <cfelse>
                    factorID = '0' AND 0=0
                    </cfif>
                          
                ORDER BY #Order#                                          
            </cfquery>                  
                <cfreturn getReportMod>
        </cffunction>
   	<!---/ Get Modules --->            

</cfcomponent>