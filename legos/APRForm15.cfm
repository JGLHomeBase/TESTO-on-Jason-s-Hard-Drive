/<!--- Set Variables --->
<cfset TargetTable = "DataAPR15">
<cfset UniqueID = "UniqueID15">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR15ID"
        Form = "dataapr15">
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
   <cfinsert datasource="#DataSource#" tablename="dataapr15" formfields="aprID, inputUserID, projectID, reviewUserID, apr15Adult_M_Total, apr15Adult_M_HHNC, apr15Adult_M_HHWC, apr15Adult_M_HHU, apr15Adult_F_Total, apr15Adult_F_HHNC, apr15Adult_F_HHWC, apr15Adult_F_HHU, apr15Adult_Trans_Total, apr15Adult_Trans_HHNC, apr15Adult_Trans_HHWC, apr15Adult_Trans_HHU, apr15Adult_Other_Total, apr15Adult_Other_HHNC, apr15Adult_Other_HHWC, apr15Adult_Other_HHU, apr15Adult_DKR_Total, apr15Adult_DKR_HHNC, apr15Adult_DKR_HHWC, apr15Adult_DKR_HHU, apr15Adult_Missing_Total, apr15Adult_Missing_HHNC, apr15Adult_Missing_HHWC, apr15Adult_Missing_HHU, apr15Adult_Total, apr15Adult_Subtotal_HHNC, apr15Adult_Subtotal_HHWC, apr15Adult_Subtotal_HHU, apr15Child_M_Total, apr15Child_M_HHWC, apr15Child_M_HHOC, apr15Child_M_HHU, apr15Child_F_Total, apr15Child_F_HHWC, apr15Child_F_HHOC, apr15Child_F_HHU, apr15Child_Trans_Total, apr15Child_Trans_HHWC, apr15Child_Trans_HHOC, apr15Child_Trans_HHU, apr15Child_Other_Total, apr15Child_Other_HHWC, apr15Child_Other_HHOC, apr15Child_Other_HHU, apr15Child_DKR_Total, apr15Child_DKR_HHWC, apr15Child_DKR_HHOC, apr15Child_DKR_HHU, apr15Child_Missing_Total, apr15Child_Missing_HHWC, apr15Child_Missing_HHOC, apr15Child_Missing_HHU, apr15Child_Total, apr15Child_Subtotal_HHWC, apr15Child_Subtotal_HHOC, apr15Child_Subtotal_HHU, apr15MissingAge_M_Total, apr15MissingAge_M_HHNC, apr15MissingAge_M_HHWC, apr15MissingAge_M_HHOC, apr15MissingAge_M_HHU, apr15MissingAge_F_Total, apr15MissingAge_F_HHNC, apr15MissingAge_F_HHWC, apr15MissingAge_F_HHOC, apr15MissingAge_F_HHU, apr15MissingAge_Trans_Total, apr15MissingAge_Trans_HHWC, apr15MissingAge_Trans_HHNC, apr15MissingAge_Trans_HHOC, apr15MissingAge_Trans_HHU, apr15MissingAge_Other_Total, apr15MissingAge_Other_HHNC, apr15MissingAge_Other_HHWC, apr15MissingAge_Other_HHOC, apr15MissingAge_Other_HHU, apr15MissingAge_DKR_Total, apr15MissingAge_DKR_HHNC, apr15MissingAge_DKR_HHWC, apr15MissingAge_DKR_HHOC, apr15MissingAge_DKR_HHU, apr15MissingAge_Missing_Total, apr15MissingAge_Missing_HHNC, apr15MissingAge_Missing_HHWC, apr15MissingAge_Missing_HHOC, apr15MissingAge_Missing_HHU, apr15MissingAge_Total, apr15MissingAge_Subtotal_HHNC, apr15MissingAge_Subtotal_HHWC, apr15MissingAge_Subtotal_HHOC, apr15MissingAge_Subtotal_HHU">
  <cfelse>
    <cfset FORM.DataAPR15ID = newCheck.DataAPR15ID>

<!--- Set Defaults --->

