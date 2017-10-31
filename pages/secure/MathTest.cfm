<cfparam name=URL.doc default ="GettingStarted">

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>#AppShortName# Math Dump</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<cfquery name="getTableList">
    SELECT APRQuestion, tableName, TableID FROM tables WHERE projectData = '1' AND APRQuestion <> '0'
</cfquery>

<cfquery name="getMeasures">
    SELECT pmName, sourceField
    FROM performmeasure
</cfquery>
    
<cfquery name="getProject">
SELECT 
    <cfloop query="getMeasures">
    #toString(getMeasures.sourceField)# AS #toString(getMeasures.pmName)#,
    </cfloop>
    projects.projectID
FROM projects 


    <cfloop query="getTableList">
    LEFT JOIN  dataapr#NumberFormat(getTableList.APRQuestion,"00")# ON projects.projectID = dataapr#NumberFormat(getTableList.APRQuestion,"00")#.projectID
    </cfloop>
    LEFT JOIN  agency ON projects.agencyID = agency.agencyID
    INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
WHERE projects.ProjectID = <cfqueryparam value="#SESSION.projectID#">
</cfquery>
    
<div class="row">
  <div class="medium-2 columns">
  </div>
  <div class="medium-10 columns">
      <cfdump var="#getProject#">
  </div>
</div>
