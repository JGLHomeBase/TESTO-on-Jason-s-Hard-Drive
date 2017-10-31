<!--- 
Filename: table.cfc
Version: 1.0
--->


<cfcomponent displayname="Tables" hint="Insert update and delete table records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 1>   
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="tables" formfields="projectData, tableName, APRQuestion, tableNotes, tableAPRQTitle, tableAPRPriority, programComponentList">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new table (#FORM.tableName#)"
                  EventDesc = "New Table">
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 1>  
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM tables WHERE tableID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a table (Table ID: #redshirt#)"
                  EventDesc = "Table Deleted" >
            <!---/ Log Event --->    
        </cfif>
	</cffunction>
    <!---/ Nuke Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 1>
            <cfupdate datasource="#datasource#" tablename="tables" formfields="tableID, projectData, tableName, APRQuestion, tableNotes, tableAPRQTitle, tableAPRPriority, programComponentList">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new table (#FORM.tableName#)"
                  EventDesc = "New Table" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->

    <!--- Get a Table --->
    <cffunction name="get" 
                access="public" 
                description="Grabs information for a specific table" 
                output="false" 
                returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" 
                        hint="ColdFusion DataSource Name" 
                        type="string" 
                        required="true" >
            <cfargument name="whatFields" 
                        hint="Sets what data fields are selected" 
                        type="string" 
                        required="false" 
                        default="*" >
            <cfargument name="Where" 
                        hint="Sets which agencies the query looks at" 
                        type="string" 
                        required="true" 
                        default="0=0" >
            <cfargument name="Order" 
                        hint="Orders the selected information" 
                        type="string" 
                        required="false" 
                        default="tableName" >
            <cfargument name="Question" 
                        hint="Identity of question" 
                        type="string" 
                        required="false" 
                        default="No" >
            <!---/ Arguments --->

              <cfquery datasource="#datasource#" name="getTables">
                SELECT #whatFields#
                FROM tables
                WHERE
                <cfif Where is "thisTable">
                tableID = <cfqueryparam value="#URL.table#">
                <cfelseif Where is "code">
                tableID <> <cfqueryparam value="#URL.code#">
                <cfelseif Where is "namedQuestion">
                APRQuestion = <cfqueryparam value="#question#">
                <cfelse>
                0=0
                </cfif>
                ORDER BY #Order#
              </cfquery>          
                <cfreturn getTables>
        </cffunction>
    <!---/ Get a Table --->
    
    <!--- Get List of Data Tables --->
    <cffunction name="getDataTables" 
                access="public" 
                description="Grabs a list of tables containing project data"
                returntype="Query">
        <cfquery name="getTableList">
            SELECT APRQuestion, tableName, TableID 
            FROM tables 
            WHERE projectData = '1' 
                AND APRQuestion <> '0'
        </cfquery>
        <cfreturn getTableList>
    </cffunction>
    <!---/ Get List of Data Tables --->

</cfcomponent>