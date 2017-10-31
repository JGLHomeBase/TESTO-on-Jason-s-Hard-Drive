<!--- Set Variables --->
<cfset TargetTable = "DataAPR21">
<cfset UniqueID = "DataAPR21ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR21ID"
        Form = "dataapr21">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr21" formfields="aprID, inputUserID, projectID, reviewUserID, apr21_Vet_Total, apr21_Vet_HHNC, apr21_Vet_HHWC, apr21_Vet_HHU, apr21_NotVet_Total, apr21_NotVet_HHNC, apr21_NotVet_HHWC, apr21_NotVet_HHU, apr21_DKR_Total, apr21_DKR_HHNC, apr21_DKR_HHWC, apr21_DKR_HHU, apr21_Missing_Total, apr21_Missing_HHNC, apr21_Missing_HHWC, apr21_Missing_HHU, apr21_Total, apr21_Total_HHNC, apr21_Total_HHWC, apr21_Total_HHU">
  <cfelse>
    <cfset FORM.DataAPR21ID = newCheck.DataAPR21ID>

    <!--- Set Defaults --->        
    <cfif form.apr21_Vet_Total	 EQ "">	
        <cfset form.apr21_Vet_Total	 =0></cfif>
    <cfif form.apr21_Vet_HHNC	 EQ "">	
        <cfset form.apr21_Vet_HHNC	 =0></cfif>
    <cfif form.apr21_Vet_HHWC	 EQ "">	
        <cfset form.apr21_Vet_HHWC	 =0></cfif>
    <cfif form.apr21_Vet_HHU	 EQ "">	
        <cfset form.apr21_Vet_HHU	 =0></cfif>
    <cfif form.apr21_NotVet_Total	 EQ "">	
        <cfset form.apr21_NotVet_Total	 =0></cfif>
    <cfif form.apr21_NotVet_HHNC	 EQ "">	
        <cfset form.apr21_NotVet_HHNC	 =0></cfif>
    <cfif form.apr21_NotVet_HHWC	 EQ "">
        <cfset form.apr21_NotVet_HHWC	 =0></cfif>
    <cfif form.apr21_NotVet_HHU	 EQ "">	
        <cfset form.apr21_NotVet_HHU	 =0></cfif>
    <cfif form.apr21_DKR_Total	 EQ "">	
        <cfset form.apr21_DKR_Total	 =0></cfif>
    <cfif form.apr21_DKR_HHNC	 EQ "">	
        <cfset form.apr21_DKR_HHNC	 =0></cfif>
    <cfif form.apr21_DKR_HHWC	 EQ "">	
        <cfset form.apr21_DKR_HHWC	 =0></cfif>
    <cfif form.apr21_DKR_HHU	 EQ "">	
        <cfset form.apr21_DKR_HHU	 =0></cfif>
    <cfif form.apr21_Missing_Total	 EQ "">	
        <cfset form.apr21_Missing_Total	 =0></cfif>
    <cfif form.apr21_Missing_HHNC	 EQ "">	
        <cfset form.apr21_Missing_HHNC	 =0></cfif>
    <cfif form.apr21_Missing_HHWC	 EQ "">	
        <cfset form.apr21_Missing_HHWC	 =0></cfif>
    <cfif form.apr21_Missing_HHU	 EQ "">	
        <cfset form.apr21_Missing_HHU	 =0></cfif>
    <cfif form.apr21_Total	 EQ "">	<cfset form.apr21_Total	 =0></cfif>
    <cfif form.apr21_Total_HHNC	 EQ "">	
        <cfset form.apr21_Total_HHNC	 =0></cfif>
    <cfif form.apr21_Total_HHWC	 EQ "">	
        <cfset form.apr21_Total_HHWC	 =0></cfif>
    <cfif form.apr21_Total_HHNC	 EQ "">	
        <cfset form.apr21_Total_HHNC	 =0></cfif>
    <!---/ Set Defaults --->        
    <cfupdate datasource="#DataSource#" tablename="dataapr21" formfields="DataAPR21ID, aprID, inputUserID, projectID, reviewUserID, apr21_Vet_Total, apr21_Vet_HHNC, apr21_Vet_HHWC, apr21_Vet_HHU, apr21_NotVet_Total, apr21_NotVet_HHNC, apr21_NotVet_HHWC, apr21_NotVet_HHU, apr21_DKR_Total, apr21_DKR_HHNC, apr21_DKR_HHWC, apr21_DKR_HHU, apr21_Missing_Total, apr21_Missing_HHNC, apr21_Missing_HHWC, apr21_Missing_HHU, apr21_Total, apr21_Total_HHNC, apr21_Total_HHWC, apr21_Total_HHU">
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
        Form = "dataapr21"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="4">