<cfif form.apr15Adult_M_Total EQ "">
    <cfset form.apr15Adult_M_Total=0>
</cfif>
<cfif form.apr15Adult_M_HHNC EQ "">
    <cfset form.apr15Adult_M_HHNC=0>
</cfif>
<cfif form.apr15Adult_M_HHWC EQ "">
    <cfset form.apr15Adult_M_HHWC=0>
</cfif>
<cfif form.apr15Adult_M_HHU EQ "">
    <cfset form.apr15Adult_M_HHU=0>
</cfif>
<cfif form.apr15Adult_F_Total EQ "">
    <cfset form.apr15Adult_F_Total=0>
</cfif>
<cfif form.apr15Adult_F_HHNC EQ "">
    <cfset form.apr15Adult_F_HHNC=0>
</cfif>
<cfif form.apr15Adult_F_HHWC EQ "">
    <cfset form.apr15Adult_F_HHWC=0>
</cfif>
<cfif form.apr15Adult_F_HHU EQ "">
    <cfset form.apr15Adult_F_HHU=0>
</cfif>
<cfif form.apr15Adult_Trans_Total EQ "">
    <cfset form.apr15Adult_Trans_Total=0>
</cfif>
<cfif form.apr15Adult_Trans_HHNC EQ "">
    <cfset form.apr15Adult_Trans_HHNC=0>
</cfif>
<cfif form.apr15Adult_Trans_HHWC EQ "">
    <cfset form.apr15Adult_Trans_HHWC=0>
</cfif>
<cfif form.apr15Adult_Trans_HHU EQ "">
    <cfset form.apr15Adult_Trans_HHU=0>
</cfif>
<cfif form.apr15Adult_Other_Total EQ "">
    <cfset form.apr15Adult_Other_Total=0>
</cfif>
<cfif form.apr15Adult_Other_HHNC EQ "">
    <cfset form.apr15Adult_Other_HHNC=0>
</cfif>
<cfif form.apr15Adult_Other_HHWC EQ "">
    <cfset form.apr15Adult_Other_HHWC=0>
</cfif>
<cfif form.apr15Adult_Other_HHU EQ "">
    <cfset form.apr15Adult_Other_HHU=0>
</cfif>
<cfif form.apr15Adult_DKR_Total EQ "">
    <cfset form.apr15Adult_DKR_Total=0>
</cfif>
<cfif form.apr15Adult_DKR_HHNC EQ "">
    <cfset form.apr15Adult_DKR_HHNC=0>
</cfif>
<cfif form.apr15Adult_DKR_HHWC EQ "">
    <cfset form.apr15Adult_DKR_HHWC=0>
</cfif>
<cfif form.apr15Adult_DKR_HHU EQ "">
    <cfset form.apr15Adult_DKR_HHU=0>
</cfif>
<cfif form.apr15Adult_Missing_Total EQ "">
    <cfset form.apr15Adult_Missing_Total=0>
</cfif>
<cfif form.apr15Adult_Missing_HHNC EQ "">
    <cfset form.apr15Adult_Missing_HHNC=0>
</cfif>
<cfif form.apr15Adult_Missing_HHWC EQ "">
    <cfset form.apr15Adult_Missing_HHWC=0>
</cfif>
<cfif form.apr15Adult_Missing_HHU EQ "">
    <cfset form.apr15Adult_Missing_HHU=0>
</cfif>
<cfif form.apr15Adult_Total EQ "">
    <cfset form.apr15Adult_Total=0>
</cfif>
<cfif form.apr15Adult_Subtotal_HHNC EQ "">
    <cfset form.apr15Adult_Subtotal_HHNC=0>
</cfif>
<cfif form.apr15Adult_Subtotal_HHWC EQ "">
    <cfset form.apr15Adult_Subtotal_HHWC=0>
</cfif>
<cfif form.apr15Adult_Subtotal_HHU EQ "">
    <cfset form.apr15Adult_Subtotal_HHU=0>
</cfif>
<cfif form.apr15Child_M_Total EQ "">
    <cfset form.apr15Child_M_Total=0>
