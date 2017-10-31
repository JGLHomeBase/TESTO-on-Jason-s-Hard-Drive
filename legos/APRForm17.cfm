<!--- Set Variables --->
<cfset TargetTable = "DataAPR17">
<cfset UniqueID = "DataAPR17ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR17ID"
        Form = "dataapr17">
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
   <cfinsert datasource="#DataSource#" tablename="dataapr17" formfields="aprID, inputUserID, projectID, reviewUserID, apr17Ethnicity_NonHispanic_Total, apr17Ethnicity_Hispanic_Total, apr17Ethnicity_DKR_Total, apr17Ethnicity_Missing_Total, apr17Ethnicity_Total, apr17Ethnicity_NonHispanic_HHNC, apr17Ethnicity_NonHispanic_HHWC, apr17Ethnicity_NonHispanic_HHOC, apr17Ethnicity_NonHispanic_HHU, apr17Ethnicity_Hispanic_HHWC, apr17Ethnicity_Hispanic_HHNC, apr17Ethnicity_Hispanic_HHOC, apr17Ethnicity_Hispanic_HHU, apr17Ethnicity_DKR_HHNC, apr17Ethnicity_DKR_HHWC, apr17Ethnicity_DKR_HHOC, apr17Ethnicity_DKR_HHU, apr17Ethnicity_Missing_HHNC, apr17Ethnicity_Missing_HHWC, apr17Ethnicity_Missing_HHOC, apr17Ethnicity_Missing_HHU, apr17Ethnicity_Total_HHNC, apr17Ethnicity_Total_HHWC, apr17Ethnicity_Total_HHOC, apr17Ethnicity_Total_HHU, apr17Race_White_Total, apr17Race_Black_Total, apr17Race_Asian_Total, apr17Race_AmerIndian_Total, apr17Race_Hawaiian_Total, apr17Race_Multiple_Total, apr17Race_DKR_Total, apr17Race_Missing_Total, apr17Race_Total, apr17Race_White_HHNC, apr17Race_White_HHWC, apr17Race_White_HHOC, apr17Race_White_HHU, apr17Race_Black_HHNC, apr17Race_Black_HHWC, apr17Race_Black_HHOC, apr17Race_Black_HHU, apr17Race_Asian_HHOC, apr17Race_Asian_HHNC, apr17Race_Asian_HHWC, apr17Race_Asian_HHU, apr17Race_AmerIndian_HHWC, apr17Race_AmerIndian_HHOC, apr17Race_AmerIndian_HHNC, apr17Race_AmerIndian_HHU, apr17Race_Hawaiian_HHOC, apr17Race_Hawaiian_HHNC, apr17Race_Hawaiian_HHWC, apr17Race_Hawaiian_HHU, apr17Race_Multiple_HHWC, apr17Race_Multiple_HHOC, apr17Race_Multiple_HHNC, apr17Race_Multiple_HHU, apr17Race_DKR_HHOC, apr17Race_DKR_HHNC, apr17Race_DKR_HHWC, apr17Race_DKR_HHU, apr17Race_Missing_HHOC, apr17Race_Missing_HHWC, apr17Race_Missing_HHNC, apr17Race_Missing_HHU, apr17Race_Total_HHNC, apr17Race_Total_HHWC, apr17Race_Total_HHOC, apr17Race_Total_HHU">
  <cfelse>
    <cfset FORM.DataAPR17ID = newCheck.DataAPR17ID>

<!--- Set Defaults --->

<cfif form.apr17Ethnicity_NonHispanic_Total EQ "">
    <cfset form.apr17Ethnicity_NonHispanic_Total=0>
</cfif>
<cfif form.apr17Ethnicity_Hispanic_Total EQ "">
    <cfset form.apr17Ethnicity_Hispanic_Total=0>
</cfif>
<cfif form.apr17Ethnicity_DKR_Total EQ "">
    <cfset form.apr17Ethnicity_DKR_Total=0>
</cfif>
<cfif form.apr17Ethnicity_Missing_Total EQ "">
    <cfset form.apr17Ethnicity_Missing_Total=0>
