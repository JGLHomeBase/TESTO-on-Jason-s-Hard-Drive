<!--- Set Variables --->
<cfset TargetTable = "DataAPR06">
<cfset UniqueID = "DataAPR06ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR06ID"
        Form = "dataapr06">
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
  <cfinsert datasource="#DataSource#" tablename="dataapr06" formfields="aprID, inputUserID, projectID, reviewUserID, apr06_HHNC_HMISBeds, apr06_HHWC_HMISBeds, apr06_HHOC_HMISBeds, apr06_HHNC_HMISCoverage, apr06_HHWC_HMISCoverage, apr06_HHOC_HMISCoverage, apr06_Total_HMISCoverage">
  <cfelse>
    <cfset FORM.DataAPR06ID = newCheck.DataAPR06ID>

<!--- Set Defaults --->        
<cfif form.apr06_HHNC_HMISBeds EQ "">
    <cfset form.apr06_HHNC_HMISBeds=0>
</cfif>        
<cfif form.apr06_HHWC_HMISBeds EQ "">
    <cfset form.apr06_HHWC_HMISBeds=0>
</cfif>
<cfif form.apr06_HHOC_HMISBeds EQ "">
    <cfset form.apr06_HHOC_HMISBeds=0>
</cfif>        
<cfif form.apr06_HHNC_HMISCoverage EQ "">
    <cfset form.apr06_HHNC_HMISCoverage=0>
</cfif>
<cfif form.apr06_HHWC_HMISCoverage EQ "">
    <cfset form.apr06_HHWC_HMISCoverage=0>
</cfif>        
<cfif form.apr06_HHOC_HMISCoverage EQ "">
    <cfset form.apr06_HHOC_HMISCoverage=0>
</cfif>
<cfif form.apr06_Total_HMISCoverage EQ "">
    <cfset form.apr06_Total_HMISCoverage=0>
</cfif>              
<!---/ Set Defaults --->
    
  <cfupdate datasource="#DataSource#" tablename="dataapr06" formfields="DataAPR06ID, aprID, inputUserID, projectID, reviewUserID, apr06_HHNC_HMISBeds, apr06_HHWC_HMISBeds, apr06_HHOC_HMISBeds, apr06_HHNC_HMISCoverage, apr06_HHWC_HMISCoverage, apr06_HHOC_HMISCoverage, apr06_Total_HMISCoverage">
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
        Form = "dataapr06"
        Where = "thisProject">
<!---/ Get DataAPR --->

<!---Flag fields with suspicious percentages of beds in orange--->     
    
<cfoutput>
    <script>
    $(document).ready(function () {
        $(".percentcovered").on("change", function () {
            var HMIScoverage = $(this).val()
                        
            if(HMIScoverage < 0 || HMIScoverage > 100) {
                $(this).addClass("BGOrange");
            }
            else {
                $(this).removeClass("BGOrange");
            }
        });
    });
    </script>    
</cfoutput>    
    
<!---/Flag fields with suspicious percentages of beds in orange--->
    
    
    
<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>HMIS Bed Participation</h3>
    <table width="100%">
      <tbody>
        <tr>
          <td width="75%" class="text-right">
            The total number of year-round beds in HMIS for households without children
          </td>
          <td width="25%">
            <input type="number"
                   name="apr06_HHNC_HMISBeds"
                   value="#getDataAPR.apr06_HHNC_HMISBeds#"
                   placeholder="0"
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
          <td width="75%" class="text-right">
            The total number of year-round beds in HMIS for households with children
          </td>
          <td width="25%">
            <input type="number"
                   name="apr06_HHWC_HMISBeds"
                   value="#getDataAPR.apr06_HHWC_HMISBeds#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   tabindex="#nexttab++#"
                  required>
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td width="75%" class="text-right">
            The total number of year-round beds in HMIS for households with only children
          </td>
          <td width="25%">
            <input type="number"
                   name="apr06_HHOC_HMISBeds"
                   value="#getDataAPR.apr06_HHOC_HMISBeds#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   tabindex="#nexttab++#"
                  required>
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td width="75%" class="text-right">
            HMIS bed coverage rate for year-round beds for households without children
           </td>
          <td width="25%">
            <div class="row collapse">
              <div class="small-10 columns">
                <input type="number"
                       name="apr06_HHNC_HMISCoverage"
                       value="#NumberFormat("#getDataAPR.apr06_HHNC_HMISCoverage#")#"
                       placeholder="0"
                       class="percentcovered"
                      maxlength="11,2"
                       tabindex="#nexttab++#"
                      required>
                <small class="form-error">Must be a number</small>
              </div>
              <div class="small-2 columns">
                <span class="postfix radius">%</span>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="75%" class="text-right">
            HMIS bed coverage rate for year-round beds for households with children 
          </td>
          <td width="25%">
            <div class="row collapse">
              <div class="small-10 columns">
               <input type="number"
                       name="apr06_HHWC_HMISCoverage"
                       value="#NumberFormat("#getDataAPR.apr06_HHWC_HMISCoverage#")#"
                       placeholder="0"
                       class="percentcovered"
                      maxlength="11,2"
                      tabindex="#nexttab++#"
                      required>
                <small class="form-error">Must be a number</small>
              </div>
              <div class="small-2 columns">
                <span class="postfix radius">%</span>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="75%" class="text-right">
            HMIS bed coverage rate for year-round beds for households with only children
          </td>
          <td width="25%">
            <div class="row collapse">
              <div class="small-10 columns">
               <input type="number"
                       name="apr06_HHOC_HMISCoverage"
                       value="#NumberFormat("#getDataAPR.apr06_HHOC_HMISCoverage#")#"
                       placeholder="0"
                       class="percentcovered"
                      maxlength="11,2"
                      tabindex="#nexttab++#"
                      required>
                <small class="form-error">Must be a number</small>
              </div>
              <div class="small-2 columns">
                <span class="postfix radius">%</span>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="75%" class="text-right">
            Total HMIS bed coverage rate for all year-round beds %
          </td>
          <td width="25%">
            <div class="row collapse">
              <div class="small-10 columns">
                <input type="number"
                       name="apr06_Total_HMISCoverage"
                       value="#NumberFormat("#getDataAPR.apr06_Total_HMISCoverage#")#"
                       placeholder="0"
                       class="percentcovered"
                      maxlength="11,2"
                       tabindex="#nexttab++#"
                      required>
                <small class="form-error">Must be a number</small>
              </div>
              <div class="small-2 columns">
                <span class="postfix radius">%</span>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>