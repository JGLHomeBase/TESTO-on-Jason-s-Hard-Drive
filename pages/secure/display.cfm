<cfparam name="URL.project" default="0">
<cfparam name="URL.apr" default="0">
<cfparam name="URL.report" default="0">
<cfparam name="URL.comp" default="0">
<cfparam name="URL.app" default="0">
<cfparam name=URL.score default ="off">
<cfset URL.mode = "explore">
<cfif SESSION.authLevel EQ 7>
    <cfset URL.mode = "score">
</cfif>

<!--- Disable Scrolling within Numeric Table Cells --->    
<cfoutput>
    <script>  
    $(document).ready(function () {
        $('form').on('focus', 'input[type=number]', function (e) {
        $(this).on('mousewheel.disableScroll', function (e) {
            e.preventDefault()
        })
    })
            
    $('form').on('blur', 'input[type=number]', function (e) {
        $(this).off('mousewheel.disableScroll')
        })
    });
    </script>
</cfoutput>
<!---/ Disable Scrolling within Numeric Table Cells --->     
    
<cfif URL.app NEQ 0>
    <cfquery name="getApp">
    SELECT compAppID, projectID, reportID, scoreDisable, compapp.compID, comp.aprDefaultID
    FROM compapp
    INNER JOIN comp ON comp.compID = compapp.compID
    WHERE compAppID = <cfqueryparam value="#URL.app#">
    </cfquery>  
    <cfset URL.report = getApp.reportID>
    <cfset URL.project = getApp.projectID>
    <cfset URL.mode = "score">
    <cfset URL.apr =  getApp.aprDefaultID>
</cfif>
    
<cfif URL.project EQ 0>
<!--- Get Project List --->
  <cfinvoke component="knex.projects" 
        method="getList"
        DataSource = "#DataSource#"
        returnVariable = "getProjectList"
        whatFields ="Legion"
        Join = "LCoCAgencyComponent"
        Where = "Session"
        Order = "Layered">
  <!---/ Get Project List --->
  <cfset URL.project = getProjectList.projectID>
</cfif>
    
<cfif URL.apr EQ 0>
    <cfquery name="getAPR">
      SELECT aprID
      FROM dataapr00
          <cfif SESSION.cocID NEQ 0>
          WHERE cocID = <cfqueryparam value="#SESSION.cocID#">
          </cfif>
      </cfquery>
    <cfset URL.apr = getAPR.aprID>
</cfif>

<!--- Build Report --->
<cfinclude template="#absoluteURL#legos/buildReport.cfm">
<!---/  Build Report --->