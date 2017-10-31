<cfoutput>
    <!--- Docs Navigation --->
    <ul class="menu vertical">
      <li <cfif URL.doc EQ "GettingStarted">class="active"</cfif>><a href="#CurrentPage#?doc=GettingStarted">Getting Started</a></li>
       <!--- Administration --->
      <li class="divider"></li>
      <li><label>Administration</label></li>
      <li <cfif URL.doc EQ "Users">class="active"</cfif>><a href="#CurrentPage#?doc=Users">Users</a></li>
      <!---/ Administration --->

      <!--- Development --->
      <li class="divider"></li>
      <li><label>Development</label></li>
      <li <cfif URL.doc EQ "StyleGuide">class="active"</cfif>><a href="#CurrentPage#?doc=StyleGuide">Style Guide</a></li>
      <li <cfif URL.doc EQ "Components">class="active"</cfif>><a href="#CurrentPage#?doc=Components">Components</a></li>
      <li <cfif URL.doc EQ "SessionVars">class="active"</cfif>><a href="#CurrentPage#?doc=SessionVars">Session Variables</a></li>
      <li <cfif URL.doc EQ "DBStructure">class="active"</cfif>><a href="#CurrentPage#?doc=DBStructure">Database Structure</a></li>
      <li <cfif URL.doc EQ "SQL">class="active"</cfif>><a href="#CurrentPage#?doc=SQL">MySQL CREATE</a></li>
      <!---/ Development --->
        
      <!--- Third Party Docs --->
      <li class="divider"></li>
      <li><label>Third-Party Docs</label></li>
      <li><a href="http://foundation.zurb.com/docs/" target="_blank">Foundation</a></li>
      <li><a href="http://zurb.com/playground/foundation-icon-fonts-3" target="_blank">Foundation Icons</a></li>
      <li><a href="https://wikidocs.adobe.com/wiki/pages/viewpage.action?pageId=140968014" target="_blank">CFML Reference</a></li>
      <!---/ Third Party Docs --->
    </ul>
    <!--- Docs Navigation --->
</cfoutput>