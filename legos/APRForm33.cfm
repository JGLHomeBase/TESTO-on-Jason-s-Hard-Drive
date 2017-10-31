<!--- Set Variables --->
<cfset TargetTable = "DataAPR33">
<cfset UniqueID = "DataAPR33ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR33ID"
        Form = "dataapr33">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr33" formfields="aprID, inputUserID, projectID, reviewUserID, SROValueAlchDrugServices, SROValueMentalHealthS, SROValueOutreach, SROValueCaseMgmt, SROValueLifeSkills, SROValueAIDS, SROValueOtherHCS, SROValueEducation, SROValueHousingP, SROValueEmpAss, SROValueChildC, SROValueTransport, SROValueLegal, SROValueOther, SROValueTotal">
  <cfelse>
    <cfset FORM.DataAPR33ID = newCheck.DataAPR33ID>
        
    <!--- Set Default --->        
    <cfif form.SROValueAlchDrugServices EQ "">
        <cfset form.SROValueAlchDrugServices=0>
    </cfif>        
    <cfif form.SROValueMentalHealthS EQ "">
        <cfset form.SROValueMentalHealthS=0>
    </cfif>
    <cfif form.SROValueOutreach EQ "">
        <cfset form.SROValueOutreach=0>
    </cfif>        
    <cfif form.SROValueCaseMgmt EQ "">
        <cfset form.SROValueCaseMgmt=0>
    </cfif>
    <cfif form.SROValueLifeSkills EQ "">
        <cfset form.SROValueLifeSkills=0>
    </cfif>        
    <cfif form.SROValueAIDS EQ "">
        <cfset form.SROValueAIDS=0>
    </cfif>
    <cfif form.SROValueOtherHCS EQ "">
        <cfset form.SROValueOtherHCS=0>
    </cfif>
    <cfif form.SROValueEducation EQ "">
        <cfset form.SROValueEducation=0>
    </cfif>        
    <cfif form.SROValueHousingP EQ "">
        <cfset form.SROValueHousingP=0>
    </cfif>
    <cfif form.SROValueEmpAss EQ "">
        <cfset form.SROValueEmpAss=0>
    </cfif>        
    <cfif form.SROValueChildC EQ "">
        <cfset form.SROValueChildC=0>
    </cfif>
    <cfif form.SROValueTransport EQ "">
        <cfset form.SROValueTransport=0>
    </cfif>        
    <cfif form.SROValueLegal EQ "">
        <cfset form.SROValueLegal=0>
    </cfif>
    <cfif form.SROValueOther EQ "">
        <cfset form.SROValueOther=0>
    </cfif>
    <cfif form.SROValueTotal EQ "">
        <cfset form.SROValueTotal=0>
    </cfif>  
    <!---/ Set Default --->        
        
   <cfupdate datasource="#DataSource#" tablename="dataapr33" formfields="DataAPR33ID, aprID, inputUserID, projectID, reviewUserID, SROValueAlchDrugServices, SROValueMentalHealthS, SROValueOutreach, SROValueCaseMgmt, SROValueLifeSkills, SROValueAIDS, SROValueOtherHCS, SROValueEducation, SROValueHousingP, SROValueEmpAss, SROValueChildC, SROValueTransport, SROValueLegal, SROValueOther, SROValueTotal">
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
        Form = "dataapr33"
        Where = "thisProject">
<!---/ Get DataAPR --->    

<!--- Math --->
<cfset mathCols="1">
<cfset mathRows="0">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Value of Supportive Services Received by SRO Clients During the Operating Year</h3>
    <table width="100%">
      <thead>
        <th width="50%">Supportive Service Match</th>
        <th>Value ($)</th>       
      </thead>
      <tbody>
        <tr>
          <td>
            Outreach
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueOutreach"
                         value="#getDataAPR.SROValueOutreach#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Case management
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueCaseMgmt"
                         value="#getDataAPR.SROValueCaseMgmt#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Life skills (outside of case management)
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueLifeSkills"
                         value="#getDataAPR.SROValueLifeSkills#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Alcohol and drug abuse services
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueAlchDrugServices"
                         value="#getDataAPR.SROValueAlchDrugServices#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Mental health services
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueMentalHealthS"
                         value="#getDataAPR.SROValueMentalHealthS#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            AIDS - related services
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueAIDS"
                         value="#getDataAPR.SROValueAIDS#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Other health care services
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueOtherHCS"
                         value="#getDataAPR.SROValueOtherHCS#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Education
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueEducation"
                         value="#getDataAPR.SROValueEducation#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Housing placement
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueHousingP"
                         value="#getDataAPR.SROValueHousingP#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Employment assistance
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueEmpAss"
                         value="#getDataAPR.SROValueEmpAss#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Child care
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueChildC"
                         value="#getDataAPR.SROValueChildC#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Transportation
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueTransport"
                         value="#getDataAPR.SROValueTransport#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11" 
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Legal
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueLegal"
                         value="#getDataAPR.SROValueLegal#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            Other
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueOther"
                         value="#getDataAPR.SROValueOther#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"
                         tabindex="#nexttab++#"
                        class="col1">
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <b>Total</b>
          </td>
          <td>
             <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="text"
                         name="SROValueTotal"
                         value="#getDataAPR.SROValueTotal#"
                         placeholder="0"
                         pattern="number"
                         maxlength="11"                      
                        class="BGLightGray"
                        id="sumC1"
                        readonly>
                  <small class="form-error">Must be a whole number</small>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>