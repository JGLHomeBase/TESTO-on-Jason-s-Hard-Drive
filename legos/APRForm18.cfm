<!--- Set Variables --->
<cfset TargetTable = "DataAPR18">
<cfset UniqueID = "DataAPR18ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR18ID"
        Form = "dataapr18">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr18" formfields="aprID, inputUserID, projectID, reviewUserID, apr18_MentalIllness_Total, apr18_Alcohol_Total, apr18_Drug_Total, apr18_ChronicHealth_Total, apr18_HIV_Total, apr18_DevDisability_Total, apr18_PhysDisability_Total, apr18_MentalIllness_HHNC, apr18_Alcohol_HHNC, apr18_Drug_HHNC, apr18_ChronicHealth_HHNC, apr18_HIV_HHNC, apr18_DevDisability_HHNC, apr18_PhysDisability_HHNC, apr18_MentalIllness_HHWC, apr18_Alcohol_HHWC, apr18_Drug_HHWC, apr18_ChronicHealth_HHWC, apr18_HIV_HHWC, apr18_DevDisability_HHWC, apr18_PhysDisability_HHWC, apr18_MentalIllness_HHOC, apr18_Alcohol_HHOC, apr18_Drug_HHOC, apr18_ChronicHealth_HHOC, apr18_HIV_HHOC, apr18_DevDisability_HHOC, apr18_PhysDisability_HHOC, apr18_MentalIllness_HHU, apr18_Alcohol_HHU, apr18_Drug_HHU, apr18_ChronicHealth_HHU, apr18_HIV_HHU, apr18_DevDisability_HHU, apr18_PhysDisability_HHU, apr18_None_Total, apr18_1Condition_Total, apr18_2Conditions_Total, apr18_3PlusConditions_Total, apr18_Unknown_Total, apr18_DKR_Total, apr18_Missing_Total, apr18_Total, apr18_None_HHNC, apr18_None_HHWC, apr18_None_HHOC, apr18_None_HHU, apr18_1Condition_HHWC, apr18_1Condition_HHNC, apr18_1Condition_HHOC, apr18_1Condition_HHU, apr18_2Conditions_HHNC, apr18_2Conditions_HHWC, apr18_2Conditions_HHOC, apr18_2Conditions_HHU, apr18_3PlusConditions_HHWC, apr18_3PlusConditions_HHNC, apr18_3PlusConditions_HHOC, apr18_3PlusConditions_HHU, apr18_Unknown_HHOC, apr18_Unknown_HHNC, apr18_Unknown_HHWC, apr18_Unknown_HHU, apr18_DKR_HHNC, apr18_DKR_HHWC, apr18_DKR_HHOC, apr18_DKR_HHU, apr18_Missing_HHNC, apr18_Missing_HHWC, apr18_Missing_HHOC, apr18_Missing_HHU, apr18_Total_HHNC, apr18_Total_HHWC, apr18_Total_HHOC, apr18_Total_HHU">
  <cfelse>
    <cfset FORM.DataAPR18ID = newCheck.DataAPR18ID>

<!--- Set Defaults --->

<cfif form.apr18_MentalIllness_Total EQ "">
    <cfset form.apr18_MentalIllness_Total=0>
</cfif>
<cfif form.apr18_Alcohol_Total EQ "">
    <cfset form.apr18_Alcohol_Total=0>
</cfif>
<cfif form.apr18_Drug_Total EQ "">
    <cfset form.apr18_Drug_Total=0>
</cfif>
<cfif form.apr18_ChronicHealth_Total EQ "">
    <cfset form.apr18_ChronicHealth_Total=0>
</cfif>
<cfif form.apr18_HIV_Total EQ "">
    <cfset form.apr18_HIV_Total=0>
</cfif>
<cfif form.apr18_DevDisability_Total EQ "">
    <cfset form.apr18_DevDisability_Total=0>
</cfif>
<cfif form.apr18_PhysDisability_Total EQ "">
    <cfset form.apr18_PhysDisability_Total=0>
</cfif>
<cfif form.apr18_MentalIllness_HHNC EQ "">
    <cfset form.apr18_MentalIllness_HHNC=0>
</cfif>
<cfif form.apr18_Alcohol_HHNC EQ "">
    <cfset form.apr18_Alcohol_HHNC=0>
