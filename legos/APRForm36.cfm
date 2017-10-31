<!--- Set Variables --->
<cfset TargetTable = "DataAPR36">
<cfset UniqueID = "DataAPR36ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR36ID"
        Form = "dataapr36">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr36" formfields="aprID, inputUserID, projectID, reviewUserID, apr36Outreach_Housing_Universe, apr36Outreach_Housing_TargetNum, apr36Outreach_Service_TargetNum, apr36Outreach_Service_Universe, apr36Outreach_Housing_TargetPerc, apr36_Housing_TargetNum, apr36_TotalIncome_TargetNum, apr36_EarnedIncome_TargetNum, apr36_Housing_TargetPerc, apr36_TotalIncome_TargetPerc, apr36_EarnedIncome_TargetPerc, apr36_Housing_Served, apr36_TotalIncome_Served, apr36_EarnedIncome_Served, apr36_Housing_NumAccomplished, apr36_TotalIncome_NumAccomplished, apr36_EarnedIncome_NumAccomplished, apr36_Housing_PercAccomplished, apr36_TotalIncome_PercAccomplished, apr36_EarnedIncome_PercAccomplished, apr36_Housing_PercDiff, apr36_TotalIncome_PercDiff, apr36_EarnedIncome_PercDiff, apr36SH_Housing_TargetNum, apr36SH_TotalIncome_TargetNum, apr36SH_TotalIncome_TargetPerc, apr36SH_Housing_TargetPerc, apr36SH_Housing_Served, apr36SH_TotalIncome_Served, apr36SH_TotalIncome_NumAccomplished, apr36SH_Housing_NumAccomplished, apr36SH_Housing_PercAccomplished, apr36SH_TotalIncome_PercAccomplished, apr36SH_TotalIncome_PercDiff, apr36SH_Housing_PercDiff, apr36Outreach_Service_TargetPerc">
  <cfelse>
    <cfset FORM.DataAPR36ID = newCheck.DataAPR36ID>
        
<!--- Set Defaults --->
<cfif form.apr36Outreach_Housing_Universe	 EQ "">	
    <cfset form.apr36Outreach_Housing_Universe	 =0></cfif>
<cfif form.apr36Outreach_Housing_TargetNum	 EQ "">	
    <cfset form.apr36Outreach_Housing_TargetNum	 =0></cfif>
<cfif form.apr36Outreach_Service_TargetNum	 EQ "">	
    <cfset form.apr36Outreach_Service_TargetNum	 =0></cfif>
<cfif form.apr36Outreach_Service_Universe	 EQ "">	
    <cfset form.apr36Outreach_Service_Universe	 =0></cfif>
<cfif form.apr36Outreach_Housing_TargetPerc	 EQ "">	
    <cfset form.apr36Outreach_Housing_TargetPerc	 =0></cfif>
<cfif form.apr36_Housing_TargetNum	 EQ "">	
    <cfset form.apr36_Housing_TargetNum	 =0></cfif>
<cfif form.apr36_TotalIncome_TargetNum	 EQ "">	
    <cfset form.apr36_TotalIncome_TargetNum	 =0></cfif>
<cfif form.apr36_EarnedIncome_TargetNum	 EQ "">	
    <cfset form.apr36_EarnedIncome_TargetNum	 =0></cfif>
<cfif form.apr36_Housing_TargetPerc	 EQ "">	
    <cfset form.apr36_Housing_TargetPerc	 =0></cfif>
<cfif form.apr36_TotalIncome_TargetPerc	 EQ "">	
    <cfset form.apr36_TotalIncome_TargetPerc	 =0></cfif>
<cfif form.apr36_EarnedIncome_TargetPerc	 EQ "">	
    <cfset form.apr36_EarnedIncome_TargetPerc	 =0></cfif>
<cfif form.apr36_Housing_Served	 EQ "">	
    <cfset form.apr36_Housing_Served	 =0></cfif>
<cfif form.apr36_TotalIncome_Served	 EQ "">	
    <cfset form.apr36_TotalIncome_Served	 =0></cfif>
<cfif form.apr36_EarnedIncome_Served	 EQ "">	
    <cfset form.apr36_EarnedIncome_Served	 =0></cfif>
<cfif form.apr36_Housing_NumAccomplished	 EQ "">	
    <cfset form.apr36_Housing_NumAccomplished	 =0></cfif>
