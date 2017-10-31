<!--- Set Variables --->
<cfset TargetTable = "DataRFI">
<cfset UniqueID = "DataRFIID">

<!--- Get Field List --->
<cfinvoke component="knex.rfi" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getRFI"
        whatFields = "*"
        Where = "ThisAPR"
        Order = "qNumber ASC"
		authLevel = "#SESSION.authLevel#">
<!---/ Get Field List --->    
<!---/ Set Variables --->




<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataRFIID"
        Form = "datarfi">
<!---/ Get ID --->

<cfif newCheck.RecordCount EQ 0>
  <cfset newRecord = 1>
<cfelse>
  <cfset newRecord = 0>
</cfif>
<!---/ New Check --->

<!--- Process Forms --->
<cfif FORM.action EQ "process" AND FORM.goldenTicket EQ SESSION.goldenTicket>
    <cfif newRecord EQ 1>
      <cfinsert datasource="#DataSource#" tablename="datarfi" formfields="#FORM.FieldList#, projectID, aprID, inputUserID, reviewUserID, RFI_ProjectFTE, RFI_CoCAttendance, RFI_DedicatedBeds, RFI_Deobligated, RFI_DeobligatedExpl, RFI_DrawDown, RFI_DrawDownExpl, RFI_LeverageProjectApp, RFI_MatchDocumented, RFI_MatchProjectApp, RFI_MonitoringFindings, RFI_MonitoringFindingsExpl, RFI_PercDedicatedBeds, RFI_PercPrioritizedBeds, RFI_PrioritizedBeds, RFI_LeverageDocumented">
    <cfelse>
      <cfset FORM.DataRFIID = newCheck.DataRFIID>
      <cfupdate datasource="#DataSource#" tablename="datarfi" formfields="#FORM.FieldList#, DataRFIID, projectID, aprID, inputUserID, reviewUserID, RFI_ProjectFTE, RFI_CoCAttendance, RFI_DedicatedBeds, RFI_Deobligated, RFI_DeobligatedExpl, RFI_DrawDown, RFI_DrawDownExpl, RFI_LeverageProjectApp, RFI_MatchDocumented, RFI_MatchProjectApp, RFI_MonitoringFindings, RFI_MonitoringFindingsExpl, RFI_PercDedicatedBeds, RFI_PercPrioritizedBeds, RFI_PrioritizedBeds, RFI_LeverageDocumented">
    </cfif>
        
  <cfset SESSION.message = "success">
  <cfset SESSION.messageText = "#ProjectName# updated successfully.">
  <cfset variables.redirectQ = SESSION.authLevel eq 6 ? 99 : 0>
  <cflocation url="#CurrentPage#?project=#URL.project#&APR=#URL.apr#&q=#variables.redirectQ#" addtoken="false">
<cfelseif FORM.action EQ "process">
   <cfset SESSION.message = "alert">
   <cfset SESSION.messageText = "Authentication error. Please try again.">
</cfif>
<cfinclude template="#AbsoluteURL#legos/alert.cfm">
<!---/ Process Forms --->

<!--- Queries --->
<!--- Get Projects --->
<cfinvoke component="knex.projects" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getProjects"
        whatFields = "*"
        Where = "ThisProject">
<!---/ Get Projects --->

<!--- Get DataAPR --->
<cfinvoke component="knex.aprData" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getDataAPR"
        FormID = "*"
        Form = "datarfi">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="0">
<cfset mathRows="0">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
      
    <cfset fieldList = "">
    <cfloop query="getRFI">
      <h3>#qNumber#. #Question#</h3>
      <p><i>#instruction#</i></p>
      <cfif Left(fieldname,3) EQ "Sho">
        <input type="text"
               name="#fieldname#"
               value="#Evaluate("getDataAPR.#fieldname#")#"
               placeholder="#nickname#"
               <cfif required EQ 1>required</cfif>
               maxlength="256">
        <small class="form-error">Required</small>
      <cfelseif Left(fieldname,3) EQ "Lon">
        <textarea name="#fieldname#"
                  placeholder="#nickname#"
                  <cfif required EQ 1>required</cfif>>#Evaluate("getDataAPR.#fieldname#")#</textarea>
         <small class="form-error">Required</small>
      <cfelseif Left(fieldname,3) EQ "Num">
        <cfif format EQ "Currency">
           <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="number"
                       name="#fieldname#"
                       value="#Evaluate("getDataAPR.#fieldname#")#"
                       placeholder="#nickname#"
                       step="0.01"
                       <cfif required EQ 1>required</cfif>
                       maxlength="10">
                <small class="form-error">Must be a number</small>
            </div>
          </div>
        <cfelseif format EQ "Percentage">
          <div class="row collapse">
              <div class="small-9 large-10 columns">
                <input type="number"
                       name="#fieldname#"
                       value="#Evaluate("getDataAPR.#fieldname#")#"
                       placeholder="#nickname#"
                       step="0.01"
                       <cfif required EQ 1>required</cfif>
                       maxlength="10">
                <small class="form-error">Must be a number</small>
            </div>
            <div class="small-3 large-2 columns">
                <span class="postfix">&##37;</span>
              </div>
          </div>
        <cfelse>
          <input type="number"
               name="#fieldname#"
               value="#Evaluate("getDataAPR.#fieldname#")#"
               placeholder="#nickname#"
                step="0.01"
                maxlength="10" 
               <cfif required EQ 1>required</cfif>
               maxlength="10">
         <small class="form-error">Must be a number</small>
        </cfif>
        
      </cfif>
      <hr>
      <cfset FieldList = listAppend("#FieldList#", "#fieldname#")>

    </cfloop>
      <input type="hidden" name="FieldList" value="#FieldList#">
  </div>
</div>
</cfoutput>