</cfif>
<cfif form.apr18_Drug_HHNC EQ "">
    <cfset form.apr18_Drug_HHNC=0>
</cfif>
<cfif form.apr18_ChronicHealth_HHNC EQ "">
    <cfset form.apr18_ChronicHealth_HHNC=0>
</cfif>
<cfif form.apr18_HIV_HHNC EQ "">
    <cfset form.apr18_HIV_HHNC=0>
</cfif>
<cfif form.apr18_DevDisability_HHNC EQ "">
    <cfset form.apr18_DevDisability_HHNC=0>
</cfif>
<cfif form.apr18_PhysDisability_HHNC EQ "">
    <cfset form.apr18_PhysDisability_HHNC=0>
</cfif>
<cfif form.apr18_MentalIllness_HHWC EQ "">
    <cfset form.apr18_MentalIllness_HHWC=0>
</cfif>
<cfif form.apr18_Alcohol_HHWC EQ "">
    <cfset form.apr18_Alcohol_HHWC=0>
</cfif>
<cfif form.apr18_Drug_HHWC EQ "">
    <cfset form.apr18_Drug_HHWC=0>
</cfif>
<cfif form.apr18_ChronicHealth_HHWC EQ "">
    <cfset form.apr18_ChronicHealth_HHWC=0>
</cfif>
<cfif form.apr18_HIV_HHWC EQ "">
    <cfset form.apr18_HIV_HHWC=0>
</cfif>
<cfif form.apr18_DevDisability_HHWC EQ "">
    <cfset form.apr18_DevDisability_HHWC=0>
</cfif>
<cfif form.apr18_PhysDisability_HHWC EQ "">
    <cfset form.apr18_PhysDisability_HHWC=0>
</cfif>
<cfif form.apr18_MentalIllness_HHOC EQ "">
    <cfset form.apr18_MentalIllness_HHOC=0>
</cfif>
<cfif form.apr18_Alcohol_HHOC EQ "">
    <cfset form.apr18_Alcohol_HHOC=0>
</cfif>
<cfif form.apr18_Drug_HHOC EQ "">
    <cfset form.apr18_Drug_HHOC=0>
</cfif>
<cfif form.apr18_ChronicHealth_HHOC EQ "">
    <cfset form.apr18_ChronicHealth_HHOC=0>
</cfif>
<cfif form.apr18_HIV_HHOC EQ "">
    <cfset form.apr18_HIV_HHOC=0>
</cfif>
<cfif form.apr18_DevDisability_HHOC EQ "">
    <cfset form.apr18_DevDisability_HHOC=0>
</cfif>
<cfif form.apr18_PhysDisability_HHOC EQ "">
    <cfset form.apr18_PhysDisability_HHOC=0>
</cfif>
<cfif form.apr18_MentalIllness_HHU EQ "">
    <cfset form.apr18_MentalIllness_HHU=0>
</cfif>
<cfif form.apr18_Alcohol_HHU EQ "">
    <cfset form.apr18_Alcohol_HHU=0>
</cfif>
<cfif form.apr18_Drug_HHU EQ "">
    <cfset form.apr18_Drug_HHU=0>
</cfif>
<cfif form.apr18_ChronicHealth_HHU EQ "">
    <cfset form.apr18_ChronicHealth_HHU=0>
</cfif>
<cfif form.apr18_HIV_HHU EQ "">
    <cfset form.apr18_HIV_HHU=0>
</cfif>
<cfif form.apr18_DevDisability_HHU EQ "">
    <cfset form.apr18_DevDisability_HHU=0>
</cfif>
<cfif form.apr18_PhysDisability_HHU EQ "">
    <cfset form.apr18_PhysDisability_HHU=0>
</cfif>
<cfif form.apr18_None_Total EQ "">
    <cfset form.apr18_None_Total=0>
</cfif>
<cfif form.apr18_1Condition_Total EQ "">
    <cfset form.apr18_1Condition_Total=0>
</cfif>
<cfif form.apr18_2Conditions_Total EQ "">
    <cfset form.apr18_2Conditions_Total=0>
</cfif>
<cfif form.apr18_3PlusConditions_Total EQ "">
    <cfset form.apr18_3PlusConditions_Total=0>
</cfif>
<cfif form.apr18_Unknown_Total EQ "">
    <cfset form.apr18_Unknown_Total=0>
