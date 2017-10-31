<!--- 
Filename: docs.cfc
Version: 1.0
--->


<cfcomponent displayname="Documents" hint="Insert update and delete Document records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="docs" formfields="compID, docName, docDesc, docBox">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new doc                      (#FORM.docName#)"
                  EventDesc = "New doc" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="numeric" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM docs WHERE docID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a Document (Doc ID: #redshirt#)"
                  EventDesc = "doc Deleted" >
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
            <cfupdate datasource="#datasource#" tablename="docs" formfields="docID, compID, docName, docDesc, docBox">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new doc (#FORM.docName#)"
                  EventDesc = "New doc" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->
           
    <!--- Get Docs --->
        <cffunction name="get" access="public" description="Grabs database fields for uploaded documents" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which docs the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="docID ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getdoc">
                SELECT #whatFields#
                FROM docs
                WHERE
                    <cfif Where is "ThisComp">
                    compID = <cfqueryparam value="#URL.comp#">
                    <cfelseif Where is "ThisProject">
                    projectID = <cfqueryparam value="#URL.project#">
                    <cfelseif Where is "ThisDoc">
                    docID = <cfqueryparam value="#URL.doc#">
                    <cfelseif Where is "NotHidden">
                    projectID = <cfqueryparam value="#URL.project#">
		            AND docPrivate = '0'    
                    </cfif>
                ORDER BY #Order#                                          
            </cfquery>                  
                <cfreturn getdoc>
        </cffunction>
   	<!---/ Get Docs --->            
            
</cfcomponent>