</cfif>
<cfif form.apr15Child_M_HHWC EQ "">
    <cfset form.apr15Child_M_HHWC=0>
</cfif>
<cfif form.apr15Child_M_HHOC EQ "">
    <cfset form.apr15Child_M_HHOC=0>
</cfif>
<cfif form.apr15Child_M_HHU EQ "">
    <cfset form.apr15Child_M_HHU=0>
</cfif>
<cfif form.apr15Child_F_Total EQ "">
    <cfset form.apr15Child_F_Total=0>
</cfif>
<cfif form.apr15Child_F_HHWC EQ "">
    <cfset form.apr15Child_F_HHWC=0>
</cfif>
<cfif form.apr15Child_F_HHOC EQ "">
    <cfset form.apr15Child_F_HHOC=0>
</cfif>
<cfif form.apr15Child_F_HHU EQ "">
    <cfset form.apr15Child_F_HHU=0>
</cfif>
<cfif form.apr15Child_Trans_Total EQ "">
    <cfset form.apr15Child_Trans_Total=0>
</cfif>
<cfif form.apr15Child_Trans_HHWC EQ "">
    <cfset form.apr15Child_Trans_HHWC=0>
</cfif>
<cfif form.apr15Child_Trans_HHOC EQ "">
    <cfset form.apr15Child_Trans_HHOC=0>
</cfif>
<cfif form.apr15Child_Trans_HHU EQ "">
    <cfset form.apr15Child_Trans_HHU=0>
</cfif>
<cfif form.apr15Child_Other_Total EQ "">
    <cfset form.apr15Child_Other_Total=0>
</cfif>
<cfif form.apr15Child_Other_HHWC EQ "">
    <cfset form.apr15Child_Other_HHWC=0>
</cfif>
<cfif form.apr15Child_Other_HHOC EQ "">
    <cfset form.apr15Child_Other_HHOC=0>
</cfif>
<cfif form.apr15Child_Other_HHU EQ "">
    <cfset form.apr15Child_Other_HHU=0>
</cfif>
<cfif form.apr15Child_DKR_Total EQ "">
    <cfset form.apr15Child_DKR_Total=0>
</cfif>
<cfif form.apr15Child_DKR_HHWC EQ "">
    <cfset form.apr15Child_DKR_HHWC=0>
</cfif>
<cfif form.apr15Child_DKR_HHOC EQ "">
    <cfset form.apr15Child_DKR_HHOC=0>
</cfif>
<cfif form.apr15Child_DKR_HHU EQ "">
    <cfset form.apr15Child_DKR_HHU=0>
</cfif>
<cfif form.apr15Child_Missing_Total EQ "">
    <cfset form.apr15Child_Missing_Total=0>
</cfif>
<cfif form.apr15Child_Missing_HHWC EQ "">
    <cfset form.apr15Child_Missing_HHWC=0>
</cfif>
<cfif form.apr15Child_Missing_HHOC EQ "">
    <cfset form.apr15Child_Missing_HHOC=0>
</cfif>
<cfif form.apr15Child_Missing_HHU EQ "">
    <cfset form.apr15Child_Missing_HHU=0>
</cfif>
<cfif form.apr15Child_Total EQ "">
    <cfset form.apr15Child_Total=0>
</cfif>
<cfif form.apr15Child_Subtotal_HHWC EQ "">
    <cfset form.apr15Child_Subtotal_HHWC=0>
</cfif>
<cfif form.apr15Child_Subtotal_HHOC EQ "">
    <cfset form.apr15Child_Subtotal_HHOC=0>
</cfif>
<cfif form.apr15Child_Subtotal_HHU EQ "">
    <cfset form.apr15Child_Subtotal_HHU=0>
</cfif>
<cfif form.apr15MissingAge_M_Total EQ "">
    <cfset form.apr15MissingAge_M_Total=0>
</cfif>
<cfif form.apr15MissingAge_M_HHNC EQ "">
    <cfset form.apr15MissingAge_M_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_M_HHWC EQ "">
    <cfset form.apr15MissingAge_M_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_M_HHOC EQ "">
    <cfset form.apr15MissingAge_M_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_M_HHU EQ "">
    <cfset form.apr15MissingAge_M_HHU=0>
