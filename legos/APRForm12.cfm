<!--- Set Variables --->
<cfset TargetTable = "DataAPR12">
<cfset UniqueID = "DataAPR12ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR12ID"
        Form = "dataapr12">
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
   <cfinsert datasource="#DataSource#" tablename="dataapr12" formfields="aprID, inputUserID, projectID, reviewUserID, apr12_Contacted_Once_Total, apr12_Contacted_Once_NMHH, apr12_Contacted_Once_NonHousing, apr12_Contacted_Once_Housing, apr12_Contacted_Once_Missing, apr12_Contacted_2to5_Total, apr12_Contacted_2to5_NMHH, apr12_Contacted_2to5_NonHousing, apr12_Contacted_2to5_Housing, apr12_Contacted_2to5_Missing, apr12_Contacted_6to9_Total, apr12_Contacted_6to9_NMHH, apr12_Contacted_6to9_NonHousing, apr12_Contacted_6to9_Housing, apr12_Contacted_6to9_Missing, apr12_Contacted_10Plus_Total, apr12_Contacted_10Plus_NMHH, apr12_Contacted_10Plus_NonHousing, apr12_Contacted_10Plus_Housing, apr12_Contacted_10Plus_Missing, apr12_Contacted_Total, apr12_Contacted_Total_NMHH, apr12_Contacted_Total_NonHousing, apr12_Contacted_Total_Housing, apr12_Contacted_Total_Missing, apr12_Engaged_Once_Total, apr12_Engaged_Once_NMHH, apr12_Engaged_Once_NonHousing, apr12_Engaged_Once_Housing, apr12_Engaged_Once_Missing, apr12_Engaged_2to5_Total, apr12_Engaged_2to5_NMHH, apr12_Engaged_2to5_NonHousing, apr12_Engaged_2to5_Housing, apr12_Engaged_2to5_Missing, apr12_Engaged_6to9_Total, apr12_Engaged_6to9_NMHH, apr12_Engaged_6to9_NonHousing, apr12_Engaged_6to9_Housing, apr12_Engaged_6to9_Missing, apr12_Engaged_10Plus_Total, apr12_Engaged_10Plus_NMHH, apr12_Engaged_10Plus_NonHousing, apr12_Engaged_10Plus_Housing, apr12_Engaged_10Plus_Missing, apr12_Engaged_Total, apr12_Engaged_Total_NMHH, apr12_Engaged_Total_NonHousing, apr12_Engaged_Total_Housing, apr12_Engaged_Total_Missing">
  <cfelse>
    <cfset FORM.DataAPR12ID = newCheck.DataAPR12ID>
   <cfupdate datasource="#DataSource#" tablename="dataapr12" formfields="DataAPR12ID, aprID, inputUserID, projectID, reviewUserID, apr12_Contacted_Once_Total, apr12_Contacted_Once_NMHH, apr12_Contacted_Once_NonHousing, apr12_Contacted_Once_Housing, apr12_Contacted_Once_Missing, apr12_Contacted_2to5_Total, apr12_Contacted_2to5_NMHH, apr12_Contacted_2to5_NonHousing, apr12_Contacted_2to5_Housing, apr12_Contacted_2to5_Missing, apr12_Contacted_6to9_Total, apr12_Contacted_6to9_NMHH, apr12_Contacted_6to9_NonHousing, apr12_Contacted_6to9_Housing, apr12_Contacted_6to9_Missing, apr12_Contacted_10Plus_Total, apr12_Contacted_10Plus_NMHH, apr12_Contacted_10Plus_NonHousing, apr12_Contacted_10Plus_Housing, apr12_Contacted_10Plus_Missing, apr12_Contacted_Total, apr12_Contacted_Total_NMHH, apr12_Contacted_Total_NonHousing, apr12_Contacted_Total_Housing, apr12_Contacted_Total_Missing, apr12_Engaged_Once_Total, apr12_Engaged_Once_NMHH, apr12_Engaged_Once_NonHousing, apr12_Engaged_Once_Housing, apr12_Engaged_Once_Missing, apr12_Engaged_2to5_Total, apr12_Engaged_2to5_NMHH, apr12_Engaged_2to5_NonHousing, apr12_Engaged_2to5_Housing, apr12_Engaged_2to5_Missing, apr12_Engaged_6to9_Total, apr12_Engaged_6to9_NMHH, apr12_Engaged_6to9_NonHousing, apr12_Engaged_6to9_Housing, apr12_Engaged_6to9_Missing, apr12_Engaged_10Plus_Total, apr12_Engaged_10Plus_NMHH, apr12_Engaged_10Plus_NonHousing, apr12_Engaged_10Plus_Housing, apr12_Engaged_10Plus_Missing, apr12_Engaged_Total, apr12_Engaged_Total_NMHH, apr12_Engaged_Total_NonHousing, apr12_Engaged_Total_Housing, apr12_Engaged_Total_Missing">
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
        Form = "dataapr12"
        Where = "thisProject">