</cfif>
<cfif form.apr17Ethnicity_Total EQ "">
    <cfset form.apr17Ethnicity_Total=0>
</cfif>
<cfif form.apr17Ethnicity_NonHispanic_HHNC EQ "">
    <cfset form.apr17Ethnicity_NonHispanic_HHNC=0>
</cfif>
<cfif form.apr17Ethnicity_NonHispanic_HHWC EQ "">
    <cfset form.apr17Ethnicity_NonHispanic_HHWC=0>
</cfif>
<cfif form.apr17Ethnicity_NonHispanic_HHOC EQ "">
    <cfset form.apr17Ethnicity_NonHispanic_HHOC=0>
</cfif>
<cfif form.apr17Ethnicity_NonHispanic_HHU EQ "">
    <cfset form.apr17Ethnicity_NonHispanic_HHU=0>
</cfif>
<cfif form.apr17Ethnicity_Hispanic_HHWC EQ "">
    <cfset form.apr17Ethnicity_Hispanic_HHWC=0>
</cfif>
<cfif form.apr17Ethnicity_Hispanic_HHNC EQ "">
    <cfset form.apr17Ethnicity_Hispanic_HHNC=0>
</cfif>
<cfif form.apr17Ethnicity_Hispanic_HHOC EQ "">
    <cfset form.apr17Ethnicity_Hispanic_HHOC=0>
</cfif>
<cfif form.apr17Ethnicity_Hispanic_HHU EQ "">
    <cfset form.apr17Ethnicity_Hispanic_HHU=0>
</cfif>
<cfif form.apr17Ethnicity_DKR_HHNC EQ "">
    <cfset form.apr17Ethnicity_DKR_HHNC=0>
</cfif>
<cfif form.apr17Ethnicity_DKR_HHWC EQ "">
    <cfset form.apr17Ethnicity_DKR_HHWC=0>
</cfif>
<cfif form.apr17Ethnicity_DKR_HHOC EQ "">
    <cfset form.apr17Ethnicity_DKR_HHOC=0>
</cfif>
<cfif form.apr17Ethnicity_DKR_HHU EQ "">
    <cfset form.apr17Ethnicity_DKR_HHU=0>
</cfif>
<cfif form.apr17Ethnicity_Missing_HHNC EQ "">
    <cfset form.apr17Ethnicity_Missing_HHNC=0>
</cfif>
<cfif form.apr17Ethnicity_Missing_HHWC EQ "">
    <cfset form.apr17Ethnicity_Missing_HHWC=0>
</cfif>
<cfif form.apr17Ethnicity_Missing_HHOC EQ "">
    <cfset form.apr17Ethnicity_Missing_HHOC=0>
</cfif>
<cfif form.apr17Ethnicity_Missing_HHU EQ "">
    <cfset form.apr17Ethnicity_Missing_HHU=0>
</cfif>
<cfif form.apr17Ethnicity_Total_HHNC EQ "">
    <cfset form.apr17Ethnicity_Total_HHNC=0>
</cfif>
<cfif form.apr17Ethnicity_Total_HHWC EQ "">
    <cfset form.apr17Ethnicity_Total_HHWC=0>
</cfif>
<cfif form.apr17Ethnicity_Total_HHOC EQ "">
    <cfset form.apr17Ethnicity_Total_HHOC=0>
</cfif>
<cfif form.apr17Ethnicity_Total_HHU EQ "">
    <cfset form.apr17Ethnicity_Total_HHU=0>
</cfif>
<cfif form.apr17Race_White_Total EQ "">
    <cfset form.apr17Race_White_Total=0>
</cfif>
<cfif form.apr17Race_Black_Total EQ "">
    <cfset form.apr17Race_Black_Total=0>
</cfif>
<cfif form.apr17Race_Asian_Total EQ "">
    <cfset form.apr17Race_Asian_Total=0>
</cfif>
<cfif form.apr17Race_AmerIndian_Total EQ "">
    <cfset form.apr17Race_AmerIndian_Total=0>
