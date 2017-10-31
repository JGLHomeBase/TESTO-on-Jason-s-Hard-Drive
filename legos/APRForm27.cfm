<!--- Set Variables --->
<cfset TargetTable = "DataAPR27">
<cfset UniqueID = "DataAPR27ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR27ID"
        Form = "dataapr27">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr27" formfields="aprID, inputUserID, projectID, reviewUserID, apr27_30Less_Total, apr27_30Less_Leavers, apr27_30Less_Stayers, apr27_31to60_Total, apr27_31to60_Leavers, apr27_31to60_Stayers, apr27_181to365_Total, apr27_61to180_Total, apr27_61to180_Leavers, apr27_61to180_Stayers, apr27_181to365_Leavers, apr27_181to365_Stayers, apr27_366to730_Total, apr27_366to730_Leavers, apr27_366to730_Stayers, apr27_731to1095_Total, apr27_731to1095_Leavers, apr27_731to1095_Stayers, apr27_1096to1460_Total, apr27_1096to1460_Leavers, apr27_1096to1460_Stayers, apr27_1461to1825_Total, apr27_1461to1825_Leavers, apr27_1461to1825_Stayers, apr27_1825More_Total, apr27_1825More_Leavers, apr27_1825More_Stayers, apr27_Missing_Total, apr27_Missing_Leavers, apr27_Missing_Stayers, apr27_Total_Total, apr27_Total_Leavers, apr27_Total_Stayers, apr27_Leavers_Avg, apr27_Stayers_Avg, apr27_Leavers_Median, apr27_Stayers_Median">
  <cfelse>
    <cfset FORM.DataAPR27ID = newCheck.DataAPR27ID>

    <!--- Set Defualts --->        
    <cfif form.apr27_30Less_Total	 EQ "">	
        <cfset form.apr27_30Less_Total	 =0></cfif>
    <cfif form.apr27_30Less_Leavers	 EQ "">	
        <cfset form.apr27_30Less_Leavers	 =0></cfif>
    <cfif form.apr27_30Less_Stayers	 EQ "">	
        <cfset form.apr27_30Less_Stayers	 =0></cfif>
    <cfif form.apr27_31to60_Total	 EQ "">	
        <cfset form.apr27_31to60_Total	 =0></cfif>
    <cfif form.apr27_31to60_Leavers	 EQ "">	
        <cfset form.apr27_31to60_Leavers	 =0></cfif>
    <cfif form.apr27_31to60_Stayers	 EQ "">	
        <cfset form.apr27_31to60_Stayers	 =0></cfif>
    <cfif form.apr27_181to365_Total	 EQ "">	
        <cfset form.apr27_181to365_Total	 =0></cfif>
    <cfif form.apr27_61to180_Total	 EQ "">	
        <cfset form.apr27_61to180_Total	 =0></cfif>
    <cfif form.apr27_61to180_Leavers	 EQ "">	
        <cfset form.apr27_61to180_Leavers	 =0></cfif>
    <cfif form.apr27_61to180_Stayers	 EQ "">	
        <cfset form.apr27_61to180_Stayers	 =0></cfif>
    <cfif form.apr27_181to365_Leavers	 EQ "">	
        <cfset form.apr27_181to365_Leavers	 =0></cfif>
    <cfif form.apr27_181to365_Stayers	 EQ "">	
        <cfset form.apr27_181to365_Stayers	 =0></cfif>
    <cfif form.apr27_366to730_Total	 EQ "">	
        <cfset form.apr27_366to730_Total	 =0></cfif>
    <cfif form.apr27_366to730_Leavers	 EQ "">	
        <cfset form.apr27_366to730_Leavers	 =0></cfif>
    <cfif form.apr27_366to730_Stayers	 EQ "">	
        <cfset form.apr27_366to730_Stayers	 =0></cfif>
    <cfif form.apr27_731to1095_Total	 EQ "">	
        <cfset form.apr27_731to1095_Total	 =0></cfif>
    <cfif form.apr27_731to1095_Leavers	 EQ "">	
        <cfset form.apr27_731to1095_Leavers	 =0></cfif>
    <cfif form.apr27_731to1095_Stayers	 EQ "">	
        <cfset form.apr27_731to1095_Stayers	 =0></cfif>
    <cfif form.apr27_1096to1460_Total	 EQ "">	
        <cfset form.apr27_1096to1460_Total	 =0></cfif>
    <cfif form.apr27_1096to1460_Leavers	 EQ "">	
        <cfset form.apr27_1096to1460_Leavers	 =0></cfif>
    <cfif form.apr27_1096to1460_Stayers	 EQ "">	
        <cfset form.apr27_1096to1460_Stayers	 =0></cfif>
    <cfif form.apr27_1461to1825_Total	 EQ "">	
        <cfset form.apr27_1461to1825_Total	 =0></cfif>
    <cfif form.apr27_1461to1825_Leavers	 EQ "">	
        <cfset form.apr27_1461to1825_Leavers	 =0></cfif>
    <cfif form.apr27_1461to1825_Stayers	 EQ "">	
        <cfset form.apr27_1461to1825_Stayers	 =0></cfif>
    <cfif form.apr27_1825More_Total	 EQ "">	
        <cfset form.apr27_1825More_Total	 =0></cfif>
    <cfif form.apr27_1825More_Leavers	 EQ "">	
        <cfset form.apr27_1825More_Leavers	 =0></cfif>
    <cfif form.apr27_1825More_Stayers	 EQ "">	
        <cfset form.apr27_1825More_Stayers	 =0></cfif>
    <cfif form.apr27_Missing_Total	 EQ "">	
        <cfset form.apr27_Missing_Total	 =0></cfif>
    <cfif form.apr27_Missing_Leavers	 EQ "">	
        <cfset form.apr27_Missing_Leavers	 =0></cfif>
    <cfif form.apr27_Missing_Stayers	 EQ "">	
        <cfset form.apr27_Missing_Stayers	 =0></cfif>
    <cfif form.apr27_Total_Total	 EQ "">	
        <cfset form.apr27_Total_Total	 =0></cfif>
    <cfif form.apr27_Total_Leavers	 EQ "">	
        <cfset form.apr27_Total_Leavers	 =0></cfif>
    <cfif form.apr27_Total_Stayers	 EQ "">	
        <cfset form.apr27_Total_Stayers	 =0></cfif>
    <cfif form.apr27_Leavers_Avg	 EQ "">	
        <cfset form.apr27_Leavers_Avg	 =0></cfif>
    <cfif form.apr27_Stayers_Avg	 EQ "">	
        <cfset form.apr27_Stayers_Avg	 =0></cfif>
    <cfif form.apr27_Leavers_Median	 EQ "">	
        <cfset form.apr27_Leavers_Median	 =0></cfif>
    <cfif form.apr27_Stayers_Median	 EQ "">	<cfset form.apr27_Stayers_Median	 =0></cfif>        
    <!---/ Set Defualts --->
    
    <cfupdate datasource="#DataSource#" tablename="dataapr27" formfields="DataAPR27ID, aprID, inputUserID, projectID, reviewUserID, apr27_30Less_Total, apr27_30Less_Leavers, apr27_30Less_Stayers, apr27_31to60_Total, apr27_31to60_Leavers, apr27_31to60_Stayers, apr27_181to365_Total, apr27_61to180_Total, apr27_61to180_Leavers, apr27_61to180_Stayers, apr27_181to365_Leavers, apr27_181to365_Stayers, apr27_366to730_Total, apr27_366to730_Leavers, apr27_366to730_Stayers, apr27_731to1095_Total, apr27_731to1095_Leavers, apr27_731to1095_Stayers, apr27_1096to1460_Total, apr27_1096to1460_Leavers, apr27_1096to1460_Stayers, apr27_1461to1825_Total, apr27_1461to1825_Leavers, apr27_1461to1825_Stayers, apr27_1825More_Total, apr27_1825More_Leavers, apr27_1825More_Stayers, apr27_Missing_Total, apr27_Missing_Leavers, apr27_Missing_Stayers, apr27_Total_Total, apr27_Total_Leavers, apr27_Total_Stayers, apr27_Leavers_Avg, apr27_Stayers_Avg, apr27_Leavers_Median, apr27_Stayers_Median">
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
        Form = "dataapr27"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queries --->

