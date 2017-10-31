<!--- 
Filename: customGoals.cfc
Version: 1.0
--->


<cfcomponent displayname="Program Components" hint="Insert update and delete Program Component records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfinsert datasource="#DataSource#" tablename="customgoals" formfields="projectID, aprID, goalTargetText, goalName, goalTarget, GoalSuccess, goalParticipants, goalTargetPer">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new Survey Question  (#FORM.goalName#)"
                  EventDesc = "New Survey Question " >
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
        
        <cfif SESSION.authLevel LTE 3>
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM customgoals WHERE customGoalID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a Custom Gaol (Goal ID: #redshirt#)"
                  EventDesc = "Survey Question Deleted" >
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
            <cfupdate datasource="#DataSource#" tablename="customgoals" formfields="customGoalID, projectID, aprID, goalTargetText, goalName, goalTarget, GoalSuccess, goalParticipants, goalTargetPer">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new Survey Question  (#FORM.goalName#)"
                  EventDesc = "New doc" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->
            
    <!--- Get Custom Goals --->
        <cffunction name="get" access="public" description="Grabs database fields for custom goals" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what database fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which custom goals the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="customGoalID ASC" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getcustomGoals">
                SELECT #whatFields#
                FROM customGoals
                WHERE
                    <cfif Where is "ThisProject">
                    projectID = <cfqueryparam value="#URL.project#">
                    <cfelseif Where is "ThisGoal">
                    customGoalID = <cfqueryparam value="#URL.goal#">
                    <cfelse>
                    0=0
                    </cfif>
                ORDER BY #Order#                                         
            </cfquery>                  
                <cfreturn getcustomGoals>
        </cffunction>
   	<!---/ Get Custom Goals --->            

            
</cfcomponent>