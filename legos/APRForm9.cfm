<!--- Set Variables --->
<cfset TargetTable = "DataAPR09">
<cfset UniqueID = "DataAPR09ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR09ID"
        Form = "dataapr09">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr09" formfields="aprID, inputUserID, projectID, reviewUserID, apr09_HH_Total, apr09_HHNC, apr09_HHWC, apr09_HHOC, apr09_HHU, apr09_Jan_Total, apr09_Jan_HHNC , apr09_Jan_HHWC, apr09_Jan_HHOC, apr09_Jan_HHU, apr09_Apr_Total, apr09_Apr_HHNC, apr09_Apr_HHWC, apr09_Apr_HHOC, apr09_Apr_HHU, apr09_Jul_Total, apr09_Jul_HHNC, apr09_Jul_HHWC, apr09_Jul_HHOC, apr09_Jul_HHU, apr09_Oct_Total, apr09_Oct_HHNC, apr09_Oct_HHWC, apr09_Oct_HHOC, apr09_Oct_HHU">
  <cfelse>
    <cfset FORM.DataAPR09ID = newCheck.DataAPR09ID>

<!--- Set Defaults --->

<cfif form.apr09_HH_Total EQ "">
    <cfset form.apr09_HH_Total=0>
</cfif>
<cfif form.apr09_HHNC EQ "">
    <cfset form.apr09_HHNC=0>
</cfif>
<cfif form.apr09_HHWC EQ "">
    <cfset form.apr09_HHWC=0>
</cfif>
<cfif form.apr09_HHOC EQ "">
    <cfset form.apr09_HHOC=0>
</cfif>
<cfif form.apr09_HHU EQ "">
    <cfset form.apr09_HHU=0>
</cfif>
<cfif form.apr09_Jan_Total EQ "">
    <cfset form.apr09_Jan_Total=0>
</cfif>
<cfif form.apr09_Jan_HHNC EQ "">
    <cfset form.apr09_Jan_HHNC=0>
</cfif>
<cfif form.apr09_Jan_HHWC EQ "">
    <cfset form.apr09_Jan_HHWC=0>
</cfif>
<cfif form.apr09_Jan_HHOC EQ "">
    <cfset form.apr09_Jan_HHOC=0>
</cfif>
<cfif form.apr09_Jan_HHU EQ "">
    <cfset form.apr09_Jan_HHU=0>
</cfif>
<cfif form.apr09_Apr_Total EQ "">
    <cfset form.apr09_Apr_Total=0>
</cfif>
<cfif form.apr09_Apr_HHNC EQ "">
    <cfset form.apr09_Apr_HHNC=0>
</cfif>
<cfif form.apr09_Apr_HHWC EQ "">
    <cfset form.apr09_Apr_HHWC=0>
</cfif>
<cfif form.apr09_Apr_HHOC EQ "">
    <cfset form.apr09_Apr_HHOC=0>
</cfif>
<cfif form.apr09_Apr_HHU EQ "">
    <cfset form.apr09_Apr_HHU=0>
</cfif>
<cfif form.apr09_Jul_Total EQ "">
    <cfset form.apr09_Jul_Total=0>
</cfif>
<cfif form.apr09_Jul_HHNC EQ "">
    <cfset form.apr09_Jul_HHNC=0>
</cfif>
<cfif form.apr09_Jul_HHWC EQ "">
    <cfset form.apr09_Jul_HHWC=0>
</cfif>
<cfif form.apr09_Jul_HHOC EQ "">
    <cfset form.apr09_Jul_HHOC=0>
</cfif>
<cfif form.apr09_Jul_HHU EQ "">
    <cfset form.apr09_Jul_HHU=0>
</cfif>
<cfif form.apr09_Oct_Total EQ "">
    <cfset form.apr09_Oct_Total=0>
</cfif>
<cfif form.apr09_Oct_HHNC EQ "">
    <cfset form.apr09_Oct_HHNC=0>
</cfif>
<cfif form.apr09_Oct_HHWC EQ "">
    <cfset form.apr09_Oct_HHWC=0>
</cfif>
<cfif form.apr09_Oct_HHOC EQ "">
    <cfset form.apr09_Oct_HHOC=0>
</cfif>
<cfif form.apr09_Oct_HHU EQ "">
    <cfset form.apr09_Oct_HHU=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr09" formfields="DataAPR09ID, aprID, inputUserID, projectID, reviewUserID, apr09_HH_Total, apr09_HHNC, apr09_HHWC, apr09_HHOC, apr09_HHU, apr09_Jan_Total, apr09_Jan_HHNC , apr09_Jan_HHWC, apr09_Jan_HHOC, apr09_Jan_HHU, apr09_Apr_Total, apr09_Apr_HHNC, apr09_Apr_HHWC, apr09_Apr_HHOC, apr09_Apr_HHU, apr09_Jul_Total, apr09_Jul_HHNC, apr09_Jul_HHWC, apr09_Jul_HHOC, apr09_Jul_HHU, apr09_Oct_Total, apr09_Oct_HHNC, apr09_Oct_HHWC, apr09_Oct_HHOC, apr09_Oct_HHU">
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
        Form = "dataapr09"
        Where = "thisProject">
<!---/ Get DataAPR --->      


<!--- Math --->
<cfset mathCols="0">
<cfset mathRows="9">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->
<cfoutput>