</cfif>
<cfif form.apr17Race_Hawaiian_Total EQ "">
    <cfset form.apr17Race_Hawaiian_Total=0>
</cfif>
<cfif form.apr17Race_Multiple_Total EQ "">
    <cfset form.apr17Race_Multiple_Total=0>
</cfif>
<cfif form.apr17Race_DKR_Total EQ "">
    <cfset form.apr17Race_DKR_Total=0>
</cfif>
<cfif form.apr17Race_Missing_Total EQ "">
    <cfset form.apr17Race_Missing_Total=0>
</cfif>
<cfif form.apr17Race_Total EQ "">
    <cfset form.apr17Race_Total=0>
</cfif>
<cfif form.apr17Race_White_HHNC EQ "">
    <cfset form.apr17Race_White_HHNC=0>
</cfif>
<cfif form.apr17Race_White_HHWC EQ "">
    <cfset form.apr17Race_White_HHWC=0>
</cfif>
<cfif form.apr17Race_White_HHOC EQ "">
    <cfset form.apr17Race_White_HHOC=0>
</cfif>
<cfif form.apr17Race_White_HHU EQ "">
    <cfset form.apr17Race_White_HHU=0>
</cfif>
<cfif form.apr17Race_Black_HHNC EQ "">
    <cfset form.apr17Race_Black_HHNC=0>
</cfif>
<cfif form.apr17Race_Black_HHWC EQ "">
    <cfset form.apr17Race_Black_HHWC=0>
</cfif>
<cfif form.apr17Race_Black_HHOC EQ "">
    <cfset form.apr17Race_Black_HHOC=0>
</cfif>
<cfif form.apr17Race_Black_HHU EQ "">
    <cfset form.apr17Race_Black_HHU=0>
</cfif>
<cfif form.apr17Race_Asian_HHOC EQ "">
    <cfset form.apr17Race_Asian_HHOC=0>
</cfif>
<cfif form.apr17Race_Asian_HHNC EQ "">
    <cfset form.apr17Race_Asian_HHNC=0>
</cfif>
<cfif form.apr17Race_Asian_HHWC EQ "">
    <cfset form.apr17Race_Asian_HHWC=0>
</cfif>
<cfif form.apr17Race_Asian_HHU EQ "">
    <cfset form.apr17Race_Asian_HHU=0>
</cfif>
<cfif form.apr17Race_AmerIndian_HHWC EQ "">
    <cfset form.apr17Race_AmerIndian_HHWC=0>
</cfif>
<cfif form.apr17Race_AmerIndian_HHOC EQ "">
    <cfset form.apr17Race_AmerIndian_HHOC=0>
</cfif>
<cfif form.apr17Race_AmerIndian_HHNC EQ "">
    <cfset form.apr17Race_AmerIndian_HHNC=0>
</cfif>
<cfif form.apr17Race_AmerIndian_HHU EQ "">
    <cfset form.apr17Race_AmerIndian_HHU=0>
</cfif>
<cfif form.apr17Race_Hawaiian_HHOC EQ "">
    <cfset form.apr17Race_Hawaiian_HHOC=0>
</cfif>
<cfif form.apr17Race_Hawaiian_HHNC EQ "">
    <cfset form.apr17Race_Hawaiian_HHNC=0>
</cfif>
<cfif form.apr17Race_Hawaiian_HHWC EQ "">
    <cfset form.apr17Race_Hawaiian_HHWC=0>
</cfif>
<cfif form.apr17Race_Hawaiian_HHU EQ "">
    <cfset form.apr17Race_Hawaiian_HHU=0>
</cfif>
<cfif form.apr17Race_Multiple_HHWC EQ "">
    <cfset form.apr17Race_Multiple_HHWC=0>
</cfif>
<cfif form.apr17Race_Multiple_HHOC EQ "">
    <cfset form.apr17Race_Multiple_HHOC=0>
</cfif>
<cfif form.apr17Race_Multiple_HHNC EQ "">
    <cfset form.apr17Race_Multiple_HHNC=0>
</cfif>
<cfif form.apr17Race_Multiple_HHU EQ "">
    <cfset form.apr17Race_Multiple_HHU=0>
