<!--- Set Variables --->
<cfset TargetTable = "DataAPR07">
<cfset UniqueID = "UniqueID07">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR07ID"
        Form = "dataapr07">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr07" formfields="aprID, inputUserID, projectID, reviewUserID, apr07_TotalClients, apr07_TotalAdults, apr07_TotalChildrenUnaccomp, apr07_TotalLeavers, apr07_FName_DKR, apr07_FName_Missing, apr07_LName_DKR, apr07_LName_Missing, apr07_SSN_DKR, apr07_SSN_Missing, apr07_DoB_DKR, apr07_DoB_Missing, apr07_Race_DKR, apr07_Race_Missing, apr07_Ethnicity_DKR, apr07_Ethnicity_Missing, apr07_Gender_DKR, apr07_Gender_Missing, apr07_Vet_DKR, apr07_Vet_Missing, apr07_Disabling_DKR, apr07_Disabling_Missing, apr07_ResidencePrior_DKR, apr07_ResidencePrior_Missing, apr07_Zip_DKR, apr07_Zip_Missing, apr07_HousingStatus_DKR, apr07_HousingStatus_Missing, apr07_IncEntry_DKR, apr07_IncEntry_Missing, apr07_IncExit_DKR, apr07_IncExit_Missing, apr07_NonCashEntry_DKR, apr07_NonCashEntry_Missing, apr07_NonCashExit_DKR, apr07_NonCashExit_Missing, apr07_PhysDisability_DKR, apr07_PhysDisability_Missing, apr07_DevDisability_DKR, apr07_DevDisability_Missing, apr07_ChronicHealth_DKR, apr07_ChronicHealth_Missing, apr07_HIV_DKR, apr07_HIV_Missing, apr07_MentalHealth_DKR, apr07_MentalHealth_Missing, apr07_SA_DKR, apr07_SA_Missing, apr07_DV_DKR, apr07_DV_Missing, apr07_Dest_Missing, apr07_Dest_DKR">
  <cfelse>
    <cfset FORM.DataAPR07ID = newCheck.DataAPR07ID>
<!--- Set Defaults --->        
<cfif form.apr07_TotalClients EQ "">
    <cfset form.apr07_TotalClients=0>
</cfif>        
<cfif form.apr07_TotalAdults EQ "">
    <cfset form.apr07_TotalAdults=0>
</cfif>
<cfif form.apr07_TotalChildrenUnaccomp EQ "">
    <cfset form.apr07_TotalChildrenUnaccomp=0>
</cfif>        
<cfif form.apr07_TotalLeavers EQ "">
    <cfset form.apr07_TotalLeavers=0>
</cfif>
<cfif form.apr07_FName_DKR EQ "">
    <cfset form.apr07_FName_DKR=0>
</cfif>        
<cfif form.apr07_FName_Missing EQ "">
    <cfset form.apr07_FName_Missing=0>
</cfif>
<cfif form.apr07_LName_DKR EQ "">
    <cfset form.apr07_LName_DKR=0>
</cfif> 

<cfif form.apr07_LName_Missing EQ "">
    <cfset form.apr07_LName_Missing=0>
</cfif>        
<cfif form.apr07_SSN_DKR EQ "">
    <cfset form.apr07_SSN_DKR=0>
</cfif>
<cfif form.apr07_SSN_Missing EQ "">
    <cfset form.apr07_SSN_Missing=0>
</cfif>        
<cfif form.apr07_DoB_DKR EQ "">
    <cfset form.apr07_DoB_DKR=0>
</cfif>
<cfif form.apr07_DoB_Missing EQ "">
    <cfset form.apr07_DoB_Missing=0>
</cfif>        
<cfif form.apr07_Race_DKR EQ "">
    <cfset form.apr07_Race_DKR=0>
</cfif>
<cfif form.apr07_Race_Missing EQ "">
    <cfset form.apr07_Race_Missing=0>
</cfif>       

<cfif form.apr07_Ethnicity_DKR EQ "">
    <cfset form.apr07_Ethnicity_DKR=0>
