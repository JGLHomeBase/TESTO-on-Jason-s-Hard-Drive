<!--- Set Variables --->
<cfset TargetTable = "DataAPR30">
<cfset UniqueID = "DataAPR30ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR30ID"
        Form = "dataapr30">
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
     <cfinsert datasource="#DataSource#" tablename="dataapr30" formfields="aprID, inputUserID, projectID, reviewUserID, apr30_HMISCashMatchExpended_Total, apr30_SSCashMatchExpended_Total, apr30_Aquisition_SHP, apr30_Rehab_SHP, apr30_NewConst_SHP, apr30_DevTotal_SHP, apr30_Aquisition_CashMatch, apr30_Rehab_CashMatch, apr30_NewConstruction_CashMatch, apr30_DevTotal_CashMatch, apr30_Aquisition_MatchPercent, apr30_Rehab_MatchPercent, apr30_NewConstruction_MatchPercent, apr30_DevTotal_MatchPercent, apr30_Aquisition_Total, apr30_Rehab_Total, apr30_NewConstruction_Total, apr30_DevTotal_Total, apr30_Outreach_SHP, apr30_CaseManage_SHP, apr30_LifeSkills_SHP, apr30_AlcoholDrugs_SHP, apr30_MentalHealth_SHP, apr30_AIDS_SHP, apr30_OtherHealth_SHP, apr30_Education_SHP, apr30_HousingPlacement_SHP, apr30_JobAssist_SHP, apr30_ChildCare_SHP, apr30_Transport_SHP, apr30_Legal_SHP, apr30_SSOther_SHP, apr30_SSTotal_SHP, apr30_Equipment_SHP, apr30_Software_SHP, apr30_Services_SHP, apr30_Personnel_SHP, apr30_Space_SHP, apr30_Stipends_SHP, apr30_HMISOther_SHP, apr30_HMISTotal_SHP, apr30_Leasing_SHP, apr30_Operating_SHP, apr30_Admin_SHP, apr30_LOATotal_SHP, apr30_Admin_CashMatch, apr30_Operating_CashMatch, apr30_Leasing_CashMatch, apr30_LOATotal_CashMatch, apr30_Admin_MatchPercent, apr30_Leasing_MatchPercent, apr30_Operating_MatchPercent, apr30_Leasing_Total, apr30Total_SS_MatchPercent, apr30Total_HMIS_MatchPercent, apr30Total_SS_Total, apr30Total_Total_SHP">
  <cfelse>
    <cfset FORM.DataAPR30ID = newCheck.DataAPR30ID>

<!--- Set Defaults --->

<cfif form.apr30_HMISCashMatchExpended_Total EQ "">
    <cfset form.apr30_HMISCashMatchExpended_Total=0>
</cfif>
<cfif form.apr30_SSCashMatchExpended_Total EQ "">
    <cfset form.apr30_SSCashMatchExpended_Total=0>
</cfif>
<cfif form.apr30_Aquisition_SHP EQ "">
    <cfset form.apr30_Aquisition_SHP=0>
<cfelse>
    <cfset FORM.apr30_Aquisition_SHP = LSParseCurrency(FORM.apr30_Aquisition_SHP)>
</cfif>
<cfif form.apr30_Rehab_SHP EQ "">
    <cfset form.apr30_Rehab_SHP=0>
<cfelse>
    <cfset FORM.apr30_Rehab_SHP = LSParseCurrency(FORM.apr30_Rehab_SHP)>
</cfif>
<cfif form.apr30_NewConst_SHP EQ "">
    <cfset form.apr30_NewConst_SHP=0>
<cfelse>
    <cfset FORM.apr30_NewConst_SHP = LSParseCurrency(FORM.apr30_NewConst_SHP)>
</cfif>
<cfif form.apr30_DevTotal_SHP EQ "">
    <cfset form.apr30_DevTotal_SHP=0>
</cfif>
<cfif form.apr30_Aquisition_CashMatch EQ "">
    <cfset form.apr30_Aquisition_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_Aquisition_CashMatch = LSParseCurrency(FORM.apr30_Aquisition_CashMatch)>
</cfif>
<cfif form.apr30_Rehab_CashMatch EQ "">
    <cfset form.apr30_Rehab_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_Rehab_CashMatch = LSParseCurrency(FORM.apr30_Rehab_CashMatch)>
</cfif>
<cfif form.apr30_NewConstruction_CashMatch EQ "">
    <cfset form.apr30_NewConstruction_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_NewConstruction_CashMatch = LSParseCurrency(FORM.apr30_NewConstruction_CashMatch)>
</cfif>
<cfif form.apr30_DevTotal_CashMatch EQ "">
    <cfset form.apr30_DevTotal_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_DevTotal_CashMatch = LSParseCurrency(FORM.apr30_DevTotal_CashMatch)>
</cfif>
<cfif form.apr30_Aquisition_MatchPercent EQ "">
    <cfset form.apr30_Aquisition_MatchPercent=0>
