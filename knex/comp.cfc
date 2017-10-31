<!--- 
Filename: comp.cfc
Version: 1.0
--->


<cfcomponent displayname="Competitions" hint="Insert update and delete Competition records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfset FORM.cocID = SESSION.cocID>
            <cfset FORM.ARD = LSParseCurrency(FORM.ARD)>
            <cfset FORM.UFA = LSParseCurrency(FORM.UFA)>
            <cfset FORM.FPRN = LSParseCurrency(FORM.FPRN)>
            <cfset FORM.PlanningGrant = LSParseCurrency(FORM.PlanningGrant)>
            <!--- Cap Tier 1 between 0% and 100% of the ARD --->
            <cfif FORM.ARDCut GT 100>
                <cfset FORM.ARDCut = 100>
            <cfelseif FORM.ARDCut LT 0>
                <cfset FORM.ARDCut = 0>
            </cfif>
            <!---/ Cap Tier 1 between 0% and 100% of the ARD --->
                    
            <cfinsert datasource="#datasource#" tablename="comp" formfields="compLongName, compName, cocID, CompFY, ListOpen, PeerOpen, ScoringOpen, ARDCut, ARD, FPRN, UFA, PanelInstructions, PlanningGrant, aprDefaultID, aprCompAID, aprCompBID, ReportsOpen, reportSetID">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new competition (#FORM.compLongName#)"
                  EventDesc = "New Competition" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines the competition ID to be deleted" type="numeric" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfquery datasource="#datasource#" name="deletecomp">
            DELETE FROM comp WHERE compID = <cfqueryparam value="#redshirt#">
            </cfquery>
                
            <!--- Nuke Scoring Categories --->
            <cfinvoke component="knex.scoreCat" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    compID="#redshirt#">
            <!---/ Nuke Scoring Categories --->                
                            
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a Competition (Competition ID: #redshirt#)"
                  EventDesc = "Competition Deleted" >
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
            <cfset FORM.ARD = LSParseCurrency(FORM.ARD)>
            <cfset FORM.FPRN = LSParseCurrency(FORM.FPRN)>
            <cfset FORM.UFA = LSParseCurrency(FORM.UFA)>
            <cfset FORM.PlanningGrant = LSParseCurrency(FORM.PlanningGrant)>
            <!--- Cap Tier 1 between 0% and 100% of the ARD --->
            <cfif FORM.ARDCut GT 100>
                <cfset FORM.ARDCut = 100>
            <cfelseif FORM.ARDCut LT 0>
                <cfset FORM.ARDCut = 0>
            </cfif>
            <!---/ Cap Tier 1 between 0% and 100% of the ARD --->
            <cfupdate datasource="#datasource#" tablename="comp" formfields="compID, compLongName, compName, CompFY, ListOpen, PeerOpen, ScoringOpen, ARDCut, ARD, FPRN, UFA, PanelInstructions, PlanningGrant, aprDefaultID, aprCompAID, aprCompBID, ReportsOpen, reportSetID">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new competition (#FORM.compLongName#)"
                  EventDesc = "New Competition" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->

    <!--- Get Comps --->
	<cffunction name="get" access="public" description="Grabs a list of Competitions" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Sets what information is selected" type="string" required="false" default ="*" >
        <cfargument name="Join" hint="Selects which tables to join, and how" type="string" required="true" default = "no" >
        <cfargument name="Where" hint="Sets which competitions the query looks at" type="string" required="true" default = "0=0" >
        <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default = "comp.CompFY DESC, comp.compName" >
        <!---/ Arguments --->
    
          <cfquery datasource="#datasource#" name="getCompList">
            SELECT #whatFields#
            FROM comp
            <cfif Join is "LCoC">
                LEFT JOIN coc ON comp.cocID = coc.cocID
            </cfif>
            <cfif Where is "ThisComp">
                INNER JOIN scorecat ON comp.compID = scorecat.compID
            </cfif>
            WHERE
                <cfif Where is "ThisCoC">
                active = '1'
                <cfelseif Where is "ThisComp">
                comp.compID = <cfqueryparam value="#URL.comp#">
                <cfelseif Where is "SessionComp">
                compID = <cfqueryparam value="#SESSION.compID#">
                <cfelseif Where is "SessionCoCActive">
                comp.active = '1'
                <cfelse>
                0=0
                </cfif>
                <cfif SESSION.cocID NEQ 0>
                AND comp.cocID = <cfqueryparam value="#SESSION.cocID#">
                </cfif>
            ORDER BY #Order#
          </cfquery>
          <cfreturn getCompList>
    </cffunction>
    <!---/ Get Comps ---> 

</cfcomponent>