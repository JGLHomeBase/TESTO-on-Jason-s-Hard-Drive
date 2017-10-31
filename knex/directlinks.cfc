<!--- 
Filename: directlinks.cfc
Version: 1.0
--->


<cfcomponent displayname="DirectLinks" hint="Insert update and delete CoC records" output="false">
    
    <!--- Update Record --->
	<cffunction name="update" access="public" description="Updates an existing record" output="false" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="projectID" hint="Project ID generated by getProjects query" type="string" required="true" >
        <!---/ Arguements --->
        
                <cfset stringLength = 10>
                <cfset stringList = "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z">
                <cfset rndString = "">
                <cfloop from="1" to="#stringLength#" index="i">
                <cfset rndNum = RandRange(1, listlen(stringList))>
                <cfset rndString = rndString & listgetat(stringlist,#rndNum#)>
                </cfloop>
                <cfset FORM.goldenTicket = rndString>
                <cfset FORM.projectID = #projectID#>
                <cfupdate datasource="#datasource#" TABLENAME="projects" FORMFIELDS="projectID, goldenTicket">
                    
    </cffunction>
    <!---/ Update Record --->

            
</cfcomponent>