</cfif>
<cfif form.apr30_Rehab_MatchPercent EQ "">
    <cfset form.apr30_Rehab_MatchPercent=0>
</cfif>
<cfif form.apr30_NewConstruction_MatchPercent EQ "">
    <cfset form.apr30_NewConstruction_MatchPercent=0>
</cfif>
<cfif form.apr30_DevTotal_MatchPercent EQ "">
    <cfset form.apr30_DevTotal_MatchPercent=0>
</cfif>
<cfif form.apr30_Aquisition_Total EQ "">
    <cfset form.apr30_Aquisition_Total=0>
</cfif>
<cfif form.apr30_Rehab_Total EQ "">
    <cfset form.apr30_Rehab_Total=0>
</cfif>
<cfif form.apr30_NewConstruction_Total EQ "">
    <cfset form.apr30_NewConstruction_Total=0>
</cfif>
<cfif form.apr30_DevTotal_Total EQ "">
    <cfset form.apr30_DevTotal_Total=0>
</cfif>
<cfif form.apr30_Outreach_SHP EQ "">
    <cfset form.apr30_Outreach_SHP=0>
<cfelse>
    <cfset FORM.apr30_Outreach_SHP = LSParseCurrency(FORM.apr30_Outreach_SHP)>
</cfif>
<cfif form.apr30_CaseManage_SHP EQ "">
    <cfset form.apr30_CaseManage_SHP=0>
<cfelse>
    <cfset FORM.apr30_CaseManage_SHP = LSParseCurrency(FORM.apr30_CaseManage_SHP)>
</cfif>
<cfif form.apr30_LifeSkills_SHP EQ "">
    <cfset form.apr30_LifeSkills_SHP=0>
<cfelse>
    <cfset FORM.apr30_LifeSkills_SHP = LSParseCurrency(FORM.apr30_LifeSkills_SHP)>
</cfif>
<cfif form.apr30_AlcoholDrugs_SHP EQ "">
    <cfset form.apr30_AlcoholDrugs_SHP=0>
<cfelse>
    <cfset FORM.apr30_AlcoholDrugs_SHP = LSParseCurrency(FORM.apr30_AlcoholDrugs_SHP)>
</cfif>
<cfif form.apr30_MentalHealth_SHP EQ "">
    <cfset form.apr30_MentalHealth_SHP=0>
<cfelse>
    <cfset FORM.apr30_MentalHealth_SHP = LSParseCurrency(FORM.apr30_MentalHealth_SHP)>
</cfif>
<cfif form.apr30_AIDS_SHP EQ "">
    <cfset form.apr30_AIDS_SHP=0>
<cfelse>
    <cfset FORM.apr30_AIDS_SHP = LSParseCurrency(FORM.apr30_AIDS_SHP)>
</cfif>
<cfif form.apr30_OtherHealth_SHP EQ "">
    <cfset form.apr30_OtherHealth_SHP=0>
<cfelse>
    <cfset FORM.apr30_OtherHealth_SHP = LSParseCurrency(FORM.apr30_OtherHealth_SHP)>
</cfif>
<cfif form.apr30_Education_SHP EQ "">
    <cfset form.apr30_Education_SHP=0>
<cfelse>
    <cfset FORM.apr30_Education_SHP = LSParseCurrency(FORM.apr30_Education_SHP)>
</cfif>
<cfif form.apr30_HousingPlacement_SHP EQ "">
    <cfset form.apr30_HousingPlacement_SHP=0>
<cfelse>
    <cfset FORM.apr30_HousingPlacement_SHP = LSParseCurrency(FORM.apr30_HousingPlacement_SHP)>
</cfif>
<cfif form.apr30_JobAssist_SHP EQ "">
    <cfset form.apr30_JobAssist_SHP=0>
<cfelse>
    <cfset FORM.apr30_JobAssist_SHP = LSParseCurrency(FORM.apr30_JobAssist_SHP)>
</cfif>
<cfif form.apr30_ChildCare_SHP EQ "">
    <cfset form.apr30_ChildCare_SHP=0>
<cfelse>
    <cfset FORM.apr30_ChildCare_SHP = LSParseCurrency(FORM.apr30_ChildCare_SHP)>
</cfif>
<cfif form.apr30_Transport_SHP EQ "">
    <cfset form.apr30_Transport_SHP=0>
<cfelse>
    <cfset FORM.apr30_Transport_SHP = LSParseCurrency(FORM.apr30_Transport_SHP)>
</cfif>
<cfif form.apr30_Legal_SHP EQ "">
    <cfset form.apr30_Legal_SHP=0>
<cfelse>
    <cfset FORM.apr30_Legal_SHP = LSParseCurrency(FORM.apr30_Legal_SHP)>
</cfif>
<cfif form.apr30_SSOther_SHP EQ "">
    <cfset form.apr30_SSOther_SHP=0>
<cfelse>
    <cfset FORM.apr30_SSOther_SHP = LSParseCurrency(FORM.apr30_SSOther_SHP)>