<cfif form.apr36_TotalIncome_NumAccomplished	 EQ "">	
    <cfset form.apr36_TotalIncome_NumAccomplished	 =0></cfif>
<cfif form.apr36_EarnedIncome_NumAccomplished	 EQ "">	
    <cfset form.apr36_EarnedIncome_NumAccomplished	 =0></cfif>
<cfif form.apr36_Housing_PercAccomplished	 EQ "">	
    <cfset form.apr36_Housing_PercAccomplished	 =0></cfif>
<cfif form.apr36_TotalIncome_PercAccomplished	 EQ "">	
    <cfset form.apr36_TotalIncome_PercAccomplished	 =0></cfif>
<cfif form.apr36_EarnedIncome_PercAccomplished	 EQ "">	
    <cfset form.apr36_EarnedIncome_PercAccomplished	 =0></cfif>
<cfif form.apr36_Housing_PercDiff	 EQ "">	
    <cfset form.apr36_Housing_PercDiff	 =0></cfif>
<cfif form.apr36_TotalIncome_PercDiff	 EQ "">	
    <cfset form.apr36_TotalIncome_PercDiff	 =0></cfif>
<cfif form.apr36_EarnedIncome_PercDiff	 EQ "">	
    <cfset form.apr36_EarnedIncome_PercDiff	 =0></cfif>
<cfif form.apr36SH_Housing_TargetNum	 EQ "">	
    <cfset form.apr36SH_Housing_TargetNum	 =0></cfif>
<cfif form.apr36SH_TotalIncome_TargetNum	 EQ "">	
    <cfset form.apr36SH_TotalIncome_TargetNum	 =0></cfif>
<cfif form.apr36SH_TotalIncome_TargetPerc	 EQ "">	
    <cfset form.apr36SH_TotalIncome_TargetPerc	 =0></cfif>
<cfif form.apr36SH_Housing_TargetPerc	 EQ "">	
    <cfset form.apr36SH_Housing_TargetPerc	 =0></cfif>
<cfif form.apr36SH_Housing_Served	 EQ "">	
    <cfset form.apr36SH_Housing_Served	 =0></cfif>
<cfif form.apr36SH_TotalIncome_Served	 EQ "">	
    <cfset form.apr36SH_TotalIncome_Served	 =0></cfif>
<cfif form.apr36SH_TotalIncome_NumAccomplished	 EQ "">	
    <cfset form.apr36SH_TotalIncome_NumAccomplished	 =0></cfif>
<cfif form.apr36SH_Housing_NumAccomplished	 EQ "">	
    <cfset form.apr36SH_Housing_NumAccomplished	 =0></cfif>
<cfif form.apr36SH_Housing_PercAccomplished	 EQ "">	
    <cfset form.apr36SH_Housing_PercAccomplished	 =0></cfif>
<cfif form.apr36SH_TotalIncome_PercAccomplished	 EQ "">	
    <cfset form.apr36SH_TotalIncome_PercAccomplished	 =0></cfif>
<cfif form.apr36SH_TotalIncome_PercDiff	 EQ "">	
    <cfset form.apr36SH_TotalIncome_PercDiff	 =0></cfif>
<cfif form.apr36SH_Housing_PercDiff	 EQ "">	
    <cfset form.apr36SH_Housing_PercDiff	 =0></cfif>
<cfif form.apr36Outreach_Service_TargetPerc	 EQ "">	
    <cfset form.apr36Outreach_Service_TargetPerc	 =0></cfif>        
