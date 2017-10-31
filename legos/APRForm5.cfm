<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR05ID"
        Form = "dataapr05">
<!---/ Get ID --->

<cfif newCheck.RecordCount EQ 0>
  <cfset newRecord = 1>
<cfelse>
  <cfset newRecord = 0>
</cfif>
<!---/ New Check --->
    
   
<!---Flag fields with suspicious numbers of beds or units in orange--->     
    
<cfoutput>
    <script>
    $(document).ready(function () {
        $(".bedField, .chronicField, .unitField").on("change", function () {
            var apartments = $(this).closest("tr").find(".unitField").val()
            var beds = $(this).closest("tr").find(".bedField").val()
            var chronic = $(this).closest("tr").find(".chronicField").val()
            
            if(apartments > beds) {
                $(this).closest("tr").find(".bedField").addClass("BGOrange");
            }
            else {
                $(this).closest("tr").find(".bedField").removeClass("BGOrange");
            }
            
            if(beds < chronic) {
                $(this).closest("tr").find(".chronicField").addClass("BGOrange");
            }
            else {
                $(this).closest("tr").find(".chronicField").removeClass("BGOrange");
            }
            
            if(beds > 0 && apartments <= 0) {
                $(this).closest("tr").find(".unitField").addClass("BGOrange");
            }
            else {
                $(this).closest("tr").find(".unitField").removeClass("BGOrange");
            }
        });
    });
    </script>    
</cfoutput>    
    
<!---Flag fields with suspicious numbers of beds or units in orange--->    
    

    
<!--- Process Forms --->
<cfif FORM.action EQ "process" AND FORM.goldenTicket EQ SESSION.goldenTicket>



  <cfif newRecord EQ 1>


  
    <cfinsert datasource="#DataSource#" tablename="dataapr05" formfields="aprID, inputUserID, projectID, reviewUserID, apr05_HHWC_ProposedBeds, apr05_HHWC_ProposedCHBeds, apr05_HHWC_ProposedUnits, apr05_HHNC_ProposedCHBeds, apr05_HHNC_ProposedBeds, apr05_HHOC_ProposedBeds, apr05_Total_ProposedBeds, apr05_HHWC_ActualBeds, apr05_HHNC_ActualCHBeds, apr05_Total_ActualUnits, apr05_HHNC_ActualBeds, apr05_HHWC_ActualCHBeds, apr05_HHOC_ActualBeds, apr05_Total_ActualBeds, apr05_HHOC_ProposedCHBeds, apr05_Total_ProposedCHBeds, apr05_HHNC_ProposedUnits, apr05_HHOC_ProposedUnits, apr05_Total_ProposedUnits, apr05_HHOC_ActualCHBeds, apr05_Total_ActualCHBeds, apr05_HHWC_ActualUnits, apr05_HHNC_ActualUnits, apr05_HHOC_ActualUnits">



  <cfelse>

    <cfset FORM.DataAPR05ID = newCheck.DataAPR05ID>

<!--- Set Defaults --->        
<cfif form.apr05_HHWC_ProposedBeds EQ "">
    <cfset form.apr05_HHWC_ProposedBeds=0>
</cfif>        
<cfif form.apr05_HHWC_ProposedCHBeds EQ "">
    <cfset form.apr05_HHWC_ProposedCHBeds=0>
</cfif>
<cfif form.apr05_HHWC_ProposedUnits EQ "">
    <cfset form.apr05_HHWC_ProposedUnits=0>
</cfif>        
<cfif form.apr05_HHNC_ProposedCHBeds EQ "">
    <cfset form.apr05_HHNC_ProposedCHBeds=0>
</cfif>
<cfif form.apr05_HHNC_ProposedBeds EQ "">
    <cfset form.apr05_HHNC_ProposedBeds=0>
</cfif>        
<cfif form.apr05_HHOC_ProposedBeds EQ "">
    <cfset form.apr05_HHOC_ProposedBeds=0>
</cfif>
<cfif form.apr05_Total_ProposedBeds EQ "">
    <cfset form.apr05_Total_ProposedBeds=0>
