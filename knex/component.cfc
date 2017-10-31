<!--- 
Filename: component.cfc
Version: 1.0
--->


<cfcomponent displayname="Program Components" hint="Insert update and delete Program Component records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="projectcomponent" formfields="projectComponentDesc, projectComponentLongName, projectComponentName, projectComponentSource, projectComponentSourceURL, projectCompCategory">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "New" 
                EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new  component (#FORM.projectComponentLongName#)"
                EventDesc = "New Component" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a new record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="numeric" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 1>
            
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM projectcomponent WHERE projectComponentID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "Delete" 
                EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a Program Component (Component ID: #redshirt#)"
                EventDesc = "Component Deleted" >
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
            <cfupdate datasource="#datasource#" tablename="projectcomponent" formfields="projectComponentID, projectComponentDesc, projectComponentLongName, projectComponentName, projectComponentSource, projectComponentSourceURL, projectCompCategory">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "New" 
                EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new                        component (#FORM.projectComponentLongName#)"
                EventDesc = "New Component" >
             <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->
            
    <!--- Get Components --->
	<cffunction name="get" access="public" description="Grabs a list of Competitions" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Sets what information is selected" type="string" required="false" default="*" >
        <cfargument name="Where" hint="Sets which competitions the query looks at" type="string" required="false" default="0=0" >
        <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="projectComponentID" >
        <!---/ Arguments --->
        
          <cfquery datasource="#datasource#" name="getProjectCom">
            SELECT #whatFields#
            FROM projectcomponent
            WHERE
                <cfif Where is "Active">
                active = '1'
                <cfelseif Where is "ThisProject">
                projectID = <cfqueryparam value="#URL.project#">
                <cfelseif Where is "ThisComponent">
                projectComponentID = <cfqueryparam value="#URL.component#">
                <cfelse>
                0=0
                </cfif>
            ORDER BY #Order#
          </cfquery>
                        <cfreturn getProjectCom>
    </cffunction>
    <!---/ Get Components ---> 
            
    <!--- Get Components from Projects --->
        <cffunction name="getThis" access="public" description="Grabs project component for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getProjectCom">
            SELECT projectComponentID from projects WHERE projectID = <cfqueryparam value="#URL.project#">
            </cfquery>          
                
                <cfreturn getProjectCom>
        </cffunction>
    <!---/ Get Components from Projects --->


</cfcomponent>