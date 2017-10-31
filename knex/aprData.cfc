<!--- 
Filename: aprData.cfc
Version: 1.0
--->

<cfcomponent displayname="aprData" hint="Insert update and delete APR Set" output="false">

    <!--- Get DataAPR --->
	<cffunction name="get" access="public" description="Grabs the ID for this APR Form" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="FormID" hint="Sets what information is selected" type="string" required="false" >
        <cfargument name="Form" hint="Sets what table is queried" type="string" required="false" >
        <!---/ Arguments --->
        
        <cfquery datasource="#datasource#" name="getDataAPR">
            SELECT #FormID#
            FROM #Form#
            WHERE
            projectID = <cfqueryparam value="#URL.project#">
            AND aprID = <cfqueryparam value="#URL.apr#">
        </cfquery>
        <cfreturn getDataAPR>
    </cffunction>
    <!---/ Get DataAPR ---> 
    
    <!--- New Check --->
	<cffunction name="newCheck" access="public" description="Grabs the ID for this APR Form" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="FormID" hint="Sets what information is selected" type="string" required="false" >
        <cfargument name="Form" hint="Sets what table is queried" type="string" required="false" >
        <cfargument name="Where" hint="Sets conditions for query" type="string" required="false">
        <!---/ Arguments --->
        
        <cfquery datasource="#datasource#" name="newCheck">
            SELECT #FormID#
            FROM #Form#
            WHERE
            projectID = <cfqueryparam value="#URL.project#">
            AND aprID = <cfqueryparam value="#URL.apr#">
        </cfquery>
        <cfreturn newCheck>
    </cffunction>
    <!---/ New Check --->   

    <!--- Progress Check --->
	<cffunction name="progress" access="public" description="Progress Check" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="Question" hint="Identity of local question" type="string" required="false" default="No">
        <cfargument name="whatFields" hint="Identifies the fields to query" type="string" required="false" default="*">
        <cfargument name="Join" hint="Triggers a JOIN clause" type="string" required="false" default="No">
        <!---/ Arguments --->
      
		<cfquery datasource="#datasource#" name="progress">
		    SELECT #whatFields#
            FROM dataapr#numberFormat("#question#","00")#
		    <cfif Join is "users">
            INNER JOIN users ON dataapr#numberFormat("#question#","00")#.inputUserID = users.userID
            </cfif>
		    WHERE dataapr#numberFormat("#question#","00")#.projectID = <cfqueryparam value="#URL.project#">
		    AND dataapr#numberFormat("#question#","00")#.APRID = <cfqueryparam value="#URL.apr#">
		</cfquery>
                        <cfreturn progress>
    </cffunction>
    <!---/ Progress Check --->            

    <!--- Second Progress Check --->
	<cffunction name="progressTwo" access="public" description="Second Progress Check" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="whatFields" hint="Identifies the fields to query" type="string" required="false" default="*">
        <cfargument name="Join" hint="Triggers a JOIN clause" type="string" required="false" default="No">
        <!---/ Arguments --->
      
		<cfquery datasource="#datasource#" name="progress">
		   SELECT #whatFields#
           FROM datarfi
            <cfif Join is "users">
		   INNER JOIN users ON datarfi.inputUserID = users.userID
            </cfif>
		   WHERE aprID = <cfqueryparam value="#URL.apr#">
            AND datarfi.projectID = <cfqueryparam value="#URL.project#">
		</cfquery>
                        <cfreturn progress>
    </cffunction>
    <!---/ Second Progress Check --->            

    <!--- Get APR ID from DataAPR Table --->
	<cffunction name="tmp" access="public" description="Get APR ID from DataAPR Table" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="Question" hint="Identity of local question variable" type="string" required="false" default="No">
        <!---/ Arguments --->
      
            <cfquery datasource="#datasource#" name="getTables">
              SELECT aprID
                FROM dataapr#numberFormat("#question#","00")#
              WHERE projectID = <cfqueryparam value="#URL.project#">
              AND APRID = <cfqueryparam value="#URL.apr#">
              </cfquery>
                        <cfreturn getTables>
    </cffunction>
    <!---/ Get APR ID from DataAPR Table --->            

    <!--- Get APR07 Totals --->
	<cffunction name="q7totals" access="public" description="Grabs totals from DataAPR07" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
      
           <cfquery datasource="#datasource#" name="q7totals">
              SELECT apr07_TotalClients, apr07_TotalAdults, apr07_TotalChildrenUnaccomp, apr07_TotalLeavers
               FROM dataapr07 
              WHERE projectID = <cfqueryparam value="#URL.project#">
              AND aprID = <cfqueryparam value="#URL.apr#">
            </cfquery>
                        <cfreturn q7totals>
    </cffunction>
    <!---/ Get APR07 Totals --->

    <!--- Insert and Update APRForm00 --->
	<cffunction name="enter00" access="public" description="Insert and Update APRForm00" output="false">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="newRecord" hint="newRecord local variable value" type="string" required="false" >
        <cfargument name="dataAPRID" hint="DataaprID generated by the newCheck query" type="string" required="false" >
        <!---/ Arguments --->
        
          <cfif newRecord EQ 1>
            <cfinsert datasource="#DataSource#" tablename="dataapr01" formfields="">
          <cfelse>
            <cfset FORM.DataAPR00ID = "#DataAPRID#">
            <cfupdate datasource="#DataSource#" tablename="dataapr01" formfields="">
          </cfif>

    </cffunction>
    <!---/ Insert and Update APRForm00 --->   

    <!--- Insert and Update APRForm99 --->
	<cffunction name="enter99" access="public" description="Insert and Update APRForm99" output="false">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="newRecord" hint="newRecord local variable value" type="string" required="false" >
        <cfargument name="dataAPRID" hint="DataaprID generated by the newCheck query" type="string" required="false" >
        <!---/ Arguments --->
        
          <cfif newRecord EQ 1>
            <cfinsert datasource="#DataSource#" tablename="datarfi" formfields="#FORM.FieldList#, projectID, aprID, inputUserID, reviewUserID, projectARD">
          <cfelse>
            <cfset FORM.DataAPR00ID = "#DataAPRID#">
            <cfupdate datasource="#DataSource#" tablename="datarfi" formfields="#FORM.FieldList#, dataRFIID, projectID, aprID, inputUserID, reviewUserID, projectARD">
          </cfif>

    </cffunction>
    <!---/ Insert and Update APRForm99 ---> 
 
    <!--- Nuke Child APR Data --->
	<cffunction name="nukeChildren" access="public" description="Nukes a record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="From" hint="Identifies the table to delete from" type="string" required="true" >
        <cfargument name="aprID" hint="Defines the APR Set for which data entries are to be deleted" type="numeric" required="true" >
        <!---/ Arguements --->
        
        <cfif SESSION.authLevel LTE 1>
            <cfquery datasource="#datasource#" name="deleteData">
            DELETE
            FROM #From#
            WHERE aprID = <cfqueryparam value="#aprID#">
            </cfquery>               
                            
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "APR data was deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted an APR (APR ID: #aprID#)"
                  EventDesc = "APR Data Deleted" >
            <!---/ Log Event --->            
        </cfif>
	</cffunction>
    <!---/ Nuke Child APR Data --->
  
</cfcomponent>