</cfif>
<cfif form.apr15MissingAge_F_Total EQ "">
    <cfset form.apr15MissingAge_F_Total=0>
</cfif>
<cfif form.apr15MissingAge_F_HHNC EQ "">
    <cfset form.apr15MissingAge_F_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_F_HHWC EQ "">
    <cfset form.apr15MissingAge_F_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_F_HHOC EQ "">
    <cfset form.apr15MissingAge_F_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_F_HHU EQ "">
    <cfset form.apr15MissingAge_F_HHU=0>
</cfif>
<cfif form.apr15MissingAge_Trans_Total EQ "">
    <cfset form.apr15MissingAge_Trans_Total=0>
</cfif>
<cfif form.apr15MissingAge_Trans_HHWC EQ "">
    <cfset form.apr15MissingAge_Trans_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_Trans_HHNC EQ "">
    <cfset form.apr15MissingAge_Trans_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_Trans_HHOC EQ "">
    <cfset form.apr15MissingAge_Trans_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_Trans_HHU EQ "">
    <cfset form.apr15MissingAge_Trans_HHU=0>
</cfif>
<cfif form.apr15MissingAge_Other_Total EQ "">
    <cfset form.apr15MissingAge_Other_Total=0>
</cfif>
<cfif form.apr15MissingAge_Other_HHNC EQ "">
    <cfset form.apr15MissingAge_Other_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_Other_HHWC EQ "">
    <cfset form.apr15MissingAge_Other_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_Other_HHOC EQ "">
    <cfset form.apr15MissingAge_Other_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_Other_HHU EQ "">
    <cfset form.apr15MissingAge_Other_HHU=0>
</cfif>
<cfif form.apr15MissingAge_DKR_Total EQ "">
    <cfset form.apr15MissingAge_DKR_Total=0>
</cfif>
<cfif form.apr15MissingAge_DKR_HHNC EQ "">
    <cfset form.apr15MissingAge_DKR_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_DKR_HHWC EQ "">
    <cfset form.apr15MissingAge_DKR_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_DKR_HHOC EQ "">
    <cfset form.apr15MissingAge_DKR_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_DKR_HHU EQ "">
    <cfset form.apr15MissingAge_DKR_HHU=0>
</cfif>
<cfif form.apr15MissingAge_Missing_Total EQ "">
    <cfset form.apr15MissingAge_Missing_Total=0>
</cfif>
<cfif form.apr15MissingAge_Missing_HHNC EQ "">
    <cfset form.apr15MissingAge_Missing_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_Missing_HHWC EQ "">
    <cfset form.apr15MissingAge_Missing_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_Missing_HHOC EQ "">
    <cfset form.apr15MissingAge_Missing_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_Missing_HHU EQ "">
    <cfset form.apr15MissingAge_Missing_HHU=0>
</cfif>
<cfif form.apr15MissingAge_Total EQ "">
    <cfset form.apr15MissingAge_Total=0>
</cfif>
<cfif form.apr15MissingAge_Subtotal_HHNC EQ "">
    <cfset form.apr15MissingAge_Subtotal_HHNC=0>
</cfif>
<cfif form.apr15MissingAge_Subtotal_HHWC EQ "">
    <cfset form.apr15MissingAge_Subtotal_HHWC=0>
</cfif>
<cfif form.apr15MissingAge_Subtotal_HHOC EQ "">
    <cfset form.apr15MissingAge_Subtotal_HHOC=0>
