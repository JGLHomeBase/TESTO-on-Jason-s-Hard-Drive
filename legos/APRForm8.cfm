<!--- Set Variables --->
<cfset TargetTable = "DataAPR08">
<cfset UniqueID = "DataAPR08ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR08ID"
        Form = "dataapr08">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr08" formfields="aprID, inputUserID, projectID, reviewUserID, apr08_Adult_Total, apr08_Children_Total, apr08_DKR_Total, apr08_Missing_Total, apr08_Total, apr08_Adult_HHNC, apr08_DKR_HHNC, apr08_Missing_HHNC, apr08_Total_HHNC, apr08_Adult_HHWC, apr08_Children_HHWC, apr08_DKR_HHWC, apr08_Missing_HHWC, apr08_Total_HHWC, apr08_Children_HHOC, apr08_DKR_HHOC, apr08_Missing_HHOC, apr08_Total_HHOC, apr08_Adult_HHU, apr08_Children_HHU, apr08_DKR_HHU, apr08_Missing_HHU, apr08_Total_HHU, apr08_AvgNumPersons_Total, apr08_AvgNumPersons_HHNC, apr08_AvgNumPersons_HHWC, apr08_AvgNumPersons_HHOC, apr08_AvgNumPersons_HHU, apr08_Jan_Total, apr08_Apr_Total, apr08_Jul_Total, apr08_Oct_Total, apr08_Jan_HHNC, apr08_Apr_HHNC, apr08_Jul_HHNC, apr08_Oct_HHNC, apr08_Apr_HHWC, apr08_Jan_HHWC, apr08_Jul_HHWC, apr08_Oct_HHWC, apr08_Apr_HHOC, apr08_Jan_HHOC, apr08_Jul_HHOC, apr08_Oct_HHOC, apr08_Jan_HHU, apr08_Apr_HHU, apr08_Jul_HHU, apr08_Oct_HHU">
  <cfelse>
    <cfset FORM.DataAPR08ID = newCheck.DataAPR08ID>

<!--- Set Defaults --->  

<cfif form.apr08_Adult_Total EQ "">
    <cfset form.apr08_Adult_Total=0>
</cfif>
<cfif form.apr08_Children_Total EQ "">
    <cfset form.apr08_Children_Total=0>
</cfif>
<cfif form.apr08_DKR_Total EQ "">
    <cfset form.apr08_DKR_Total=0>
</cfif>
<cfif form.apr08_Missing_Total EQ "">
    <cfset form.apr08_Missing_Total=0>
</cfif>
<cfif form.apr08_Total EQ "">
    <cfset form.apr08_Total=0>
</cfif>
<cfif form.apr08_Adult_HHNC EQ "">
    <cfset form.apr08_Adult_HHNC=0>
</cfif>
<cfif form.apr08_DKR_HHNC EQ "">
    <cfset form.apr08_DKR_HHNC=0>
</cfif>
<cfif form.apr08_Missing_HHNC EQ "">
    <cfset form.apr08_Missing_HHNC=0>
</cfif>
<cfif form.apr08_Total_HHNC EQ "">
    <cfset form.apr08_Total_HHNC=0>
</cfif>
<cfif form.apr08_Adult_HHWC EQ "">
    <cfset form.apr08_Adult_HHWC=0>
</cfif>
<cfif form.apr08_Children_HHWC EQ "">
    <cfset form.apr08_Children_HHWC=0>
</cfif>
<cfif form.apr08_DKR_HHWC EQ "">
    <cfset form.apr08_DKR_HHWC=0>
</cfif>
<cfif form.apr08_Missing_HHWC EQ "">
    <cfset form.apr08_Missing_HHWC=0>
</cfif>
<cfif form.apr08_Total_HHWC EQ "">
    <cfset form.apr08_Total_HHWC=0>
</cfif>
<cfif form.apr08_Children_HHOC EQ "">
    <cfset form.apr08_Children_HHOC=0>
