<!--- 
Filename: cocs.cfc
Version: 1.0
--->


<cfcomponent displayname="CoCs" hint="Insert update and delete CoC records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfinsert datasource="#datasource#" tablename="coc" formfields="cocLongName, cocName, CoCURL, HUDCoCID, CoCCity, CoCState, profileEnable, profileBody">
            <!--- Create Default APR Set --->
            <cfquery name="getCoCID">
                SELECT cocID FROM coc WHERE cocLongName = <cfqueryparam value="#FORM.cocLongName#">
                ORDER BY cocID DESC
            </cfquery>
            <cfset FORM.aprSetName = "#FORM.CoCCity# Default">
            <cfset FORM.APRDataSource = "HUD">
            <cfquery name="qList">
                SELECT APRQuestion from tables WHERE APRQuestion IS NOT NULL AND APRQuestion <> '0'  
            </cfquery>
            <cfset FORM.aprSetQList = ValueList(qList.APRQuestion)>
            <cfset FORM.cocID = getCoCID.cocID>
            <cfset FORM.compID = 0>
            <cfinsert datasource="#datasource#" tablename="dataapr00" formfields="APRDataSource, aprSetQList, cocID, aprSetName">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
              method="newEvent"
              DataSource = "#DataSource#"
              EventType = "New" 
              EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new CoC (#FORM.cocLongName#)"
              EventDesc = "New CoC" >
            <!---/ Log Event --->
            <!--- Slack --->
            <cfsavecontent variable="slackMessage">
                <cfoutput>
                    :city_sunrise: #SESSION.userFirst# #SESSION.userLast# created a new community, *#FORM.cocLongName#*
                </cfoutput>
            </cfsavecontent>
            <cfinvoke component="knex.slacker"
                      method="post"
                      DataSource="#DataSource#"
                      slackMessage="#slackMessage#">
            <!---/ Slack --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines CoCID to be deleted" type="numeric" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 1>
            <cfquery datasource="#datasource#" name="deleteCoC">
            DELETE FROM coc WHERE cocID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Nuke Agencies --->
            <cfinvoke component="knex.agency" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    cocID="#redshirt#">
            <!---/ Nuke Agencies --->
            <!--- Nuke Local APR Sets --->
            <cfinvoke component="knex.aprSet" 
                    method="nukeChildren"
                    DataSource = "#DataSource#"
                    cocID="#redshirt#">
            <!---/ Nuke APR Sets ---> 
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a CoC, and all of it agencies and projects (CoC ID: #redshirt#)"
                  EventDesc = "CoC Deleted" >
            <!---/ Log Event --->
            <!--- Slack --->
            <cfsavecontent variable="slackMessage">
                <cfoutput>
                    :city_sunset: :fire: #SESSION.userFirst# #SESSION.userLast# deleted a community :fire:
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

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfupdate datasource="#datasource#" tablename="coc" formfields="cocID, cocLongName, cocName, CoCURL, HUDCoCID, CoCCity, CoCState, profileEnable, profileBody">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "New" 
                EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new CoC (#FORM.cocLongName#)"
                EventDesc = "New CoC" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->

    <!--- Get CoCs --->
        <cffunction name="get" access="public" description="Grabs information about CoCs" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which CoCs the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="coc.CoCID ASC" >
            <!---/ Arguments --->
                
            <cfquery name="getCoC">
                SELECT #whatFields#
                FROM coc
                <cfif Where is "Children">
                INNER JOIN agency ON coc.cocID=agency.cocID
                </cfif>
                WHERE
                    <cfif Where is "Active">
                    active = '1'
                    <cfelseif Where is "ThisCoC">
                    coc.cocID = <cfqueryparam value="#URL.coc#">
                    <cfelseif Where is "Children">
                    coc.cocID = <cfqueryparam value="#URL.coc#">                    
                    <cfelse>
                    0=0
                    </cfif>
                ORDER BY #Order#                                          
            </cfquery>                  
                <cfreturn getCoC>
        </cffunction>
   	<!---/ Get CoCs --->            
                    
            

            
</cfcomponent>