</cfif>        
<cfif form.apr07_Ethnicity_Missing EQ "">
    <cfset form.apr07_Ethnicity_Missing=0>
</cfif>
<cfif form.apr07_Gender_DKR EQ "">
    <cfset form.apr07_Gender_DKR=0>
</cfif>        
<cfif form.apr07_Gender_Missing EQ "">
    <cfset form.apr07_Gender_Missing=0>
</cfif>
<cfif form.apr07_Vet_DKR EQ "">
    <cfset form.apr07_Vet_DKR=0>
</cfif>        
<cfif form.apr07_Vet_Missing EQ "">
    <cfset form.apr07_Vet_Missing=0>
</cfif>
<cfif form.apr07_Disabling_DKR EQ "">
    <cfset form.apr07_Disabling_DKR=0>
</cfif>
<cfif form.apr07_Disabling_Missing EQ "">
    <cfset form.apr07_Disabling_Missing=0>
</cfif>        
<cfif form.apr07_ResidencePrior_DKR EQ "">
    <cfset form.apr07_ResidencePrior_DKR=0>
</cfif>
<cfif form.apr07_ResidencePrior_Missing EQ "">
    <cfset form.apr07_ResidencePrior_Missing=0>
</cfif>        
<cfif form.apr07_Zip_DKR EQ "">
    <cfset form.apr07_Zip_DKR=0>
</cfif>
<cfif form.apr07_Zip_Missing EQ "">
    <cfset form.apr07_Zip_Missing=0>
</cfif>        
<cfif form.apr07_HousingStatus_DKR EQ "">
    <cfset form.apr07_HousingStatus_DKR=0>
</cfif>
<cfif form.apr07_HousingStatus_Missing EQ "">
    <cfset form.apr07_HousingStatus_Missing=0>
</cfif>       
<cfif form.apr07_IncEntry_DKR EQ "">
    <cfset form.apr07_IncEntry_DKR=0>
</cfif>        
<cfif form.apr07_IncEntry_Missing EQ "">
    <cfset form.apr07_IncEntry_Missing=0>
</cfif>
<cfif form.apr07_IncExit_DKR EQ "">
    <cfset form.apr07_IncExit_DKR=0>
</cfif>        
<cfif form.apr07_IncExit_Missing EQ "">
    <cfset form.apr07_IncExit_Missing=0>
</cfif>
<cfif form.apr07_NonCashEntry_DKR EQ "">
    <cfset form.apr07_NonCashEntry_DKR=0>
</cfif>        
<cfif form.apr07_NonCashEntry_Missing EQ "">
    <cfset form.apr07_NonCashEntry_Missing=0>
</cfif>
<cfif form.apr07_NonCashExit_DKR EQ "">
    <cfset form.apr07_NonCashExit_DKR=0>
</cfif>       
<cfif form.apr07_NonCashExit_Missing EQ "">
    <cfset form.apr07_NonCashExit_Missing=0>
</cfif>        
<cfif form.apr07_PhysDisability_DKR EQ "">
    <cfset form.apr07_PhysDisability_DKR=0>
</cfif>
<cfif form.apr07_PhysDisability_Missing EQ "">
    <cfset form.apr07_PhysDisability_Missing=0>
</cfif>        
<cfif form.apr07_DevDisability_DKR EQ "">
    <cfset form.apr07_DevDisability_DKR=0>
</cfif>
<cfif form.apr07_DevDisability_Missing EQ "">
    <cfset form.apr07_DevDisability_Missing=0>
</cfif>        
<cfif form.apr07_ChronicHealth_DKR EQ "">
    <cfset form.apr07_ChronicHealth_DKR=0>
</cfif>
<cfif form.apr07_ChronicHealth_Missing EQ "">
    <cfset form.apr07_ChronicHealth_Missing=0>
</cfif>
<cfif form.apr07_HIV_DKR EQ "">
    <cfset form.apr07_HIV_DKR=0>
</cfif>        
<cfif form.apr07_HIV_Missing EQ "">
    <cfset form.apr07_HIV_Missing=0>
