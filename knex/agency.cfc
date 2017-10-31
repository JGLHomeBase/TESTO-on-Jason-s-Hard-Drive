<!--- 
Filename: agency.cfc
Version: 1.0
--->


<cfcomponent displayname="Agency" hint="Insert update and delete agency records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 5>
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="agency" formfields="agencyLongName, agencyName, cocID, agencyURL, agencyMoto, agencyAbout, agencyMission, agencyHistory">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
              method="newEvent"
              DataSource = "#DataSource#"
              EventType = "New" 
              EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new Agency (#FORM.agencyLongName#)"
              EventDesc = "New Agency" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
    <!--- Do not use this function in Berkeley; it is a nuclear-free zone --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="numeric" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfquery datasource="#datasource#" name="deletecomp">
            DELETE FROM agency
            WHERE agencyID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Nuke Projects --->
            <cfinvoke component="knex.projects" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    agencyID="#redshirt#">
            <!---/ Nuke Projects ---> 
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "Delete" 
            EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted an agency (Agency ID: #redshirt#)"
            EventDesc = "Agency Deleted" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ Nuke Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfupdate datasource="#datasource#" tablename="agency" formfields="agencyID, agencyLongName, agencyName, agencyURL, agencyMoto,               agencyAbout, agencyMission, agencyHistory">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "New" 
            EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new agency (#FORM.agencyLongName#)"
            EventDesc = "New Agency" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->

        <!--- Nuke Child Agencies --->
    <cffunction name="nukeChildren" access="public" description="Deletes agencies attached to a deleted coc" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="cocID" hint="Defines the parent coc of the agencies to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="getAgencies">
              SELECT agencyID
              FROM agency
              WHERE
                cocID = <cfqueryparam value="#cocID#">   
            </cfquery> 
            <cfquery datasource="#datasource#" name="deleteAgencies">
              DELETE FROM agency
              WHERE
                cocID = <cfqueryparam value="#cocID#">   
            </cfquery>
            
            <!--- Nuke Projects --->
            <cfloop query=getAgencies> 
                <cfinvoke component="knex.projects" 
                        method="nukeChildren"
                        DataSource = "#DataSource#"
                        agencyID="#getAgencies.agencyID#">
            </cfloop>
            <!---/ Nuke Projects --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "Agencies were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted a CoC (CoC ID=#cocID#)."
                  EventDesc = "Agencies Deleted Because CoC Deleted" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Child Agencies --->

    <!--- Get Agencies --->
        <cffunction name="get" access="public" description="Grabs project component for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what information is selected" type="string" required="false" default="*" >
            <cfargument name="Join" hint="Selects what tables to join, and how" type="string" required="false" default="No" >
            <cfargument name="Where" hint="Sets which agencies the query looks at" type="string" required="true" defualt="0=0" >
            <cfargument name="Order" hint="Orders the selected agency information" type="string" required="false" default="agency.agencyID ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getAgencies">
                SELECT #whatFields#
                FROM agency
                <cfif Join is "LCoC">
                LEFT JOIN coc ON agency.cocID = coc.cocID
                </cfif>                        
                <cfif Where is "Children">
                INNER JOIN projects ON agency.agencyID = projects.agencyID
                </cfif>
                WHERE
                    <cfif Where is "ThisAgency">
                    agency.agencyID = <cfqueryparam value="#URL.agency#">
                    <cfelseif Where is "Children">
                    agency.agencyID = <cfqueryparam value="#URL.agency#">                    
                    <cfelseif Where is "ThisCoC">
                    active = '1'
                    <cfelseif Where is "SessionCoCActive">
                    agency.active = '1'
                    <cfelse>
                    0=0
                    </cfif>                
                    <cfif SESSION.cocID NEQ 0>
                    AND agency.cocID = <cfqueryparam value="#SESSION.cocID#">
                    </cfif>                  
                ORDER BY #Order#                                           
            </cfquery>                  
                <cfreturn getAgencies>
        </cffunction>
    <!---/ Get Agencies --->
</cfcomponent>