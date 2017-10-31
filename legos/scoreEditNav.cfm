<cfoutput>
  <cfinclude template="#absoluteURL#legos/compMenu.cfm">
  <hr>
  <p><i>Scoring</i></p>
  <!--- comp Navigation --->
  <ul class="menu vertical">
    <!--- Manage comps --->
    <cfif SESSION.authLevel LTE 3>
      <li><label>Categories</label></li>
         <li><a href="scoreCat.cfm?action=new&comp=#URL.comp#">Add Category</a></li>
          <li><a href="scoreCat.cfm?action=list&comp=#URL.comp#">Manage Category</a></li>
      <li class="divider"></li>
      
        <!--- Make sure there is at least one Score Category or else turn off option to add Score Factors --->
        <cfset atleastoneCat = 0>
        
        <cfinvoke component="knex.scoreCat" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getScoreCat"
                whatFields = "All"
                Where = "ThisComp"
                Order = "LongName">
        
        <cfloop query="getScoreCat">
            <cfif #getScoreCat.catLongName# NEQ "">
                <cfset atleastoneCat = 1>
            </cfif>
        </cfloop>
        
        <cfif atleastoneCat EQ 1>
        <!---/ Make sure there is at least one Score Category or else turn off option to add Score Factors --->
            
        <li><label>Factors</label></li>
         <li><a href="scoreFactors.cfm?action=new&comp=#URL.comp#">Add Factor</a></li>
      <li><a href="scoreFactors.cfm?action=list&comp=#URL.comp#">Manage Factor</a></li>
      <li class="divider"></li>
    
        </cfif>
      
      </cfif>
    <!---/ Manage comps --->
  </ul>
  <!--- comp Navigation --->
</cfoutput>