<!---/ Get DataAPR --->   

<!--- Math --->
<cfset mathCols="10">
<cfset mathRows="10">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->
<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <table width="100%">
      <thead>
        <th></th>
        <th>All Persons Contacted</th>
        <th>First contact was at a place not meant for human habitation</th>
        <th>First contact was at a non-housing service site</th>
        <th>First Contact was at a housing location</th>
        <th>First contact place was missing</th>
      </thead>
      <tbody>
        <tr>
            <td>
                Once
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_Once_Total"
                       value="#getDataAPR.apr12_Contacted_Once_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray col1"
                      id="sumR1"
                        min="0"
                        step="1"
                       autofocus>
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_Once_NMHH"
                       value="#getDataAPR.apr12_Contacted_Once_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      class="row1 col2"
                        min="0"
                        step="1">
            </td>
            <td>
            <input type="number"
                   name="apr12_Contacted_Once_NonHousing"
                   value="#getDataAPR.apr12_Contacted_Once_NonHousing#"
                   placeholder="0"
                  maxlength="11"
                  class="row1 col3"
                        min="0"
                        step="1">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
            <input type="number"
                   name="apr12_Contacted_Once_Housing"
                   value="#getDataAPR.apr12_Contacted_Once_Housing#"
                   placeholder="0"
                  maxlength="11"
                  class="row1 col4"
                        min="0"
                        step="1">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_Once_Missing"
                       value="#getDataAPR.apr12_Contacted_Once_Missing#"
                       placeholder="0"
                      maxlength="11"
                      class="row1 col5"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                2-5 Times
            </td>
             <td>
                 <input type="number"
                       name="apr12_Contacted_2to5_Total"
                       value="#getDataAPR.apr12_Contacted_2to5_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray col1"
                      id="sumR2"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_2to5_NMHH"
                       value="#getDataAPR.apr12_Contacted_2to5_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      class="row2 col2"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_2to5_NonHousing"
                       value="#getDataAPR.apr12_Contacted_2to5_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      class="row2 col3"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_2to5_Housing"
                       value="#getDataAPR.apr12_Contacted_2to5_Housing#"
                       placeholder="0"
                      maxlength="11"
                      class="row2 col4"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_2to5_Missing"
                       value="#getDataAPR.apr12_Contacted_2to5_Missing#"
                       placeholder="0"
                      maxlength="11"
                      class="row2 col5"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                6-9 Times
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_6to9_Total"
                       value="#getDataAPR.apr12_Contacted_6to9_Total#"
                       placeholder="0"
                      maxlength="11"
                       readonly
                      class="BGLightGray col1"
                      id="sumR3"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_6to9_NMHH"
                       value="#getDataAPR.apr12_Contacted_6to9_NMHH#"
                       placeholder="0"
                      maxlength="11"
                       class="row3 col2"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_6to9_NonHousing"
                       value="#getDataAPR.apr12_Contacted_6to9_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      class="row3 col3"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                    <input type="number"
                           name="apr12_Contacted_6to9_Housing"
                           value="#getDataAPR.apr12_Contacted_6to9_Housing#"
                           placeholder="0"
                          maxlength="11"
                          class="row3 col4"
                        min="0"
                        step="1">
                    <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                        <input type="number"
                               name="apr12_Contacted_6to9_Missing"
                               value="#getDataAPR.apr12_Contacted_6to9_Missing#"
                               placeholder="0"
                              maxlength="11"
                              class="row3 col5"
                                min="0"
                                step="1">
                        <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                10+ Times
            </td>
               
            <td>
             <input type="number"
                       name="apr12_Contacted_10Plus_Total"
                       value="#getDataAPR.apr12_Contacted_10Plus_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray col1"
                      id="sumR4"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_10Plus_NMHH"
                       value="#getDataAPR.apr12_Contacted_10Plus_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      class="row4 col2"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_10Plus_NonHousing"
                       value="#getDataAPR.apr12_Contacted_10Plus_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      class="row4 col3"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_10Plus_Housing"
                       value="#getDataAPR.apr12_Contacted_10Plus_Housing#"
                       placeholder="0"
                      maxlength="11"
                      class="row4 col4"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_10Plus_Missing"
                       value="#getDataAPR.apr12_Contacted_10Plus_Missing#"
                       placeholder="0"
                      maxlength="11"
                      class="row4 col5"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                <b>Total Persons Contacted</b>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_Total"
                       value="#getDataAPR.apr12_Contacted_Total#"
                       placeholder="Total Persons Contacted"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC1"
                        min="0"
                        step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_Total_NMHH"
                       value="#getDataAPR.apr12_Contacted_Total_NMHH#"
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
                       name="apr12_Contacted_Total_NonHousing"
                       value="#getDataAPR.apr12_Contacted_Total_NonHousing#"
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
                           name="apr12_Contacted_Total_Housing"
                           value="#getDataAPR.apr12_Contacted_Total_Housing#"
                           placeholder="0"
                          maxlength="11"
                          readonly
                          class="BGLightGray"
                          id="sumC4"
                        min="0"
                        step="1">
                    <small class="form-error">Must be a whole number</small> 
            </td>
            <td>
                <input type="number"
                       name="apr12_Contacted_Total_Missing"
                       value="#getDataAPR.apr12_Contacted_Total_Missing#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC5"
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
    <h3>Number of Persons Engaged by Number of Contacts During the Operating Year</h3>
    <table width="100%">
      <thead>
        <th></th>
        <th>All Persons Contacted</th>
        <th>First contact was at a place not meant for human habitation</th>
        <th>First contact was at a non-housing service site</th>
        <th>First Contact was at a housing location</th>
        <th>First contact place was missing</th>
      </thead>
      <tbody>
        <tr>
            <td>
                1 Contact 
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_Once_Total"
                       value="#getDataAPR.apr12_Engaged_Once_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray col6"
                      id="sumR5"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_Once_NMHH"
                       value="#getDataAPR.apr12_Engaged_Once_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      class="row5 col7"
                       min="0"
                       step="1">
            </td>
            <td>
            <input type="number"
                   name="apr12_Engaged_Once_NonHousing"
                   value="#getDataAPR.apr12_Engaged_Once_NonHousing#"
                   placeholder="0"
                  maxlength="11"
                  class="row5 col8"
                       min="0"
                       step="1">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
            <input type="number"
                   name="apr12_Engaged_Once_Housing"
                   value="#getDataAPR.apr12_Engaged_Once_Housing#"
                   placeholder="0"
                  maxlength="11"
                  class="row5 col9"
                       min="0"
                       step="1">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_Once_Missing"
                       value="#getDataAPR.apr12_Engaged_Once_Missing#"
                       placeholder="0"
                      maxlength="11"
                      class="row5 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
               2-5 Contacts
            </td>
             <td>
                 <input type="number"
                       name="apr12_Engaged_2to5_Total"
                       value="#getDataAPR.apr12_Engaged_2to5_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray col6"
                      id="sumR6"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_2to5_NMHH"
                       value="#getDataAPR.apr12_Engaged_2to5_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      class="row6 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_2to5_NonHousing"
                       value="#getDataAPR.apr12_Engaged_2to5_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      class="row6 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_2to5_Housing"
                       value="#getDataAPR.apr12_Engaged_2to5_Housing#"
                       placeholder="0"
                      maxlength="11"
                      class="row6 col9"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_2to5_Missing"
                       value="#getDataAPR.apr12_Engaged_2to5_Missing#"
                       placeholder="0"
                      maxlength="11"
                      class="row6 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
               6-9 Contacts 
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_6to9_Total"
                       value="#getDataAPR.apr12_Engaged_6to9_Total#"
                       placeholder="0"
                      maxlength="11"
                       readonly
                      class="BGLightGray col6"
                      id="sumR7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_6to9_NMHH"
                       value="#getDataAPR.apr12_Engaged_6to9_NMHH#"
                       placeholder="0"
                      maxlength="11"
                       class="row7 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_6to9_NonHousing"
                       value="#getDataAPR.apr12_Engaged_6to9_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      class="row7 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                    <input type="number"
                           name="apr12_Engaged_6to9_Housing"
                           value="#getDataAPR.apr12_Engaged_6to9_Housing#"
                           placeholder="0"
                          maxlength="11"
                          class="row7 col9"
                       min="0"
                       step="1">
                    <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                        <input type="number"
                               name="apr12_Engaged_6to9_Missing"
                               value="#getDataAPR.apr12_Engaged_6to9_Missing#"
                               placeholder="0"
                              maxlength="11"
                              class="row7 col10"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
               10+ Contacts
            </td>
               
            <td>
             <input type="number"
                       name="apr12_Engaged_10Plus_Total"
                       value="#getDataAPR.apr12_Engaged_10Plus_Total#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray col6"
                      id="sumR8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_10Plus_NMHH"
                       value="#getDataAPR.apr12_Engaged_10Plus_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      class="row8 col7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_10Plus_NonHousing"
                       value="#getDataAPR.apr12_Engaged_10Plus_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      class="row8 col8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_10Plus_Housing"
                       value="#getDataAPR.apr12_Engaged_10Plus_Housing#"
                       placeholder="0"
                      maxlength="11"
                      class="row8 col9"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_10Plus_Missing"
                       value="#getDataAPR.apr12_Engaged_10Plus_Missing#"
                       placeholder="0"
                      maxlength="11"
                      class="row8 col10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
            <td>
                <b>Total Persons Engaged</b>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_Total"
                       value="#getDataAPR.apr12_Engaged_Total#"
                       placeholder="T0"
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
                       name="apr12_Engaged_Total_NMHH"
                       value="#getDataAPR.apr12_Engaged_Total_NMHH#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC7"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_Total_NonHousing"
                       value="#getDataAPR.apr12_Engaged_Total_NonHousing#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC8"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                    <input type="number"
                           name="apr12_Engaged_Total_Housing"
                           value="#getDataAPR.apr12_Engaged_Total_Housing#"
                           placeholder="0"
                          maxlength="11"
                          readonly
                          class="BGLightGray"
                          id="sumC9"
                       min="0"
                       step="1">
                    <small class="form-error">Must be a whole number</small> 
            </td>
            <td>
                <input type="number"
                       name="apr12_Engaged_Total_Missing"
                       value="#getDataAPR.apr12_Engaged_Total_Missing#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC10"
                       min="0"
                       step="1">
                <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>