<!--- Set Variables --->
<cfset TargetTable = "DataAPR16">
<cfset UniqueID = "UniqueID00">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR16ID"
        Form = "dataapr16">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr16" formfields="aprID, inputUserID, projectID, reviewUserID, apr16_Under5_Total, apr16_5to12_Total, apr16_13to17_Total, apr16_18to24_Total, apr16_25to34_Total, apr16_35to44_Total, apr16_45to54_Total, apr16_55to61_Total, apr16_62Plus_Total, apr16_DKR_Total, apr16_Missing_Total, apr16_Total, apr16_Under5_HHWC, apr16_Under5_HHOC, apr16_Under5_HHU, apr16_5to12_HHWC, apr16_5to12_HHOC, apr16_5to12_HHU, apr16_13to17_HHWC, apr16_13to17_HHOC, apr16_13to17_HHU, apr16_18to24_HHWC, apr16_18to24_HHNC, apr16_18to24_HHU, apr16_25to34_HHWC, apr16_25to34_HHNC, apr16_25to34_HHU, apr16_35to44_HHWC, apr16_35to44_HHNC, apr16_35to44_HHU, apr16_45to54_HHWC, apr16_45to54_HHNC, apr16_45to54_HHU, apr16_55to61_HHWC, apr16_55to61_HHNC, apr16_55to61_HHU, apr16_62Plus_HHWC, apr16_62Plus_HHNC, apr16_62Plus_HHU, apr16_DKR_HHWC, apr16_DKR_HHNC, apr16_DKR_HHOC, apr16_DKR_HHU, apr16_Missing_HHU, apr16_Missing_HHNC, apr16_Missing_HHOC, apr16_Missing_HHWC, apr16_Total_HHNC, apr16_Total_HHWC, apr16_Total_HHOC, apr16_Total_HHU">
  <cfelse>
    <cfset FORM.DataAPR16ID = newCheck.DataAPR16ID>

<!--- Set Defaults --->

<cfif form.apr16_Under5_Total EQ "">
    <cfset form.apr16_Under5_Total=0>
</cfif>
<cfif form.apr16_5to12_Total EQ "">
    <cfset form.apr16_5to12_Total=0>
</cfif>
<cfif form.apr16_13to17_Total EQ "">
    <cfset form.apr16_13to17_Total=0>
</cfif>
<cfif form.apr16_18to24_Total EQ "">
    <cfset form.apr16_18to24_Total=0>
</cfif>
<cfif form.apr16_25to34_Total EQ "">
    <cfset form.apr16_25to34_Total=0>
</cfif>
<cfif form.apr16_35to44_Total EQ "">
    <cfset form.apr16_35to44_Total=0>
</cfif>
<cfif form.apr16_45to54_Total EQ "">
    <cfset form.apr16_45to54_Total=0>
</cfif>
<cfif form.apr16_55to61_Total EQ "">
    <cfset form.apr16_55to61_Total=0>
</cfif>
<cfif form.apr16_62Plus_Total EQ "">
    <cfset form.apr16_62Plus_Total=0>
</cfif>
<cfif form.apr16_DKR_Total EQ "">
    <cfset form.apr16_DKR_Total=0>
</cfif>
<cfif form.apr16_Missing_Total EQ "">
    <cfset form.apr16_Missing_Total=0>
</cfif>
<cfif form.apr16_Total EQ "">
    <cfset form.apr16_Total=0>
</cfif>
<cfif form.apr16_Under5_HHWC EQ "">
    <cfset form.apr16_Under5_HHWC=0>
</cfif>
<cfif form.apr16_Under5_HHOC EQ "">
    <cfset form.apr16_Under5_HHOC=0>
</cfif>
<cfif form.apr16_Under5_HHU EQ "">
    <cfset form.apr16_Under5_HHU=0>
</cfif>
<cfif form.apr16_5to12_HHWC EQ "">
    <cfset form.apr16_5to12_HHWC=0>
</cfif>
<cfif form.apr16_5to12_HHOC EQ "">
    <cfset form.apr16_5to12_HHOC=0>
</cfif>
<cfif form.apr16_5to12_HHU EQ "">
    <cfset form.apr16_5to12_HHU=0>
</cfif>
<cfif form.apr16_13to17_HHWC EQ "">
    <cfset form.apr16_13to17_HHWC=0>
</cfif>
<cfif form.apr16_13to17_HHOC EQ "">
    <cfset form.apr16_13to17_HHOC=0>