</cfif>
<cfif form.apr17Race_DKR_HHOC EQ "">
    <cfset form.apr17Race_DKR_HHOC=0>
</cfif>
<cfif form.apr17Race_DKR_HHNC EQ "">
    <cfset form.apr17Race_DKR_HHNC=0>
</cfif>
<cfif form.apr17Race_DKR_HHWC EQ "">
    <cfset form.apr17Race_DKR_HHWC=0>
</cfif>
<cfif form.apr17Race_DKR_HHU EQ "">
    <cfset form.apr17Race_DKR_HHU=0>
</cfif>
<cfif form.apr17Race_Missing_HHOC EQ "">
    <cfset form.apr17Race_Missing_HHOC=0>
</cfif>
<cfif form.apr17Race_Missing_HHWC EQ "">
    <cfset form.apr17Race_Missing_HHWC=0>
</cfif>
<cfif form.apr17Race_Missing_HHNC EQ "">
    <cfset form.apr17Race_Missing_HHNC=0>
</cfif>
<cfif form.apr17Race_Missing_HHU EQ "">
    <cfset form.apr17Race_Missing_HHU=0>
</cfif>
<cfif form.apr17Race_Total_HHNC EQ "">
    <cfset form.apr17Race_Total_HHNC=0>
</cfif>
<cfif form.apr17Race_Total_HHWC EQ "">
    <cfset form.apr17Race_Total_HHWC=0>
</cfif>
<cfif form.apr17Race_Total_HHOC EQ "">
    <cfset form.apr17Race_Total_HHOC=0>
</cfif>
<cfif form.apr17Race_Total_HHU EQ "">
    <cfset form.apr17Race_Total_HHU=0>
</cfif>

<!---/ Set Defaults --->

   <cfupdate datasource="#DataSource#" tablename="dataapr17" formfields="DataAPR17ID, aprID, inputUserID, projectID, reviewUserID, apr17Ethnicity_NonHispanic_Total, apr17Ethnicity_Hispanic_Total, apr17Ethnicity_DKR_Total, apr17Ethnicity_Missing_Total, apr17Ethnicity_Total, apr17Ethnicity_NonHispanic_HHNC, apr17Ethnicity_NonHispanic_HHWC, apr17Ethnicity_NonHispanic_HHOC, apr17Ethnicity_NonHispanic_HHU, apr17Ethnicity_Hispanic_HHWC, apr17Ethnicity_Hispanic_HHNC, apr17Ethnicity_Hispanic_HHOC, apr17Ethnicity_Hispanic_HHU, apr17Ethnicity_DKR_HHNC, apr17Ethnicity_DKR_HHWC, apr17Ethnicity_DKR_HHOC, apr17Ethnicity_DKR_HHU, apr17Ethnicity_Missing_HHNC, apr17Ethnicity_Missing_HHWC, apr17Ethnicity_Missing_HHOC, apr17Ethnicity_Missing_HHU, apr17Ethnicity_Total_HHNC, apr17Ethnicity_Total_HHWC, apr17Ethnicity_Total_HHOC, apr17Ethnicity_Total_HHU, apr17Race_White_Total, apr17Race_Black_Total, apr17Race_Asian_Total, apr17Race_AmerIndian_Total, apr17Race_Hawaiian_Total, apr17Race_Multiple_Total, apr17Race_DKR_Total, apr17Race_Missing_Total, apr17Race_Total, apr17Race_White_HHNC, apr17Race_White_HHWC, apr17Race_White_HHOC, apr17Race_White_HHU, apr17Race_Black_HHNC, apr17Race_Black_HHWC, apr17Race_Black_HHOC, apr17Race_Black_HHU, apr17Race_Asian_HHOC, apr17Race_Asian_HHNC, apr17Race_Asian_HHWC, apr17Race_Asian_HHU, apr17Race_AmerIndian_HHWC, apr17Race_AmerIndian_HHOC, apr17Race_AmerIndian_HHNC, apr17Race_AmerIndian_HHU, apr17Race_Hawaiian_HHOC, apr17Race_Hawaiian_HHNC, apr17Race_Hawaiian_HHWC, apr17Race_Hawaiian_HHU, apr17Race_Multiple_HHWC, apr17Race_Multiple_HHOC, apr17Race_Multiple_HHNC, apr17Race_Multiple_HHU, apr17Race_DKR_HHOC, apr17Race_DKR_HHNC, apr17Race_DKR_HHWC, apr17Race_DKR_HHU, apr17Race_Missing_HHOC, apr17Race_Missing_HHWC, apr17Race_Missing_HHNC, apr17Race_Missing_HHU, apr17Race_Total_HHNC, apr17Race_Total_HHWC, apr17Race_Total_HHOC, apr17Race_Total_HHU">
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
        Form = "dataapr17"
        Where = "thisProject">