</cfif>        
<cfif form.apr05_HHWC_ActualBeds EQ "">
    <cfset form.apr05_HHWC_ActualBeds=0>
</cfif>   
<cfif form.apr05_HHNC_ActualCHBeds EQ "">
    <cfset form.apr05_HHNC_ActualCHBeds=0>
</cfif>        
<cfif form.apr05_Total_ActualUnits EQ "">
    <cfset form.apr05_Total_ActualUnits=0>
</cfif>
<cfif form.apr05_HHNC_ActualBeds EQ "">
    <cfset form.apr05_HHNC_ActualBeds=0>
</cfif>        
<cfif form.apr05_HHWC_ActualCHBeds EQ "">
    <cfset form.apr05_HHWC_ActualCHBeds=0>
</cfif>

<cfif form.apr05_HHOC_ActualBeds EQ "">
    <cfset form.apr05_HHOC_ActualBeds=0>
</cfif>        
<cfif form.apr05_Total_ActualBeds EQ "">
    <cfset form.apr05_Total_ActualBeds=0>
</cfif>
<cfif form.apr05_HHOC_ProposedCHBeds EQ "">
    <cfset form.apr05_HHOC_ProposedCHBeds=0>
</cfif>        
<cfif form.apr05_Total_ProposedCHBeds EQ "">
    <cfset form.apr05_Total_ProposedCHBeds=0>
</cfif>
<cfif form.apr05_HHNC_ProposedUnits EQ "">
    <cfset form.apr05_HHNC_ProposedUnits=0>
</cfif>        
<cfif form.apr05_HHOC_ProposedUnits EQ "">
    <cfset form.apr05_HHOC_ProposedUnits=0>
</cfif>
<cfif form.apr05_Total_ProposedUnits EQ "">
    <cfset form.apr05_Total_ProposedUnits=0>
</cfif>        
<cfif form.apr05_HHOC_ActualCHBeds EQ "">
    <cfset form.apr05_HHOC_ActualCHBeds=0>
</cfif>   
<cfif form.apr05_HHOC_ActualUnits EQ "">
    <cfset form.apr05_HHOC_ActualUnits=0>
</cfif>        
<cfif form.apr05_Total_ActualCHBeds EQ "">
    <cfset form.apr05_Total_ActualCHBeds=0>
</cfif>
<cfif form.apr05_HHWC_ActualUnits EQ "">
    <cfset form.apr05_HHWC_ActualUnits=0>
</cfif>        
<cfif form.apr05_HHNC_ActualUnits EQ "">
    <cfset form.apr05_HHNC_ActualUnits=0>
</cfif>    
<!---/ Set Defaults ---> 
    
   <cfupdate datasource="#DataSource#" tablename="dataapr05" formfields="DataAPR05ID, aprID, inputUserID, projectID, reviewUserID, apr05_HHWC_ProposedBeds, apr05_HHWC_ProposedCHBeds, apr05_HHWC_ProposedUnits, apr05_HHNC_ProposedCHBeds, apr05_HHNC_ProposedBeds, apr05_HHOC_ProposedBeds, apr05_Total_ProposedBeds, apr05_HHWC_ActualBeds, apr05_HHNC_ActualCHBeds, apr05_Total_ActualUnits, apr05_HHNC_ActualBeds, apr05_HHWC_ActualCHBeds, apr05_HHOC_ActualBeds, apr05_Total_ActualBeds, apr05_HHOC_ProposedCHBeds, apr05_Total_ProposedCHBeds, apr05_HHNC_ProposedUnits, apr05_HHOC_ProposedUnits, apr05_Total_ProposedUnits, apr05_HHOC_ActualCHBeds, apr05_Total_ActualCHBeds, apr05_HHWC_ActualUnits, apr05_HHNC_ActualUnits, apr05_HHOC_ActualUnits">
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
        Form = "dataapr05"
        Where = "thisProject">
<!---/ Get DataAPR --->    
    
