<!--- 
Filename: score.cfc
Version: 1.0
--->


<cfcomponent displayname="Score" hint="Insert and update Score records" output="false">
    <!--- Insert Record --->
	<cffunction name="insert" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="formFields" hint="List of all Form Fields" type="string" required="true" >
        <!---/ Arguments --->

            <cfinsert datasource="#datasource#" tablename="scores" formfields="#formFields#">            
            
	</cffunction>
    <!---/ Insert Record --->

    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="formFields" hint="List of all Form Fields" type="string" required="true" >
        <!---/ Arguments --->

            <cfupdate datasource="#datasource#" tablename="scores" formfields="scoreID, #formFields#">
            
	</cffunction>
    <!---/ Update Record --->                
                
        
    <!--- Get Scores --->
        <cffunction name="get" access="public" description="Grabs project scores for the current project" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="setTotal">
                SELECT score1, score2, score3, score4, score5, score6, score7, score8, score9, score10, score11, score12, score13, score14, score15, score16, score17, score18, score19, score20, score21, score22, score23, score24, score25 
                FROM scores
                LEFT JOIN users ON scores.userID = users.userID
                WHERE scores.projectID = <cfqueryparam value="#URL.project#"> 
                    AND scores.compID = <cfqueryparam value="#SESSION.compID#">
                    AND users.authLevel = '7'
                    AND users.compID = <cfqueryparam value="#SESSION.compID#">
            </cfquery>
                
                <cfreturn setTotal>
        </cffunction>
   	<!---/ Get Scores --->
</cfcomponent>