<!---/ Get DataAPR --->       

<!--- Math --->
<cfset mathCols="10">
<cfset mathRows="12">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Ethnicity</h3>
    <h4>Number of Persons in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>Non-Hispanic/Non-Latino</td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_NonHispanic_Total"
                   value="#getDataAPR.apr17Ethnicity_NonHispanic_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                         name="apr17Ethnicity_NonHispanic_HHNC"
                         value="#getDataAPR.apr17Ethnicity_NonHispanic_HHNC#"
                         placeholder="0"
                         min="0"
                   step="1"
                        maxlength="11"
                        tabindex="1"
                        class="row1 col2"
                        autofocus>
                  <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr17Ethnicity_NonHispanic_HHWC"
                     value="#getDataAPR.apr17Ethnicity_NonHispanic_HHWC#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11"
                    tabindex="2"
                    class="row1 col3">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr17Ethnicity_NonHispanic_HHOC"
                     value="#getDataAPR.apr17Ethnicity_NonHispanic_HHOC#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11"
                    tabindex="3"
                    class="row1 col4">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_NonHispanic_HHU"
                   value="#getDataAPR.apr17Ethnicity_NonHispanic_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="4"
                   class="row1 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Hispanic/Latino</td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Hispanic_Total"
                   value="#getDataAPR.apr17Ethnicity_Hispanic_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr17Ethnicity_Hispanic_HHNC"
                     value="#getDataAPR.apr17Ethnicity_Hispanic_HHNC#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11"
                    tabindex="5"
                     class="row2 col2">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Hispanic_HHWC"
                   value="#getDataAPR.apr17Ethnicity_Hispanic_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="6"
                   class="row2 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Hispanic_HHOC"
                   value="#getDataAPR.apr17Ethnicity_Hispanic_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="7"
                   class="row2 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Hispanic_HHU"
                   value="#getDataAPR.apr17Ethnicity_Hispanic_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="8"
                   class="row2 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_DKR_Total"
                   value="#getDataAPR.apr17Ethnicity_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_DKR_HHNC"
                   value="#getDataAPR.apr17Ethnicity_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="9"
                  class="row3 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_DKR_HHWC"
                   value="#getDataAPR.apr17Ethnicity_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="10"
                  class="row3 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_DKR_HHOC"
                   value="#getDataAPR.apr17Ethnicity_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="11"
                  class="row3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_DKR_HHU"
                   value="#getDataAPR.apr17Ethnicity_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="12"
                  class="row3 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Missing_Total"
                   value="#getDataAPR.apr17Ethnicity_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Missing_HHNC"
                   value="#getDataAPR.apr17Ethnicity_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="13"
                  class="row4 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Missing_HHWC"
                   value="#getDataAPR.apr17Ethnicity_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="14"
                  class="row4 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Missing_HHOC"
                   value="#getDataAPR.apr17Ethnicity_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="15"
                  class="row4 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Missing_HHU"
                   value="#getDataAPR.apr17Ethnicity_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="16"
                  class="row4 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                   name="apr17Ethnicity_Total"
                   value="#getDataAPR.apr17Ethnicity_Total#"
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
                   name="apr17Ethnicity_Total_HHNC"
                   value="#getDataAPR.apr17Ethnicity_Total_HHNC#"
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
                   name="apr17Ethnicity_Total_HHWC"
                   value="#getDataAPR.apr17Ethnicity_Total_HHWC#"
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
                   name="apr17Ethnicity_Total_HHOC"
                   value="#getDataAPR.apr17Ethnicity_Total_HHOC#"
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
                   name="apr17Ethnicity_Total_HHU"
                   value="#getDataAPR.apr17Ethnicity_Total_HHU#"
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
  </div>