<!---/ Set Defaults --->        
        
   <cfupdate datasource="#DataSource#" tablename="dataapr36" formfields="DataAPR36ID, aprID, inputUserID, projectID, reviewUserID, apr36Outreach_Housing_Universe, apr36Outreach_Housing_TargetNum, apr36Outreach_Service_TargetNum, apr36Outreach_Service_Universe, apr36Outreach_Housing_TargetPerc, apr36_Housing_TargetNum, apr36_TotalIncome_TargetNum, apr36_EarnedIncome_TargetNum, apr36_Housing_TargetPerc, apr36_TotalIncome_TargetPerc, apr36_EarnedIncome_TargetPerc, apr36_Housing_Served, apr36_TotalIncome_Served, apr36_EarnedIncome_Served, apr36_Housing_NumAccomplished, apr36_TotalIncome_NumAccomplished, apr36_EarnedIncome_NumAccomplished, apr36_Housing_PercAccomplished, apr36_TotalIncome_PercAccomplished, apr36_EarnedIncome_PercAccomplished, apr36_Housing_PercDiff, apr36_TotalIncome_PercDiff, apr36_EarnedIncome_PercDiff, apr36SH_Housing_TargetNum, apr36SH_TotalIncome_TargetNum, apr36SH_TotalIncome_TargetPerc, apr36SH_Housing_TargetPerc, apr36SH_Housing_Served, apr36SH_TotalIncome_Served, apr36SH_TotalIncome_NumAccomplished, apr36SH_Housing_NumAccomplished, apr36SH_Housing_PercAccomplished, apr36SH_TotalIncome_PercAccomplished, apr36SH_TotalIncome_PercDiff, apr36SH_Housing_PercDiff, apr36Outreach_Service_TargetPerc">
  </cfif>
  <cfset SESSION.message = "success">
  <cfset SESSION.messageText = "#ProjectName# updated successfully.">
  <cflocation url="#successpage#">
<cfelseif FORM.action EQ "process">
   <cfset SESSION.message = "alert">
   <cfset SESSION.messageText = "Authentication error. Please try again.">
</cfif>
<cfinclude template="#AbsoluteURL#legos/alert.cfm">
<!---/ Process Forms --->