<!--- Math --->
<cfset mathCols="3">
<cfset mathRows="10">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Length of Participation by Exit Status</h3>
    <h4>Number of Persons</h4>
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Leavers</th>
        <th>Stayers</th>
      </thead>
      <tbody>
        <tr>
          <td>30 days or less</td>
          <td>
            <input type="number"
                   name="apr27_30Less_Total"
                   value="#getDataAPR.apr27_30Less_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_30Less_Leavers"
                   value="#getDataAPR.apr27_30Less_Leavers#"
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
                   name="apr27_30Less_Stayers"
                   value="#getDataAPR.apr27_30Less_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>31 to 60 days</td>
          <td>
            <input type="number"
                   name="apr27_31to60_Total"
                   value="#getDataAPR.apr27_31to60_Total#"
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
                   name="apr27_31to60_Leavers"
                   value="#getDataAPR.apr27_31to60_Leavers#"
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
                   name="apr27_31to60_Stayers"
                   value="#getDataAPR.apr27_31to60_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>61 to 180 days</td>
          <td>
            <input type="number"
                   name="apr27_61to180_Total"
                   value="#getDataAPR.apr27_61to180_Total#"
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
                   name="apr27_61to180_Leavers"
                   value="#getDataAPR.apr27_61to180_Leavers#"
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
                   name="apr27_61to180_Stayers"
                   value="#getDataAPR.apr27_61to180_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row3 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>181 to 365 days</td>
          <td>
            <input type="number"
                   name="apr27_181to365_Total"
                   value="#getDataAPR.apr27_181to365_Total#"
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
                   name="apr27_181to365_Leavers"
                   value="#getDataAPR.apr27_181to365_Leavers#"
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
                   name="apr27_181to365_Stayers"
                   value="#getDataAPR.apr27_181to365_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row4 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>366 to 730 days (1-2 Yrs)</td>
          <td>
            <input type="number"
                   name="apr27_366to730_Total"
                   value="#getDataAPR.apr27_366to730_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_366to730_Leavers"
                   value="#getDataAPR.apr27_366to730_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_366to730_Stayers"
                   value="#getDataAPR.apr27_366to730_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>731 to 1,095 days (2-3 Yrs)</td>
          <td>
            <input type="number"
                   name="apr27_731to1095_Total"
                   value="#getDataAPR.apr27_731to1095_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_731to1095_Leavers"
                   value="#getDataAPR.apr27_731to1095_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_731to1095_Stayers"
                   value="#getDataAPR.apr27_731to1095_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>1,096 to 1,460 days (3-4 Yrs)</td>
          <td>
            <input type="number"
                   name="apr27_1096to1460_Total"
                   value="#getDataAPR.apr27_1096to1460_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_1096to1460_Leavers"
                   value="#getDataAPR.apr27_1096to1460_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_1096to1460_Stayers"
                   value="#getDataAPR.apr27_1096to1460_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>1,461 to 1,825 days (4-5 Yrs)</td>
          <td>
            <input type="number"
                   name="apr27_1461to1825_Total"
                   value="#getDataAPR.apr27_1461to1825_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_1461to1825_Leavers"
                   value="#getDataAPR.apr27_1461to1825_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_1461to1825_Stayers"
                   value="#getDataAPR.apr27_1461to1825_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>More than 1,825 days (&gt; 5 Yrs)</td>
          <td>
            <input type="number"
                   name="apr27_1825More_Total"
                   value="#getDataAPR.apr27_1825More_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_1825More_Leavers"
                   value="#getDataAPR.apr27_1825More_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row9 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_1825More_Stayers"
                   value="#getDataAPR.apr27_1825More_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row9 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr27_Missing_Total"
                   value="#getDataAPR.apr27_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray col1"
                   id="sumR10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_Missing_Leavers"
                   value="#getDataAPR.apr27_Missing_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row10 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_Missing_Stayers"
                   value="#getDataAPR.apr27_Missing_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row10 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                   name="apr27_Total_Total"
                   value="#getDataAPR.apr27_Total_Total#"
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
                   name="apr27_Total_Leavers"
                   value="#getDataAPR.apr27_Total_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   
                   readonly
                   class="subtotal_leavers BGLightGray"
                   id="sumC2">
            
          </td>
          <td>
            <input type="number"
                   name="apr27_Total_Stayers"
                   value="#getDataAPR.apr27_Total_Stayers#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   
                   readonly
                   class="subtotal_stayers BGLightGray"
                   id="sumC3">
             
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>


<div class="row">
  <div class="large-12 columns">
    <h3>Average and Median Length of Participation in Days</h3>
    <table width="100%">
      <thead>
        <th></th>
        <th>Average Length</th>
        <th>Median Length</th>
      </thead>
      <tbody>
        <tr>
          <td>Leavers</td>
          <td>
            <input type="number"
                   name="apr27_Leavers_Avg"
                   value="#getDataAPR.apr27_Leavers_Avg#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_Leavers_Median"
                   value="#getDataAPR.apr27_Leavers_Median#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Stayers</td>
          <td>
            <input type="number"
                   name="apr27_Stayers_Avg"
                   value="#getDataAPR.apr27_Stayers_Avg#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr27_Stayers_Median"
                   value="#getDataAPR.apr27_Stayers_Median#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>