</div>
<div class="row">
  <div class="large-12 columns">
    <h3>Race</h3>
    <h4>Number of Persons in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>White</td>
          <td>
            <input type="number"
                   name="apr17Race_White_Total"
                   value="#getDataAPR.apr17Race_White_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col6 BGLightGray"
                  id="sumR5">
            <small class="form-error">Must be a whole number</small>
                      </td>
          <td>
            <input type="number"
                   name="apr17Race_White_HHNC"
                   value="#getDataAPR.apr17Race_White_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="17"
                  class="row5 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_White_HHWC"
                   value="#getDataAPR.apr17Race_White_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="18"
                  class="row5 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_White_HHOC"
                   value="#getDataAPR.apr17Race_White_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="19"
                  class="row5 col9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_White_HHU"
                   value="#getDataAPR.apr17Race_White_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="20"
                  class="row5 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Black or African- American</td>
          <td>
            <input type="number"
                   name="apr17Race_Black_Total"
                   value="#getDataAPR.apr17Race_Black_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   readonly
                  class="col6 BGLightGray"
                  id="sumR6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Black_HHNC"
                   value="#getDataAPR.apr17Race_Black_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="21"
                  class="row6 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Black_HHWC"
                   value="#getDataAPR.apr17Race_Black_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="22"
                  class="row6 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Black_HHOC"
                   value="#getDataAPR.apr17Race_Black_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="23"
                  class="row6 col9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Black_HHU"
                   value="#getDataAPR.apr17Race_Black_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="24"
                  class="row6 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Asian</td>
          <td>
            <input type="number"
                   name="apr17Race_Asian_Total"
                   value="#getDataAPR.apr17Race_Asian_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col6 BGLightGray"
                  id="sumR7">
            <small class="form-error">Must be a whole number</small>
          </td>
           <td>
            <input type="number"
                   name="apr17Race_Asian_HHNC"
                   value="#getDataAPR.apr17Race_Asian_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="25"
                  class="row7 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Asian_HHWC"
                   value="#getDataAPR.apr17Race_Asian_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="26"
                  class="row7 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Asian_HHOC"
                   value="#getDataAPR.apr17Race_Asian_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"    
                  maxlength="11"
                  tabindex="27"
                  class="row7 col9">
            <small class="form-error">Must be a whole number</small>
         </td>
          <td>
            <input type="number"
                   name="apr17Race_Asian_HHU"
                   value="#getDataAPR.apr17Race_Asian_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="28"
                  class="row7 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>American Indian or Alaska Native</td>
          <td>
            <input type="number"
                 name="apr17Race_AmerIndian_Total"
                 value="#getDataAPR.apr17Race_AmerIndian_Total#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                readonly
                class="col6 BGLightGray"
                id="sumR8">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                 name="apr17Race_AmerIndian_HHNC"
                 value="#getDataAPR.apr17Race_AmerIndian_HHNC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                tabindex="29"
                class="row8 col7">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_AmerIndian_HHWC"
                   value="#getDataAPR.apr17Race_AmerIndian_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="30"
                  class="row8 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_AmerIndian_HHOC"
                   value="#getDataAPR.apr17Race_AmerIndian_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="31"
                  class="row8 col9">
            <small class="form-error">Must be a whole number</small>
          </td>
          
          <td>
            <input type="number"
                   name="apr17Race_AmerIndian_HHU"
                   value="#getDataAPR.apr17Race_AmerIndian_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="32"
                  class="row8 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Native Hawaiian or Other Pacific Islander</td>
          <td>
            <input type="number"
                   name="apr17Race_Hawaiian_Total"
                   value="#getDataAPR.apr17Race_Hawaiian_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                class="col6 BGLightGray"
                id="sumR9">
            <small class="form-error">Must be a whole number</small>
          </td>
           <td>
            <input type="number"
                   name="apr17Race_Hawaiian_HHNC"
                   value="#getDataAPR.apr17Race_Hawaiian_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="33"
                  class="row9 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Hawaiian_HHWC"
                   value="#getDataAPR.apr17Race_Hawaiian_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="34"
                  class="row9 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Hawaiian_HHOC"
                   value="#getDataAPR.apr17Race_Hawaiian_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="35"
                  class="row9 col9">
            <small class="form-error">Must be a whole number</small>
          </td>
         
          <td>
            <input type="number"
                   name="apr17Race_Hawaiian_HHU"
                   value="#getDataAPR.apr17Race_Hawaiian_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="36"
                  class="row9 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Multiple Races</td>
          <td>
            <input type="number"
                   name="apr17Race_Multiple_Total"
                   value="#getDataAPR.apr17Race_Multiple_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                class="col6 BGLightGray"
                id="sumR10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Multiple_HHNC"
                   value="#getDataAPR.apr17Race_Multiple_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="37"
                  class="row10 col7">
            <small class="form-error">Must be a whole number</small>
            </td>
          <td>
            <input type="number"
                   name="apr17Race_Multiple_HHWC"
                   value="#getDataAPR.apr17Race_Multiple_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="38"
                  class="row10 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Multiple_HHOC"
                   value="#getDataAPR.apr17Race_Multiple_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="39"
                  class="row10 col9">
            <small class="form-error">Must be a whole number</small>
          </td>
          
          <td>
            <input type="number"
                   name="apr17Race_Multiple_HHU"
                   value="#getDataAPR.apr17Race_Multiple_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="40"
                  class="row10 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused </td>
          <td>
            <input type="number"
                   name="apr17Race_DKR_Total"
                   value="#getDataAPR.apr17Race_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                class="col6 BGLightGray"
                id="sumR11">
            <small class="form-error">Must be a whole number</small>
          </td>
          
          <td>
            <input type="number"
                   name="apr17Race_DKR_HHNC"
                   value="#getDataAPR.apr17Race_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="41"
                  class="row11 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_DKR_HHWC"
                   value="#getDataAPR.apr17Race_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="42"
                  class="row11 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                 name="apr17Race_DKR_HHOC"
                 value="#getDataAPR.apr17Race_DKR_HHOC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                tabindex="43"
                class="row11 col9">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_DKR_HHU"
                   value="#getDataAPR.apr17Race_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="44"
                  class="row11 col10">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr17Race_Missing_Total"
                   value="#getDataAPR.apr17Race_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col6 BGLightGray"
                  id="sumR12">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Missing_HHNC"
                   value="#getDataAPR.apr17Race_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="45"
                  class="row12 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Missing_HHWC"
                   value="#getDataAPR.apr17Race_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="46"
                  class="row12 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Missing_HHOC"
                   value="#getDataAPR.apr17Race_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="47"
                  class="row12 col9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Missing_HHU"
                   value="#getDataAPR.apr17Race_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="48"
                  class="row12 col10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                name="apr17Race_Total"
                value="#getDataAPR.apr17Race_Total#"
                placeholder="0"
                min="0"
                step="1"
                maxlength="11"
                readonly
                class="subtotal_persons BGLightGray"
                id="sumC6">
          
            </td>
          <td>
            <input type="number"
                   name="apr17Race_Total_HHNC"
                   value="#getDataAPR.apr17Race_Total_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC7">
            <small class="form-error">Must be a whole number</small>
           </td>
          <td>
            <input type="number"
                   name="apr17Race_Total_HHWC"
                   value="#getDataAPR.apr17Race_Total_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr17Race_Total_HHOC"
                   value="#getDataAPR.apr17Race_Total_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="subtotal_children BGLightGray"
                  id="sumC9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                    name="apr17Race_Total_HHU"
                   value="#getDataAPR.apr17Race_Total_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
    <cfset nexttab = "49">
  </div>
</div>
</cfoutput>