</cfif>
<cfif form.apr15MissingAge_Subtotal_HHU EQ "">
    <cfset form.apr15MissingAge_Subtotal_HHU=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr15" formfields="DataAPR15ID, aprID, inputUserID, projectID, reviewUserID, apr15Adult_M_Total, apr15Adult_M_HHNC, apr15Adult_M_HHWC, apr15Adult_M_HHU, apr15Adult_F_Total, apr15Adult_F_HHNC, apr15Adult_F_HHWC, apr15Adult_F_HHU, apr15Adult_Trans_Total, apr15Adult_Trans_HHNC, apr15Adult_Trans_HHWC, apr15Adult_Trans_HHU, apr15Adult_Other_Total, apr15Adult_Other_HHNC, apr15Adult_Other_HHWC, apr15Adult_Other_HHU, apr15Adult_DKR_Total, apr15Adult_DKR_HHNC, apr15Adult_DKR_HHWC, apr15Adult_DKR_HHU, apr15Adult_Missing_Total, apr15Adult_Missing_HHNC, apr15Adult_Missing_HHWC, apr15Adult_Missing_HHU, apr15Adult_Total, apr15Adult_Subtotal_HHNC, apr15Adult_Subtotal_HHWC, apr15Adult_Subtotal_HHU, apr15Child_M_Total, apr15Child_M_HHWC, apr15Child_M_HHOC, apr15Child_M_HHU, apr15Child_F_Total, apr15Child_F_HHWC, apr15Child_F_HHOC, apr15Child_F_HHU, apr15Child_Trans_Total, apr15Child_Trans_HHWC, apr15Child_Trans_HHOC, apr15Child_Trans_HHU, apr15Child_Other_Total, apr15Child_Other_HHWC, apr15Child_Other_HHOC, apr15Child_Other_HHU, apr15Child_DKR_Total, apr15Child_DKR_HHWC, apr15Child_DKR_HHOC, apr15Child_DKR_HHU, apr15Child_Missing_Total, apr15Child_Missing_HHWC, apr15Child_Missing_HHOC, apr15Child_Missing_HHU, apr15Child_Total, apr15Child_Subtotal_HHWC, apr15Child_Subtotal_HHOC, apr15Child_Subtotal_HHU, apr15MissingAge_M_Total, apr15MissingAge_M_HHNC, apr15MissingAge_M_HHWC, apr15MissingAge_M_HHOC, apr15MissingAge_M_HHU, apr15MissingAge_F_Total, apr15MissingAge_F_HHNC, apr15MissingAge_F_HHWC, apr15MissingAge_F_HHOC, apr15MissingAge_F_HHU, apr15MissingAge_Trans_Total, apr15MissingAge_Trans_HHWC, apr15MissingAge_Trans_HHNC, apr15MissingAge_Trans_HHOC, apr15MissingAge_Trans_HHU, apr15MissingAge_Other_Total, apr15MissingAge_Other_HHNC, apr15MissingAge_Other_HHWC, apr15MissingAge_Other_HHOC, apr15MissingAge_Other_HHU, apr15MissingAge_DKR_Total, apr15MissingAge_DKR_HHNC, apr15MissingAge_DKR_HHWC, apr15MissingAge_DKR_HHOC, apr15MissingAge_DKR_HHU, apr15MissingAge_Missing_Total, apr15MissingAge_Missing_HHNC, apr15MissingAge_Missing_HHWC, apr15MissingAge_Missing_HHOC, apr15MissingAge_Missing_HHU, apr15MissingAge_Total, apr15MissingAge_Subtotal_HHNC, apr15MissingAge_Subtotal_HHWC, apr15MissingAge_Subtotal_HHOC, apr15MissingAge_Subtotal_HHU">
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
        Form = "dataapr15"
        Where = "thisProject">
<!---/ Get DataAPR --->     

