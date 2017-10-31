<cfoutput>
  <div class="row">
    <div class="large-12 columns text-center">
      <a href="##" data-open="Add#position#" class="small button">Add Content <i class="fi-plus"></i></a>
      <cfif getScoreMod.recordCount NEQ 0>
           <a href="##" data-open="AddScore#position#" class="small button secondary">Add Scoring Factor <i class="fi-plus"></i></a>
        </cfif>
    </div>
  </div>
  <div class="reveal small BGLightGray" data-reveal id="Add#position#">
    <h3>Add Content <i class="fi-plus"></i></h3>
    <form action="#CurrentPage#?report=#URL.report#&action=build" method=post>
      <select name="reportPayload" onchange="this.form.submit()">
        <option value="">&mdash; Pick a Module &mdash;</option>
        <cfloop query="getReportMod">
          <option value="#getReportMod.ReportModID#">#getReportMod.ModName# (#getReportMod.reportModID#)</option>
        </cfloop>
      </select>
      <input type="hidden" name="action" value="addMod">
      <input type="hidden" name="position" value="#position#">
    </form>
  </div>
  <div class="reveal small BGLightGray" data-reveal id="AddScore#position#">
    <h3>Add Scoring Factor <i class="fi-plus"></i></h3>
    <form action="#CurrentPage#?report=#URL.report#&action=build" method=post>
      <select name="reportPayload" onchange="this.form.submit()">
        <option value="">&mdash; Pick a Factor &mdash;</option>
        <cfloop query="getScoreMod">
          <option value="#getScoreMod.ReportModID#">#getScoreMod.factorLongName# (#getScoreMod.factorShortName#)</option>
        </cfloop>
      </select>
      <input type="hidden" name="action" value="addMod">
      <input type="hidden" name="position" value="#position#">
    </form>
  </div>  
</cfoutput>