</cfif>
<cfif form.apr18_DKR_Total EQ "">
    <cfset form.apr18_DKR_Total=0>
</cfif>
<cfif form.apr18_Missing_Total EQ "">
    <cfset form.apr18_Missing_Total=0>
</cfif>
<cfif form.apr18_Total EQ "">
    <cfset form.apr18_Total=0>
</cfif>
<cfif form.apr18_None_HHNC EQ "">
    <cfset form.apr18_None_HHNC=0>
</cfif>
<cfif form.apr18_None_HHWC EQ "">
    <cfset form.apr18_None_HHWC=0>
</cfif>
<cfif form.apr18_None_HHOC EQ "">
    <cfset form.apr18_None_HHOC=0>
</cfif>
<cfif form.apr18_None_HHU EQ "">
    <cfset form.apr18_None_HHU=0>
</cfif>
<cfif form.apr18_1Condition_HHWC EQ "">
    <cfset form.apr18_1Condition_HHWC=0>
</cfif>
<cfif form.apr18_1Condition_HHNC EQ "">
    <cfset form.apr18_1Condition_HHNC=0>
</cfif>
<cfif form.apr18_1Condition_HHOC EQ "">
    <cfset form.apr18_1Condition_HHOC=0>
</cfif>
<cfif form.apr18_1Condition_HHU EQ "">
    <cfset form.apr18_1Condition_HHU=0>
</cfif>
<cfif form.apr18_2Conditions_HHNC EQ "">
    <cfset form.apr18_2Conditions_HHNC=0>
</cfif>
<cfif form.apr18_2Conditions_HHWC EQ "">
    <cfset form.apr18_2Conditions_HHWC=0>
</cfif>
<cfif form.apr18_2Conditions_HHOC EQ "">
    <cfset form.apr18_2Conditions_HHOC=0>
</cfif>
<cfif form.apr18_2Conditions_HHU EQ "">
    <cfset form.apr18_2Conditions_HHU=0>
</cfif>
<cfif form.apr18_3PlusConditions_HHWC EQ "">
    <cfset form.apr18_3PlusConditions_HHWC=0>
</cfif>
<cfif form.apr18_3PlusConditions_HHNC EQ "">
    <cfset form.apr18_3PlusConditions_HHNC=0>
</cfif>
<cfif form.apr18_3PlusConditions_HHOC EQ "">
    <cfset form.apr18_3PlusConditions_HHOC=0>
</cfif>
<cfif form.apr18_3PlusConditions_HHU EQ "">
    <cfset form.apr18_3PlusConditions_HHU=0>
</cfif>
<cfif form.apr18_Unknown_HHOC EQ "">
    <cfset form.apr18_Unknown_HHOC=0>
</cfif>
<cfif form.apr18_Unknown_HHNC EQ "">
    <cfset form.apr18_Unknown_HHNC=0>
</cfif>
<cfif form.apr18_Unknown_HHWC EQ "">
    <cfset form.apr18_Unknown_HHWC=0>
</cfif>
<cfif form.apr18_Unknown_HHU EQ "">
    <cfset form.apr18_Unknown_HHU=0>
</cfif>
<cfif form.apr18_DKR_HHNC EQ "">
    <cfset form.apr18_DKR_HHNC=0>
</cfif>
<cfif form.apr18_DKR_HHWC EQ "">
    <cfset form.apr18_DKR_HHWC=0>
</cfif>
<cfif form.apr18_DKR_HHOC EQ "">
    <cfset form.apr18_DKR_HHOC=0>
</cfif>
<cfif form.apr18_DKR_HHU EQ "">
    <cfset form.apr18_DKR_HHU=0>
</cfif>
<cfif form.apr18_Missing_HHNC EQ "">
    <cfset form.apr18_Missing_HHNC=0>
</cfif>
<cfif form.apr18_Missing_HHWC EQ "">
    <cfset form.apr18_Missing_HHWC=0>
</cfif>
<cfif form.apr18_Missing_HHOC EQ "">
    <cfset form.apr18_Missing_HHOC=0>
</cfif>
<cfif form.apr18_Missing_HHU EQ "">
    <cfset form.apr18_Missing_HHU=0>
</cfif>
<cfif form.apr18_Total_HHNC EQ "">
    <cfset form.apr18_Total_HHNC=0>
