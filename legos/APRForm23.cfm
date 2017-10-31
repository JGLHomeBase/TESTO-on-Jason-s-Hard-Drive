<!--- Set Variables --->
<cfset TargetTable = "DataAPR23">
<cfset UniqueID = "DataAPR23ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR23ID"
        Form = "dataapr23">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr23" formfields="aprID, inputUserID, projectID, reviewUserID, apr23_NoInc_Entry, apr23_NoInc_FollowUp, apr23_NoInc_Exit, apr23_1to150_Entry, apr23_1to150_FollowUp, apr23_1to150_Exit, apr23_151to250_Entry, apr23_151to250_FollowUp, apr23_151to250_Exit, apr23_251to500_Entry, apr23_251to500_FollowUp, apr23_251to500_Exit, apr23_500to1000_Entry, apr23_500to1000_FollowUp, apr23_500to1000_Exit, apr23_1001to1500_Entry, apr23_1001to1500_FollowUp, apr23_1001to1500_Exit, apr23_1501to2000_Entry, apr23_1501to2000_FollowUp, apr23_1501to2000_Exit, apr23_2000Plus_Entry, apr23_2000Plus_FollowUp, apr23_2000Plus_Exit, apr23_DKR_Entry, apr23_DKR_FollowUp, apr23_DKR_Exit, apr23_Missing_Entry, apr23_Missing_FollowUp, apr23_Missing_Exit, apr23_Total_Entry, apr23_Total_FollowUp, apr23_Total_Exit">
  <cfelse>
    <cfset FORM.DataAPR23ID = newCheck.DataAPR23ID>

    <!--- Set Defaults --->        
    <cfif form.apr23_500to1000_Exit	 EQ "">	
        <cfset form.apr23_500to1000_Exit	 =0></cfif>
    <cfif form.apr23_500to1000_FollowUp	 EQ "">	
        <cfset form.apr23_500to1000_FollowUp	 =0></cfif>
    <cfif form.apr23_500to1000_Entry	 EQ "">	
        <cfset form.apr23_500to1000_Entry	 =0></cfif>
    <cfif form.apr23_1001to1500_Exit	 EQ "">	
        <cfset form.apr23_1001to1500_Exit	 =0></cfif>
    <cfif form.apr23_1001to1500_FollowUp	 EQ "">	
        <cfset form.apr23_1001to1500_FollowUp	 =0></cfif>
    <cfif form.apr23_1001to1500_Entry	 EQ "">	
        <cfset form.apr23_1001to1500_Entry	 =0></cfif>
    <cfif form.apr23_1to150_Exit	 EQ "">	
        <cfset form.apr23_1to150_Exit	 =0></cfif>
    <cfif form.apr23_1to150_FollowUp	 EQ "">	
        <cfset form.apr23_1to150_FollowUp	 =0></cfif>
    <cfif form.apr23_1to150_Entry	 EQ "">	
        <cfset form.apr23_1to150_Entry	 =0></cfif>
    <cfif form.apr23_1501to2000_Exit	 EQ "">	
        <cfset form.apr23_1501to2000_Exit	 =0></cfif>
    <cfif form.apr23_1501to2000_FollowUp	 EQ "">	
        <cfset form.apr23_1501to2000_FollowUp	 =0></cfif>
    <cfif form.apr23_1501to2000_Entry	 EQ "">	
        <cfset form.apr23_1501to2000_Entry	 =0></cfif>
    <cfif form.apr23_151to250_Exit	 EQ "">	
        <cfset form.apr23_151to250_Exit	 =0></cfif>
    <cfif form.apr23_151to250_FollowUp	 EQ "">	
        <cfset form.apr23_151to250_FollowUp	 =0></cfif>
    <cfif form.apr23_151to250_Entry	 EQ "">	
        <cfset form.apr23_151to250_Entry	 =0></cfif>
    <cfif form.apr23_251to500_Exit	 EQ "">	
        <cfset form.apr23_251to500_Exit	 =0></cfif>
    <cfif form.apr23_251to500_FollowUp	 EQ "">	
        <cfset form.apr23_251to500_FollowUp	 =0></cfif>
    <cfif form.apr23_251to500_Entry	 EQ "">	
        <cfset form.apr23_251to500_Entry	 =0></cfif>
    <cfif form.apr23_DKR_Exit	 EQ "">	
        <cfset form.apr23_DKR_Exit	 =0></cfif>
    <cfif form.apr23_DKR_FollowUp	 EQ "">	
        <cfset form.apr23_DKR_FollowUp	 =0></cfif>
    <cfif form.apr23_DKR_Entry	 EQ "">	
        <cfset form.apr23_DKR_Entry	 =0></cfif>
    <cfif form.apr23_2000Plus_Exit	 EQ "">	
        <cfset form.apr23_2000Plus_Exit	 =0></cfif>
    <cfif form.apr23_2000Plus_FollowUp	 EQ "">	
        <cfset form.apr23_2000Plus_FollowUp	 =0></cfif>
    <cfif form.apr23_2000Plus_Entry	 EQ "">	
        <cfset form.apr23_2000Plus_Entry	 =0></cfif>
    <cfif form.apr23_Missing_Exit	 EQ "">	
        <cfset form.apr23_Missing_Exit	 =0></cfif>
    <cfif form.apr23_Missing_FollowUp	 EQ "">	
        <cfset form.apr23_Missing_FollowUp	 =0></cfif>
    <cfif form.apr23_Missing_Entry	 EQ "">	
        <cfset form.apr23_Missing_Entry	 =0></cfif>
    <cfif form.apr23_NoInc_Entry EQ "">	
        <cfset form.apr23_NoInc_Entry =0></cfif>
    <cfif form.apr23_NoInc_Exit	 EQ "">	
        <cfset form.apr23_NoInc_Exit	 =0></cfif>
    <cfif form.apr23_NoInc_FollowUp	 EQ "">	
        <cfset form.apr23_NoInc_FollowUp	 =0></cfif>
    <cfif form.apr23_Total_Exit	 EQ "">	
        <cfset form.apr23_Total_Exit	 =0></cfif>
    <cfif form.apr23_Total_FollowUp	 EQ "">	
        <cfset form.apr23_Total_FollowUp	 =0></cfif>
    <cfif form.apr23_Total_Entry	 EQ "">	
        <cfset form.apr23_Total_Entry	 =0></cfif>
    <!---/ Set Defaults --->         

    <cfupdate datasource="#DataSource#" tablename="dataapr23" formfields="DataAPR23ID, aprID, inputUserID, projectID, reviewUserID, apr23_NoInc_Entry, apr23_NoInc_FollowUp, apr23_NoInc_Exit, apr23_1to150_Entry, apr23_1to150_FollowUp, apr23_1to150_Exit, apr23_151to250_Entry, apr23_151to250_FollowUp, apr23_151to250_Exit, apr23_251to500_Entry, apr23_251to500_FollowUp, apr23_251to500_Exit, apr23_500to1000_Entry, apr23_500to1000_FollowUp, apr23_500to1000_Exit, apr23_1001to1500_Entry, apr23_1001to1500_FollowUp, apr23_1001to1500_Exit, apr23_1501to2000_Entry, apr23_1501to2000_FollowUp, apr23_1501to2000_Exit, apr23_2000Plus_Entry, apr23_2000Plus_FollowUp, apr23_2000Plus_Exit, apr23_DKR_Entry, apr23_DKR_FollowUp, apr23_DKR_Exit, apr23_Missing_Entry, apr23_Missing_FollowUp, apr23_Missing_Exit, apr23_Total_Entry, apr23_Total_FollowUp, apr23_Total_Exit">
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
        Form = "dataapr23"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queries --->