</cfif>
<cfif form.apr16_13to17_HHU EQ "">
    <cfset form.apr16_13to17_HHU=0>
</cfif>
<cfif form.apr16_18to24_HHWC EQ "">
    <cfset form.apr16_18to24_HHWC=0>
</cfif>
<cfif form.apr16_18to24_HHNC EQ "">
    <cfset form.apr16_18to24_HHNC=0>
</cfif>
<cfif form.apr16_18to24_HHU EQ "">
    <cfset form.apr16_18to24_HHU=0>
</cfif>
<cfif form.apr16_25to34_HHWC EQ "">
    <cfset form.apr16_25to34_HHWC=0>
</cfif>
<cfif form.apr16_25to34_HHNC EQ "">
    <cfset form.apr16_25to34_HHNC=0>
</cfif>
<cfif form.apr16_25to34_HHU EQ "">
    <cfset form.apr16_25to34_HHU=0>
</cfif>
<cfif form.apr16_35to44_HHWC EQ "">
    <cfset form.apr16_35to44_HHWC=0>
</cfif>
<cfif form.apr16_35to44_HHNC EQ "">
    <cfset form.apr16_35to44_HHNC=0>
</cfif>
<cfif form.apr16_35to44_HHU EQ "">
    <cfset form.apr16_35to44_HHU=0>
</cfif>
<cfif form.apr16_45to54_HHWC EQ "">
    <cfset form.apr16_45to54_HHWC=0>
</cfif>
<cfif form.apr16_45to54_HHNC EQ "">
    <cfset form.apr16_45to54_HHNC=0>
</cfif>
<cfif form.apr16_45to54_HHU EQ "">
    <cfset form.apr16_45to54_HHU=0>
</cfif>
<cfif form.apr16_55to61_HHWC EQ "">
    <cfset form.apr16_55to61_HHWC=0>
</cfif>
<cfif form.apr16_55to61_HHNC EQ "">
    <cfset form.apr16_55to61_HHNC=0>
</cfif>
<cfif form.apr16_55to61_HHU EQ "">
    <cfset form.apr16_55to61_HHU=0>
</cfif>
<cfif form.apr16_62Plus_HHWC EQ "">
    <cfset form.apr16_62Plus_HHWC=0>
</cfif>
<cfif form.apr16_62Plus_HHNC EQ "">
    <cfset form.apr16_62Plus_HHNC=0>
</cfif>
<cfif form.apr16_62Plus_HHU EQ "">
    <cfset form.apr16_62Plus_HHU=0>
</cfif>
<cfif form.apr16_DKR_HHWC EQ "">
    <cfset form.apr16_DKR_HHWC=0>
</cfif>
<cfif form.apr16_DKR_HHNC EQ "">
    <cfset form.apr16_DKR_HHNC=0>
</cfif>
<cfif form.apr16_DKR_HHOC EQ "">
    <cfset form.apr16_DKR_HHOC=0>
</cfif>
<cfif form.apr16_DKR_HHU EQ "">
    <cfset form.apr16_DKR_HHU=0>
</cfif>
<cfif form.apr16_Missing_HHU EQ "">
    <cfset form.apr16_Missing_HHU=0>
</cfif>
<cfif form.apr16_Missing_HHNC EQ "">
    <cfset form.apr16_Missing_HHNC=0>
</cfif>
<cfif form.apr16_Missing_HHOC EQ "">
    <cfset form.apr16_Missing_HHOC=0>
</cfif>
<cfif form.apr16_Missing_HHWC EQ "">
    <cfset form.apr16_Missing_HHWC=0>
</cfif>
<cfif form.apr16_Total_HHNC EQ "">
    <cfset form.apr16_Total_HHNC=0>
</cfif>
<cfif form.apr16_Total_HHWC EQ "">
    <cfset form.apr16_Total_HHWC=0>
</cfif>
<cfif form.apr16_Total_HHOC EQ "">
    <cfset form.apr16_Total_HHOC=0>
