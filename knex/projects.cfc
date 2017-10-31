<!--- 
Filename: projects.cfc
Version: 1.0
--->


<cfcomponent displayname="Projects" hint="Insert update and delete project records" output="false">
    <!--- New Record --->
	<cffunction name="new" access="public" description="Creates a new record" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->
        <cfif SESSION.authLevel LTE 3>
            <cfset FORM.cocID = SESSION.cocID>
            <cfinsert datasource="#datasource#" tablename="projects" formfields="active, agencyID, cocID, coordinatedAssessment, housingFirst, HousingProvided, onlyCH, popServed, ProjectCity, projectComponentID, ProjectGeoCode, ProjectGeoHeading, ProjectHood, projectLongName, projectName, projectNew, projectOverview, ProjectState, ProjectStreet1, ProjectStreet2, ProjectZip, ServicesProvided, targetPop, VenuesForService, reportID">
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new project (#FORM.projectLongName#)"
                  EventDesc = "New Project" >
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
              DELETE FROM projects WHERE projectID = <cfqueryparam value="#redshirt#">
            </cfquery>
            <!--- Log Event --->
              <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a project (Module ID: #redshirt#)"
                  EventDesc = "Project Deleted" >
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
            <cfupdate datasource="#datasource#" tablename="projects" formfields="projectID, active, agencyID, cocID, coordinatedAssessment, housingFirst, HousingProvided, onlyCH, popServed, ProjectCity, projectComponentID, ProjectGeoCode, ProjectGeoHeading, ProjectHood, projectLongName, projectName, projectNew, projectOverview, ProjectState, ProjectStreet1, ProjectStreet2, ProjectZip, ServicesProvided, targetPop, VenuesForService, reportID">
            <!--- geocode --->
              <cfinvoke component="knex.tomtom" 
                  method="geocode"
                  DataSource = "#DataSource#"
                  project = "#FORM.projectID#">
            <!---/ geocode --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new project (#FORM.projectLongName#)"
                  EventDesc = "New Project" >
            <!---/ Log Event --->
	   </cfif>
    </cffunction>
    <!---/ Update Record --->

<!--- Nuke Child Projects --->
    <cffunction name="nukeChildren" access="public" description="Deletes projects associated with a deleted factor" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="agencyID" hint="Defines the parent agency of the projects to be deleted" type="numeric" required="true">
        <!---/ Arguments --->
            
        <cfif SESSION.authLevel LTE 3>  
            <cfquery datasource="#datasource#" name="deleteScale">
              DELETE FROM projects
              WHERE
                agencyID = <cfqueryparam value="#agencyID#">   

            </cfquery>
            <!--- Log Event --->
              <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Delete" 
                  EventDetail = "Projects were deleted, because a user (#SESSION.userFirst# #SESSION.userLast#) deleted a project (Agency ID: #agencyID#)"
                  EventDesc = "Projects Deleted Because Agency Deleted" >
              <!---/ Log Event ---> 
        </cfif>
    </cffunction>
<!---/ Nuke Child Projects --->             
    
    <!--- Get Projects --->
        <cffunction name="get" access="public" description="Grabs data fields for projects" output="false" returnType="query">
            <!--- Arguments --->
            <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
            <cfargument name="sortingHat" hint="Defines sortingHat, which should be getagencies.agencyID" type="string" required="true" default="No">
            <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" default="*" >
            <cfargument name="Where" hint="Sets which projects the query looks at" type="string" required="true" default="0=0" >
            <cfargument name="Order" hint="Orders the selected information" type="string" required="false" default="projects.projectID ASC">
            <cfargument name="Join" hint="Selects what tables to join" type="string" required="false" default="No">
            <!---/ Arguments --->

            <cfquery datasource="#datasource#" name="getProjects">
                SELECT #whatFields#
                FROM projects
                    <cfif Join is "LComponent">
                    LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
                    <cfelseif Join is "compApp">
                    JOIN compapp ON projects.projectID = compapp.projectID
                    </cfif>
                WHERE
                    <cfif Where is "Active">
                    active = '1'
                    <cfelseif Where is "ThisProject">
                    projectID = <cfqueryparam value="#URL.project#">
                    <cfelseif Where is "ThisCoCAgency">
                    agencyID = <cfqueryparam value="#sortingHat#">
                    <cfelseif Where is "ProjectTicket">
                    projectID = <cfqueryparam value="#URL.project#"> 
	                   AND goldenTicket = <cfqueryparam value="#URL.goldenTicket#">
                    <cfelseif Where is "ThisApp">
                    compapp.compappID = <cfqueryparam value="#URL.app#">
                    <cfelseif Where is "ActiveCoCAgency">
                    active = '1'
					AND agencyID = <cfqueryparam value="#SESSION.agencyID#">    
                    <cfelse>
                    0=0
                    </cfif>
                    <cfif SESSION.cocID NEQ 0>
                    AND cocID = <cfqueryparam value="#SESSION.cocID#">
                    </cfif>
                ORDER BY #Order#                                    
            </cfquery>                  
                <cfreturn getProjects>
        </cffunction>
   	<!---/ Get Projects --->

    <!--- Get Project A --->
	<cffunction name="getProjectA" access="public" description="Grabs information for projects for projects.cfm" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >    
        <!---/ Arguments --->

          <cfquery datasource="#datasource#" name="getprojects">
            SELECT * FROM projects  
            LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
            LEFT JOIN agency ON projects.agencyID = agency.agencyID
            WHERE 0=0
            <cfif SESSION.agencyID NEQ 0>
              AND projects.agencyID = <cfqueryparam value="#SESSION.agencyID#">
            </cfif>
            <cfif SESSION.cocID NEQ 0>
              AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
            </cfif>
            ORDER BY projects.active DESC, projectComponentName ASC, agencyName ASC, projectLongName ASC
          </cfquery>
                    <cfreturn getProjects> 
	</cffunction>
    <!---/ Get Project A --->                  
                        
    <!--- Get All Projects --->
	<cffunction name="getAll" access="public" description="Grabs information for all projects" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->

        <cfquery datasource="#datasource#" name="getProjects">
          SELECT projects.projectName, projects.projectID, coc.cocCity, agency.agencyName FROM projects
          LEFT JOIN coc ON projects.cocID = coc.cocID
          LEFT JOIN agency ON projects.agencyID = agency.agencyID
          LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
          WHERE
            <cfif SESSION.usercocID NEQ 0>
              cocID = <cfqueryparam value="#SESSION.usercocID#"> AND
            </cfif>
            <cfif SESSION.useragencyID NEQ 0>
              agencyID = <cfqueryparam value="#SESSION.useragencyID#"> AND
            </cfif>
            <cfif SESSION.userprojectID NEQ 0>
              projectID = <cfqueryparam value="#SESSION.userprojectID#"> AND
            </cfif>            
            0=0                         
          ORDER BY coc.cocCity, agency.agencyName, projectcomponent.projectComponentName, projects.projectName
        </cfquery>
                <cfreturn getProjects> 

	</cffunction>
    <!---/ Get All Projects --->

    <!--- Get Active Project --->
	<cffunction name="getActive" access="public" description="Grabs information for active projects" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <!---/ Arguments --->

        <cfquery datasource="#datasource#" name="getActive">
          SELECT projectID FROM projects
          WHERE active = '1'
          <cfif SESSION.cocID NEQ 0>
            AND cocID = <cfqueryparam value="#SESSION.cocID#">
          </cfif>
          ORDER BY cocID, projectLongName
        </cfquery>
                    <cfreturn getActive> 
	</cffunction>
    <!---/ Get Active Project --->

    <!--- Get Projects for Score --->
	<cffunction name="scoreGetProjects" access="public" description="Grabs information for projects for score.cfm" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="cocID" hint="CoC ID" type="string" required="true" >        
        <!---/ Arguments --->

        <cfquery datasource="#Datasource#" name="scoreGetProjects">
            SELECT ProjectName, ProjectLongName, projectID, projectComponentName, agencyLongName, reportID FROM projects
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
            INNER JOIN agency ON projects.agencyID = agency.agencyID
            WHERE projects.cocID = <cfqueryparam value="#cocID#">
                
            <cfif SESSION.cocID NEQ 0>
                AND cocID = <cfqueryparam value="#SESSION.cocID#">
            </cfif>    
            AND projects.active = '1'
            <cfif URL.sort EQ "type">
                ORDER BY projectComponentName, agencyLongName, ProjectLongName
            <cfelseif URL.sort EQ "agency">
                ORDER BY agencyLongName, ProjectLongName
            <cfelseif URL.sort EQ "name">
                ORDER BY ProjectLongName
            </cfif>
        </cfquery>
                    <cfreturn scoreGetProjects> 
	</cffunction>
    <!---/ Get Get Projects for Score --->

    <!--- Get Projects for Score Home --->
	<cffunction name="scoreHGetProjects" access="public" description="Grabs information for projects for scoreHome.cfm" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="cocID" hint="CoC ID" type="string" required="true" >        
        <!---/ Arguments --->

        <cfquery datasource="#Datasource#" name="GetProjects">
          SELECT ProjectName, ProjectLongName, projectID, projectComponentName, agencyLongName, reportID FROM projects
          INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
           INNER JOIN agency ON projects.agencyID = agency.agencyID
          WHERE projects.cocID = <cfqueryparam value="#cocID#">
          AND projects.active = '1'
        </cfquery>
                    <cfreturn GetProjects> 
	</cffunction>
    <!---/ Get Get Projects for Score Home --->



    <!--- Get a Specific Project --->
	<cffunction name="getOne" access="public" description="Grabs information for current project" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >    
        <!---/ Arguments --->

        <cfquery datasource="#datasource#" name="getProjects">
          SELECT projectID, projectLongName
          FROM projects
          LEFT JOIN coc ON projects.cocID = coc.cocID
          WHERE 0=0
          <cfif SESSION.cocID NEQ 0>
            AND cocID = <cfqueryparam value="#SESSION.cocID#">
          </cfif>
          ORDER BY CoCCity, projectLongName
        </cfquery>
                        <cfreturn getProjects> 
	</cffunction>
    <!---/ Get a Specific Project --->
            
    <!--- Get Project List --->
	<cffunction name="getList" access="public" description="Grabs a list of projects" output="false" returnType="query">
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="Join" hint="Selects what tables to join, and how" type="string" required="true" >
        <cfargument name="whatFields" hint="Sets what data fields are selected" type="string" required="false" >
        <cfargument name="Where" hint="Sets which projects the query looks at" type="string" required="true" >
        <cfargument name="Order" hint="Orders the selected information" type="string" required="false" >
        <!---/ Arguments --->

        <cfquery datasource="#datasource#" name="getProjectList">
            SELECT
                <cfif whatFields is "Legion">
                projects.projectName, projects.projectLongName, projects.projectID, coc.cocCity, agency.agencyName, projects.projectComponentID, projects.agencyID
                <cfelseif whatFields is "Ranked">
                ProjectLongName, projects.projectID, projectComponentName, agencyLongName, reportID, projectScore, projectARD    
                <cfelseif whatFields is "docReview">
                projectLongName, CoCCity, agencyLongName, projectID    
                <cfelse>
                *
                </cfif>
            FROM projects
            <cfif Join is "LCoCAgencyComponent">
                LEFT JOIN coc ON projects.cocID = coc.cocID
                LEFT JOIN agency ON projects.agencyID = agency.agencyID
                LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
            <cfelseif Join is "LCoCAgency">
                LEFT JOIN coc ON projects.cocID = coc.cocID
                LEFT JOIN agency ON projects.agencyID = agency.agencyID
                LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
            <cfelseif Join is "ICoCAgency">   
                INNER JOIN agency ON projects.agencyID = agency.agencyID
                INNER JOIN coc ON projects.cocID = coc.cocID
            <cfelseif Join is "Ranked">
                INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
                INNER JOIN agency ON projects.agencyID = agency.agencyID
                LEFT JOIN datarfi ON projects.projectID = datarfi.projectID
            </cfif>
            WHERE
                <cfif Where is "ThisCoc">
                projects.cocID = <cfqueryparam value="#SESSION.cocID#">
                AND projects.active = '1'
                <cfelseif Where is "SessionCoC">
                projects.cocID = <cfqueryparam value="#SESSION.cocID#"> AND
                    <cfif SESSION.agencyID NEQ 0>
                      projects.agencyID = <cfqueryparam value="#SESSION.agencyID#"> AND
                    </cfif>
                    <cfif SESSION.userprojectID NEQ 0>
                      projects.projectID = <cfqueryparam value="#SESSION.userprojectID#"> AND
                    </cfif> 
                    0=0
                <cfelseif Where is "Active">
                    <cfif SESSION.cocID NEQ 0>
                    projects.cocID = <cfqueryparam value="#SESSION.usercocID#"> AND
                    </cfif>
                    <cfif SESSION.agencyID NEQ 0>
                    projects.agencyID = <cfqueryparam value="#SESSION.useragencyID#"> AND
                    </cfif>
                    projects.active = '1'                
                <cfelseif Where is "Session">
                    <cfif SESSION.cocID NEQ 0>
                      projects.cocID = <cfqueryparam value="#SESSION.cocID#"> AND
                    </cfif>
                    <cfif SESSION.agencyID NEQ 0>
                      projects.agencyID = <cfqueryparam value="#SESSION.agencyID#"> AND
                    </cfif>
                    <cfif SESSION.userprojectID NEQ 0>
                      projects.projectID = <cfqueryparam value="#SESSION.userprojectID#"> AND
                    </cfif> 
                    0=0    
                <cfelseif Where is "thisCoC" AND SESSION.cocID NEQ 0>
                    projects.cocID = <cfqueryparam value="#SESSION.cocID#">
                <cfelse>
                    0=0
                </cfif>
                <cfif SESSION.cocID NEQ 0>
                    AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
                </cfif>
                
            ORDER BY
            <cfif Order is "CityAgencyLongName">
            cocCity, agencyName, projectLongName
            <cfelseif Order is "Score">
            projectScore DESC
            <cfelseif Order is "Layered">
            coc.cocCity, agency.agencyName, projectcomponent.projectComponentName, projects.projectName
            <cfelseif Order is "Depends" AND URL.sort EQ "project">
            coc.cocCity, projects.projectLongName
                <cfset URL.sort = "standard">
            <cfelseif Order is "Depends" AND URL.sort NEQ "project">
            ORDER BY coc.cocCity, agency.agencyName, projectcomponent.projectComponentName, projects.projectName
            </cfif>
        </cfquery>
                            <cfreturn getProjectList> 
	</cffunction>
    <!---/ Get Project List --->
</cfcomponent>
        