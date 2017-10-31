<!--- Set Variables --->
<cfset TargetTable = "DataAPR19">
<cfset UniqueID = "DataAPR19ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR19ID"
        Form = "dataapr19">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr19" formfields="aprID, inputUserID, projectID, reviewUserID, apr19DV_Yes_HHNC, apr19DV_No_HHNC, apr19DV_DKR_HHNC, apr19DV_Total, apr19DV_Missing_HHNC, apr19DV_Total_HHNC, apr19DV_Yes_Total, apr19DV_No_Total, apr19DV_DKR_Total, apr19DV_Missing_Total, apr19DV_Yes_HHWC, apr19DV_No_HHWC, apr19DV_DKR_HHWC, apr19DV_Missing_HHWC, apr19DV_Total_HHWC, apr19DV_Yes_HHOC, apr19DV_No_HHOC, apr19DV_DKR_HHOC, apr19DV_Missing_HHOC, apr19DV_Total_HHOC, apr19DV_Yes_HHU, apr19DV_No_HHU, apr19DV_DKR_HHU, apr19DV_Missing_HHU, apr19DV_Total_HHU, apr19WhenDV_3Months_Total, apr19WhenDV_3to6_Total, apr19WhenDV_6to12_Total, apr19WhenDV_YearPlus_Total, apr19WhenDV_DKR_Total, apr19WhenDV_Missing_Total, apr19WhenDV_3Months_HHNC, apr19WhenDV_3to6_HHNC, apr19WhenDV_6to12_HHNC, apr19WhenDV_YearPlus_HHNC, apr19WhenDV_DKR_HHNC, apr19WhenDV_Missing_HHNC, apr19WhenDV_3Months_HHWC, apr19WhenDV_3to6_HHWC, apr19WhenDV_6to12_HHWC, apr19WhenDV_YearPlus_HHWC, apr19WhenDV_DKR_HHWC, apr19WhenDV_Missing_HHWC, apr19WhenDV_3Months_HHOC, apr19WhenDV_3to6_HHOC, apr19WhenDV_6to12_HHOC, apr19WhenDV_YearPlus_HHOC, apr19WhenDV_DKR_HHOC, apr19WhenDV_Missing_HHOC, apr19WhenDV_3Months_HHU, apr19WhenDV_3to6_HHU, apr19WhenDV_6to12_HHU, apr19WhenDV_YearPlus_HHU, apr19WhenDV_Missing_HHU, apr19WhenDV_DKR_HHU">
  <cfelse>
    <cfset FORM.DataAPR19ID = newCheck.DataAPR19ID>

<!--- Set Defaults --->        
<cfif form.apr19DV_Yes_HHNC	EQ "">	
    <cfset form.apr19DV_Yes_HHNC=0></cfif>
<cfif form.apr19DV_No_HHNC EQ "">	
    <cfset form.apr19DV_No_HHNC=0></cfif>
<cfif form.apr19DV_DKR_HHNC	EQ "">	
    <cfset form.apr19DV_DKR_HHNC=0></cfif>
<cfif form.apr19DV_Total EQ "">	
    <cfset form.apr19DV_Total=0></cfif>
<cfif form.apr19DV_Missing_HHNC EQ "">	
    <cfset form.apr19DV_Missing_HHNC=0></cfif>
<cfif form.apr19DV_Total_HHNC EQ "">	
    <cfset form.apr19DV_Total_HHNC=0></cfif>
<cfif form.apr19DV_Yes_Total EQ "">	
    <cfset form.apr19DV_Yes_Total=0></cfif>
<cfif form.apr19DV_No_Total EQ "">	
    <cfset form.apr19DV_No_Total=0></cfif>
<cfif form.apr19DV_DKR_Total EQ "">	
    <cfset form.apr19DV_DKR_Total=0></cfif>
<cfif form.apr19DV_Missing_Total EQ "">	
    <cfset form.apr19DV_Missing_Total=0></cfif>
