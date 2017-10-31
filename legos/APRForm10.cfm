<!--- Set Variables --->
<cfset TargetTable = "DataAPR10">
<cfset UniqueID = "DataAPR10ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR10ID"
        Form = "dataapr10">
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
  <cfinsert datasource="#DataSource#" tablename="dataapr10" formfields="aprID, inputUserID, projectID, reviewUserID, apr10_BedUtilization_Jan, apr10_BedUtilization_Apr, apr10_BedUtilization_Jul, apr10_BedUtilization_Oct, apr11_UnitUtilization_Jan, apr11_UnitUtilization_Apr, apr11_UnitUtilization_Jul, apr11_UnitUtilization_Oct, apr10_AvgDailyUtilization">
  <cfelse>
    <cfset FORM.DataAPR10ID = newCheck.DataAPR10ID>

<!--- Set Defaults --->

<cfif form.apr10_BedUtilization_Jan EQ "">
    <cfset form.apr10_BedUtilization_Jan=0>
</cfif>
<cfif form.apr10_BedUtilization_Apr EQ "">
    <cfset form.apr10_BedUtilization_Apr=0>
</cfif>
<cfif form.apr10_BedUtilization_Jul EQ "">
    <cfset form.apr10_BedUtilization_Jul=0>
</cfif>
<cfif form.apr10_BedUtilization_Oct EQ "">
    <cfset form.apr10_BedUtilization_Oct=0>
</cfif>
<cfif form.apr11_UnitUtilization_Jan EQ "">
    <cfset form.apr11_UnitUtilization_Jan=0>
</cfif>
<cfif form.apr11_UnitUtilization_Apr EQ "">
    <cfset form.apr11_UnitUtilization_Apr=0>
</cfif>
<cfif form.apr11_UnitUtilization_Jul EQ "">
    <cfset form.apr11_UnitUtilization_Jul=0>
</cfif>
<cfif form.apr11_UnitUtilization_Oct EQ "">
    <cfset form.apr11_UnitUtilization_Oct=0>
</cfif>
<cfif form.apr10_AvgDailyUtilization EQ "">
    <cfset form.apr10_AvgDailyUtilization=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr10" formfields="DataAPR10ID, aprID, inputUserID, projectID, reviewUserID, apr10_BedUtilization_Jan, apr10_BedUtilization_Apr, apr10_BedUtilization_Jul, apr10_BedUtilization_Oct, apr11_UnitUtilization_Jan, apr11_UnitUtilization_Apr, apr11_UnitUtilization_Jul, apr11_UnitUtilization_Oct, apr10_AvgDailyUtilization">
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
        Form = "dataapr10"
        Where = "thisProject">
<!---/ Get DataAPR --->     


<!--- Math --->
<cfset mathCols="0">
<cfset mathRows="0">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Bed Utilization Rate</h3>
    <table width="100%">
      <tbody>
        <tr>
          <td width="50%">
            Average daily utilization rate during the operating year 
          </td>
          <td>
<input type="number"
       name="apr10_AvgDailyUtilization"
       value="#getDataAPR.apr10_AvgDailyUtilization#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       autofocus
       min="0"
       step="1"
       autofocus>
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
    <h4>Point-in-Time bed utilization rate on the last Wednesday in:</h4>
    <table width="100%">
      <tbody>
        <tr>
          <td width="50%">
            January
          </td>
          <td>
<input type="number"
       name="apr10_BedUtilization_Jan"
       value="#getDataAPR.apr10_BedUtilization_Jan#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
        <tr>
          <td width="50%">
            April
          </td>
          <td>
<input type="number"
       name="apr10_BedUtilization_Apr"
       value="#getDataAPR.apr10_BedUtilization_Apr#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
        <tr>
          <td width="50%">
            July
          </td>
          <td>
<input type="number"
       name="apr10_BedUtilization_Jul"
       value="#getDataAPR.apr10_BedUtilization_Jul#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
        <tr>
          <td width="50%">
            October
          </td>
          <td>
<input type="number"
       name="apr10_BedUtilization_Oct"
       value="#getDataAPR.apr10_BedUtilization_Oct#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
      </tbody>
    </table>
    <h3>Unit Utilization Rate</h3>
    <h4>Point-in-Time unit utilization rate on the last Wednesday in:</h4>
    <table width="100%">
      <tbody>
       <tr>
          <td width="50%">
            January
          </td>
          <td>
<input type="number"
       name="apr11_UnitUtilization_Jan"
       value="#getDataAPR.apr11_UnitUtilization_Jan#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
        <tr>
          <td width="50%">
            April
          </td>
          <td>
<input type="number"
       name="apr11_UnitUtilization_Apr"
       value="#getDataAPR.apr11_UnitUtilization_Apr#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
        <tr>
          <td width="50%">
            July
          </td>
          <td>
<input type="number"
       name="apr11_UnitUtilization_Jul"
       value="#getDataAPR.apr11_UnitUtilization_Jul#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
        <tr>
          <td width="50%">
            October
          </td>
          <td>
<input type="number"
       name="apr11_UnitUtilization_Oct"
       value="#getDataAPR.apr11_UnitUtilization_Oct#"
       placeholder="0"
      maxlength="11"
       tabindex="#nexttab++#"
       min="0"
       step="1">
<small class="form-error">Must be a number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>