</cfif>
<cfif form.apr30_SSTotal_SHP EQ "">
    <cfset form.apr30_SSTotal_SHP=0>
</cfif>
<cfif form.apr30_Equipment_SHP EQ "">
    <cfset form.apr30_Equipment_SHP=0>
<cfelse>
    <cfset FORM.apr30_Equipment_SHP = LSParseCurrency(FORM.apr30_Equipment_SHP)>
</cfif>
<cfif form.apr30_Software_SHP EQ "">
    <cfset form.apr30_Software_SHP=0>
<cfelse>
    <cfset FORM.apr30_Software_SHP = LSParseCurrency(FORM.apr30_Software_SHP)>
</cfif>
<cfif form.apr30_Services_SHP EQ "">
    <cfset form.apr30_Services_SHP=0>
<cfelse>
    <cfset FORM.apr30_Services_SHP = LSParseCurrency(FORM.apr30_Services_SHP)>
</cfif>
<cfif form.apr30_Personnel_SHP EQ "">
    <cfset form.apr30_Personnel_SHP=0>
<cfelse>
    <cfset FORM.apr30_Personnel_SHP = LSParseCurrency(FORM.apr30_Personnel_SHP)>
</cfif>
<cfif form.apr30_Space_SHP EQ "">
    <cfset form.apr30_Space_SHP=0>
<cfelse>
    <cfset FORM.apr30_Space_SHP = LSParseCurrency(FORM.apr30_Space_SHP)>
</cfif>
<cfif form.apr30_Stipends_SHP EQ "">
    <cfset form.apr30_Stipends_SHP=0>
<cfelse>
    <cfset FORM.apr30_Stipends_SHP = LSParseCurrency(FORM.apr30_Stipends_SHP)>
</cfif>
<cfif form.apr30_HMISOther_SHP EQ "">
    <cfset form.apr30_HMISOther_SHP=0>
<cfelse>
    <cfset FORM.apr30_HMISOther_SHP = LSParseCurrency(FORM.apr30_HMISOther_SHP)>
</cfif>
<cfif form.apr30_HMISTotal_SHP EQ "">
    <cfset form.apr30_HMISTotal_SHP=0>
</cfif>
<cfif form.apr30_Leasing_SHP EQ "">
    <cfset form.apr30_Leasing_SHP=0>
<cfelse>
    <cfset FORM.apr30_Leasing_SHP = LSParseCurrency(FORM.apr30_Leasing_SHP)>
</cfif>
<cfif form.apr30_Operating_SHP EQ "">
    <cfset form.apr30_Operating_SHP=0>
<cfelse>
    <cfset FORM.apr30_Operating_SHP = LSParseCurrency(FORM.apr30_Operating_SHP)>
</cfif>
<cfif form.apr30_Admin_SHP EQ "">
    <cfset form.apr30_Admin_SHP=0>
<cfelse>
    <cfset FORM.apr30_Admin_SHP = LSParseCurrency(FORM.apr30_Admin_SHP)>
</cfif>
<cfif form.apr30_LOATotal_SHP EQ "">
    <cfset form.apr30_LOATotal_SHP=0>
</cfif>
<cfif form.apr30_Admin_CashMatch EQ "">
    <cfset form.apr30_Admin_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_Admin_CashMatch = LSParseCurrency(FORM.apr30_Admin_CashMatch)>
</cfif>
<cfif form.apr30_Operating_CashMatch EQ "">
    <cfset form.apr30_Operating_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_Operating_CashMatch = LSParseCurrency(FORM.apr30_Operating_CashMatch)>
</cfif>
<cfif form.apr30_Leasing_CashMatch EQ "">
    <cfset form.apr30_Leasing_CashMatch=0>
<cfelse>
    <cfset FORM.apr30_Leasing_CashMatch = LSParseCurrency(FORM.apr30_Leasing_CashMatch)>
</cfif>
<cfif form.apr30_LOATotal_CashMatch EQ "">
    <cfset form.apr30_LOATotal_CashMatch=0>
</cfif>
<cfif form.apr30_Admin_MatchPercent EQ "">
    <cfset form.apr30_Admin_MatchPercent=0>
</cfif>
<cfif form.apr30_Leasing_MatchPercent EQ "">
    <cfset form.apr30_Leasing_MatchPercent=0>
</cfif>
<cfif form.apr30_Operating_MatchPercent EQ "">
    <cfset form.apr30_Operating_MatchPercent=0>
</cfif>
<cfif form.apr30_Leasing_Total EQ "">
    <cfset form.apr30_Leasing_Total=0>
</cfif>
<cfif form.apr30_Operating_Total EQ "">
    <cfset form.apr30_Operating_Total=0>
</cfif>
<cfif form.apr30_Admin_Total EQ "">
    <cfset form.apr30_Admin_Total=0>
</cfif>
<cfif form.apr30_LOATotal_Total EQ "">
    <cfset form.apr30_LOATotal_Total=0>
</cfif>
<cfif form.apr30Total_SS_MatchPercent EQ "">
    <cfset form.apr30Total_SS_MatchPercent=0>
