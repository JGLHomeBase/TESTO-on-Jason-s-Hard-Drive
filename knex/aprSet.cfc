<!--- 
Filename: aprSet.cfc
Version: 1.0
--->


<cfcomponent displayname="aprSet" hint="Insert update and delete APR Set" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false">
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>            
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="dataapr00" formfields="APRDataSource, APRRangeEnd, aprRangeStart, aprSetNotes,                   aprSetQList, cocID, aprSetName">
            
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "New" 
            EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new APR set (#FORM.aprSetName#)"
            EventDesc = "New APR Set" >
            <!---/ Log Event --->
             
        </cfif>
	</cffunction>
    <!---/ New Record --->

     <!--- Copy Record --->
	<cffunction name="copy" access="public" description="Copies a record from a previous competition" output="false">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 3>            
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="dataapr00" formfields="APRDataSource, APRRangeEnd, aprRangeStart, aprSetNotes,                   aprSetQList, cocID, aprSetName">
            
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "New" 
            EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) copied an APR set (#FORM.aprSetName#)"
            EventDesc = "Copied APR Set" >
            <!---/ Log Event --->
             
        </cfif>
	</cffunction>
    <!---/ Copy Record --->
                
                
                
                
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
        <!---/ Arguments --->
        
        <cfif SESSION.authLevel LTE 1>
            
            <cfquery datasource="#datasource#" name="deletecomp">
                DELETE FROM dataapr00 WHERE aprID = <cfqueryparam value="#redshirt#">
            </cfquery>
            
            <!--- Nuke RFIQs and RFI Responses --->
            <cfinvoke component="knex.rfi" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                   aprID="#redshirt#">
            <!---/ Nuke RFIQs and RFI Responses --->
            
            <cfquery name="getTableList">
                SELECT APRQuestion, tableName, TableID FROM tables WHERE projectData = '1' AND APRQuestion <> '0'
            </cfquery>
            
                <cfloop query="getTableList">
                    <cfinvoke component="knex.aprData" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    From = "dataapr#NumberFormat(getTableList.APRQuestion,"00")#"
                   aprID="#redshirt#">
                </cfloop>

            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
            method="newEvent"
            DataSource = "#DataSource#"
            EventType = "Delete" 
            EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted an APR Set (APR ID: #redshirt#) and all RFI Questions, RFI Responses, and APR Data"
            EventDesc = "APR Set Deleted" >
            <!---/ Log Event --->
                
            <!--- Slack --->
            <cfsavecontent variable="slackMessage">
                <cfoutput>
                    :books: :fire: #SESSION.userFirst# #SESSION.userLast# deleted an apr set :fire:
                </cfoutput>
            </cfsavecontent>
            <cfinvoke component="knex.slacker"
                      method="post"
                      DataSource="#DataSource#"
                      slackMessage="#slackMessage#">
            <!---/ Slack --->
        </cfif>
	</cffunction>
    <!---/ Nuke Record --->

        <!--- Nuke Child APR Sets --->
    <cffunction name="nukeChildren" access="public" description="Deletes APR Sets attached to a deleted Communtiy/CoC" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="cocID" hint="Defines the parent CoC of the APR Sets to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 1>  
            <cfquery datasource="#datasource#" name="getAPR">
              SELECT aprID
              FROM dataapr00
              WHERE
                cocID = <cfqueryparam value="#cocID#">   
            </cfquery>
            <cfquery datasource="#datasource#" name="deleteRFIQ">
              DELETE FROM dataapr00
              WHERE
                cocID = <cfqueryparam value="#cocID#">   
            </cfquery>
            <!--- Nuke Local App Qs and Responses --->
            <cfloop query=getAPR>
            <cfinvoke component="knex.rfi" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    aprID="#getAPR.aprID#">
            </cfloop>
            <!---/ Nuke Local App Qs and Responses ---> 
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "APR Sets were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted a CoC (CoC ID=#cocID#)."
                  EventDesc = "APR Set Deleted Because CoC Deleted" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Nuke Child APR Sets ---> 

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfupdate datasource="#datasource#" tablename="dataapr00" formfields="aprID, APRDataSource, APRRangeEnd, aprRangeStart,                         aprSetNotes, aprSetQList, cocID, aprSetName">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "New" 
                EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new APR set (#FORM.aprSetName#)"
                EventDesc = "New APR Set" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->
              
    <!--- Get APR Set List --->
	<cffunction name="get" access="public" description="Grabs a list of APR Sets" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Sets what information is selected" type="string" required="false" default="*" >
        <cfargument name="Join" hint="Selects tables to join, and how" type="string" required="false" default="No" >
        <cfargument name="Where" hint="Sets which APR sets the query looks at" type="string" required="false" default="0=0" >
        <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="aprID" >
        <!---/ Arguments --->
        
        <cfquery datasource="#datasource#" name="getAPR">
            SELECT #whatFields#
            FROM dataapr00
                <cfif Join is "LCoC">
                LEFT JOIN coc ON dataapr00.cocID = coc.cocID        
                <cfelseif Join is "LCompCoC">
                LEFT JOIN coc ON dataapr00.cocID = coc.cocID            
                </cfif>
            WHERE
                <cfif Where is "ThisCoC">
                cocID = <cfqueryparam value="#SESSION.cocID#"> OR cocID = '0'
                <cfelseif Where is "ThisAPR">
                aprID = <cfqueryparam value="#URL.apr#">
                <cfelseif Where is "ThisAPRCoC">
                aprID = <cfqueryparam value="#URL.apr#">
                AND cocID = <cfqueryparam value="#SESSION.cocID#">
                <cfelseif Where is "SessionCoC">
                dataapr00.cocID = <cfqueryparam value="#SESSION.cocID#">
                <cfelseif Where is "Depends" AND SESSION.cocID NEQ 0>
                dataapr00.cocID = <cfqueryparam value="#SESSION.cocID#">    
                <cfelse>
                0=0    
                </cfif>
                <cfif SESSION.cocID NEQ 0>
                    AND dataapr00.cocID = <cfqueryparam value="#SESSION.cocID#">
                </cfif>
            ORDER BY #order#
        </cfquery>
                        <cfreturn getAPR>
    </cffunction>
    <!---/ Get APR Set List --->   

    <!--- Get APR Question List --->
	<cffunction name="getQs" access="public" description="Grabs a list of APR Sets" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Sets what information is selected" type="string" required="false" >
        <cfargument name="whatAPR" hint="Sets which APR questions the query looks at" type="string" required="false" default="">
        <cfargument name="Order" hint="Orders the selected information" type="string" required="false" >
        <cfargument name="ShowReqOnly" hint="Show required fields only" type="numeric" default="0" required="false">
        <!---/ Arguments --->
        
          <cfquery datasource="#datasource#" name="getAPRQList">
            SELECT
                <cfif whatFields is "Detail">
                tableAPRPriority, tableAPRQTitle, APRQuestion, tableName
                <cfelse>
                aprSetQList
                </cfif>
            FROM
                <cfif whatFields is "Detail">
                tables
                <cfelse>
                dataapr00
                </cfif>
            WHERE
                <cfif whatAPR is "All">
                tableAPRQTitle IS NOT NULL
                AND APRQuestion IS NOT NULL
                AND APRQuestion <> '0'
                    <cfif ShowReqOnly EQ 1>
                    AND tableAPRPriority = <cfqueryparam value="req">
                    </cfif>
                <cfelse>
                aprID = <cfqueryparam value="#URL.apr#">
                    <cfif SESSION.cocID NEQ 0>
                        AND dataapr00.cocID = <cfqueryparam value="#SESSION.cocID#">
                     </cfif>                
                </cfif>
            ORDER BY
                <cfif Order is "TableName">
                tableName ASC
                <cfelse>
                aprSetQList
                </cfif>
          </cfquery>
                        <cfreturn getAPRQList>
    </cffunction>
    <!---/ Get APR Question List ---> 

    <!--- Check Question --->
        <cffunction name="check" access="public" description="Grabs APR IDs" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="APRQ" hint="Identifies APR Q" type="string" required="true" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="qcheck">
              select aprID FROM dataapr#APRQ#
            </cfquery>                  
                <cfreturn qcheck>
        </cffunction>
   	<!---/ Check Question --->

                
    <!--- Get aprID for most recently created APR Set --->
        <cffunction name="latest" access="public" description="Grabs the aprID of the most recently created APR Set" output="false" returntype="query">
            
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >    
                
        <cfquery datasource="#datasource#" name="latestAPR">
            SELECT max(aprID) AS aprKey FROM dataapr00  
        </cfquery>        
                
        <cfreturn latestAPR>       
                
        </cffunction>
    <!--- Get aprID for most recently created APR Set --->            
                
                
</cfcomponent>