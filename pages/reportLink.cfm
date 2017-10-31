<cfparam name="URL.linkKey" default="0" />
    
<cfquery name="getApp">
SELECT reportLink.compAppID, compapp.projectID, compapp.reportID, compapp.scoreDisable, compapp.compID, comp.aprDefaultID
FROM reportLink
INNER JOIN compapp ON reportLink.compAppID = compapp.compAppID
INNER JOIN comp ON comp.compID = compapp.compID
WHERE reportLink.linkKey = <cfqueryparam value="#URL.linkKey#" />
</cfquery>  
<cfset URL.report = getApp.reportID />
<cfset URL.project = getApp.projectID />
<cfset URL.mode = "score" />
<cfset URL.apr =  getApp.aprDefaultID />

<!--- Build Report --->
<cfif getApp.RecordCount NEQ 0>
    <cfinclude template="#absoluteURL#legos/buildReport.cfm">
<cfelse>
    <div class="globalPad text-center" style="padding:150px;">
    <h1>Woops.</h1>
    <h4 class="MakeGray">Report Not Found</h4>
    </div>
</cfif>

<!---/  Build Report --->