</cfif>
<cfif form.apr07_MentalHealth_DKR EQ "">
    <cfset form.apr07_MentalHealth_DKR=0>
</cfif>        
<cfif form.apr07_MentalHealth_Missing EQ "">
    <cfset form.apr07_MentalHealth_Missing=0>
</cfif>
<cfif form.apr07_SA_DKR EQ "">
    <cfset form.apr07_SA_DKR=0>
</cfif>        
<cfif form.apr07_SA_Missing EQ "">
    <cfset form.apr07_SA_Missing=0>
</cfif>
<cfif form.apr07_DV_DKR EQ "">
    <cfset form.apr07_DV_DKR=0>
</cfif>
<cfif form.apr07_DV_Missing EQ "">
    <cfset form.apr07_DV_Missing=0>
</cfif>        
<cfif form.apr07_Dest_Missing EQ "">
    <cfset form.apr07_Dest_Missing=0>
</cfif>
<cfif form.apr07_Dest_DKR EQ "">
    <cfset form.apr07_Dest_DKR=0>
</cfif>       
<!---/ Set Defaults --->
        <cfupdate datasource="#DataSource#" tablename="dataapr07" formfields="DataAPR07ID, aprID, inputUserID, projectID, reviewUserID, apr07_TotalClients, apr07_TotalAdults, apr07_TotalChildrenUnaccomp, apr07_TotalLeavers, apr07_FName_DKR, apr07_FName_Missing, apr07_LName_DKR, apr07_LName_Missing, apr07_SSN_DKR, apr07_SSN_Missing, apr07_DoB_DKR, apr07_DoB_Missing, apr07_Race_DKR, apr07_Race_Missing, apr07_Ethnicity_DKR, apr07_Ethnicity_Missing, apr07_Gender_DKR, apr07_Gender_Missing, apr07_Vet_DKR, apr07_Vet_Missing, apr07_Disabling_DKR, apr07_Disabling_Missing, apr07_ResidencePrior_DKR, apr07_ResidencePrior_Missing, apr07_Zip_DKR, apr07_Zip_Missing, apr07_HousingStatus_DKR, apr07_HousingStatus_Missing, apr07_IncEntry_DKR, apr07_IncEntry_Missing, apr07_IncExit_DKR, apr07_IncExit_Missing, apr07_NonCashEntry_DKR, apr07_NonCashEntry_Missing, apr07_NonCashExit_DKR, apr07_NonCashExit_Missing, apr07_PhysDisability_DKR, apr07_PhysDisability_Missing, apr07_DevDisability_DKR, apr07_DevDisability_Missing, apr07_ChronicHealth_DKR, apr07_ChronicHealth_Missing, apr07_HIV_DKR, apr07_HIV_Missing, apr07_MentalHealth_DKR, apr07_MentalHealth_Missing, apr07_SA_DKR, apr07_SA_Missing, apr07_DV_DKR, apr07_DV_Missing, apr07_Dest_Missing, apr07_Dest_DKR">
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
        Form = "dataapr07"
        Where = "thisProject">
<!---/ Get DataAPR --->


<!--- Math --->
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<!---Flag fields with suspicious numbers of clients in orange--->     
    
<cfoutput>
    <script>
    $(document).ready(function () {
        $("##totalClients, ##totaladults, ##totalkids, ##totalleavers").on("change", function () {
            var totalClients = Number($(this).closest("tbody").find("##totalClients").val())
            var adults = Number($(this).closest("tbody").find("##totaladults").val())
            var kids = Number($(this).closest("tbody").find("##totalkids").val())
            var leavers = Number($(this).closest("tbody").find("##totalleavers").val())
            
            if(adults + kids > totalClients || leavers > totalClients) {
                $(this).closest("tbody").find("##totalClients").addClass("BGOrange");
            }
            else {
                $(this).closest("tbody").find("##totalClients").removeClass("BGOrange");
            }
        });
    });
        
    $(document).ready(function () {
        $(".dontknow, .missing").on("change", function () {
            var totalClients = Number($(this).closest(".outputter").find("##totalClients").val())
            var dontknow = Number($(this).closest("tr").find(".dontknow").val())
            var missing = Number($(this).closest("tr").find(".missing").val())
            
            if(dontknow + missing > totalClients) {
                $(this).closest("tr").find(".dontknow, .missing").addClass("BGOrange");
            }
            else {
                $(this).closest("tr").find(".dontknow, .missing").removeClass("BGOrange");
            }
        });
    });      
        
    </script>    
