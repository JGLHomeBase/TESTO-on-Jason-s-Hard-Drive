<!--- 
Filename: img.cfc
Version: 1.0
--->


<cfcomponent displayname="Image" hint="Insert update and delete image records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>
            <cfinsert datasource="#DataSource#" tablename="img" formfields="imgName, imgDesc, colorTheme, frontPage, cocID, projectID, imgCredit, imgCreditURL">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new img (#FORM.imgName#)"
                  EventDesc = "New img" >
            <!---/ Log Event --->
        </cfif>
	</cffunction>
    <!---/ New Record --->
            
    <!--- Nuke Record --->
	<cffunction name="nuke" access="public" description="Nukes a new record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 3>
            <cfquery datasource="#datasource#" name="deletecomp">
              DELETE FROM img WHERE imgID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted an image (Image ID: #redshirt#)"
                  EventDesc = "img Deleted" >
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
            <cfupdate datasource="#DataSource#" tablename="img" formfields="imgID, imgName, imgDesc, colorTheme, frontPage, cocID, projectID, imgCredit, imgCreditURL">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new img"
                  EventDesc = "New img" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ New Record --->
        
    <!--- Get Image --->
        <cffunction name="get" access="public" description="Grabs project component for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default = "*" >
            <cfargument name="Where" hint="Sets which images the query looks at" type="string" required="true" default ="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default = "imgID ASC" >
            <!---/ Arguments --->

			<cfquery datasource="#datasource#" name="getimg">
				SELECT #whatFields#
				FROM img
				WHERE
					<cfif Where is "ThisImage">
					imgID = <cfqueryparam value="#URL.img#">
					<cfelseif Where is "Front" AND SESSION.cocID NEQ 0>
					cocID = <cfqueryparam value="#SESSION.cocID#"> OR cocID = '0'
					<cfelseif Where is "Front" AND SESSION.cocID EQ 0>
					frontpage = '1'
					<cfelseif Where is "Front" AND SESSION.cocID NEQ 0>
					cocID = <cfqueryparam value="#SESSION.cocID#">
					<cfelseif Where is "ThisCoC">
					cocID = <cfqueryparam value="#SESSION.cocID#">
                    <cfelse>
                    0=0
                    </cfif>
					ORDER BY #Order#
			</cfquery>            
                <cfreturn getimg>
        </cffunction>
   	<!---/ Get Image --->            

    <!--- Get Image IDs img.cfm --->
        <cffunction name="getImg" access="public" description="Grabs project component for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getIMGID" maxrows="1">
                SELECT imgID 
                FROM img 
                ORDER BY imgID DESC
            </cfquery>
                <cfreturn getIMGID>
        </cffunction>
   	<!---/ Get Image IDs img.cfm --->  

</cfcomponent>