<!--- Math --->
<cfset mathCols="6">
<cfset mathRows="0">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>

    <cfinvoke component="knex.aprData" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "checkforQ7"
        FormID = "apr07_TotalClients"
        Form = "dataapr07"
        Where = "thisProject">
    
    <cfif checkforQ7.apr07_TotalClients GREATER THAN 0>
        <p></p>
    <cfelse>
        <p class="panel">Cells will glow orange if they appear to have an invalid value. If you have not yet entered data for Q7, the total cell may glow orange because the system assumes that you have a total of zero clients.</p>   

    </cfif> 

    
<div class="row">
  <div class="large-12 columns">
    <h3>Proposed Bed and Unit Inventory</h3>
          <table width="100%">
            <thead>
              <th></th>
              <th>Beds</th>
              <th>CH Beds (PH Only)</th>
              <th>Units</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Households without Children
                </td>
                <td>
                    <input type="number"
                       name="apr05_HHNC_ProposedBeds"
                       value="#getDataAPR.apr05_HHNC_ProposedBeds#"
                       placeholder="0"
                       maxlength="11"
                       tabindex="1"
                       class="col1 bedField"
                       min="0"
                       step="1"
                       autofocus>
                      <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                    <input type="number"
                        name="apr05_HHNC_ProposedCHBeds"
                        value="#getDataAPR.apr05_HHNC_ProposedCHBeds#"
                        placeholder="0"
                        maxlength="11"
                        min="0"
                        step="1"
                        tabindex="2"
                        class="col2 chronicField">
                  <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                         name="apr05_HHNC_ProposedUnits"
                         value="#getDataAPR.apr05_HHNC_ProposedUnits#"
                         placeholder="0"
                         maxlength="11"
                         min="0"
                         step="1"
                         tabindex="3"
                         class="col3 unitField">
                  <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Households with Children
                </td>
                <td>
                <input type="number"
                       name="apr05_HHWC_ProposedBeds"
                       value="#getDataAPR.apr05_HHWC_ProposedBeds#"
                       placeholder="0"
                       maxlength="11"
                       min="0"
                       step="1"
                      tabindex="4"
                      class="col1 bedField">
                      <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr05_HHWC_ProposedCHBeds"
                       value="#getDataAPR.apr05_HHWC_ProposedCHBeds#"
                       placeholder="0"
                       maxlength="11"
                       min="0"
                       step="1"
                       tabindex="5"
                       class="col2 chronicField">
                <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                 <input type="number"
                        name="apr05_HHWC_ProposedUnits"
                        value="#getDataAPR.apr05_HHWC_ProposedUnits#"
                        placeholder="0"
                        maxlength="11"
                        min="0"
                        step="1"
                        tabindex="6"
                        class="col3 unitField">
                  <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Households with Only Children
                </td>
                <td>
           <input type="number"
                 name="apr05_HHOC_ProposedBeds"
                 value="#getDataAPR.apr05_HHOC_ProposedBeds#"
                  placeholder="0"
                  maxlength="11"
                  min="0"
                  step="1"
                  tabindex="7"
                  class="col1 bedField">
          <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                         name="apr05_HHOC_ProposedCHBeds"
                         value="#getDataAPR.apr05_HHOC_ProposedCHBeds#"
                         placeholder="0"
                         maxlength="11"
                         min="0"
                         step="1"
                         tabindex="8"
                         class="col2 chronicField">
                  <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr05_HHOC_ProposedUnits"
                       value="#getDataAPR.apr05_HHOC_ProposedUnits#"
                       placeholder="0"
                       maxlength="11"
                       min="0"
                       step="1"
                       tabindex="9"
                       class="col3 unitField">
                    <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Total
                </td>
                <td>
           <input type="number"
                   name="apr05_Total_ProposedBeds"
                   value="#getDataAPR.apr05_Total_ProposedBeds#"
                   placeholder="0"
                  maxlength="11"
                  readonly
                  id="sumC1"
                  class="BGLightGray">
                </td>
                <td>
                  <input type="number"
                         name="apr05_Total_ProposedCHBeds"
                         value="#getDataAPR.apr05_Total_ProposedCHBeds#"
                         placeholder="0"
                        maxlength="11"
                        readonly
                        id="sumC2"
                        class="BGLightGray">
                </td>
                <td>
                 <input type="number"
                       name="apr05_Total_ProposedUnits"
                       value="#getDataAPR.apr05_Total_ProposedUnits#"
                       placeholder="0"
                      maxlength="11"
                      readonly
                      id="sumC3"
                      class="BGLightGray">
                </td>
              </tr>
          </tbody>
         </table>
  </div>