<cfif form.apr19DV_Yes_HHWC EQ "">	
    <cfset form.apr19DV_Yes_HHWC=0></cfif>
<cfif form.apr19DV_No_HHWC EQ "">	
    <cfset form.apr19DV_No_HHWC=0></cfif>
<cfif form.apr19DV_DKR_HHWC EQ "">	
    <cfset form.apr19DV_DKR_HHWC=0></cfif>
<cfif form.apr19DV_Missing_HHWC EQ "">	
    <cfset form.apr19DV_Missing_HHWC=0></cfif>
<cfif form.apr19DV_Total_HHWC EQ "">	
    <cfset form.apr19DV_Total_HHWC=0></cfif>
<cfif form.apr19DV_Yes_HHOC EQ "">	
    <cfset form.apr19DV_Yes_HHOC=0></cfif>
<cfif form.apr19DV_No_HHOC EQ "">	
    <cfset form.apr19DV_No_HHOC=0></cfif>
<cfif form.apr19DV_DKR_HHOC EQ "">	
    <cfset form.apr19DV_DKR_HHOC=0></cfif>
<cfif form.apr19DV_Missing_HHOC EQ "">	
    <cfset form.apr19DV_Missing_HHOC=0></cfif>
<cfif form.apr19DV_Total_HHOC EQ "">	
    <cfset form.apr19DV_Total_HHOC=0></cfif>
<cfif form.apr19DV_Yes_HHU EQ "">	
    <cfset form.apr19DV_Yes_HHU=0></cfif>
<cfif form.apr19DV_No_HHU EQ "">	
    <cfset form.apr19DV_No_HHU=0></cfif>
<cfif form.apr19DV_DKR_HHU EQ "">	
    <cfset form.apr19DV_DKR_HHU=0></cfif>
<cfif form.apr19DV_Missing_HHU EQ "">	
    <cfset form.apr19DV_Missing_HHU=0></cfif>
<cfif form.apr19DV_Total_HHU EQ "">
    <cfset form.apr19DV_Total_HHU=0></cfif>
<cfif form.apr19WhenDV_3Months_Total EQ "">	
    <cfset form.apr19WhenDV_3Months_Total=0></cfif>
<cfif form.apr19WhenDV_3to6_Total EQ "">	
    <cfset form.apr19WhenDV_3to6_Total=0></cfif>
<cfif form.apr19WhenDV_6to12_Total EQ "">	
    <cfset form.apr19WhenDV_6to12_Total=0></cfif>
<cfif form.apr19WhenDV_YearPlus_Total EQ "">	
    <cfset form.apr19WhenDV_YearPlus_Total=0></cfif>
<cfif form.apr19WhenDV_DKR_Total EQ "">	
    <cfset form.apr19WhenDV_DKR_Total=0></cfif>
<cfif form.apr19WhenDV_Missing_Total EQ "">	
    <cfset form.apr19WhenDV_Missing_Total=0></cfif>
<cfif form.apr19WhenDV_3Months_HHNC EQ "">	
    <cfset form.apr19WhenDV_3Months_HHNC=0></cfif>
<cfif form.apr19WhenDV_3to6_HHNC EQ "">	
    <cfset form.apr19WhenDV_3to6_HHNC=0></cfif>
<cfif form.apr19WhenDV_6to12_HHNC EQ "">	
    <cfset form.apr19WhenDV_6to12_HHNC=0></cfif>
<cfif form.apr19WhenDV_YearPlus_HHNC EQ "">	
    <cfset form.apr19WhenDV_YearPlus_HHNC=0></cfif>
<cfif form.apr19WhenDV_DKR_HHNC EQ "">	
    <cfset form.apr19WhenDV_DKR_HHNC=0></cfif>
<cfif form.apr19WhenDV_Missing_HHNC EQ "">	
    <cfset form.apr19WhenDV_Missing_HHNC=0></cfif>
<cfif form.apr19WhenDV_3Months_HHWC EQ "">	
    <cfset form.apr19WhenDV_3Months_HHWC=0></cfif>