<!--- Math --->
<cfset mathCols="3">
<cfset mathRows="0">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Number of Adults</h3>
    <cfset nexttab="1">
    <table width="100%"
      <thead>
        <th></th>
        <th>Income at Entry</th>
        <th>Income at Latest Follow Up for Stayers</th>
        <th>Income at Exit for Leavers</th>
      </thead>
      <tbody>
        <tr>
          <td>No Income</td>
          <td>
            <input type="number"
                   name="apr23_NoInc_Entry"
                   value="#getDataAPR.apr23_NoInc_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_NoInc_FollowUp"
                   value="#getDataAPR.apr23_NoInc_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_NoInc_Exit"
                   value="#getDataAPR.apr23_NoInc_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$1-$150</td>
          <td>
            <input type="number"
                   name="apr23_1to150_Entry"
                   value="#getDataAPR.apr23_1to150_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_1to150_FollowUp"
                   value="#getDataAPR.apr23_1to150_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_1to150_Exit"
                   value="#getDataAPR.apr23_1to150_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$151-$250</td>
          <td>
            <input type="number"
                   name="apr23_151to250_Entry"
                   value="#getDataAPR.apr23_151to250_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_151to250_FollowUp"
                   value="#getDataAPR.apr23_151to250_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_151to250_Exit"
                   value="#getDataAPR.apr23_151to250_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$251-$500</td>
          <td>
            <input type="number"
                   name="apr23_251to500_Entry"
                   value="#getDataAPR.apr23_251to500_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_251to500_FollowUp"
                   value="#getDataAPR.apr23_251to500_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_251to500_Exit"
                   value="#getDataAPR.apr23_251to500_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$501-$1,000</td>
          <td>
            <input type="number"
                   name="apr23_500to1000_Entry"
                   value="#getDataAPR.apr23_500to1000_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_500to1000_FollowUp"
                   value="#getDataAPR.apr23_500to1000_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_500to1000_Exit"
                   value="#getDataAPR.apr23_500to1000_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$1,001-$1,500</td>
          <td>
            <input type="number"
                   name="apr23_1001to1500_Entry"
                   value="#getDataAPR.apr23_1001to1500_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_1001to1500_FollowUp"
                   value="#getDataAPR.apr23_1001to1500_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_1001to1500_Exit"
                   value="#getDataAPR.apr23_1001to1500_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$1,501-$2,000</td>
          <td>
            <input type="number"
                   name="apr23_1501to2000_Entry"
                   value="#getDataAPR.apr23_1501to2000_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_1501to2000_FollowUp"
                   value="#getDataAPR.apr23_1501to2000_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_1501to2000_Exit"
                   value="#getDataAPR.apr23_1501to2000_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>$2,000+</td>
          <td>
            <input type="number"
                   name="apr23_2000Plus_Entry"
                   value="#getDataAPR.apr23_2000Plus_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small> 
          </td>
          <td>
            <input type="number"
                   name="apr23_2000Plus_FollowUp"
                   value="#getDataAPR.apr23_2000Plus_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_2000Plus_Exit"
                   value="#getDataAPR.apr23_2000Plus_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr23_DKR_Entry"
                   value="#getDataAPR.apr23_DKR_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_DKR_FollowUp"
                   value="#getDataAPR.apr23_DKR_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_DKR_Exit"
                   value="#getDataAPR.apr23_DKR_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr23_Missing_Entry"
                   value="#getDataAPR.apr23_Missing_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_Missing_FollowUp"
                   value="#getDataAPR.apr23_Missing_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr23_Missing_Exit"
                   value="#getDataAPR.apr23_Missing_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total Adults</b></td>
          <td>
            <input type="number"
                   name="apr23_Total_Entry"
                   value="#getDataAPR.apr23_Total_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="subtotal_adults BGLightGray"
                   id="sumC1">
            
          </td>
          <td>
            <input type="number"
                   name="apr23_Total_FollowUp"
                   value="#getDataAPR.apr23_Total_FollowUp#"
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
                   name="apr23_Total_Exit"
                   value="#getDataAPR.apr23_Total_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                   class="BGLightGray"
                  id="sumC3">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>