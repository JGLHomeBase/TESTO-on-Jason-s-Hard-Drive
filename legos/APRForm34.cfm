<!--- Set Variables --->
<cfset TargetTable = "DataAPR34">
<cfset UniqueID = "DataAPR34ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR34ID"
        Form = "dataapr34">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr34" formfields="aprID, inputUserID, projectID, reviewUserID, apr34_PercentHUDFunding">
  <cfelse>
    <cfset FORM.DataAPR34ID = newCheck.DataAPR34ID>
    <!--- Set Defaults --->        
    <cfif form.apr34_PercentHUDFunding EQ "">
        <cfset form.apr34_PercentHUDFunding=0>
    </cfif>
    <!---/ Set Defaults --->        
    <cfupdate datasource="#DataSource#" tablename="dataapr34" formfields="DataAPR34ID, aprID, inputUserID, projectID, reviewUserID, apr34_PercentHUDFunding">
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
        Form = "dataapr34"
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
    <table width="100%">
      <tbody>
        <tr>
          <td width="50%">
            What percentage of this project's annual budget (services, leasing, operation, HMIS, administration) is represented by HUD McKinney-Vento funding?
          </td>
          <td width="50%">
            <div class="row collapse">
              <div class="small-9 columns">
                <input type="text"
                   name="apr34_PercentHUDFunding"
                   value="#getDataAPR.apr34_PercentHUDFunding#"
                   placeholder="0"
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
      </tbody>
    </table>
  </div>
</div>
</cfoutput>