</cfif>
<cfif form.apr08_DKR_HHOC EQ "">
    <cfset form.apr08_DKR_HHOC=0>
</cfif>
<cfif form.apr08_Missing_HHOC EQ "">
    <cfset form.apr08_Missing_HHOC=0>
</cfif>
<cfif form.apr08_Total_HHOC EQ "">
    <cfset form.apr08_Total_HHOC=0>
</cfif>
<cfif form.apr08_Adult_HHU EQ "">
    <cfset form.apr08_Adult_HHU=0>
</cfif>
<cfif form.apr08_Children_HHU EQ "">
    <cfset form.apr08_Children_HHU=0>
</cfif>
<cfif form.apr08_DKR_HHU EQ "">
    <cfset form.apr08_DKR_HHU=0>
</cfif>
<cfif form.apr08_Missing_HHU EQ "">
    <cfset form.apr08_Missing_HHU=0>
</cfif>
<cfif form.apr08_Total_HHU EQ "">
    <cfset form.apr08_Total_HHU=0>
</cfif>
<cfif form.apr08_AvgNumPersons_Total EQ "">
    <cfset form.apr08_AvgNumPersons_Total=0>
</cfif>
<cfif form.apr08_AvgNumPersons_HHNC EQ "">
    <cfset form.apr08_AvgNumPersons_HHNC=0>
</cfif>
<cfif form.apr08_AvgNumPersons_HHWC EQ "">
    <cfset form.apr08_AvgNumPersons_HHWC=0>
</cfif>
<cfif form.apr08_AvgNumPersons_HHOC EQ "">
    <cfset form.apr08_AvgNumPersons_HHOC=0>
</cfif>
<cfif form.apr08_AvgNumPersons_HHU EQ "">
    <cfset form.apr08_AvgNumPersons_HHU=0>
</cfif>
<cfif form.apr08_Jan_Total EQ "">
    <cfset form.apr08_Jan_Total=0>
</cfif>
<cfif form.apr08_Apr_Total EQ "">
    <cfset form.apr08_Apr_Total=0>
</cfif>
<cfif form.apr08_Jul_Total EQ "">
    <cfset form.apr08_Jul_Total=0>
</cfif>
<cfif form.apr08_Oct_Total EQ "">
    <cfset form.apr08_Oct_Total=0>
</cfif>
<cfif form.apr08_Jan_HHNC EQ "">
    <cfset form.apr08_Jan_HHNC=0>
</cfif>
<cfif form.apr08_Apr_HHNC EQ "">
    <cfset form.apr08_Apr_HHNC=0>
</cfif>
<cfif form.apr08_Jul_HHNC EQ "">
    <cfset form.apr08_Jul_HHNC=0>
</cfif>
<cfif form.apr08_Oct_HHNC EQ "">
    <cfset form.apr08_Oct_HHNC=0>
</cfif>
<cfif form.apr08_Apr_HHWC EQ "">
    <cfset form.apr08_Apr_HHWC=0>
</cfif>
<cfif form.apr08_Jan_HHWC EQ "">
    <cfset form.apr08_Jan_HHWC=0>
</cfif>
<cfif form.apr08_Jul_HHWC EQ "">
    <cfset form.apr08_Jul_HHWC=0>
</cfif>
<cfif form.apr08_Oct_HHWC EQ "">
    <cfset form.apr08_Oct_HHWC=0>
</cfif>
<cfif form.apr08_Apr_HHOC EQ "">
    <cfset form.apr08_Apr_HHOC=0>
</cfif>
<cfif form.apr08_Jan_HHOC EQ "">
    <cfset form.apr08_Jan_HHOC=0>
</cfif>
<cfif form.apr08_Jul_HHOC EQ "">
    <cfset form.apr08_Jul_HHOC=0>
</cfif>
<cfif form.apr08_Oct_HHOC EQ "">
    <cfset form.apr08_Oct_HHOC=0>
</cfif>
<cfif form.apr08_Jan_HHU EQ "">
    <cfset form.apr08_Jan_HHU=0>
