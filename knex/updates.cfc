<!--- 
Filename: updates.cfc
Version: 1.0
--->

<cfcomponent displayname="Updates" hint="All the update queries" output="false">
    <!--- Insert Record --->
        <cffunction name="new" access="public" description="Inserts new update record" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <!---/ Arguments --->
                
            <cfinsert datasource="#DataSource#" tablename="updates" formfields="updateName, updateDate, updateNotes, updateType, updateCat, public">
        
        </cffunction>
   	<!---/ Insert Record --->  

    <!--- Update Record --->
        <cffunction name="update" access="public" description="Inserts new update record" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <!---/ Arguments --->
                
            <cfupdate datasource="#DataSource#" tablename="updates" formfields="updateID, updateName, updateDate, updateNotes, updateType, updateCat, public">
        
        </cffunction>
   	<!---/ Update Record --->                

    <!--- Delete Update --->
        <cffunction name="nuke" access="public" description="Deletes an update record" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
            <!---/ Arguments --->

          <cfquery datasource="#DataSource#" name="deleteUpdate">
            DELETE FROM updates WHERE updateID = <cfqueryparam value="#redshirt#">
          </cfquery>
                <cfreturn deleteUpdate>
        </cffunction>
   	<!---/ Delete Update --->  

     <!--- Get Update --->
        <cffunction name="get" access="public" description="Gets info about an update record" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" >
            <cfargument name="redshirt" hint="Defines redshirt ID" type="string" required="true" >
            <!---/ Arguments --->

        <cfquery datasource="#datasource#" name="getUpdate">
            SELECT
                <cfif whatFields is "IDName">
                updateID, updateName
                <cfelse>
                *
                </cfif>
            FROM updates
            WHERE updateID = <cfqueryparam value="#redshirt#">
        </cfquery> 
                <cfreturn getUpdate>
        </cffunction>
   	<!---/ Get Update --->               

     <!--- Get Updates --->
        <cffunction name="getAll" access="public" description="Gets info about an update record" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <!---/ Arguments --->

            <cfquery datasource="#DataSource#" name="getUpdates">
              SELECT * FROM updates
              WHERE 0=0
              <cfif SESSION.authLevel GT 5>
                AND public = '1'
              </cfif>
              ORDER BY updateDate DESC
            </cfquery>
                <cfreturn getUpdates>
        </cffunction>
   	<!---/ Get Updates --->                                      
                           
</cfcomponent>