<cfif form.apr19WhenDV_3to6_HHWC EQ "">	
    <cfset form.apr19WhenDV_3to6_HHWC=0></cfif>
<cfif form.apr19WhenDV_6to12_HHWC EQ "">	
    <cfset form.apr19WhenDV_6to12_HHWC=0></cfif>
<cfif form.apr19WhenDV_YearPlus_HHWC EQ "">	
    <cfset form.apr19WhenDV_YearPlus_HHWC=0></cfif>
<cfif form.apr19WhenDV_DKR_HHWC EQ "">	
    <cfset form.apr19WhenDV_DKR_HHWC=0></cfif>
<cfif form.apr19WhenDV_Missing_HHWC EQ "">	
    <cfset form.apr19WhenDV_Missing_HHWC=0></cfif>
<cfif form.apr19WhenDV_3Months_HHOC EQ "">	
    <cfset form.apr19WhenDV_3Months_HHOC=0></cfif>
<cfif form.apr19WhenDV_3to6_HHOC EQ "">	
    <cfset form.apr19WhenDV_3to6_HHOC=0></cfif>
<cfif form.apr19WhenDV_6to12_HHOC EQ "">	
    <cfset form.apr19WhenDV_6to12_HHOC=0></cfif>
<cfif form.apr19WhenDV_YearPlus_HHOC EQ "">	
    <cfset form.apr19WhenDV_YearPlus_HHOC=0></cfif>
<cfif form.apr19WhenDV_DKR_HHOC EQ "">	
    <cfset form.apr19WhenDV_DKR_HHOC=0></cfif>
<cfif form.apr19WhenDV_Missing_HHOC EQ "">	
    <cfset form.apr19WhenDV_Missing_HHOC=0></cfif>
<cfif form.apr19WhenDV_3Months_HHU EQ "">	
    <cfset form.apr19WhenDV_3Months_HHU=0></cfif>
<cfif form.apr19WhenDV_3to6_HHU EQ "">	
    <cfset form.apr19WhenDV_3to6_HHU=0></cfif>
<cfif form.apr19WhenDV_6to12_HHU EQ "">	
    <cfset form.apr19WhenDV_6to12_HHU=0></cfif>
<cfif form.apr19WhenDV_YearPlus_HHU EQ "">	
    <cfset form.apr19WhenDV_YearPlus_HHU=0></cfif>
<cfif form.apr19WhenDV_Missing_HHU EQ "">	
    <cfset form.apr19WhenDV_Missing_HHU=0></cfif>
<cfif form.apr19WhenDV_DKR_HHU EQ "">	
    <cfset form.apr19WhenDV_DKR_HHU=0></cfif>
<!---/ Set Defaults --->
    
    <cfupdate datasource="#DataSource#" tablename="dataapr19" formfields="DataAPR19ID, aprID, inputUserID, projectID, reviewUserID, apr19DV_Yes_HHNC, apr19DV_No_HHNC, apr19DV_DKR_HHNC, apr19DV_Total, apr19DV_Missing_HHNC, apr19DV_Total_HHNC, apr19DV_Yes_Total, apr19DV_No_Total, apr19DV_DKR_Total, apr19DV_Missing_Total, apr19DV_Yes_HHWC, apr19DV_No_HHWC, apr19DV_DKR_HHWC, apr19DV_Missing_HHWC, apr19DV_Total_HHWC, apr19DV_Yes_HHOC, apr19DV_No_HHOC, apr19DV_DKR_HHOC, apr19DV_Missing_HHOC, apr19DV_Total_HHOC, apr19DV_Yes_HHU, apr19DV_No_HHU, apr19DV_DKR_HHU, apr19DV_Missing_HHU, apr19DV_Total_HHU, apr19WhenDV_3Months_Total, apr19WhenDV_3to6_Total, apr19WhenDV_6to12_Total, apr19WhenDV_YearPlus_Total, apr19WhenDV_DKR_Total, apr19WhenDV_Missing_Total, apr19WhenDV_3Months_HHNC, apr19WhenDV_3to6_HHNC, apr19WhenDV_6to12_HHNC, apr19WhenDV_YearPlus_HHNC, apr19WhenDV_DKR_HHNC, apr19WhenDV_Missing_HHNC, apr19WhenDV_3Months_HHWC, apr19WhenDV_3to6_HHWC, apr19WhenDV_6to12_HHWC, apr19WhenDV_YearPlus_HHWC, apr19WhenDV_DKR_HHWC, apr19WhenDV_Missing_HHWC, apr19WhenDV_3Months_HHOC, apr19WhenDV_3to6_HHOC, apr19WhenDV_6to12_HHOC, apr19WhenDV_YearPlus_HHOC, apr19WhenDV_DKR_HHOC, apr19WhenDV_Missing_HHOC, apr19WhenDV_3Months_HHU, apr19WhenDV_3to6_HHU, apr19WhenDV_6to12_HHU, apr19WhenDV_YearPlus_HHU, apr19WhenDV_Missing_HHU, apr19WhenDV_DKR_HHU">
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
        Form = "dataapr19"
        Where = "thisProject">