</cfif>
<cfif form.apr08_Apr_HHU EQ "">
    <cfset form.apr08_Apr_HHU=0>
</cfif>
<cfif form.apr08_Jul_HHU EQ "">
    <cfset form.apr08_Jul_HHU=0>
</cfif>
<cfif form.apr08_Oct_HHU EQ "">
    <cfset form.apr08_Oct_HHU=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr08" formfields="DataAPR08ID, aprID, inputUserID, projectID, reviewUserID, apr08_Adult_Total, apr08_Children_Total, apr08_DKR_Total, apr08_Missing_Total, apr08_Total, apr08_Adult_HHNC, apr08_DKR_HHNC, apr08_Missing_HHNC, apr08_Total_HHNC, apr08_Adult_HHWC, apr08_Children_HHWC, apr08_DKR_HHWC, apr08_Missing_HHWC, apr08_Total_HHWC, apr08_Children_HHOC, apr08_DKR_HHOC, apr08_Missing_HHOC, apr08_Total_HHOC, apr08_Adult_HHU, apr08_Children_HHU, apr08_DKR_HHU, apr08_Missing_HHU, apr08_Total_HHU, apr08_AvgNumPersons_Total, apr08_AvgNumPersons_HHNC, apr08_AvgNumPersons_HHWC, apr08_AvgNumPersons_HHOC, apr08_AvgNumPersons_HHU, apr08_Jan_Total, apr08_Apr_Total, apr08_Jul_Total, apr08_Oct_Total, apr08_Jan_HHNC, apr08_Apr_HHNC, apr08_Jul_HHNC, apr08_Oct_HHNC, apr08_Apr_HHWC, apr08_Jan_HHWC, apr08_Jul_HHWC, apr08_Oct_HHWC, apr08_Apr_HHOC, apr08_Jan_HHOC, apr08_Jul_HHOC, apr08_Oct_HHOC, apr08_Jan_HHU, apr08_Apr_HHU, apr08_Jul_HHU, apr08_Oct_HHU">
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
        Form = "dataapr08"
        Where = "thisProject">
<!---/ Get DataAPR --->    

