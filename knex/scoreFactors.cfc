<!--- 
Filename: scoreFactors.cfc
Version: 1.0
--->


<cfcomponent displayname="Scoring Factors" hint="Insert update and delete score factor records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>   
            <cfinsert datasource="#DataSource#" tablename="scorefactor" formfields="catID, factorShortName, factorLongName, pmID, maxPoints, factorDesc, forced, scaled">
            <cfquery name="getFactor">
            SELECT factorID FROM scorefactor
            WHERE catID = <cfqueryparam value="#FORM.catID#">
                AND factorShortName = <cfqueryparam value="#FORM.factorShortName#">
                AND factorLongName = <cfqueryparam value="#FORM.factorLongName#">
                AND pmID = <cfqueryparam value="#FORM.pmID#">
            ORDER BY factorID DESC
            </cfquery>
            <cfset FORM.factorID = getFactor.factorID>
            <cfset FORM.cocID = SESSION.cocID>
            <cfset FORM.ModName = FORM.factorLongName>
            <cfset FORM.modShortName = FORM.factorShortName>
            <cfset FORM.modType = "score">
            <cfinsert datasource="#DataSource#" tablename="reportmod" formfields="factorID, cocID, ModName, modShortName, modType">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new scoring factor (#FORM.factorLongName#)"
                  EventDesc = "New Scoring Factor" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
        <!--- Nuke Factor --->
    <cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines factor ID to be deleted" type="string" required="true" > 
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="deletecomp">
            DELETE FROM scorefactor
            WHERE factorID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <cfquery datasource="#datasource#" name="deletecomp">
            DELETE FROM reportmod
            WHERE factorID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Nuke Scales --->
            <cfinvoke component="knex.scoreScales" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    factorID="#redshirt#">
            <!---/ Nuke Scales --->                
            <!--- Update Competition Scores --->
            <cfinvoke component="knex.sortinghat" 
                    method="scoreComp"
                    DataSource = "#DataSource#"
                    compID="#SESSION.compID#">
            <!---/ Update Competition Scores --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a score factor (Factor ID: #redshirt#) and all scoring scales attached to it."
                  EventDesc = "Scoring Factor Deleted" > 
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Factor --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfset FORM.maxPoints = LSParseCurrency(FORM.maxPoints)>
            <cfupdate datasource="#DataSource#" tablename="scorefactor" formfields="factorID, catID, factorShortName, factorLongName, pmID, maxPoints, factorDesc, forced, scaled">
            <cfquery name="modCheck">
            SELECT ReportModID FROM reportmod
            WHERE factorID = <cfqueryparam value="#FORM.factorID#">
            </cfquery>
            <cfif modCheck.RecordCount EQ 0>
                <cfset FORM.cocID = SESSION.cocID>
                <cfset FORM.ModName = FORM.factorLongName>
                <cfset FORM.modShortName = FORM.factorShortName>
                <cfset FORM.modType = "score">
                <cfinsert datasource="#DataSource#" tablename="reportmod" formfields="factorID, cocID, ModName, modShortName, modType">
            </cfif>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new scoring factor (#FORM.factorLongName#)"
                  EventDesc = "New Scoring Factor" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->
            
        <!--- Nuke Child Factors --->
    <cffunction name="nukeChildren" access="public" description="Deletes factors attached to a deleted scoring category" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="catID" hint="Defines the parent category of the factors to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="getFactors">
              SELECT factorID
              FROM scorefactor
              WHERE
                catID = <cfqueryparam value="#catID#">   
            </cfquery> 
            <cfquery datasource="#datasource#" name="deleteFactor">
              DELETE FROM scorefactor
              WHERE
                catID = <cfqueryparam value="#catID#">   
            </cfquery>
            <!--- Update Competition Scores --->
            <cfinvoke component="knex.sortinghat" 
                    method="scoreComp"
                    DataSource = "#DataSource#"
                    compID="#SESSION.compID#">
            <!---/ Update Competition Scores --->
            <!--- Nuke Scales --->
            <cfloop query=getFactors> 
                <cfinvoke component="knex.scoreScales" 
                        method="nukeChildren"
                        DataSource = "#DataSource#"
                        factorID="#getFactors.factorID#">
            </cfloop>
            <!---/ Nuke Scales --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "Scoring factors were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted a scoring category (Category ID=#catID#)."
                  EventDesc = "Scoring Factores Deleted Because Scoring Category Deleted" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Child Factors --->
                
    <!--- Get Factors --->
	<cffunction name="get" access="public" description="Grabs info about factors" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Sets what information is selected" type="string" required="false" default="*" >
        <cfargument name="Join" hint="Joins tables as indicated" type="string" required="false">    
        <cfargument name="Where" hint="Sets which factors the query looks at" type="string" required="false" default="0=0" >
        <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="scorefactor.factorID" >
        <!---/ Arguments --->
        
        <cfif Where is "inReport">
        <!--- Get List of Report Modules --->
        <cfinvoke component="knex.reports"
                  method="get"
                  datasource="#datasource#"
                  returnVariable="getReport"
                  whatFields="report.reportPayload AS modList, compapp.compAppID AS compAppID"
                  Join="compapp"
                  Where="thisApp">
        <!---/ Get List of Report Modules --->
        </cfif>
            
        <cfquery datasource="#datasource#" name="getScoreFactor">
            SELECT #whatFields#
            FROM scorefactor
            <cfif Join is "modCat">
                INNER JOIN reportmod ON scorefactor.factorID = reportmod.factorID 
                RIGHT JOIN scorecat ON scorefactor.catID = scorecat.catID
            <cfelseif Where is "Children">
                INNER JOIN scorescale ON scorefactor.factorID = scorescale.factorID 
            </cfif>
            WHERE
                <cfif Where is "thisFactor">
                scorefactor.factorID = <cfqueryparam value="#URL.factor#">
                <cfelseif Where is "Children">
                scorefactor.factorID = <cfqueryparam value="#URL.factor#">
                <cfelseif Where is "inReport">
                reportmod.reportModID IN (<cfqueryparam value="#getReport.modList#" list="true">)
                <cfelse>
                0=0
                </cfif>
            ORDER BY #Order#
          </cfquery>
                        <cfreturn getScoreFactor>
    </cffunction>
    <!---/ Get Factors --->                 
                
</cfcomponent>