<cfoutput>
    <ul class="menu vertical">
        <!--- Manage comps --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>Competitions</label></li>
          <cfif  SESSION.usercompID EQ 0>
             <li <cfif CurrentPage EQ "comp.cfm" AND URL.action EQ "new">class="active"</cfif>><a href="comp.cfm?action=new">Add Competition</a></li>
          </cfif>
          <li <cfif CurrentPage EQ "comp.cfm" AND URL.action EQ "list">class="active"</cfif>><a href="comp.cfm?action=list">Manage Competition</a></li>
        </cfif>
        <!---/ Manage comps --->
        <li class="divider"></li>
        <!--- Manage --->
        <cfif SESSION.authLevel LTE 5 AND URL.comp NEQ "" AND URL.comp NEQ 0>
          <li><label>Competition Admin</label></li>
          <li <cfif CurrentPage EQ "comp.cfm" AND URL.comp NEQ 0>class="active"</cfif>><a href="comp.cfm?comp=#URL.comp#">General Settings</a></li>
          <li <cfif CurrentPage EQ "scoreCat.cfm">class="active"</cfif>><a href="scoreCat.cfm?action=list&comp=#URL.comp#">Scoring</a></li>
          <li <cfif CurrentPage EQ "compDoc.cfm">class="active"</cfif>><a href="compDoc.cfm?comp=#URL.comp#">Documents</a></li>
          <li <cfif CurrentPage EQ "compApp.cfm">class="active"</cfif>><a href="compApp.cfm?comp=#URL.comp#">Applicants</a></li>
          <li <cfif CurrentPage EQ "compPanel.cfm">class="active"</cfif>><a href="compPanel.cfm?comp=#URL.comp#">Panelists</a></li>
          <li <cfif CurrentPage EQ "compEmail.cfm">class="active"</cfif>><a href="compEmail.cfm?comp=#URL.comp#">Messages</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage --->
    </ul>
</cfoutput>