</cfif>
<cfif form.apr18_Total_HHWC EQ "">
    <cfset form.apr18_Total_HHWC=0>
</cfif>
<cfif form.apr18_Total_HHOC EQ "">
    <cfset form.apr18_Total_HHOC=0>
</cfif>
<cfif form.apr18_Total_HHU EQ "">
    <cfset form.apr18_Total_HHU=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr18" formfields="DataAPR18ID, aprID, inputUserID, projectID, reviewUserID, apr18_MentalIllness_Total, apr18_Alcohol_Total, apr18_Drug_Total, apr18_ChronicHealth_Total, apr18_HIV_Total, apr18_DevDisability_Total, apr18_PhysDisability_Total, apr18_MentalIllness_HHNC, apr18_Alcohol_HHNC, apr18_Drug_HHNC, apr18_ChronicHealth_HHNC, apr18_HIV_HHNC, apr18_DevDisability_HHNC, apr18_PhysDisability_HHNC, apr18_MentalIllness_HHWC, apr18_Alcohol_HHWC, apr18_Drug_HHWC, apr18_ChronicHealth_HHWC, apr18_HIV_HHWC, apr18_DevDisability_HHWC, apr18_PhysDisability_HHWC, apr18_MentalIllness_HHOC, apr18_Alcohol_HHOC, apr18_Drug_HHOC, apr18_ChronicHealth_HHOC, apr18_HIV_HHOC, apr18_DevDisability_HHOC, apr18_PhysDisability_HHOC, apr18_MentalIllness_HHU, apr18_Alcohol_HHU, apr18_Drug_HHU, apr18_ChronicHealth_HHU, apr18_HIV_HHU, apr18_DevDisability_HHU, apr18_PhysDisability_HHU, apr18_None_Total, apr18_1Condition_Total, apr18_2Conditions_Total, apr18_3PlusConditions_Total, apr18_Unknown_Total, apr18_DKR_Total, apr18_Missing_Total, apr18_Total, apr18_None_HHNC, apr18_None_HHWC, apr18_None_HHOC, apr18_None_HHU, apr18_1Condition_HHWC, apr18_1Condition_HHNC, apr18_1Condition_HHOC, apr18_1Condition_HHU, apr18_2Conditions_HHNC, apr18_2Conditions_HHWC, apr18_2Conditions_HHOC, apr18_2Conditions_HHU, apr18_3PlusConditions_HHWC, apr18_3PlusConditions_HHNC, apr18_3PlusConditions_HHOC, apr18_3PlusConditions_HHU, apr18_Unknown_HHOC, apr18_Unknown_HHNC, apr18_Unknown_HHWC, apr18_Unknown_HHU, apr18_DKR_HHNC, apr18_DKR_HHWC, apr18_DKR_HHOC, apr18_DKR_HHU, apr18_Missing_HHNC, apr18_Missing_HHWC, apr18_Missing_HHOC, apr18_Missing_HHU, apr18_Total_HHNC, apr18_Total_HHWC, apr18_Total_HHOC, apr18_Total_HHU">
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
        Form = "dataapr18"
        Where = "thisProject">
<!---/ Get DataAPR --->       