<!--- Math --->
<cfset mathCols="5">
<cfset mathRows="9">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
              <div class="large-12 columns">
              <h3>Number of Persons in Household Served During the Operating Year</h3>
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
                        Adults
                      </td>
                      <td>
                        
                        <input type="number"
                               name="apr08_Adult_Total"
                               value="#getDataAPR.apr08_Adult_Total#"
                               placeholder="0"
                               min="0"
                               step="1"
                               readonly
                               class="subtotal_adults BGLightGray col1"
                               id="sumR1">
                        
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Adult_HHNC"
                               value="#getDataAPR.apr08_Adult_HHNC#"
                               placeholder="0"
                               tabindex="1"
                               class="row1 col2"
                               min="0"
                               step="1"
                               autofocus>
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Adult_HHWC"
                               value="#getDataAPR.apr08_Adult_HHWC#"
                               placeholder="0"
                               tabindex="2"
                               class="row1 col3"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Adult_HHU"
                               value="#getDataAPR.apr08_Adult_HHU#"
                               placeholder="0"
                               tabindex="3"
                               class="row1 col5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>


                    <tr>
                      <td>
                        Children
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Children_Total"
                               value="#getDataAPR.apr08_Children_Total#"
                               placeholder="0"
                               readonly
                               class="BGLightGray col1"
                               id="sumR2"
                               class="row2 col1"
                               min="0"
                               step="1">
                      </td>
                      <td>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Children_HHWC"
                               value="#getDataAPR.apr08_Children_HHWC#"
                               placeholder="0"
                               tabindex="4"
                               class="row2 col3"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Children_HHOC"
                               value="#getDataAPR.apr08_Children_HHOC#"
                               placeholder="0"
                               tabindex="5"
                               class="subtotal_children row2 col4"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Children_HHU"
                               value="#getDataAPR.apr08_Children_HHU#"
                               placeholder="0"
                               tabindex="6"
                               class="row2 col5"
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
                               name="apr08_DKR_Total"
                               value="#getDataAPR.apr08_DKR_Total#"
                               placeholder="0"
                               readonly
                               class="BGLightGray col1"
                               id="sumR3"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_DKR_HHNC"
                               value="#getDataAPR.apr08_DKR_HHNC#"
                               placeholder="0"
                               tabindex="7"
                               class="row3 col2"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_DKR_HHWC"
                               value="#getDataAPR.apr08_DKR_HHWC#"
                               placeholder="0"
                               tabindex="8"
                               class="row3 col3"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_DKR_HHOC"
                               value="#getDataAPR.apr08_DKR_HHOC#"
                               placeholder="0"
                               tabindex="9"
                               class="row3 col4"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_DKR_HHU"
                               value="#getDataAPR.apr08_DKR_HHU#"
                               placeholder="0"
                               tabindex="10"
                               class="row3 col5"
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
                               name="apr08_Missing_Total"
                               value="#getDataAPR.apr08_Missing_Total#"
                               placeholder="0"
                               readonly
                               class="BGLightGray col1"
                               id="sumR4"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Missing_HHNC"
                               value="#getDataAPR.apr08_Missing_HHNC#"
                               placeholder="0"
                               tabindex="11"
                               class="row4 col2"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Missing_HHWC"
                               value="#getDataAPR.apr08_Missing_HHWC#"
                               placeholder="0"
                               tabindex="12"
                               class="row4 col3"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Missing_HHOC"
                               value="#getDataAPR.apr08_Missing_HHOC#"
                               placeholder="0"
                               tabindex="13"
                               class="row4 col4"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Missing_HHU"
                               value="#getDataAPR.apr08_Missing_HHU#"
                               placeholder="0"
                               tabindex="14"
                               class="row4 col5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>


                    <tr>
                      <td>
                        Total
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Total"
                               value="#getDataAPR.apr08_Total#"
                               placeholder="0"
                               readonly
                               class="subtotal_persons BGLightGray"
                               id="sumC1"
                               min="0"
                               step="1">
                              

                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Total_HHNC"
                               value="#getDataAPR.apr08_Total_HHNC#"
                               placeholder="0"
                               readonly
                               class="BGLightGray"
                               id="sumC2"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Total_HHWC"
                               value="#getDataAPR.apr08_Total_HHWC#"
                               placeholder="0"
                               readonly
                               class="BGLightGray"
                               id="sumC3"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Total_HHOC"
                               value="#getDataAPR.apr08_Total_HHOC#"
                               placeholder="0"
                               readonly
                               class="BGLightGray"
                               id="sumC4"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Total_HHU"
                               value="#getDataAPR.apr08_Total_HHU#"
                               placeholder="0"
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
              <h3>Average Number of Persons Served Each Night</h3>
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
                        Average Number of Persons
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_AvgNumPersons_Total"
                               value="#getDataAPR.apr08_AvgNumPersons_Total#"
                               placeholder="0"
                              maxlength="11"
                              readonly
                               class="BGLightGray"
                               id="sumR5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_AvgNumPersons_HHNC"
                               value="#getDataAPR.apr08_AvgNumPersons_HHNC#"
                               placeholder="0"
                               tabindex="15"
                              maxlength="11"
                              class="row5"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_AvgNumPersons_HHWC"
                               value="#getDataAPR.apr08_AvgNumPersons_HHWC#"
                               placeholder="0"
                               tabindex="16"
                              maxlength="11"
                              class="row5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_AvgNumPersons_HHOC"
                               value="#getDataAPR.apr08_AvgNumPersons_HHOC#"
                               placeholder="0"
                               tabindex="17"
                              maxlength="11"
                              class="row5"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr08_AvgNumPersons_HHU"
                               value="#getDataAPR.apr08_AvgNumPersons_HHU#"
                               placeholder="0"
                               tabindex="18"
                              maxlength="11"
                              class="row5"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a number</small>
                      </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

