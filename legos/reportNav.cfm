<cfoutput>
  <!--- ReportMod Navigation --->
  <ul class="menu vertical">
    <!--- Manage --->
    <cfif SESSION.authLevel LTE 5>
      <li><label>Report Sets</label></li>
         <li <cfif URL.action EQ "new" AND CurrentPage EQ "reportSet.cfm">class="active"</cfif>><a href="reportSet.cfm?action=new">Add Report Set</a></li>
      <li <cfif URL.action EQ "list" AND CurrentPage EQ "reportSet.cfm">class="active"</cfif>><a href="reportSet.cfm?action=list">Manage Report Set</a></li>
      <li class="divider"></li>
        <li><label>Report Templates</label></li>
      <li <cfif URL.action EQ "new" AND CurrentPage EQ "reports.cfm">class="active"</cfif>><a href="reports.cfm?action=new">Add Report Template</a></li>
      <li <cfif URL.action EQ "list" AND CurrentPage EQ "reports.cfm">class="active"</cfif>><a href="reports.cfm?action=list">Manage Report Templates</a></li>
      <li class="divider"></li>
      <li><label>Report Modules</label></li>
      <li <cfif URL.action EQ "new" AND CurrentPage EQ "modules.cfm">class="active"</cfif>><a href="modules.cfm?action=new">Add Report Module</a></li>
      <li <cfif URL.action EQ "list" AND CurrentPage EQ "modules.cfm">class="active"</cfif>><a href="modules.cfm?action=list">Manage Report Modules</a></li>
    <li class="divder"></li>
    <li <cfif URL.action EQ "new" AND CurrentPage EQ "reportChart.cfm">class="active"</cfif>><a href="reportChart.cfm?action=new">Add Chart</a></li>
    <li <cfif URL.action EQ "list" AND CurrentPage EQ "reportChart.cfm">class="active"</cfif>><a href="reportChart.cfm?action=list">Manage Charts</a></li>
    </cfif>
    <!---/ Manage --->
  </ul>
  <!--- ReportMod Navigation --->
</cfoutput>