</cfif>
<cfif form.apr30Total_HMIS_MatchPercent EQ "">
    <cfset form.apr30Total_HMIS_MatchPercent=0>
</cfif>

<!---/ Set Defaults --->

      <cfupdate datasource="#DataSource#" tablename="dataapr30" formfields="DataAPR30ID, aprID, inputUserID, projectID, reviewUserID, apr30_HMISCashMatchExpended_Total, apr30_SSCashMatchExpended_Total, apr30_Aquisition_SHP, apr30_Rehab_SHP, apr30_NewConst_SHP, apr30_DevTotal_SHP, apr30_Aquisition_CashMatch, apr30_Rehab_CashMatch, apr30_NewConstruction_CashMatch, apr30_DevTotal_CashMatch, apr30_Aquisition_MatchPercent, apr30_Rehab_MatchPercent, apr30_NewConstruction_MatchPercent, apr30_DevTotal_MatchPercent, apr30_Aquisition_Total, apr30_Rehab_Total, apr30_NewConstruction_Total, apr30_DevTotal_Total, apr30_Outreach_SHP, apr30_CaseManage_SHP, apr30_LifeSkills_SHP, apr30_AlcoholDrugs_SHP, apr30_MentalHealth_SHP, apr30_AIDS_SHP, apr30_OtherHealth_SHP, apr30_Education_SHP, apr30_HousingPlacement_SHP, apr30_JobAssist_SHP, apr30_ChildCare_SHP, apr30_Transport_SHP, apr30_Legal_SHP, apr30_SSOther_SHP, apr30_SSTotal_SHP, apr30_Equipment_SHP, apr30_Software_SHP, apr30_Services_SHP, apr30_Personnel_SHP, apr30_Space_SHP, apr30_Stipends_SHP, apr30_HMISOther_SHP, apr30_HMISTotal_SHP, apr30_Leasing_SHP, apr30_Operating_SHP, apr30_Admin_SHP, apr30_LOATotal_SHP, apr30_Admin_CashMatch, apr30_Operating_CashMatch, apr30_Leasing_CashMatch, apr30_LOATotal_CashMatch, apr30_Admin_MatchPercent, apr30_Leasing_MatchPercent, apr30_Operating_MatchPercent, apr30_Leasing_Total, apr30Total_SS_MatchPercent, apr30Total_HMIS_MatchPercent, apr30Total_SS_Total, apr30Total_Total_SHP">
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
        Form = "dataapr30"
        Where = "thisProject">
<!---/ Get DataAPR --->

<!--- Queires --->