<div class="row">
            <div class="large-12 columns">
              <h3>Point-in-Time of Persons Served on the Last Wednesday in</h3>
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
                               name="apr08_Jan_Total"
                               value="#getDataAPR.apr08_Jan_Total#"
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
                               name="apr08_Jan_HHNC"
                               value="#getDataAPR.apr08_Jan_HHNC#"
                               placeholder="0"
                               tabindex="19"
                              maxlength="11"
                              class="row6"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr08_Jan_HHWC"
                               value="#getDataAPR.apr08_Jan_HHWC#"
                               placeholder="0"
                               tabindex="20"
                              maxlength="11"
                              class="row6"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Jan_HHOC"
                               value="#getDataAPR.apr08_Jan_HHOC#"
                               placeholder="0"
                               tabindex="21"
                              maxlength="11"
                              class="row6"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr08_Jan_HHU"
                               value="#getDataAPR.apr08_Jan_HHU#"
                               placeholder="0"
                               tabindex="22"
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
                               name="apr08_Apr_Total"
                               value="#getDataAPR.apr08_Apr_Total#"
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
                               name="apr08_Apr_HHNC"
                               value="#getDataAPR.apr08_Apr_HHNC#"
                               placeholder="0"
                               tabindex="23"
                              maxlength="11"
                              class="row7"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Apr_HHWC"
                               value="#getDataAPR.apr08_Apr_HHWC#"
                               placeholder="0"
                               tabindex="24"
                              maxlength="11"
                              class="row7"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Apr_HHOC"
                               value="#getDataAPR.apr08_Apr_HHOC#"
                               placeholder="0"
                               tabindex="25"
                              maxlength="11"
                              class="row7"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr08_Apr_HHU"
                               value="#getDataAPR.apr08_Apr_HHU#"
                               placeholder="0"
                               tabindex="26"
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
                               name="apr08_Jul_Total"
                               value="#getDataAPR.apr08_Jul_Total#"
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
                               name="apr08_Jul_HHNC"
                               value="#getDataAPR.apr08_Jul_HHNC#"
                               placeholder="0"
                               tabindex="27"
                              maxlength="11"
                              class="row8"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Jul_HHWC"
                               value="#getDataAPR.apr08_Jul_HHWC#"
                               placeholder="0"
                               tabindex="28"
                              maxlength="11"
                              class="row8"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Jul_HHOC"
                               value="#getDataAPR.apr08_Jul_HHOC#"
                               placeholder="0"
                               tabindex="29"
                              maxlength="11"
                              class="row8"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr08_Jul_HHU"
                               value="#getDataAPR.apr08_Jul_HHU#"
                               placeholder="0"
                               tabindex="30"
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
                               name="apr08_Oct_Total"
                               value="#getDataAPR.apr08_Oct_Total#"
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
                               name="apr08_Oct_HHNC"
                               value="#getDataAPR.apr08_Oct_HHNC#"
                               placeholder="0"
                               tabindex="31"
                              maxlength="11"
                              class="row9"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Oct_HHWC"
                               value="#getDataAPR.apr08_Oct_HHWC#"
                               placeholder="0"
                               tabindex="32"
                              maxlength="11"
                              class="row9"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                       <input type="number"
                               name="apr08_Oct_HHOC"
                               value="#getDataAPR.apr08_Oct_HHOC#"
                               placeholder="0"
                               tabindex="33"
                              maxlength="11"
                              class="row9"
                              min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>

                      <td>
                        <input type="number"
                               name="apr08_Oct_HHU"
                               value="#getDataAPR.apr08_Oct_HHU#"
                               placeholder="0"
                               tabindex="34"
                              maxlength="11"
                              class="row9"
                               min="0"
                               step="1">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>
                </tbody>
            </table>
            <cfset nexttab = "35">
        </div>
    </div>
</cfoutput>