</cfoutput>    
    
<!---Flag fields with suspicious numbers of clients in orange--->    
    
    
<cfoutput>
<div class="outputter">
<div class="row">
  <div class="large-12 columns">
    <div class="panel BGLightGray">
      <table width="100%">
        <tbody>
          <tr>
              <td class="text-right" width="50%">
                  Total number of Clients 
              </td>
              <td>
                  <input type="number"
                         name="apr07_TotalClients"
                         value="#getDataAPR.apr07_TotalClients#"
                         placeholder="0"
                         id="totalClients"
                         min="0"
                         step="1"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         required
                         autofocus>
                  <small class="form-error">Must be a whole number</small>
              </td>
          </tr>
          <tr>
              <td class="text-right" width="50%">
                  Total number of Adults
              </td>
              <td>
                  <input type="number"
                         name="apr07_TotalAdults"
                         value="#getDataAPR.apr07_TotalAdults#"
                         placeholder="0"
                         id="totaladults"
                         min="0"
                         step="1"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         required>
                  <small class="form-error">Must be a whole number</small>
              </td>
          </tr>
          <tr>
              <td class="text-right" width="50%">
                  Total number of Unaccompanied Children 
              </td>
              <td>
                  <input type="number"
                         name="apr07_TotalChildrenUnaccomp"
                         value="#getDataAPR.apr07_TotalChildrenUnaccomp#"
                         placeholder="0"
                         id="totalkids"
                         min="0"
                         step="1"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         required>
                  <small class="form-error">Must be a whole number</small>
              </td>
          </tr>
          <tr>
              <td class="text-right" width="50%">
                  Total number of Leavers
              </td>
              <td>
                  <input type="number"
                         name="apr07_TotalLeavers"
                         value="#getDataAPR.apr07_TotalLeavers#"
                         placeholder="0"
                         id="totalleavers"
                         min="0"
                         step="1"
                         maxlength="11"
                         tabindex="#nexttab++#"
                         required>
                  <small class="form-error">Must be a whole number</small>
              </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

            <div class="row">
              <div class="large-12 columns">
              <h3>HMIS or Comparable Database Data Quality</h3>
                <table width="100%">
                  <thead>
                    <th></th>
                    <th>Don't Know or Refused</th>
                    <th>Missing Data</th>
                  </thead>
                  <tbody>

                    <tr>
                      <td>
                        First Name
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_FName_DKR"
                               value="#getDataAPR.apr07_FName_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_FName_Missing"
                               value="#getDataAPR.apr07_FName_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Last Name
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_LName_DKR"
                               value="#getDataAPR.apr07_LName_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_LName_Missing"
                               value="#getDataAPR.apr07_LName_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        SSN
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_SSN_DKR"
                               value="#getDataAPR.apr07_SSN_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                                name="apr07_SSN_Missing"
                                value="#getDataAPR.apr07_SSN_Missing#"
                                placeholder="0"
                                min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                         <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Date of Birth
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_DoB_DKR"
                               value="#getDataAPR.apr07_DoB_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_DoB_Missing"
                               value="#getDataAPR.apr07_DoB_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Race
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Race_DKR"
                               value="#getDataAPR.apr07_Race_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Race_Missing"
                               value="#getDataAPR.apr07_Race_Missing#"
                               placeholder="0"
                               class="missing"
                               min="0"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Ethnicity
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Ethnicity_DKR"
                               value="#getDataAPR.apr07_Ethnicity_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Ethnicity_Missing"
                               value="#getDataAPR.apr07_Ethnicity_Missing#"
                              placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Gender
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Gender_DKR"
                               value="#getDataAPR.apr07_Gender_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Gender_Missing"
                               value="#getDataAPR.apr07_Gender_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                     <tr>
                      <td>
                        Veteran Status
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Vet_DKR"
                               value="#getDataAPR.apr07_Vet_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Vet_Missing"
                               value="#getDataAPR.apr07_Vet_Missing#"
                               placeholder="0"
                               amin="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Disabling Condition
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Disabling_DKR"
                               value="#getDataAPR.apr07_Disabling_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                       <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Disabling_Missing"
                               value="#getDataAPR.apr07_Disabling_Missing#"
                              placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Residence Prior to Entry
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_ResidencePrior_DKR"
                               value="#getDataAPR.apr07_ResidencePrior_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_ResidencePrior_Missing"
                               value="#getDataAPR.apr07_ResidencePrior_Missing#"
                                placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Zip of Last Permanent Address
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Zip_DKR"
                               value="#getDataAPR.apr07_Zip_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Zip_Missing"
                               value="#getDataAPR.apr07_Zip_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Housing Status (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_HousingStatus_DKR"
                               value="#getDataAPR.apr07_HousingStatus_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_HousingStatus_Missing"
                               value="#getDataAPR.apr07_HousingStatus_Missing#"
                              placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Income (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_IncEntry_DKR"
                               value="#getDataAPR.apr07_IncEntry_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_IncEntry_Missing"
                               value="#getDataAPR.apr07_IncEntry_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Income (at exit)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_IncExit_DKR"
                               value="#getDataAPR.apr07_IncExit_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_IncExit_Missing"
                               value="#getDataAPR.apr07_IncExit_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Non-cash benefits (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_NonCashEntry_DKR"
                               value="#getDataAPR.apr07_NonCashEntry_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_NonCashEntry_Missing"
                               value="#getDataAPR.apr07_NonCashEntry_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Non-cash benefits (at exit)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_NonCashExit_DKR"
                               value="#getDataAPR.apr07_NonCashExit_DKR#"
                              placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_NonCashExit_Missing"
                               value="#getDataAPR.apr07_NonCashExit_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Physical Disability (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_PhysDisability_DKR"
                               value="#getDataAPR.apr07_PhysDisability_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_PhysDisability_Missing"
                               value="#getDataAPR.apr07_PhysDisability_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Developmental Disability (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_DevDisability_DKR"
                               value="#getDataAPR.apr07_DevDisability_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_DevDisability_Missing"
                               value="#getDataAPR.apr07_DevDisability_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Chronic Health Condition (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_ChronicHealth_DKR"
                               value="#getDataAPR.apr07_ChronicHealth_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_ChronicHealth_Missing"
                               value="#getDataAPR.apr07_ChronicHealth_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        HIV/AIDS (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_HIV_DKR"
                               value="#getDataAPR.apr07_HIV_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_HIV_Missing"
                               value="#getDataAPR.apr07_HIV_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                     <tr>
                      <td>
                        Mental Health (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_MentalHealth_DKR"
                               value="#getDataAPR.apr07_MentalHealth_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_MentalHealth_Missing"
                               value="#getDataAPR.apr07_MentalHealth_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Substance Abuse (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_SA_DKR"
                               value="#getDataAPR.apr07_SA_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_SA_Missing"
                               value="#getDataAPR.apr07_SA_Missing#"
                              placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Domestic Violence (at entry)
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_DV_DKR"
                               value="#getDataAPR.apr07_DV_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_DV_Missing"
                               value="#getDataAPR.apr07_DV_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        Destination
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Dest_DKR"
                               value="#getDataAPR.apr07_Dest_DKR#"
                               placeholder="0"
                               min="0"
                               class="dontknow"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                      <td>
                        <input type="number"
                               name="apr07_Dest_Missing"
                               value="#getDataAPR.apr07_Dest_Missing#"
                               placeholder="0"
                               min="0"
                               class="missing"
                         step="1"
                               tabindex="#nexttab++#">
                        <small class="form-error">Must be a whole number</small>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
          </div>
    </div>
</cfoutput>