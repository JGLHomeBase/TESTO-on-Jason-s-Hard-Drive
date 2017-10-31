<!--- 
Filename: survey.cfc
Version: 1.0
--->


<cfcomponent displayname="Survey Questions" hint="Insert update and delete survey question records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>   
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="surveyq" formfields="surveyQText, surveyCat, aprID">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new Survey Question  (#FORM.surveyQText#)"
                  EventDesc = "New Survey Question " >
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
              DELETE FROM surveyq WHERE surveyQID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a survey question (Question ID: #redshirt#)"
                  EventDesc = "Survey Question Deleted" >
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
            <cfupdate datasource="#datasource#" tablename="surveyq" formfields="surveyQID, surveyQText, surveyCat, aprID">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new Survey Question  (#FORM.surveyQText#)"
                  EventDesc = "New doc" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->
   
    <!--- Get Questions --->
        <cffunction name="get" access="public" description="Grabs survey questions for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which survey questions the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="surveyQID ASC" >
            <cfargument name="Join" hint="Specifies which tables to join, and how" type="string" required="false" default="No" >    
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getQ">
                SELECT #whatFields#
                FROM surveyq
                <cfif Join is "IDataAPR00">
                INNER JOIN dataapr00 ON surveyq.aprID = dataapr00.aprID
                </cfif>
                WHERE
                    <cfif Where is "ThisQ">
                    surveyQID = <cfqueryparam value="#URL.q#">
                    <cfelseif Where is "CoC">
                    0=0
                        <cfif SESSION.cocID NEQ 0>
                        AND dataapr00.cocID = <cfqueryparam value="#SESSION.cocID#">
                        </cfif>
                    <cfelse>
                    0=0
                    </cfif>
                ORDER BY #Order#
            </cfquery>                  
                <cfreturn getQ>
        </cffunction>
   	<!---/ Get Questions --->
</cfcomponent>