<!--- Math --->
<cfset mathCols="13">
<cfset mathRows="21">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Gender of Adults</h3>
    <h4>Number of Adults in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
            <td>
                Male
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_M_Total"
                       value="#getDataAPR.apr15Adult_M_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col1 BGLightGray"
                      id="sumR1"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_M_HHNC"
                       value="#getDataAPR.apr15Adult_M_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="1"
                       class="row1 col2"
                       min="0"
                       step="1"
                       autofocus>
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_M_HHWC"
                       value="#getDataAPR.apr15Adult_M_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="2"
                      class="row1 col3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_M_HHU"
                       value="#getDataAPR.apr15Adult_M_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="3"
                      class="row1 col4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Female
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_F_Total"
                       value="#getDataAPR.apr15Adult_F_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col1 BGLightGray"
                      id="sumR2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_F_HHNC"
                       value="#getDataAPR.apr15Adult_F_HHNC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="4"
                      class="row2 col2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_F_HHWC"
                       value="#getDataAPR.apr15Adult_F_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="5"
                      class="row2 col3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_F_HHU"
                       value="#getDataAPR.apr15Adult_F_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="6"
                      class="row2 col4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Transgender
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Trans_Total"
                       value="#getDataAPR.apr15Adult_Trans_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col1 BGLightGray"
                      id="sumR3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Trans_HHNC"
                       value="#getDataAPR.apr15Adult_Trans_HHNC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="7"
                      class="row3 col2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Trans_HHWC"
                       value="#getDataAPR.apr15Adult_Trans_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="8"
                      class="row3 col3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Trans_HHU"
                       value="#getDataAPR.apr15Adult_Trans_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="9"
                       class="row3 col4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Other
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Other_Total"
                       value="#getDataAPR.apr15Adult_Other_Total#"
                       placeholder="0"
                      maxlength="11"
                       readonly
                      class="col1 BGLightGray"
                      id="sumR4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Other_HHNC"
                       value="#getDataAPR.apr15Adult_Other_HHNC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="10"
                      class="row4 col2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Other_HHWC"
                       value="#getDataAPR.apr15Adult_Other_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="11"
                      class="row4 col3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Other_HHU"
                       value="#getDataAPR.apr15Adult_Other_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="12"
                      class="row4 col4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Don't Know/Refused 
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_DKR_Total"
                       value="#getDataAPR.apr15Adult_DKR_Total#"
                       placeholder="0"
                      maxlength="11"
                       readonly
                      class="col1 BGLightGray"
                      id="sumR5"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
                            </td>
            <td>
                <input type="number"
                       name="apr15Adult_DKR_HHNC"
                       value="#getDataAPR.apr15Adult_DKR_HHNC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="13"
                      class="row5 col2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_DKR_HHWC"
                       value="#getDataAPR.apr15Adult_DKR_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="14"
                       class="row5 col3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_DKR_HHU"
                       value="#getDataAPR.apr15Adult_DKR_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="15"
                      class="row5 col4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Information Missing
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Missing_Total"
                       value="#getDataAPR.apr15Adult_Missing_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col1 BGLightGray"
                      id="sumR6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Missing_HHNC"
                       value="#getDataAPR.apr15Adult_Missing_HHNC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="16"
                       class="row6 col2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Missing_HHWC"
                       value="#getDataAPR.apr15Adult_Missing_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="17"
                       class="row6 col3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Missing_HHU"
                       value="#getDataAPR.apr15Adult_Missing_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="18"
                      class="row6 col4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                <b>Subtotal</b>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Total"
                       value="#getDataAPR.apr15Adult_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="subtotal_adults BGLightGray"
                      id="sumC1"
                       min="0"
                       step="1">
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Subtotal_HHNC"
                       value="#getDataAPR.apr15Adult_Subtotal_HHNC#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC2"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Subtotal_HHWC"
                       value="#getDataAPR.apr15Adult_Subtotal_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC3"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Adult_Subtotal_HHU"
                       value="#getDataAPR.apr15Adult_Subtotal_HHU#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC4"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>