<div class="row">
            <div class="large-12 columns">
              <h3>Number of Households Served During the Operating Year</h3>
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
                        Households
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_HH_Total"
                               value="#getDataAPR.apr09_HH_Total#"
                               placeholder="0"
                              maxlength="11"
                              readonly
                               class="BGLightGray"
                               id="sumR5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_HHNC"
                               value="#getDataAPR.apr09_HHNC#"
                               placeholder="0"
                               tabindex="1"
                              maxlength="11"
                              class="row5"
                              min="0"
                               step="1"
                               autofocus>
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_HHWC"
                               value="#getDataAPR.apr09_HHWC#"
                               placeholder="0"
                               tabindex="2"
                              maxlength="11"
                              class="row5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_HHOC"
                               value="#getDataAPR.apr09_HHOC#"
                               placeholder="0"
                               tabindex="3"
                              maxlength="11"
                              class="row5"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr09_HHU"
                               value="#getDataAPR.apr09_HHU#"
                               placeholder="0"
                               tabindex="4"
                              maxlength="11"
                              class="row5"
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
              <h3>Point-in-Time Count of Household Served on the Last Wednesday in</h3>
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
                        January
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_Jan_Total"
                               value="#getDataAPR.apr09_Jan_Total#"
                               placeholder="0"
                              maxlength="11"
                              readonly
                               class="BGLightGray"
                               id="sumR6"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Jan_HHNC"
                               value="#getDataAPR.apr09_Jan_HHNC#"
                               placeholder="0"          
                               tabindex="5"
                              maxlength="11"
                              class="row6"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_Jan_HHWC"
                               value="#getDataAPR.apr09_Jan_HHWC#"
                               placeholder="0"
                               tabindex="6"
                              maxlength="11"
                              class="row6"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Jan_HHOC"
                               value="#getDataAPR.apr09_Jan_HHOC#"
                               placeholder="0"
                               tabindex="7"
                              maxlength="11"
                              class="row6"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="nubmber"
                               name="apr09_Jan_HHU"
                               value="#getDataAPR.apr09_Jan_HHU#"
                               placeholder="0"
                               tabindex="8"
                              maxlength="11"
                              class="row6"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        April
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_Apr_Total"
                               value="#getDataAPR.apr09_Apr_Total#"
                               placeholder="0"
                              maxlength="11"
                              readonly
                               class="BGLightGray"
                               id="sumR7"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Apr_HHNC"
                               value="#getDataAPR.apr09_Apr_HHNC#"
                               placeholder="0"
                               tabindex="9"
                              maxlength="11"
                              class="row7"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Apr_HHWC"
                               value="#getDataAPR.apr09_Apr_HHWC#"
                               placeholder="0"
                               tabindex="10"
                              maxlength="11"
                              class="row7"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Apr_HHOC"
                               value="#getDataAPR.apr09_Apr_HHOC#"
                               placeholder="0"
                               tabindex="11"
                              maxlength="11"
                              class="row7"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr09_Apr_HHU"
                               value="#getDataAPR.apr09_Apr_HHU#"
                               placeholder="0"
                               tabindex="12"
                              maxlength="11"
                              class="row7"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        July
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_Jul_Total"
                               value="#getDataAPR.apr09_Jul_Total#"
                               placeholder="0"
                              maxlength="11"
                              readonly
                               class="BGLightGray"
                               id="sumR8"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Jul_HHNC"
                               value="#getDataAPR.apr09_Jul_HHNC#"
                               placeholder="0"
                               tabindex="13"
                              maxlength="11"
                              class="row8"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Jul_HHWC"
                               value="#getDataAPR.apr09_Jul_HHWC#"
                               placeholder="0"
                               tabindex="14"
                              maxlength="11"
                              class="row8"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Jul_HHOC"
                               value="#getDataAPR.apr09_Jul_HHOC#"
                               placeholder="0"
                               tabindex="15"
                              maxlength="11"
                              class="row8"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr09_Jul_HHU"
                               value="#getDataAPR.apr09_Jul_HHU#"
                               placeholder="0"
                               tabindex="16"
                              maxlength="11"
                              class="row8"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        October
                      </td>
                      <td>
                        <input type="number"
                               name="apr09_Oct_Total"
                               value="#getDataAPR.apr09_Oct_Total#"
                               placeholder="0"
                              maxlength="11"
                              readonly
                               class="BGLightGray"
                               id="sumR9"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Oct_HHNC"
                               value="#getDataAPR.apr09_Oct_HHNC#"
                               placeholder="0"
                               tabindex="17"
                              maxlength="11"
                              class="row9"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Oct_HHWC"
                               value="#getDataAPR.apr09_Oct_HHWC#"
                               placeholder="0"
                               tabindex="18"
                              maxlength="11"
                              class="row9"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr09_Oct_HHOC"
                               value="#getDataAPR.apr09_Oct_HHOC#"
                               placeholder="0"
                               tabindex="19"
                              maxlength="11"
                              class="row9"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr09_Oct_HHU"
                               value="#getDataAPR.apr09_Oct_HHU#"
                               placeholder="0"
                               tabindex="20"
                              maxlength="11"
                              class="row9"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>
                </tbody>
            </table>
            <cfset nexttab = "21">
        </div>
    </div>
</cfoutput>