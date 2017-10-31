<!--- 
Filename: field.cfc
Version: 1.0
--->


<cfcomponent displayname="Fields" hint="Insert update and delete Field records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 1>
            <cfinsert datasource="#datasource#" tablename="fields" formfields="fieldLongName, fieldName, tableID, fieldDataType, fieldLength, fieldKey, fieldDefault, fieldReq, fieldNotes, fieldDataFormat, fieldValid, fav">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new field (#FORM.fieldLongName#)"
                  EventDesc = "New Field" >
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
        
        <cfif SESSION.authLevel LTE 1>
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM fields WHERE fieldID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a Field (Field ID: #redshirt#)"
                  EventDesc = "Field Deleted" >
            <!---/ Log Event --->               
        </cfif>
	</cffunction>
    <!---/ Nuke Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 1>
            <cfupdate datasource="#datasource#" tablename="fields" formfields="fieldID, fieldLongName, fieldName, tableID, fieldDataType, fieldLength, fieldKey, fieldDefault, fieldReq, fieldNotes, fieldDataFormat, fieldValid, fav">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new field (#FORM.fieldLongName#)"
                  EventDesc = "New Field" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->

    <!--- Get Fields --->
        <cffunction name="get" access="public" description="Grabs information for fields" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what database information is selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which fields the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="fieldName ASC" >
            <cfargument name="tableID" hint="Orders the selected information" type="string" required="false" default="fieldName ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getfield">
                SELECT #whatFields#
                FROM fields
                WHERE
                    <cfif Where is "ThisField">
                    fieldID = <cfqueryparam value="#URL.field#">
                    <cfelseif Where is "getTables">
                    tableID = <cfqueryparam value="#tableID#"></cfqueryparam>    
                    <cfelseif Where is "Favorite">
                    fields.fav = <cfqueryparam value="1">
                    </cfif>
                ORDER BY #order#                                           
            </cfquery>                  
                <cfreturn getfield>
        </cffunction>
   	<!---/ Get Fields --->

    <!--- Get Fields with Join --->
        <cffunction name="getJoin" access="public" description="Grabs information for fields" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="APRQ" hint="Defines redshirt ID" type="string" required="true" default="No" >
            <cfargument name="whatFields" hint="Sets what database information is selected" type="string" required="false" default="*" >
            <cfargument name="Join" hint="Selects what tables to join, and how" type="string" required="true" default="No" >
            <cfargument name="Where" hint="Sets which fields the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="fieldName ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getFields">
                SELECT #whatFields#
                FROM fields
                <cfif Join is "LTables">
                    LEFT JOIN tables ON fields.tableID = tables.tableID
                </cfif>
                WHERE
                    <cfif Where is "APRTable">
                    tables.tableName = <cfqueryparam value="DataAPR#APRQ#">
                    <cfelseif Where is "Code">
                    fields.tableID = <cfqueryparam value="#URL.code#">    
                    <cfelseif Where is "thisTable">
                    fields.tableID = <cfqueryparam value="#URL.table#">
                    <cfelseif Where is "ThisField">
                    fieldID = <cfqueryparam value="#URL.field#">
                    <cfelseif Where is "Favorite">
                    fields.fav = <cfqueryparam value="1">
                    <cfelseif Where is "Depends" AND URL.table NEQ 0>
                    fields.tableID = <cfqueryparam value="#URL.table#">
                    <cfelse>
                    0=0
                    </cfif>
                ORDER BY #Order#                                            
            </cfquery>                  
                <cfreturn getFields>
        </cffunction>
   	<!---/ Get Fields with Join --->

</cfcomponent>