<div class="row">
  <div class="large-12 columns">
    <h3>Gender of Children</h3>
    <h4>Number of Children in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
            <td>
                Male
            </td>
            <td>
                <input type="number"
                       name="apr15Child_M_Total"
                       value="#getDataAPR.apr15Child_M_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col5 BGLightGray"
                      id="sumR7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_M_HHWC"
                       value="#getDataAPR.apr15Child_M_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="19"
                      class="row7 col6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_M_HHOC"
                       value="#getDataAPR.apr15Child_M_HHOC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="20"
                      class="row7 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_M_HHU"
                       value="#getDataAPR.apr15Child_M_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="21"
                      class="row7 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Female
            </td>
            <td>
                <input type="number"
                       name="apr15Child_F_Total"
                       value="#getDataAPR.apr15Child_F_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col5 BGLightGray"
                      id="sumR8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_F_HHWC"
                       value="#getDataAPR.apr15Child_F_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="22"
                      class="row8 col6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_F_HHOC"
                       value="#getDataAPR.apr15Child_F_HHOC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="23"
                       class="row8 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_F_HHU"
                       value="#getDataAPR.apr15Child_F_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="24"
                      class="row8 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Transgender
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Trans_Total"
                       value="#getDataAPR.apr15Child_Trans_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col5 BGLightGray"
                      id="sumR9"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Trans_HHWC"
                       value="#getDataAPR.apr15Child_Trans_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="25"
                      class="row9 col6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Trans_HHOC"
                       value="#getDataAPR.apr15Child_Trans_HHOC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="26"
                       class="row9 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Trans_HHU"
                       value="#getDataAPR.apr15Child_Trans_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="27"
                      class="row9 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Other
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Other_Total"
                       value="#getDataAPR.apr15Child_Other_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col5 BGLightGray"
                      id="sumR10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Other_HHWC"
                       value="#getDataAPR.apr15Child_Other_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="28"
                      class="row10 col6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Other_HHOC"
                       value="#getDataAPR.apr15Child_Other_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="29"
                      class="row10 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Other_HHU"
                       value="#getDataAPR.apr15Child_Other_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="30"
                      class="row10 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Don't Know/Refused 
            </td>
            <td>
                <input type="number"
                       name="apr15Child_DKR_Total"
                       value="#getDataAPR.apr15Child_DKR_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col5 BGLightGray"
                      id="sumR11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_DKR_HHWC"
                       value="#getDataAPR.apr15Child_DKR_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="31"
                      class="row11 col6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_DKR_HHOC"
                       value="#getDataAPR.apr15Child_DKR_HHOC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="32"
                      class="row11 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_DKR_HHU"
                       value="#getDataAPR.apr15Child_DKR_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="33"
                      class="row11 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Information Missing
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Missing_Total"
                       value="#getDataAPR.apr15Child_Missing_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="col5 BGLightGray"
                      id="sumR12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Missing_HHWC"
                       value="#getDataAPR.apr15Child_Missing_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="34"
                      class="row12 col6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
               <input type="number"
                       name="apr15Child_Missing_HHOC"
                       value="#getDataAPR.apr15Child_Missing_HHOC#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="35"
                      class="row12 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Missing_HHU"
                       value="#getDataAPR.apr15Child_Missing_HHU#"
                       placeholder="0"
                      maxlength="11"
                      tabindex="36"
                      class="row12 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                <b>Subtotal</b>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Total"
                       value="#getDataAPR.apr15Child_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC5"
                       min="0"
                       step="1">
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Subtotal_HHWC"
                       value="#getDataAPR.apr15Child_Subtotal_HHWC#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Subtotal_HHOC"
                       value="#getDataAPR.apr15Child_Subtotal_HHOC#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="subtotal_children BGLightGray"
                      id="sumC7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15Child_Subtotal_HHU"
                       value="#getDataAPR.apr15Child_Subtotal_HHU#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="row">
  <div class="large-12 columns">
    <h3>Gender of Persons Missing Age Information</h3>
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
            <td>
                Male
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_M_Total"
                       value="#getDataAPR.apr15MissingAge_M_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="col9 BGLightGray"
                       id="sumR13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
                            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_M_HHNC"
                       value="#getDataAPR.apr15MissingAge_M_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="37"
                       class="row13 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_M_HHWC"
                       value="#getDataAPR.apr15MissingAge_M_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="38"
                       class="row13 col11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_M_HHOC"
                       value="#getDataAPR.apr15MissingAge_M_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="39"
                       class="row13 col12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_M_HHU"
                       value="#getDataAPR.apr15MissingAge_M_HHU#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="40"
                       class="row13 col13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Female
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_F_Total"
                       value="#getDataAPR.apr15MissingAge_F_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="col9 BGLightGray"
                       id="sumR14"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_F_HHNC"
                       value="#getDataAPR.apr15MissingAge_F_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="41"
                       class="row14 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_F_HHWC"
                       value="#getDataAPR.apr15MissingAge_F_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="42"
                       class="row14 col11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_F_HHOC"
                       value="#getDataAPR.apr15MissingAge_F_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="43"
                       class="row14 col12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_F_HHU"
                       value="#getDataAPR.apr15MissingAge_F_HHU#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="44"
                       class="row14 col13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Transgender
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Trans_Total"
                       value="#getDataAPR.apr15MissingAge_Trans_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="col9 BGLightGray"
                       id="sumR15"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Trans_HHWC"
                       value="#getDataAPR.apr15MissingAge_Trans_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="45"
                       class="row15 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Trans_HHNC"
                       value="#getDataAPR.apr15MissingAge_Trans_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="46"
                       class="row15 col11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Trans_HHOC"
                       value="#getDataAPR.apr15MissingAge_Trans_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="47"
                       class="row15 col12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Trans_HHU"
                       value="#getDataAPR.apr15MissingAge_Trans_HHU#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="48"
                       class="row15 col13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Other
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Other_Total"
                       value="#getDataAPR.apr15MissingAge_Other_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="col9 BGLightGray"
                       id="sumR16"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Other_HHNC"
                       value="#getDataAPR.apr15MissingAge_Other_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="49"
                       class="row16 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Other_HHWC"
                       value="#getDataAPR.apr15MissingAge_Other_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="50"
                       class="row16 col11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Other_HHOC"
                       value="#getDataAPR.apr15MissingAge_Other_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="51"
                       class="row16 col12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Other_HHU"
                       value="#getDataAPR.apr15MissingAge_Other_HHU#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="52"
                       class="row16 col13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Don't Know/Refused 
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_DKR_Total"
                       value="#getDataAPR.apr15MissingAge_DKR_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="col9 BGLightGray"
                       id="sumR17"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_DKR_HHNC"
                       value="#getDataAPR.apr15MissingAge_DKR_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="53"
                       class="row17 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_DKR_HHWC"
                       value="#getDataAPR.apr15MissingAge_DKR_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="54"
                       class="row17 col11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_DKR_HHOC"
                       value="#getDataAPR.apr15MissingAge_DKR_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="55"
                       class="row17 col12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_DKR_HHU"
                       value="#getDataAPR.apr15MissingAge_DKR_HHU#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="56"
                       class="row17 col13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                Information Missing
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Missing_Total"
                       value="#getDataAPR.apr15MissingAge_Missing_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="col9 BGLightGray"
                       id="sumR18"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Missing_HHNC"
                       value="#getDataAPR.apr15MissingAge_Missing_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="57"
                       class="row18 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Missing_HHWC"
                       value="#getDataAPR.apr15MissingAge_Missing_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="58"
                       class="row18 col11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Missing_HHOC"
                       value="#getDataAPR.apr15MissingAge_Missing_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="59"
                       class="row18 col12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Missing_HHU"
                       value="#getDataAPR.apr15MissingAge_Missing_HHU#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="60"
                       class="row18 col13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                <b>Subtotal</b>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Total"
                       value="#getDataAPR.apr15MissingAge_Total#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="subtotal_ageunknown BGLightGray"
                       id="sumC9"
                       min="0"
                       step="1">
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Subtotal_HHNC"
                       value="#getDataAPR.apr15MissingAge_Subtotal_HHNC#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="BGLightGray"
                       id="sumC10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Subtotal_HHWC"
                       value="#getDataAPR.apr15MissingAge_Subtotal_HHWC#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="BGLightGray"
                       id="sumC11"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Subtotal_HHOC"
                       value="#getDataAPR.apr15MissingAge_Subtotal_HHOC#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="BGLightGray"
                       id="sumC12"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr15MissingAge_Subtotal_HHU"
                       value="#getDataAPR.apr15MissingAge_Subtotal_HHU#"
                       placeholder="0"
                       maxlength="11"
                       readonly
                       class="BGLightGray"
                       id="sumC13"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
      </tbody>
    </table>
    <cfset nexttab = "61">
  </div>
</div>
</cfoutput>