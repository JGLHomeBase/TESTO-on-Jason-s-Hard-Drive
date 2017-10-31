<!--- 
Filename: scoreScales.cfc
Version: 1.0
--->


<cfcomponent displayname="Scoring Scales" hint="Insert update and delete scoring scale records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>   
            <cfinsert datasource="#DataSource#" tablename="scorescale" formfields="factorID, scaleName, minValue, ptScore">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new scoring category (#FORM.scaleName#)"
                  EventDesc = "New Scoring Scale" >
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
              DELETE FROM scorescale WHERE scaleID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a scoring scale (Scale ID: #redshirt#)"
                  EventDesc = "Scoring Scale Deleted" >
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
            <cfset FORM.minValue = LSParseCurrency(minValue)>
            <cfset FORM.ptScore = LSParseCurrency(ptScore)>
            <cfupdate datasource="#DataSource#" tablename="scorescale" formfields="scaleID, factorID, scaleName, minValue, ptScore">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new scoring category (#FORM.scaleName#)"
                  EventDesc = "New Scoring Scale" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->
            
        <!--- Nuke Child Scales --->
    <cffunction name="nukeChildren" access="public" description="Deletes scales attached to a deleted factor" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="factorID" hint="Defines the parent factor of the scales to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="deleteScale">
              DELETE FROM scorescale
              WHERE
                factorID = <cfqueryparam value="#factorID#">   

            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "Scoring scales were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted a scoring factor (Factor ID=#factorID#)."
                  EventDesc = "Scoring Scales Deleted Because Factor Deleted" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Child Scales --->  
</cfcomponent>