<cfset mathRows="5">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>Veteran</td>
          <td>
            <!--- apr21_Vet_Total --->
            <input type="number"
                   name="apr21_Vet_Total"
                   value="#getDataAPR.apr21_Vet_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR1">
            <small class="form-error">Must be a whole number</small>
            <!---/ apr21_Vet_Total --->
          </td>
          <td>
            <!--- apr21_Vet_HHNC --->
            <input type="number"
                   name="apr21_Vet_HHNC"
                   value="#getDataAPR.apr21_Vet_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col2"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
            <!---/ apr21_Vet_HHNC --->
          </td>
          <td>
            <!--- apr21_Vet_HHWC --->
            <input type="number"
                   name="apr21_Vet_HHWC"
                   value="#getDataAPR.apr21_Vet_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col3">
            <small class="form-error">Must be a whole number</small>
            <!---/ apr21_Vet_HHWC --->
          </td>
          <td>
            <!--- apr21_Vet_HHU --->
            <input type="number"
                   name="apr21_Vet_HHU"
                   value="#getDataAPR.apr21_Vet_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col4">
            <small class="form-error">Must be a whole number</small>
            <!---/ apr21_Vet_HHU --->
          </td>
        </tr>
        <tr>
          <td>Not a Veteran</td>
          <td>
            <input type="number"
                   name="apr21_NotVet_Total"
                   value="#getDataAPR.apr21_NotVet_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr21_NotVet_HHNC"
                   value="#getDataAPR.apr21_NotVet_HHNC#"
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
                   name="apr21_NotVet_HHWC"
                   value="#getDataAPR.apr21_NotVet_HHWC#"
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
                   name="apr21_NotVet_HHU"
                   value="#getDataAPR.apr21_NotVet_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr21_DKR_Total"
                   value="#getDataAPR.apr21_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr21_DKR_HHNC"
                   value="#getDataAPR.apr21_DKR_HHNC#"
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
                   name="apr21_DKR_HHWC"
                   value="#getDataAPR.apr21_DKR_HHWC#"
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
                   name="apr21_DKR_HHU"
                   value="#getDataAPR.apr21_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr21_Missing_Total"
                   value="#getDataAPR.apr21_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr21_Missing_HHNC"
                   value="#getDataAPR.apr21_Missing_HHNC#"
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
                   name="apr21_Missing_HHWC"
                   value="#getDataAPR.apr21_Missing_HHWC#"
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
                   name="apr21_Missing_HHU"
                   value="#getDataAPR.apr21_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row4 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                   name="apr21_Total"
                   value="#getDataAPR.apr21_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="subtotal_adults BGLightGray"
                  id="sumC1"
             
          </td>
          <td>
            <input type="number"
                   name="apr21_Total_HHNC"
                   value="#getDataAPR.apr21_Total_HHNC#"
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
                   name="apr21_Total_HHWC"
                   value="#getDataAPR.apr21_Total_HHWC#"
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
                   name="apr21_Total_HHU"
                   value="#getDataAPR.apr21_Total_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC4">
            <small class="form-error">Must be a whole number</small>          
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>