<!---/ Get DataAPR ---> 
<!--- Queires --->

<!--- Math --->
<cfset mathCols="5">
<cfset mathRows="10">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Past Domestic Violence Experience</h3>
    <h4>Number of Adults and Unaccompanied Children in Households</h4>
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
          <td>Yes</td>
          <td>
            <input type="number"
                   name="apr19DV_Yes_Total"
                   value="#getDataAPR.apr19DV_Yes_Total#"
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
                   name="apr19DV_Yes_HHNC"
                   value="#getDataAPR.apr19DV_Yes_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                  tabindex="#nexttab++#"
                  class="row1 col2"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_Yes_HHWC"
                   value="#getDataAPR.apr19DV_Yes_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row1 col3">
            <small class="form-error">Must be a whole number</small>
                      </td>
          <td>
            <input type="number"
                   name="apr19DV_Yes_HHOC"
                   value="#getDataAPR.apr19DV_Yes_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row1 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_Yes_HHU"
                   value="#getDataAPR.apr19DV_Yes_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>No</td>
          <td>
            <input type="number"
                   name="apr19DV_No_Total"
                   value="#getDataAPR.apr19DV_No_Total#"
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
                   name="apr19DV_No_HHNC"
                   value="#getDataAPR.apr19DV_No_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_No_HHWC"
                   value="#getDataAPR.apr19DV_No_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_No_HHOC"
                   value="#getDataAPR.apr19DV_No_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col4">
            <small class="form-error">Must be a whole number</small>
                      </td>
          <td>
            <input type="number"
                   name="apr19DV_No_HHU"
                   value="#getDataAPR.apr19DV_No_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row2 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr19DV_DKR_Total"
                   value="#getDataAPR.apr19DV_DKR_Total#"
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
                   name="apr19DV_DKR_HHNC"
                   value="#getDataAPR.apr19DV_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row3 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_DKR_HHWC"
                   value="#getDataAPR.apr19DV_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row3 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_DKR_HHOC"
                   value="#getDataAPR.apr19DV_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_DKR_HHU"
                   value="#getDataAPR.apr19DV_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row3 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr19DV_Missing_Total"
                   value="#getDataAPR.apr19DV_Missing_Total#"
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
                   name="apr19DV_Missing_HHNC"
                   value="#getDataAPR.apr19DV_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row4 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_Missing_HHWC"
                   value="#getDataAPR.apr19DV_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row4 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_Missing_HHOC"
                   value="#getDataAPR.apr19DV_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row4 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19DV_Missing_HHU"
                   value="#getDataAPR.apr19DV_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row4 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                   name="apr19DV_Total"
                   value="#getDataAPR.apr19DV_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="subtotal_adultspluskids BGLightGray"
                  id="sumC1">
          </td>
          <td>
            <input type="number"
                   name="apr19DV_Total_HHNC"
                   value="#getDataAPR.apr19DV_Total_HHNC#"
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
                   name="apr19DV_Total_HHWC"
                   value="#getDataAPR.apr19DV_Total_HHWC#"
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
                    name="apr19DV_Total_HHOC"
                   value="#getDataAPR.apr19DV_Total_HHOC#"
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
                   name="apr19DV_Total_HHU"
                   value="#getDataAPR.apr19DV_Total_HHU#"
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
    <h3>When Past Domestic Violence Experience Occurred</h3>
    <h4>Number of Adults and Unaccompanied Children in Households</h4>
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
          <td>Within the past 3 Months</td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3Months_Total"
                   value="#getDataAPR.apr19WhenDV_3Months_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3Months_HHNC"
                   value="#getDataAPR.apr19WhenDV_3Months_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3Months_HHWC"
                   value="#getDataAPR.apr19WhenDV_3Months_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3Months_HHOC"
                   value="#getDataAPR.apr19WhenDV_3Months_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                 name="apr19WhenDV_3Months_HHU"
                 value="#getDataAPR.apr19WhenDV_3Months_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                   tabindex="#nexttab++#"
                class="row5">
          <small class="form-error">Must be a whole number</small>
        </td>
        </tr>
         <tr>
          <td>3 to 6 Months Ago</td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3to6_Total"
                   value="#getDataAPR.apr19WhenDV_3to6_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3to6_HHNC"
                   value="#getDataAPR.apr19WhenDV_3to6_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3to6_HHWC"
                   value="#getDataAPR.apr19WhenDV_3to6_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3to6_HHOC"
                   value="#getDataAPR.apr19WhenDV_3to6_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_3to6_HHU"
                   value="#getDataAPR.apr19WhenDV_3to6_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <tr>
          <td>6 to 12 Months Ago</td>
          <td>
            <input type="number"
                   name="apr19WhenDV_6to12_Total"
                   value="#getDataAPR.apr19WhenDV_6to12_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_6to12_HHNC"
                   value="#getDataAPR.apr19WhenDV_6to12_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_6to12_HHWC"
                   value="#getDataAPR.apr19WhenDV_6to12_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_6to12_HHOC"
                   value="#getDataAPR.apr19WhenDV_6to12_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_6to12_HHU"
                   value="#getDataAPR.apr19WhenDV_6to12_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>More Than a Year Ago</td>
          <td>
            <input type="number"
                   name="apr19WhenDV_YearPlus_Total"
                   value="#getDataAPR.apr19WhenDV_YearPlus_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_YearPlus_HHNC"
                   value="#getDataAPR.apr19WhenDV_YearPlus_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_YearPlus_HHWC"
                   value="#getDataAPR.apr19WhenDV_YearPlus_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_YearPlus_HHOC"
                   value="#getDataAPR.apr19WhenDV_YearPlus_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_YearPlus_HHU"
                   value="#getDataAPR.apr19WhenDV_YearPlus_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row8">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr19WhenDV_DKR_Total"
                   value="#getDataAPR.apr19WhenDV_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_DKR_HHNC"
                   value="#getDataAPR.apr19WhenDV_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_DKR_HHWC"
                   value="#getDataAPR.apr19WhenDV_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_DKR_HHOC"
                   value="#getDataAPR.apr19WhenDV_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_Missing_HHU"
                   value="#getDataAPR.apr19WhenDV_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row9">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr19WhenDV_Missing_Total"
                   value="#getDataAPR.apr19WhenDV_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_Missing_HHNC"
                   value="#getDataAPR.apr19WhenDV_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_Missing_HHWC"
                   value="#getDataAPR.apr19WhenDV_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_Missing_HHOC"
                   value="#getDataAPR.apr19WhenDV_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr19WhenDV_DKR_HHU"
                   value="#getDataAPR.apr19WhenDV_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                  class="row10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>