</cfif>
<cfif form.apr16_Total_HHU EQ "">
    <cfset form.apr16_Total_HHU=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr16" formfields="DataAPR16ID, aprID, inputUserID, projectID, reviewUserID, apr16_Under5_Total, apr16_5to12_Total, apr16_13to17_Total, apr16_18to24_Total, apr16_25to34_Total, apr16_35to44_Total, apr16_45to54_Total, apr16_55to61_Total, apr16_62Plus_Total, apr16_DKR_Total, apr16_Missing_Total, apr16_Total, apr16_Under5_HHWC, apr16_Under5_HHOC, apr16_Under5_HHU, apr16_5to12_HHWC, apr16_5to12_HHOC, apr16_5to12_HHU, apr16_13to17_HHWC, apr16_13to17_HHOC, apr16_13to17_HHU, apr16_18to24_HHWC, apr16_18to24_HHNC, apr16_18to24_HHU, apr16_25to34_HHWC, apr16_25to34_HHNC, apr16_25to34_HHU, apr16_35to44_HHWC, apr16_35to44_HHNC, apr16_35to44_HHU, apr16_45to54_HHWC, apr16_45to54_HHNC, apr16_45to54_HHU, apr16_55to61_HHWC, apr16_55to61_HHNC, apr16_55to61_HHU, apr16_62Plus_HHWC, apr16_62Plus_HHNC, apr16_62Plus_HHU, apr16_DKR_HHWC, apr16_DKR_HHNC, apr16_DKR_HHOC, apr16_DKR_HHU, apr16_Missing_HHU, apr16_Missing_HHNC, apr16_Missing_HHOC, apr16_Missing_HHWC, apr16_Total_HHNC, apr16_Total_HHWC, apr16_Total_HHOC, apr16_Total_HHU">
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
        Form = "dataapr16"
        Where = "thisProject">
<!---/ Get DataAPR --->     


