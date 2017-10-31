<!--- 
Filename: scoreCat.cfc
Version: 1.0
--->


<cfcomponent displayname="Scoring Categories" hint="Insert update and delete score category records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>   
            <cfinsert datasource="#DataSource#" tablename="scorecat" formfields="compID, catShortName, catLongName, catDesc">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new scoring category (#FORM.catLongName#)"
                  EventDesc = "New Scoring Category" >
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
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM scorecat WHERE catID = <cfqueryparam value="#redshirt#">
            </cfquery>
                
            <!--- Nuke Factors --->
            <cfinvoke component="knex.scoreFactors" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    catID="#redshirt#">
            <!---/ Nuke Factors --->                
                            
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a score category and all scoring factors and scoring scales associated with it. (Category ID: #redshirt#)"
                  EventDesc = "Scoring Category Deleted" >
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
            <cfupdate datasource="#DataSource#" tablename="scorecat" formfields="catID, compID, catShortName, catLongName, catDesc">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new scoring category (#FORM.catLongName#)"
                  EventDesc = "New Scoring Category" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->

        <!--- Nuke Child Scoring Categories --->
    <cffunction name="nukeChildren" access="public" description="Deletes scoring categories attached to a deleted competition" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="compID" hint="Defines the parent competition of the categories to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="getCategories">
              SELECT catID
              FROM scorecat
              WHERE
                compID = <cfqueryparam value="#compID#">   
            </cfquery> 
            <cfquery datasource="#datasource#" name="deleteCategory">
              DELETE FROM scorecat
              WHERE
                compID = <cfqueryparam value="#compID#">   
            </cfquery>
            
            <!--- Nuke Scales --->
            <cfloop query=getCategories> 
                <cfinvoke component="knex.scoreFactors" 
                        method="nukeChildren"
                        DataSource = "#DataSource#"
                        catID="#getCategories.catID#">
            </cfloop>
            <!---/ Nuke Scales --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "Scoring categories were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted a competition (Competition ID=#compID#)."
                  EventDesc = "Scoring Categories Deleted Because Competition Deleted" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Child Scoring Categories --->            
            
    <!--- Get Score Categories --->
        <cffunction name="get" access="public" description="Grabs score categories for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" >
            <cfargument name="Where" hint="Sets which score categories the query looks at" type="string" required="true" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getScoreCat">
                SELECT
                    <cfif WhatFields is "All">
                    *
                    <cfelseif WhatFields is "IDLongName">
                    scorecat.catID, scorecat.catLongName
                     <cfelseif WhatFields is "Children">
                    scorecat.catID, scorecat.catLongName, scorefactor.factorLongName
                    <cfelse>
                    *
                    </cfif>
                FROM scorecat
                <cfif WhatFields is "Children">
                    INNER JOIN scorefactor ON scorecat.catID = scorefactor.catID
                </cfif>
                WHERE
                    <cfif Where is "ThisComp">
                    scorecat.compID = <cfqueryparam value="#URL.comp#">
                    <cfelseif Where is "ThisCat">
                    scorecat.catID = <cfqueryparam value="#URL.cat#">
                    </cfif>
                ORDER BY
                    <cfif Order is "LongName">
                    catLongName ASC 
                    <cfelse>
                    catID ASC
                    </cfif>                                            
            </cfquery>                  
                <cfreturn getScoreCat>
        </cffunction>
   	<!---/ Get Score Categories --->
</cfcomponent>