<!--- Queires --->
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
        Form = "dataapr36"
        Where = "thisProject">
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
        <h3>Q36.</h3>
        <h4>For Services Only Programs - Street Outreach Only</h4>
          <table width="100%">
            <thead>
              <th>Service Linkage Measure</th>
              <th>Universe (##)</th>
              <th>Target (##)</th>
              <th>Target %</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  1 - Housing Stability
                </td>
                <td>
               <input type="number"
                       name="apr36Outreach_Housing_Universe"
                       value="#getDataAPR.apr36Outreach_Housing_Universe#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                      tabindex="#nexttab++#"
                      autofocus>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36Outreach_Housing_TargetNum"
                       value="#getDataAPR.apr36Outreach_Housing_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                    <input type="number"
                           name="apr36Outreach_Housing_TargetPerc"
                           value="#getDataAPR.apr36Outreach_Housing_TargetPerc#"
                           placeholder="0"
                           min="0"
                       step="1"
                          maxlength="11"
                           tabindex="#nexttab++#">
                    <small class="form-error">Must be a whole number</small>
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
              </td>

              </tr>

              <tr>
                <td>
                  2a-2f - Service Linkage 
                </td>
                <td>
               <input type="number"
                       name="apr36Outreach_Service_Universe"
                       value="#getDataAPR.apr36Outreach_Service_Universe#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36Outreach_Service_TargetNum"
                       value="#getDataAPR.apr36Outreach_Service_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                    <input type="number"
                       name="apr36Outreach_Service_TargetPerc"
                       value="#getDataAPR.apr36Outreach_Service_TargetPerc#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                        tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                    <small class="form-error">Must be a whole number</small>
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
              </td>



              </tr>


              

            </tbody>
       </table>
    </div>
  </div>

  <div class="row">
        <div class="large-12 columns">
        <h4>For Permanent Housing, Transitional Housing and Services Only Programs with a Housing Goal</h4>
          <table width="100%">
            <thead>
              <th>Performance Measure</th>
              <th>Exhibit 2 Target ##of persons who were expected to accomplish this measure</th>
              <th>Exhibit 2 Target % of persons who were expected to accomplish this measure</th>
              <th>Actual ## of persons served by the program as applicable to this measure</th>
              <th>Actual ## of persons who accomplished this measure</th>
              <th>Actual % of persons who accomplished this measure</th>
              <th>% Difference between Exhibit 2 Target and Actual Performance</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  1 - Housing Stability
                </td>
                <td>
               <input type="number"
                       name="apr36_Housing_TargetNum"
                       value="#getDataAPR.apr36_Housing_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_Housing_TargetPerc"
                       value="#getDataAPR.apr36_Housing_TargetPerc#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
              </td>
                <td>
                <input type="number"
                       name="apr36_Housing_Served"
                       value="#getDataAPR.apr36_Housing_Served#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36_Housing_NumAccomplished"
                       value="#getDataAPR.apr36_Housing_NumAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_Housing_PercAccomplished"
                       value="#getDataAPR.apr36_Housing_PercAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
              </td>

              <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_Housing_PercDiff"
                       value="#getDataAPR.apr36_Housing_PercDiff#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                     tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  2 - Total Income
                </td>
                <td>
               <input type="number"
                       name="apr36_TotalIncome_TargetNum"
                       value="#getDataAPR.apr36_TotalIncome_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_TotalIncome_TargetPerc"
                       value="#getDataAPR.apr36_TotalIncome_TargetPerc#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                        tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36_TotalIncome_Served"
                       value="#getDataAPR.apr36_TotalIncome_Served#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36_TotalIncome_NumAccomplished"
                       value="#getDataAPR.apr36_TotalIncome_NumAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_TotalIncome_PercAccomplished"
                       value="#getDataAPR.apr36_TotalIncome_PercAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
              <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_TotalIncome_PercDiff"
                       value="#getDataAPR.apr36_TotalIncome_PercDiff#"
                       placeholder="0"
                       min="0"
                       step="1"
                      maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  2 - Earned Income
                </td>
                <td>
               <input type="number"
                       name="apr36_EarnedIncome_TargetNum"
                       value="#getDataAPR.apr36_EarnedIncome_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>  
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_EarnedIncome_TargetPerc"
                       value="#getDataAPR.apr36_EarnedIncome_TargetPerc#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36_EarnedIncome_Served"
                       value="#getDataAPR.apr36_EarnedIncome_Served#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                        tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36_EarnedIncome_NumAccomplished"
                       value="#getDataAPR.apr36_EarnedIncome_NumAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_EarnedIncome_PercAccomplished"
                       value="#getDataAPR.apr36_EarnedIncome_PercAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36_EarnedIncome_PercDiff"
                       value="#getDataAPR.apr36_EarnedIncome_PercDiff#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>

              </tr>
              

            </tbody>
       </table>
    </div>
  </div>

  <div class="row">
        <div class="large-12 columns">
        <h4>For Safe Haven Programs</h4>
          <table width="100%">
            <thead>
              <th>Performance Measure</th>
              <th>Exhibit 2 Target ## of persons who were expected to accomplish this measure</th>
              <th>Exhibit 2 Target % of persons who were expected to accomplish this measure</th>
              <th>Actual ## of persons served by the program as applicable to this measure</th>
              <th>Actual ## of persons who accomplished this measure</th>
              <th>Actual % of persons who accomplished this measure</th>
              <th>% Difference between Exhibit 2 Target and Actual Performance</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  1 - Housing Stability
                </td>
                <td>
               <input type="number"
                       name="apr36SH_Housing_TargetNum"
                       value="#getDataAPR.apr36SH_Housing_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                      tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                 <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36SH_Housing_TargetPerc"
                       value="#getDataAPR.apr36SH_Housing_TargetPerc#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36SH_Housing_Served"
                       value="#getDataAPR.apr36SH_Housing_Served#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36SH_Housing_NumAccomplished"
                       value="#getDataAPR.apr36SH_Housing_NumAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
               <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36SH_Housing_PercAccomplished"
                       value="#getDataAPR.apr36SH_Housing_PercAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36SH_Housing_PercDiff"
                       value="#getDataAPR.apr36SH_Housing_PercDiff#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  2 - Total Income
                </td>
                <td>
               <input type="number"
                       name="apr36SH_TotalIncome_TargetNum"
                       value="#getDataAPR.apr36SH_TotalIncome_TargetNum#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
               <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36SH_TotalIncome_TargetPerc"
                       value="#getDataAPR.apr36SH_TotalIncome_TargetPerc#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36SH_TotalIncome_Served"
                       value="#getDataAPR.apr36SH_TotalIncome_Served#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr36SH_TotalIncome_NumAccomplished"
                       value="#getDataAPR.apr36SH_TotalIncome_NumAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36SH_TotalIncome_PercAccomplished"
                       value="#getDataAPR.apr36SH_TotalIncome_PercAccomplished#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                     <input type="number"
                       name="apr36SH_TotalIncome_PercDiff"
                       value="#getDataAPR.apr36SH_TotalIncome_PercDiff#"
                       placeholder="0"
                       min="0"
                       step="1"
                       maxlength="11"
                       tabindex="#nexttab++#">
                <small class="form-error">Must be a whole number</small>   
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              
        </tbody>
       </table>
    </div>
  </div>
</cfoutput>