<!--- Math --->
<cfset mathCols="5">
<cfset mathRows="11">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
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
          <td>Under 5</td>
          <td>
            <input type="number"
                   name="apr16_Under5_Total"
                   value="#getDataAPR.apr16_Under5_Total#"
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
          </td>
          <td>
             <input type="number"
                   name="apr16_Under5_HHWC"
                   value="#getDataAPR.apr16_Under5_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="1"
                   class="row1 col3"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_Under5_HHOC"
                   value="#getDataAPR.apr16_Under5_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="2"
                   class="row1 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_Under5_HHU"
                   value="#getDataAPR.apr16_Under5_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="3"
                   class="row1 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>5 - 12</td>
          <td>
            <input type="number"
                   name="apr16_5to12_Total"
                   value="#getDataAPR.apr16_5to12_Total#"
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
          </td>
          <td>
            <input type="number"
                   name="apr16_5to12_HHWC"
                   value="#getDataAPR.apr16_5to12_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="4"
                   class="row2 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_5to12_HHOC"
                   value="#getDataAPR.apr16_5to12_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="5"
                  class="row2 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_5to12_HHU"
                   value="#getDataAPR.apr16_5to12_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="6"
                  class="row2 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>13 - 17</td>
          <td>
            <input type="number"
                  name="apr16_13to17_Total"
                  value="#getDataAPR.apr16_13to17_Total#"
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
          </td>
          <td>
            <input type="number"
                  name="apr16_13to17_HHWC"
                  value="#getDataAPR.apr16_13to17_HHWC#"
                  placeholder="0"
                  min="0"
                   step="1"
                  maxlength="11"
                  tabindex="7"
                  class="row3 col3">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_13to17_HHOC"
                   value="#getDataAPR.apr16_13to17_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="8"
                  class="row3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_13to17_HHU"
                   value="#getDataAPR.apr16_13to17_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="9"
                  class="row3 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>18 - 24</td>
          <td>
            <input type="number"
                         name="apr16_18to24_Total"
                         value="#getDataAPR.apr16_18to24_Total#"
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
                       name="apr16_18to24_HHNC"
                       value="#getDataAPR.apr16_18to24_HHNC#"
                       placeholder="0"
                       min="0"
                   step="1"
                      maxlength="11"
                      tabindex="10"
                      class="row4 col2">
                <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_18to24_HHWC"
                   value="#getDataAPR.apr16_18to24_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="11"
                  class="row4 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          </td>
          <td>
            <input type="number"
                   name="apr16_18to24_HHU"
                   value="#getDataAPR.apr16_18to24_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="12"
                  class="row4 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>25 - 34</td>
          <td>
            <input type="number"
                   name="apr16_25to34_Total"
                   value="#getDataAPR.apr16_25to34_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr16_25to34_HHNC"
                     value="#getDataAPR.apr16_25to34_HHNC#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11"
                    tabindex="13"
                    class="row5 col2">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_25to34_HHWC"
                   value="#getDataAPR.apr16_25to34_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="14"
                  class="row5 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          </td>
          <td>
            <input type="number"
                   name="apr16_25to34_HHU"
                   value="#getDataAPR.apr16_25to34_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="15"
                  class="row5 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>35 - 44</td>
          <td>
            <input type="number"
                   name="apr16_35to44_Total"
                   value="#getDataAPR.apr16_35to44_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_35to44_HHNC"
                   value="#getDataAPR.apr16_35to44_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="16"
                  class="row6 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_35to44_HHWC"
                   value="#getDataAPR.apr16_35to44_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="17"
                  class="row6 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          </td>
          <td>
            <input type="number"
                   name="apr16_35to44_HHU"
                   value="#getDataAPR.apr16_35to44_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="18"
                  class="row6 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>45 - 54</td>
          <td>
            <input type="number"
                   name="apr16_45to54_Total"
                   value="#getDataAPR.apr16_45to54_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="col1 BGLightGray"
                  id="sumR7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_45to54_HHNC"
                   value="#getDataAPR.apr16_45to54_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="19"
                  class="row7 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_45to54_HHWC"
                   value="#getDataAPR.apr16_45to54_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="20"
                  class="row7 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>

          </td>
          <td>
            <input type="number"
                   name="apr16_45to54_HHU"
                   value="#getDataAPR.apr16_45to54_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="21"
                  class="row7 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>55 - 61</td>
          <td>
            <input type="number"
                   name="apr16_55to61_Total"
                   value="#getDataAPR.apr16_55to61_Total#"
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
                   name="apr16_55to61_HHNC"
                   value="#getDataAPR.apr16_55to61_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="22"
                  class="row8 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_55to61_HHWC"
                   value="#getDataAPR.apr16_55to61_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="23"
                  class="row8 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          </td>
          <td>
            <input type="number"
                   name="apr16_55to61_HHU"
                   value="#getDataAPR.apr16_55to61_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="24"
                  class="row8 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>62 +</td>
          <td>
            <input type="number"
                     name="apr16_62Plus_Total"
                     value="#getDataAPR.apr16_62Plus_Total#"
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
                   name="apr16_62Plus_HHNC"
                   value="#getDataAPR.apr16_62Plus_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="25"
                  class="row9 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_62Plus_HHWC"
                   value="#getDataAPR.apr16_62Plus_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="26"
                  class="row9 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          </td>
          <td>
            <input type="number"
                   name="apr16_62Plus_HHU"
                   value="#getDataAPR.apr16_62Plus_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="27"
                  class="row9 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>Don't Know/Refused</td>
          <td>
            <input type="number"
                   name="apr16_DKR_Total"
                   value="#getDataAPR.apr16_DKR_Total#"
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
                   name="apr16_DKR_HHNC"
                   value="#getDataAPR.apr16_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="28"
                  class="row10 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_DKR_HHWC"
                   value="#getDataAPR.apr16_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="29"
                  class="row10 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_DKR_HHOC"
                   value="#getDataAPR.apr16_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="30"
                  class="row10 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_DKR_HHU"
                   value="#getDataAPR.apr16_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="31"
                  class="row10 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr16_Missing_Total"
                   value="#getDataAPR.apr16_Missing_Total#"
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
                   name="apr16_Missing_HHNC"
                   value="#getDataAPR.apr16_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="32"
                  class="row11 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                 name="apr16_Missing_HHWC"
                 value="#getDataAPR.apr16_Missing_HHWC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                tabindex="33"
                class="row11 col3">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_Missing_HHOC"
                   value="#getDataAPR.apr16_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="34"
                  class="row11 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr16_Missing_HHU"
                   value="#getDataAPR.apr16_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  tabindex="35"
                  class="row11 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
            <input type="number"
                   name="apr16_Total"
                   value="#getDataAPR.apr16_Total#"
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
                   name="apr16_Total_HHNC"
                   value="#getDataAPR.apr16_Total_HHNC#"
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
                   name="apr16_Total_HHWC"
                   value="#getDataAPR.apr16_Total_HHWC#"
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
                   name="apr16_Total_HHOC"
                   value="#getDataAPR.apr16_Total_HHOC#"
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
                   name="apr16_Total_HHU"
                   value="#getDataAPR.apr16_Total_HHU#"
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
    <cfset nexttab = "36">
  </div>
</div>
</cfoutput>