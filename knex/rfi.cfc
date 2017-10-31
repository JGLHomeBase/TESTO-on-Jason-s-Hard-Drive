<!--- 
Filename: rfi.cfc
Version: 1.1
--->


<cfcomponent displayname="Request for Information" hint="Insert update and delete RFI records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>   
            <!--- Insert --->
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#DataSource#" tablename="datarfiq" formfields="programComponentList, question, nickname, instruction, aprID, format, fieldname, qNumber, required, isPrivate">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new Supplemental Question (#FORM.question#)"
                  EventDesc = "New Question" >
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
                <cfquery datasource="#datasource#" name="deleteRFI">
                DELETE FROM datarfiq WHERE DataRFIQID = <cfqueryparam value="#redshirt#">
                </cfquery>
                <!--- Log Event --->
                <cfinvoke component="knex.eventLog" 
                      method="newEvent"
                      DataSource = "#DataSource#"
                      EventType = "Delete" 
                      EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted an RFI question (RFI Question ID: #redshirt#)"
                      EventDesc = "Supplemental Question Deleted" >
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
            <cfupdate datasource="#DataSource#" tablename="datarfiq" formfields="DataRFIQID, programComponentList, question, nickname, instruction, aprID, format, fieldname, qNumber, required, isPrivate">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Update" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) updated an applicaiton question (#FORM.question#)"
                  EventDesc = "Supplemental Questions Update" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->

        <!--- Nuke Child DataRFI Questions --->
    <cffunction name="nukeChildren" access="public" description="Deletes RFI questions attached to a deleted APR Set" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="aprID" hint="Defines the parent APR Set of the RFI questions to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="deleteRFIQ">
              DELETE FROM datarfiq
              WHERE
                aprID = <cfqueryparam value="#aprID#">   
            </cfquery>
            <cfquery datasource="#datasource#" name="deleteRFIData">
              DELETE FROM datarfi
              WHERE
                aprID = <cfqueryparam value="#aprID#">   
            </cfquery>            
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "RFI questions and RFI data were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted an APR Set (APR Set ID=#aprID#)."
                  EventDesc = "RFI Questions and Data Deleted Because APR Set Deleted" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Child DataRFI Questions ---> 

    <!--- Get RFI --->
        <cffunction name="get" access="public" description="Grabs data fields for RFIs" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which RFI records the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="DataRFIQID ASC" >
			<cfargument name="authLevel" hint="role id" type="numeric" default="0" > 
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getRFI">
                SELECT #whatFields#
                FROM datarfiq
                WHERE
                    <cfif Where is "ThisAPR">
                    	aprID = <cfqueryparam value="#URL.apr#">
						<cfif arguments.authLevel eq 6>
							AND isPrivate = 0
						</cfif>
                    <cfelseif Where is "ThisRFI">
                    DataRFIQID = <cfqueryparam value="#URL.q#">
                    <cfelseif Where is "OldAPR">
                    aprID = <cfqueryparam value="#OriginalAPR#">
                    <cfelseif Where is "Debug">
                    aprID = 13
                    <cfelse>
                    0=0
                    </cfif>
                ORDER BY #Order#                                          
            </cfquery>                  
                <cfreturn getRFI>
        </cffunction>
   	<!---/ Get RFI --->
                        
  
                        
       

</cfcomponent>