<!--- Math --->
<cfset mathCols="25">
<cfset mathRows="12">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Q30a1. SHP Expenditures - Development Costs<h3>
    <h4>SHP and Cash Match Expenditures During the Operating Year - Development Costs</h4>
    <cfset nexttab = "1">
    <table width="100%">
      <thead>
        <th>Expenditure Type</th>
        <th>SHP Funds</th>
        <th>Cash Match</th>
        <th>Match %</th>
        <th>Total Expenditures</th>
      </thead>
      <tbody>
        <tr>
          <td>Acquisition</td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_Aquisition_SHP"
                   value="#NumberFormat(getDataAPR.apr30_Aquisition_SHP)#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 row1">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_Aquisition_CashMatch"
                   value="#NumberFormat(getDataAPR.apr30_Aquisition_CashMatch)#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2 row1">
            <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-9 columns">
                <input type="text"
                   name="apr30_Aquisition_MatchPercent"
                   value="#getDataAPR.apr30_Aquisition_MatchPercent#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#">
                <small class="error">Must be a whole number</small>
              </div>
              <div class="small-3 columns">
                <span class="postfix">&##37</span>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_Aquisition_Total"
                   value="#getDataAPR.apr30_Aquisition_Total#"
                   placeholder="0"
                   class="BGLightGray"
                   maxlength="11"
                   readonly
                   id="sumR1">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>Rehabilitation</td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_Rehab_SHP"
                   value="#NumberFormat(getDataAPR.apr30_Rehab_SHP)#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 row2">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_Rehab_CashMatch"
                   value="#NumberFormat(getDataAPR.apr30_Rehab_CashMatch)#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2 row2">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-9 columns">
                <input type="text"
                   name="apr30_Rehab_MatchPercent"
                   value="#getDataAPR.apr30_Rehab_MatchPercent#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#">
                <small class="error">Must be a whole number</small>
              </div>
              <div class="small-3 columns">
                <span class="postfix">&##37</span>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_Rehab_Total"
                   value="#getDataAPR.apr30_Rehab_Total#"
                   placeholder="0"
                   maxlength="11"
                   readonly
                   class="BGLightGray"
                   maxlength="11"
                   readonly
                   id="sumR2">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>New Construction</td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_NewConst_SHP"
                   value="#NumberFormat(getDataAPR.apr30_NewConst_SHP)#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 row3">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_NewConstruction_CashMatch"
                   value="#NumberFormat(getDataAPR.apr30_NewConstruction_CashMatch)#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2 row3">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-9 columns">
                <input type="text"
                   name="apr30_NewConstruction_MatchPercent"
                   value="#getDataAPR.apr30_NewConstruction_MatchPercent#"
                   placeholder="0"
                   maxlength="11"
                   tabindex="#nexttab++#">
                <small class="error">Must be a whole number</small>
              </div>
              <div class="small-3 columns">
                <span class="postfix">&##37</span>
              </div>
            </div>
          </td>
           <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_NewConstruction_Total"
                   value="#getDataAPR.apr30_NewConstruction_Total#"
                   placeholder="0"
                   maxlength="11"
                   readonly
                   class="BGLightGray"
                   id="sumR3">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
            
          </td>
        </tr>
        
          </td>
        <tr>
          <td><strong>Development - Subtotal</strong></td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_DevTotal_SHP"
                   value="#NumberFormat(getDataAPR.apr30_DevTotal_SHP)#"
                   placeholder="0"
                   maxlength="11"
                   readonly
                   class="BGLightGray row4"
                   id="sumC1">
                <small class="error">Must be a whole number</small>
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_DevTotal_CashMatch"
                   value="#NumberFormat(getDataAPR.apr30_DevTotal_CashMatch)#"
                   placeholder="0"
                   maxlength="11"
                   readonly
                   class="BGLightGray row4"
                   id="sumC2">
              </div>
            </div>
           
          </td>
          <td>
          <div class="row collapse">
            <div class="small-9 columns">
              <input type="text"
                   name="apr30_DevTotal_MatchPercent"
                   value="#getDataAPR.apr30_DevTotal_MatchPercent#"
                   placeholder="0"
                   class="col8"
                   maxlength="11"
                   tabindex="#nexttab++#">
              <small class="error">Must be a whole number</small>
            </div>
            <div class="small-3 columns">
              <span class="postfix">&##37</span>
            </div>
          </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name="apr30_DevTotal_Total"
                   value="#getDataAPR.apr30_DevTotal_Total#"
                   placeholder="0"
                   
                  maxlength="11"
                   readonly
                   class="BGLightGray"
                   id="sumR4">
                <small class="error">Must be a whole number</small>
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
    <h3>Q30a. SHP Expenditures - Supportive Services</h3>
        <h4>SHP and Cash Match Expenditures During the Operating Year - Supportive Services</h4>
          <table width="100%">
            <thead>
              <th>Expenditure Type</th>
              <th>SHP Funds</th>
              <th>Cash Match</th>
              <th>Match %</th>
              <th>Total Expenditures</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Outreach
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_Outreach_SHP"
                             value="#NumberFormat(getDataAPR.apr30_Outreach_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
              </tr>


              <tr>
                <td>
                  Case Management
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_CaseManage_SHP"
                             value="#NumberFormat(getDataAPR.apr30_CaseManage_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td> 
                </td>
                <td> 
                </td>
              </tr>


              <tr>
                <td>
                  Life skills (not case management)
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_LifeSkills_SHP"
                             value="#NumberFormat(getDataAPR.apr30_LifeSkills_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                </td>
                <td> 
                </td>
              </tr>
              

              <tr>
                <td>
                  Alcohol and drug abuse services
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_AlcoholDrugs_SHP"
                             value="#NumberFormat(getDataAPR.apr30_AlcoholDrugs_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td> 
                </td>
                <td>
                </td>
              </tr>


              <tr>
                <td>
                  Mental health services
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_MentalHealth_SHP"
                             value="#NumberFormat(getDataAPR.apr30_MentalHealth_SHP)#"
                             placeholder="0"
                             class="col3"
                             maxlength="11"
                             tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  AIDS - related services
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                             name="apr30_AIDS_SHP"
                             value="#NumberFormat(getDataAPR.apr30_AIDS_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
           
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Other health care services
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_OtherHealth_SHP"
                               value="#NumberFormat(getDataAPR.apr30_OtherHealth_SHP)#"
                               placeholder="0"
                               class="col3"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
           
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Education
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Education_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Education_SHP)#"
                               placeholder="0"
                               class="col3"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Housing Placement
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_HousingPlacement_SHP"
                               value="#NumberFormat(getDataAPR.apr30_HousingPlacement_SHP)#"
                               placeholder="0"
                               class="col3"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
           
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Employment assistance
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_JobAssist_SHP"
                             value="#NumberFormat(getDataAPR.apr30_JobAssist_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Child care
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                     <input type="text"
                                 name="apr30_ChildCare_SHP"
                                 value="#NumberFormat(getDataAPR.apr30_ChildCare_SHP)#"
                                 placeholder="0"
                                 class="col3"
                                maxlength="11"
                                tabindex="#nexttab++#">
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

          <tr>
                <td>
                  Transportation
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_Transport_SHP"
                             value="#NumberFormat(getDataAPR.apr30_Transport_SHP)#"
                             placeholder="0"
                             class="col3"
                            maxlength="11"
                            tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

               <tr>
                <td>
                  Legal
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_Legal_SHP"
                             value="#NumberFormat(getDataAPR.apr30_Legal_SHP)#"
                             placeholder="0"
                             class="col3"
                             maxlength="11"
                             tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
            
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

               <tr>
                <td>
                  Other
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                             name="apr30_SSOther_SHP"
                             value="#NumberFormat(getDataAPR.apr30_SSOther_SHP)#"
                             placeholder="0"
                             class="col3"
                             maxlength="11"
                             tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  <strong> Services - Subtotal </strong>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_SSTotal_SHP"
                               value="#getDataAPR.apr30_SSTotal_SHP#"
                               placeholder="0"
                               maxlength="11"
                               class="BGLightGray"
                               readonly
                               id="sumC3">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Cash Match Expended
                </td>
                <td>
                  
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                         name="apr30_SSCashMatchExpended_Total"
                         value="#NumberFormat(getDataAPR.apr30_SSCashMatchExpended_Total)#"
                         placeholder="0"
                         class="col9"
                        maxlength="11"
                        tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

            </tbody>
       </table>
  </div>