<!--- Math --->
<cfset mathCols="5">
<cfset mathRows="14">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Known Physical and Mental Health Conditions at Entry</h3>
    <h4>Number of Persons in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>Mental Illness</td>
          <td>
            <input type="number"
                   name="apr18_MentalIllness_Total"
                   value="#getDataAPR.apr18_MentalIllness_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_MentalIllness_HHNC"
                   value="#getDataAPR.apr18_MentalIllness_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="1"
                  class="row1"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_MentalIllness_HHWC"
                   value="#getDataAPR.apr18_MentalIllness_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="2"
                  class="row1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_MentalIllness_HHOC"
                   value="#getDataAPR.apr18_MentalIllness_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="3"
                  class="row1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_MentalIllness_HHU"
                   value="#getDataAPR.apr18_MentalIllness_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="4"
                  class="row1">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Alcohol Abuse</td>
          <td>
            <input type="number"
                   name="apr18_Alcohol_Total"
                   value="#getDataAPR.apr18_Alcohol_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Alcohol_HHNC"
                   value="#getDataAPR.apr18_Alcohol_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="5"
                  class="row2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Alcohol_HHWC"
                   value="#getDataAPR.apr18_Alcohol_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="6"
                  class="row2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Alcohol_HHOC"
                   value="#getDataAPR.apr18_Alcohol_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="7"
                  class="row2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Alcohol_HHU"
                   value="#getDataAPR.apr18_Alcohol_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="8"
                  class="row2">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Drug Abuse</td>
          <td>
            <input type="number"
                   name="apr18_Drug_Total"
                   value="#getDataAPR.apr18_Drug_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Drug_HHNC"
                   value="#getDataAPR.apr18_Drug_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="9"
                  class="row3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Drug_HHWC"
                   value="#getDataAPR.apr18_Drug_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="10"
                  class="row3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                  name="apr18_Drug_HHOC"
                   value="#getDataAPR.apr18_Drug_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="11"
                  class="row3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Drug_HHU"
                   value="#getDataAPR.apr18_Drug_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="12"
                  class="row3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Chronic Health Condition</td>
          <td>
            <input type="number"
                   name="apr18_ChronicHealth_Total"
                   value="#getDataAPR.apr18_ChronicHealth_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_ChronicHealth_HHNC"
                   value="#getDataAPR.apr18_ChronicHealth_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="13"
                  class="row4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_ChronicHealth_HHWC"
                   value="#getDataAPR.apr18_ChronicHealth_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="14"
                  class="row4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                     name="apr18_ChronicHealth_HHOC"
                     value="#getDataAPR.apr18_ChronicHealth_HHOC#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11"
                    tabindex="15"
                    class="row4">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_ChronicHealth_HHU"
                   value="#getDataAPR.apr18_ChronicHealth_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="16"
                  class="row4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>HIV/AIDS and Related Diseases</td>
          <td>
            <input type="number"
                   name="apr18_HIV_Total"
                   value="#getDataAPR.apr18_HIV_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR5"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_HIV_HHNC"
                   value="#getDataAPR.apr18_HIV_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="17"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_HIV_HHWC"
                   value="#getDataAPR.apr18_HIV_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="18"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_HIV_HHOC"
                   value="#getDataAPR.apr18_HIV_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="19"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                    name="apr18_HIV_HHU"
                   value="#getDataAPR.apr18_HIV_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="20"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Developmental Disability</td>
          <td>
            <input type="number"
                   name="apr18_DevDisability_Total"
                   value="#getDataAPR.apr18_DevDisability_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR6">
          </td>
          <td>
            <input type="number"
                   name="apr18_DevDisability_HHNC"
                   value="#getDataAPR.apr18_DevDisability_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="21"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DevDisability_HHWC"
                   value="#getDataAPR.apr18_DevDisability_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="22"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DevDisability_HHOC"
                   value="#getDataAPR.apr18_DevDisability_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="23"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DevDisability_HHU"
                   value="#getDataAPR.apr18_DevDisability_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="24"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Physical Disability</td>
          <td>
            <input type="number"
                   name="apr18_PhysDisability_Total"
                   value="#getDataAPR.apr18_PhysDisability_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR7">
          </td>
          <td>
            <input type="number"
                   name="apr18_PhysDisability_HHNC"
                   value="#getDataAPR.apr18_PhysDisability_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="25"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_PhysDisability_HHWC"
                   value="#getDataAPR.apr18_PhysDisability_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="26"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_PhysDisability_HHOC"
                   value="#getDataAPR.apr18_PhysDisability_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="27"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                 name="apr18_PhysDisability_HHU"
                 value="#getDataAPR.apr18_PhysDisability_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                tabindex="28"
                class="row7">
          <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Number of Known Conditions</h3>
    <h4>Number of Persons in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>None</td>
          <td>
            <input type="number"
                   name="apr18_None_Total"
                   value="#getDataAPR.apr18_None_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_None_HHNC"
                   value="#getDataAPR.apr18_None_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="29"
                  class="row8 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                 name="apr18_None_HHWC"
                 value="#getDataAPR.apr18_None_HHWC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                tabindex="30"
                class="row8 col3">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_None_HHOC"
                   value="#getDataAPR.apr18_None_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="31"
                  class="row8 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_None_HHU"
                   value="#getDataAPR.apr18_None_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="32"
                  class="row8 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>1 Condition</td>
          <td>
            <input type="number"
                   name="apr18_1Condition_Total"
                   value="#getDataAPR.apr18_1Condition_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_1Condition_HHNC"
                   value="#getDataAPR.apr18_1Condition_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="33"
                  class="row9 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_1Condition_HHWC"
                   value="#getDataAPR.apr18_1Condition_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="34"
                  class="row9 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_1Condition_HHOC"
                   value="#getDataAPR.apr18_1Condition_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="35"
                  class="row9 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_1Condition_HHU"
                   value="#getDataAPR.apr18_1Condition_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="36"
                  class="row9 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>2 Conditions </td>
          <td>
            <input type="number"
                   name="apr18_2Conditions_Total"
                   value="#getDataAPR.apr18_2Conditions_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_2Conditions_HHNC"
                   value="#getDataAPR.apr18_2Conditions_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="37"
                  class="row10 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_2Conditions_HHWC"
                   value="#getDataAPR.apr18_2Conditions_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="38"
                  class="row10 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_2Conditions_HHOC"
                   value="#getDataAPR.apr18_2Conditions_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="39"
                  class="row10 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_2Conditions_HHU"
                   value="#getDataAPR.apr18_2Conditions_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="40"
                  class="row10 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>3+ Conditions</td>
          <td>
            <input type="number"
                   name="apr18_3PlusConditions_Total"
                   value="#getDataAPR.apr18_3PlusConditions_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR11">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr18_3PlusConditions_HHNC"
                     value="#getDataAPR.apr18_3PlusConditions_HHNC#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11"
                    tabindex="41"
                    class="row11 col2">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_3PlusConditions_HHWC"
                   value="#getDataAPR.apr18_3PlusConditions_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="42"
                  class="row11 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_3PlusConditions_HHOC"
                   value="#getDataAPR.apr18_3PlusConditions_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="43"
                  class="row11 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_3PlusConditions_HHU"
                   value="#getDataAPR.apr18_3PlusConditions_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="44"
                  class="row11 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Condition Unknown</td>
          <td>
            <input type="number"
                   name="apr18_Unknown_Total"
                   value="#getDataAPR.apr18_Unknown_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR12">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Unknown_HHNC"
                   value="#getDataAPR.apr18_Unknown_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="45"
                  class="row12 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Unknown_HHWC"
                   value="#getDataAPR.apr18_Unknown_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="46"
                  class="row12 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Unknown_HHOC"
                   value="#getDataAPR.apr18_Unknown_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="47"
                  class="row12 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Unknown_HHU"
                   value="#getDataAPR.apr18_Unknown_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="48"
                  class="row12 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr18_DKR_Total"
                   value="#getDataAPR.apr18_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR13">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DKR_HHNC"
                   value="#getDataAPR.apr18_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="49"
                  class="row13 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DKR_HHWC"
                   value="#getDataAPR.apr18_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="50"
                  class="row13 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DKR_HHOC"
                   value="#getDataAPR.apr18_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="51"
                  class="row13 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_DKR_HHU"
                   value="#getDataAPR.apr18_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="52"
                  class="row13 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing </td>
          <td>
            <input type="number"
                   name="apr18_Missing_Total"
                   value="#getDataAPR.apr18_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR14">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Missing_HHNC"
                   value="#getDataAPR.apr18_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="53"
                  class="row14 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Missing_HHWC"
                   value="#getDataAPR.apr18_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="54"
                  class="row14 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Missing_HHOC"
                   value="#getDataAPR.apr18_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="55"
                  class="row14 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Missing_HHU"
                   value="#getDataAPR.apr18_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="56"
                  class="row14 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                   name="apr18_Total"
                   value="#getDataAPR.apr18_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="subtotal_persons BGLightGray"
                  id="sumC1">
            
          </td>
          <td>
            <input type="number"
                   name="apr18_Total_HHNC"
                   value="#getDataAPR.apr18_Total_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Total_HHWC"
                   value="#getDataAPR.apr18_Total_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Total_HHOC"
                   value="#getDataAPR.apr18_Total_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="subtotal_children BGLightGray"
                  id="sumC4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr18_Total_HHU"
                   value="#getDataAPR.apr18_Total_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   readonly
                  class="BGLightGray"
                  id="sumC5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
    <cfset nexttab = "57">
  </div>
</div>
</cfoutput>