</div>

<div class="row">
      <div class="large-12 columns">
        <h3>Actual Bed and Unit Inventory</h3>
        <table width="100%">
            <thead>
              <th></th>
              <th>Beds</th>
              <th>CH Beds (PH Only)</th>
              <th>Units</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Households without Children
                </td>
                <td>
            <input type="number"
                   name="apr05_HHNC_ActualBeds"
                   value="#getDataAPR.apr05_HHNC_ActualBeds#"
                   placeholder="0"
                   maxlength="11"
                   min="0"
                   step="1"
                   tabindex="10"
                   class="col4 bedField">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                       name="apr05_HHNC_ActualCHBeds"
                       value="#getDataAPR.apr05_HHNC_ActualCHBeds#"
                       placeholder="0"
                       maxlength="11"
                       min="0"
                       step="1"
                       tabindex="11"
                       class="col5 chronicField">
                </td>
                <td>
                  <input type="number"
                         name="apr05_HHNC_ActualUnits"
                         value="#getDataAPR.apr05_HHNC_ActualUnits#"
                         placeholder="0"
                         maxlength="11"
                         min="0"
                         step="1"
                         tabindex="12"
                         class="col6 unitField">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              <tr>
                <td>
                  Households with Children
                </td>
                <td>
            <input type="number"
                   name="apr05_HHWC_ActualBeds"
                   value="#getDataAPR.apr05_HHWC_ActualBeds#"
                   placeholder="0"
                   maxlength="11"
                   min="0"
                   step="1"
                   tabindex="13"
                   class="col4 bedField">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr05_HHWC_ActualCHBeds"
                   value="#getDataAPR.apr05_HHWC_ActualCHBeds#"
                   placeholder="0"
                   maxlength="11"
                   min="0"
                   step="1"
                   tabindex="14"
                   class="col5 chronicField">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr05_HHWC_ActualUnits"
                   value="#getDataAPR.apr05_HHWC_ActualUnits#"
                   placeholder="0"
                   maxlength="11"
                   min="0"
                   step="1"
                   tabindex="15"
                   class="col6 unitField">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              <tr>
                <td>
                  Households with Only Children
                </td>
                <td>
            <input type="number"
                   name="apr05_HHOC_ActualBeds"
                   value="#getDataAPR.apr05_HHOC_ActualBeds#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="16"
                   class="subtotal_children col4 bedField">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr05_HHOC_ActualCHBeds"
                   value="#getDataAPR.apr05_HHOC_ActualCHBeds#"
                   placeholder="0"
                  min="0"
                   step="1"
                   maxlength="11"
                   tabindex="17"
                   class="col5 chronicField">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr05_HHOC_ActualUnits"
                   value="#getDataAPR.apr05_HHOC_ActualUnits#"
                   placeholder="0"
                   min="0"
                   step="1"
                   tabindex="18"
                   class="col6 unitField">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              <tr>
                <td>
                  Total
                </td>
                <td>
            <input type="number"
                   name="apr05_Total_ActualBeds"
                   value="#getDataAPR.apr05_Total_ActualBeds#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                    id="sumC4"
                    class="subtotal_persons BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr05_Total_ActualCHBeds"
                   value="#getDataAPR.apr05_Total_ActualCHBeds#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                    id="sumC5"
                    class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr05_Total_ActualUnits"
                   value="#getDataAPR.apr05_Total_ActualUnits#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   readonly
                  id="sumC6"
                  class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
            </tbody>
          </table>
          <cfset nexttab = "19">
        </div>
      </div>
</cfoutput>