</div>

<div class="row">
        <div class="large-12 columns">
        <h3>Q30a3. SHP Expenditures - HMIS</h3>
        <h4>SHP and Cash Match Expenditures During the Operating Year - HMIS</h4>
          <table width="100%">
            <thead>
              <th>Expenditure Type</th>
              <th>SHP Funds</th>
              <th>Cash Match</th>
              <th>Match %</th>
              <th>Total Expenditures</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Equipment (server, computers, printers)
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Equipment_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Equipment_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                 </td>
              </tr>


              <tr>
                <td>
                  Software (software fees, user licenses, software support)
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Software_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Software_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td> 
                </td>
                <td> 
                </td>
              </tr>


              <tr>
                <td>
                  Services (training, hosting, programming)
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Services_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Services_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td> 
                </td>
              </tr>
              

              <tr>
                <td>
                  Personnel
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Personnel_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Personnel_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td> 
                </td>
                <td>
                </td>
              </tr>


              <tr>
                <td>
                  Space and operations
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Space_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Space_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Stipends to agencies
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Stipends_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Stipends_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  Other 
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_HMISOther_SHP"
                               value="#NumberFormat(getDataAPR.apr30_HMISOther_SHP)#"
                               placeholder="0"
                               class="col4"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

              <tr>
                <td>
                  <strong> HMIS Subtotal </strong>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_HMISTotal_SHP"
                               value="#getDataAPR.apr30_HMISTotal_SHP#"
                               placeholder="0"
                               readonly
                               id="sumC4"
                               class="BGLightGray"
                              maxlength="11">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>


              <tr>
                <td>
                  Cash Match Expended
                </td>
                <td>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_HMISCashMatchExpended_Total"
                               value="#NumberFormat(getDataAPR.apr30_HMISCashMatchExpended_Total)#"
                               placeholder="0"
                               maxlength="11"
                               tabindex="#nexttab++#"
                               class="col16">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>

                </td>
                <td>
                  <td> 
                </td>
                <td>
                </td>
              </tr>

            </tbody>
       </table>
    </div>
  </div>

  <div class="row">
        <div class="large-12 columns">
          <h3>Q30a4. SHP Expenditures - Leasing, Operating, and Administration</h3>
          <h4>SHP and Cash Match Expenditures During the Operating Year - Leasing, Operating, and Admin</h4>
          <table width="100%">
            <thead>
              <th>Expenditure Type</th>
              <th>SHP Funds</th>
              <th>Cash Match</th>
              <th>Match %</th>
              <th>Total Expenditures</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Real Property Leasing
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Leasing_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Leasing_SHP)#"
                               placeholder="0"
                               class="col5 row5 col10"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Leasing_CashMatch"
                               value="#NumberFormat(getDataAPR.apr30_Leasing_CashMatch)#"
                               placeholder="0"
                               class="col6 row5 col11"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name="apr30_Leasing_MatchPercent"
                         value="#NumberFormat(getDataAPR.apr30_Leasing_MatchPercent)#"
                         placeholder="0"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         class="col12">
                      <small class="error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
            <small class="error">Must be a number</small>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Leasing_Total"
                               value="#NumberFormat(getDataAPR.apr30_Leasing_Total)#"
                               placeholder="0"
                               readonly
                               id="sumR5"
                               class="BGLightGray"
                              maxlength="11">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>


              <tr>
                <td>
                  Operating Costs
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Operating_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Operating_SHP)#"
                               placeholder="0"
                               class="col5 row6 col13"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Operating_CashMatch"
                               value="#NumberFormat(getDataAPR.apr30_Operating_CashMatch)#"
                               placeholder="0"
                               class="col6 row6 col14"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name="apr30_Operating_MatchPercent"
                         value="#getDataAPR.apr30_Operating_MatchPercent#"
                         placeholder="0"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         class="col15">
                      <small class="error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
            <small class="error">Must be a number</small>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Operating_Total"
                               value="#getDataAPR.apr30_Operating_Total#"
                               placeholder="0"
                               readonly
                               id="sumR6"
                               class="BGLightGray"
                              maxlength="11">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>


              <tr>
                <td>
                  Administration
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Admin_SHP"
                               value="#NumberFormat(getDataAPR.apr30_Admin_SHP)#"
                               placeholder="0"
                               class="col5 row7 col17"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Admin_CashMatch"
                               value="#NumberFormat(getDataAPR.apr30_Admin_CashMatch)#"
                               placeholder="0"
                               class="col6 row7 col18"
                              maxlength="11"
                              tabindex="#nexttab++#">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name="apr30_Admin_MatchPercent"
                         value="#getDataAPR.apr30_Admin_MatchPercent#"
                         placeholder="0"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         class="col19">
                      <small class="error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
              <small class="error">Must be a number</small>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_Admin_Total"
                               value="#getDataAPR.apr30_Admin_Total#"
                               placeholder="0"
                               readonly
                               id="sumR7"
                               class="BGLightGray"
                              maxlength="11">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>


              <tr>
                <td>
                  <b>Leasing, Operating, Admin - Subtotal</b>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_LOATotal_SHP"
                               value="#NumberFormat(getDataAPR.apr30_LOATotal_SHP)#"
                               placeholder="0"
                               readonly
                               id="sumC5"
                               class="BGLightGray row8"
                              maxlength="11">
                      <small class="error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_LOATotal_CashMatch"
                               value="#NumberFormat(getDataAPR.apr30_LOATotal_CashMatch)#"
                               placeholder="0"
                               readonly
                               id="sumC6"
                               class="BGLightGray row8"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name=""
                         value=""
                         placeholder="Not collected"
                         maxlength="11"
                         class="BGLightGray"
                         readonly>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
              <small class="form-error">Must be a number</small>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name="apr30_LOATotal_Total"
                               value="#getDataAPR.apr30_LOATotal_Total#"
                               placeholder="0"
                               readonly
                               id="sumR8"
                               class="BGLightGray"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>



            </tbody>
          </table>

          <h4>SHP and Cash Match Expenditures During the Operating Year - Totals</h4>
          <table width="100%">
            <thead>
              <th>Total SHP Expenses</th>
              <th>SHP Funds</th>
              <th>Cash Match</th>
              <th>Match %</th>
              <th>Total Expenditures</th>
            </thead>
            <tbody>
              <tr>
          <td>Development</td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name=""
                   value="#getDataAPR.apr30_DevTotal_SHP#"
                   placeholder="0"
                   
                   maxlength="11"
                   readonly
                   class="BGLightGray col20"
                   id="sumC1">
              </div>
            </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name=""
                   value=""
                   placeholder="0"
                   
                  maxlength="11"
                   readonly
                   class="BGLightGray col21"
                   id="sumC2">
              </div>
            </div>
           
          </td>
          <td>
          <div class="row collapse">
            <div class="small-9 columns">
              <input type="text"
                   name=""
                   value=""
                   placeholder="0"
                   class="BGLightGray"
                   id="sumC8"
                  maxlength="11"
                  readonly>
            </div>
            <div class="small-3 columns">
              <span class="postfix">&##37</span>
            </div>
          </div>
          </td>
          <td>
            <div class="row collapse">
              <div class="small-3 large-2 columns">
                <span class="prefix">&##36;</span>
              </div>
              <div class="small-9 large-10 columns">
                <input type="text"
                   name=""
                   value=""
                   placeholder="0"
                   
                  maxlength="11"
                   readonly
                   class="BGLightGray col22"
                   id="sumR4">
                <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
                <td>
                  Supportive Services
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               placeholder="0"
                               maxlength="11"
                               id="sumC3"
                               class="BGLightGray row12 col20"
                               readonly>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               placeholder="0"
                               maxlength="11"
                               readonly
                               id="sumC9"
                               class="BGLightGray row12 col21">
                    </div>
                  </div>
                </td>
                <td>
                <div class="row collapse">
                  <div class="small-9 columns">
                    <input type="text"
                         name="apr30Total_SS_MatchPercent"
                         value="#getDataAPR.apr30Total_SS_MatchPercent#"
                         placeholder="0"
                        maxlength="11"
                        tabindex="#nexttab++#">
                  </div>
                  <div class="small-3 columns">
                    <span class="postfix">&##37</span>
                  </div>
                </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                              name="apr30Total_SS_Total"
                              value=""
                              placeholder="0"
                              maxlength="11"
                              readyonly
                              id="sumR12"
                              class="BGLightGray col22">
                    </div>
                  </div>
                </td>
              </tr>


             
              <tr>
                <td>
                  Real Property Leasing
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Leasing_SHP#"
                               placeholder="0"
                               maxlength="11"
                               readyonly
                               class="BGLightGray col20"
                               id="sumC10">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Leasing_CashMatch#"
                               placeholder="0"
                              maxlength="11"
                              readyonly
                               class="BGLightGray col21"
                               id="sumC11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name=""
                         value="#getDataAPR.apr30_Leasing_MatchPercent#"
                         placeholder="0"
                         maxlength="11"
                         readyonly
                               class="BGLightGray"
                               id="sumC12">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
            <small class="form-error">Must be a number</small>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Leasing_Total#"
                               placeholder="0"
                               readonly
                               id="sumR5"
                               class="BGLightGray col22"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>

              <tr>
                <td>
                  Operating Expensess
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Operating_SHP#"
                               placeholder="0"
                                readyonly
                               class="BGLightGray col20"
                               id="sumC13"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Operating_CashMatch#"
                               placeholder="0"
                                readyonly
                               class="BGLightGray col21"
                               id="sumC14"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name=""
                         value="#getDataAPR.apr30_Operating_MatchPercent#"
                         placeholder="0"
                         maxlength="11"
                          readyonly
                               class="BGLightGray"
                               id="sumC15">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
            <small class="form-error">Must be a number</small>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Operating_Total#"
                               placeholder="0"
                               readonly
                               id="sumR6"
                               class="BGLightGray col22"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>


              <tr>
                <td>
                  HMIS
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_HMISTotal_SHP#"
                               placeholder="0"
                               readonly
                               id="sumC4"
                               class="BGLightGray row11 col20"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_HMISCashMatchExpended_Total#"
                               placeholder="0"
                              maxlength="11"
                              readyonly
                               class="BGLightGray row11 col21"
                               id="sumC16">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name="apr30Total_HMIS_MatchPercent"
                         value="#getDataAPR.apr30Total_HMIS_MatchPercent#"
                         placeholder="0"
                         maxlength="11"
                         tabindex="#nexttab++#">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_HMISCashMatchExpended_Total#"
                               placeholder="0"
                               maxlength="11"
                               readyonly
                               class="BGLightGray col22"
                               id="sumR11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                  
                </td>
              </tr>

              <tr>
                <td>
                  <b>SHP Expenses - Subtotal </b>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                           name="apr30Total_Subtotal_SHP"
                           value="#getDataAPR.apr30Total_Subtotal_SHP#"
                           placeholder="0"
                           readonly
                           class="BGLightGray col23"
                           id="sumC20"
                          maxlength="11">
                    </div>
                  </div>
                    
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                           name="apr30Total_Subtotal_CashMatch"
                           value="#getDataAPR.apr30Total_Subtotal_CashMatch#"
                           placeholder="0"
                           readonly
                           class="BGLightGray col24"
                           id="sumC21"
                          maxlength="11">
                    </div>
                  </div>
                   
                </td>
                <td>
                  
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                           name="apr30Total_Subtotal_Total"
                           value="#getDataAPR.apr30Total_Subtotal_Total#"
                           placeholder="0"
                           readonly
                           class="BGLightGray col25"
                           id="sumC22"
                          maxlength="11">
                    </div>
                  </div>
                   
                </td>
              </tr>
              <tr>
                <td>
                  Administration
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Admin_SHP#"
                               placeholder="0"
                               readonly
                               class="BGLightGray col23"
                               id="sumC17"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                  <td>
                    <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Admin_CashMatch#"
                               placeholder="0"
                               readonly
                               class="BGLightGray col24"
                               id="sumC18"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-9 columns">
                      <input type="text"
                         name=""
                         value="#getDataAPR.apr30_Admin_MatchPercent#"
                         placeholder="0"
                         readonly
                         class="BGLightGray"
                         id="sumC19"
                         maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">&##37</span>
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                       <input type="text"
                               name=""
                               value="#getDataAPR.apr30_Admin_Total#"
                               placeholder="0"
                               readonly
                               id="sumR7"
                               class="BGLightGray col25"
                              maxlength="11">
                      <small class="form-error">Must be a whole number</small>
                    </div>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <b>Total Expenses</b>
                </td>
                <td>
                   <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                           name="apr30Total_Total_SHP"
                           value="#getDataAPR.apr30Total_Total_SHP#"
                           placeholder="0"
                           readonly
                           class="BGLightGray"
                           id="sumC23"
                          maxlength="11">
                    </div>
                  </div>
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                           name="apr30Total_Total_CashMatch"
                           value="#getDataAPR.apr30Total_Total_CashMatch#"
                           placeholder="0"
                           readonly
                           class="BGLightGray"
                           id="sumC24"
                          maxlength="11">
                    </div>
                  </div>
                </td>
                <td>
                  
                </td>
                <td>
                  <div class="row collapse">
                    <div class="small-3 large-2 columns">
                      <span class="prefix">&##36;</span>
                    </div>
                    <div class="small-9 large-10 columns">
                      <input type="text"
                           name="apr30Total_Total_Total"
                           value="#getDataAPR.apr30Total_Total_Total#"
                           placeholder="0"
                           readonly
                           class="BGLightGray"
                           id="sumC25"
                          maxlength="11">
                    </div>
                  </div>
                </td>
              </tr>
            </tbody>
       </table>
    </div>
  </div>

</cfoutput>