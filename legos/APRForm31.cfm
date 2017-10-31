<!--- Set Variables --->
<cfset TargetTable = "DataAPR31">
<cfset UniqueID = "DataAPR31ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR31ID"
        Form = "dataapr31">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr31" formfields="aprID, inputUserID, projectID, reviewUserID, apr31_InitialTerm, apr31_TotalMatch, apr31SC_RA, apr31SC_Admin, apr31SC_SplusCTotal, apr31SC_Outreach, apr31SC_CaseManagement, apr31SC_LifeSkills, apr31SC_AlcoholDrugs, apr31SC_MentalHealth, apr31SC_AIDS, apr31SC_OtherHealth, apr31SC_Education, apr31SC_HousingPlacement, apr31SC_ChildCare, apr31SC_Transport, apr31SC_Legal, apr31SC_Other, apr31SC_Total, apr31Dev_Acquisition, apr31Dev_Rehab, apr31Dev_NewConstruction, apr31Dev_Total, apr31SS_Assessment, apr31SS_MovingCosts, apr31SS_CaseManagement, apr31SS_ChildCare, apr31SS_Education, apr31SS_JobAssist, apr31SS_Food, apr31SS_HousingCounseling, apr31SS_Legal, apr31SS_LifeSkills, apr31SS_MentalHealth, apr31SS_Outpatient, apr31SS_Outreach, apr31SS_SA, apr31SS_Transport, apr31SS_UtilityDeposit, apr31SS_Total, apr31HMIS_Equipment, apr31HMIS_Software, apr31HMIS_NewConstruction, apr31HMIS_Personnel, apr31HMIS_Space, apr31HMIS_Total, apr31Expenditures_Leasing, apr31Expenditures_ShortTermRA, apr31Expenditures_LongTermRA, apr31Expenditures_Operating, apr31Expenditures_Admin, apr31Expenditures_Total, apr31Match_Cash, apr31Match_InKind, apr31Match_Total">
  <cfelse>
    <cfset FORM.DataAPR31ID = newCheck.DataAPR31ID>

<!--- Set Defaults --->

<cfif form.apr31_TotalMatch EQ "">
    <cfset form.apr31_TotalMatch=0>
</cfif>
<cfif form.apr31SC_RA EQ "">
    <cfset form.apr31SC_RA=0>
</cfif>
<cfif form.apr31SC_Admin EQ "">
    <cfset form.apr31SC_Admin=0>
</cfif>
<cfif form.apr31SC_SplusCTotal EQ "">
    <cfset form.apr31SC_SplusCTotal=0>
</cfif>
<cfif form.apr31SC_Outreach EQ "">
    <cfset form.apr31SC_Outreach=0>
</cfif>
<cfif form.apr31SC_CaseManagement EQ "">
    <cfset form.apr31SC_CaseManagement=0>
</cfif>
<cfif form.apr31SC_LifeSkills EQ "">
    <cfset form.apr31SC_LifeSkills=0>
</cfif>
<cfif form.apr31SC_AlcoholDrugs EQ "">
    <cfset form.apr31SC_AlcoholDrugs=0>
</cfif>
<cfif form.apr31SC_MentalHealth EQ "">
    <cfset form.apr31SC_MentalHealth=0>
</cfif>
<cfif form.apr31SC_AIDS EQ "">
    <cfset form.apr31SC_AIDS=0>
</cfif>
<cfif form.apr31SC_OtherHealth EQ "">
    <cfset form.apr31SC_OtherHealth=0>
</cfif>
<cfif form.apr31SC_Education EQ "">
    <cfset form.apr31SC_Education=0>
</cfif>
<cfif form.apr31SC_HousingPlacement EQ "">
    <cfset form.apr31SC_HousingPlacement=0>
</cfif>
<cfif form.apr31SC_JobAssist EQ "">
    <cfset form.apr31SC_JobAssist=0>
</cfif>
<cfif form.apr31SC_ChildCare EQ "">
    <cfset form.apr31SC_ChildCare=0>
</cfif>
<cfif form.apr31SC_Transport EQ "">
    <cfset form.apr31SC_Transport=0>
</cfif>
<cfif form.apr31SC_Legal EQ "">
    <cfset form.apr31SC_Legal=0>
</cfif>
<cfif form.apr31SC_Other EQ "">
    <cfset form.apr31SC_Other=0>
</cfif>
<cfif form.apr31SC_Total EQ "">
    <cfset form.apr31SC_Total=0>
</cfif>
<cfif form.apr31Dev_Acquisition EQ "">
    <cfset form.apr31Dev_Acquisition=0>
</cfif>
<cfif form.apr31Dev_Rehab EQ "">
    <cfset form.apr31Dev_Rehab=0>
</cfif>
<cfif form.apr31Dev_NewConstruction EQ "">
    <cfset form.apr31Dev_NewConstruction=0>
</cfif>
<cfif form.apr31Dev_Total EQ "">
    <cfset form.apr31Dev_Total=0>
</cfif>
<cfif form.apr31SS_Assessment EQ "">
    <cfset form.apr31SS_Assessment=0>
</cfif>
<cfif form.apr31SS_MovingCosts EQ "">
    <cfset form.apr31SS_MovingCosts=0>
</cfif>
<cfif form.apr31SS_CaseManagement EQ "">
    <cfset form.apr31SS_CaseManagement=0>
</cfif>
<cfif form.apr31SS_ChildCare EQ "">
    <cfset form.apr31SS_ChildCare=0>
</cfif>
<cfif form.apr31SS_Education EQ "">
    <cfset form.apr31SS_Education=0>
</cfif>
<cfif form.apr31SS_JobAssist EQ "">
    <cfset form.apr31SS_JobAssist=0>
</cfif>
<cfif form.apr31SS_Food EQ "">
    <cfset form.apr31SS_Food=0>
</cfif>
<cfif form.apr31SS_HousingCounseling EQ "">
    <cfset form.apr31SS_HousingCounseling=0>
</cfif>
<cfif form.apr31SS_Legal EQ "">
    <cfset form.apr31SS_Legal=0>
</cfif>
<cfif form.apr31SS_LifeSkills EQ "">
    <cfset form.apr31SS_LifeSkills=0>
</cfif>
<cfif form.apr31SS_MentalHealth EQ "">
    <cfset form.apr31SS_MentalHealth=0>
</cfif>
<cfif form.apr31SS_Outpatient EQ "">
    <cfset form.apr31SS_Outpatient=0>
</cfif>
<cfif form.apr31SS_Outreach EQ "">
    <cfset form.apr31SS_Outreach=0>
</cfif>
<cfif form.apr31SS_SA EQ "">
    <cfset form.apr31SS_SA=0>
</cfif>
<cfif form.apr31SS_Transport EQ "">
    <cfset form.apr31SS_Transport=0>
</cfif>
<cfif form.apr31SS_UtilityDeposit EQ "">
    <cfset form.apr31SS_UtilityDeposit=0>
</cfif>
<cfif form.apr31SS_Total EQ "">
    <cfset form.apr31SS_Total=0>
</cfif>
<cfif form.apr31HMIS_Equipment EQ "">
    <cfset form.apr31HMIS_Equipment=0>
</cfif>
<cfif form.apr31HMIS_Software EQ "">
    <cfset form.apr31HMIS_Software=0>
</cfif>
<cfif form.apr31HMIS_NewConstruction EQ "">
    <cfset form.apr31HMIS_NewConstruction=0>
</cfif>
<cfif form.apr31HMIS_Personnel EQ "">
    <cfset form.apr31HMIS_Personnel=0>
</cfif>
<cfif form.apr31HMIS_Space EQ "">
    <cfset form.apr31HMIS_Space=0>
</cfif>
<cfif form.apr31HMIS_Total EQ "">
    <cfset form.apr31HMIS_Total=0>
</cfif>
<cfif form.apr31Expenditures_Leasing EQ "">
    <cfset form.apr31Expenditures_Leasing=0>
</cfif>
<cfif form.apr31Expenditures_ShortTermRA EQ "">
    <cfset form.apr31Expenditures_ShortTermRA=0>
</cfif>
<cfif form.apr31Expenditures_LongTermRA EQ "">
    <cfset form.apr31Expenditures_LongTermRA=0>
</cfif>
<cfif form.apr31Expenditures_Operating EQ "">
    <cfset form.apr31Expenditures_Operating=0>
</cfif>
<cfif form.apr31Expenditures_Admin EQ "">
    <cfset form.apr31Expenditures_Admin=0>
</cfif>
<cfif form.apr31Expenditures_Total EQ "">
    <cfset form.apr31Expenditures_Total=0>
</cfif>
<cfif form.apr31Match_Cash EQ "">
    <cfset form.apr31Match_Cash=0>
</cfif>
<cfif form.apr31Match_InKind EQ "">
    <cfset form.apr31Match_InKind=0>
</cfif>
<cfif form.apr31Match_Total EQ "">
    <cfset form.apr31Match_Total=0>
</cfif>

<!---/ Set Defaults --->

    <cfupdate datasource="#DataSource#" tablename="dataapr31" formfields="DataAPR31ID, aprID, inputUserID, projectID, reviewUserID, apr31_InitialTerm, apr31_TotalMatch, apr31SC_RA, apr31SC_Admin, apr31SC_SplusCTotal, apr31SC_Outreach, apr31SC_CaseManagement, apr31SC_LifeSkills, apr31SC_AlcoholDrugs, apr31SC_MentalHealth, apr31SC_AIDS, apr31SC_OtherHealth, apr31SC_Education, apr31SC_HousingPlacement,, apr31SC_ChildCare, apr31SC_Transport, apr31SC_Legal, apr31SC_Other, apr31SC_Total, apr31Dev_Acquisition, apr31Dev_Rehab, apr31Dev_NewConstruction, apr31Dev_Total, apr31SS_Assessment, apr31SS_MovingCosts, apr31SS_CaseManagement, apr31SS_ChildCare, apr31SS_Education, apr31SS_JobAssist, apr31SS_Food, apr31SS_HousingCounseling, apr31SS_Legal, apr31SS_LifeSkills, apr31SS_MentalHealth, apr31SS_Outpatient, apr31SS_Outreach, apr31SS_SA, apr31SS_Transport, apr31SS_UtilityDeposit, apr31SS_Total, apr31HMIS_Equipment, apr31HMIS_Software, apr31HMIS_NewConstruction, apr31HMIS_Personnel, apr31HMIS_Space, apr31HMIS_Total, apr31Expenditures_Leasing, apr31Expenditures_ShortTermRA, apr31Expenditures_LongTermRA, apr31Expenditures_Operating, apr31Expenditures_Admin, apr31Expenditures_Total, apr31Match_Cash, apr31Match_InKind, apr31Match_Total">
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

<!--- Queries --->
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
        Form = "dataapr31"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queries --->

<!--- Math --->
<cfset mathCols="15">
<cfset mathRows="4">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">

<!---/ Math --->

<cfoutput>
<cfset nexttab="1">
<div class="row">
  <div class="large-12 columns">
    <table width="100%">
      <tbody>
        <tr>
          <td width="50%">
            Is this grant completing its initial grant term?
          </td>
          <td width="50%">
            <select name="apr31_InitialTerm" required tabindex="#nexttab++#">
             <option value="1" <cfif getDataAPR.apr31_InitialTerm EQ 1>selected</cfif>>Yes</option>
             <option value="0" <cfif getDataAPR.apr31_InitialTerm EQ 0>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="50%">
            If "yes" - Total match for this grant
          </td>
          <td width="50%">
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                  <input type="number"
                     name="apr31_TotalMatch"
                     value="#getDataAPR.apr31_TotalMatch#"
                     placeholder="0"
                     tabindex="#nexttab++#"
            
                    maxlength="11"
                    autofocus>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

<!---
    <h3>S+C and Documented Services Match During the Operating Year</h3>
    <table width="100%">
      <thead>
        <th></th>
        <th>Expenditure Amount</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Rental Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_RA"
                       value="#getDataAPR.apr31SC_RA#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col1">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Administration</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Admin"
                       value="#getDataAPR.apr31SC_Admin#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col1">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%"><b>Total S+C Expenditures</b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_SplusCTotal"
                       value="#getDataAPR.apr31SC_SplusCTotal#"
                       placeholder="0"
              
                      maxlength="11"
                      id="sumC1"
                      readonly
                      class="BGLightGray">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

    <h3>Value of Supportive Services Received by S+C Clients During the Operating Year</h3>
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th>Documented Service Match</th>
        <th>Value (&##36;)</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Outreach</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Outreach"
                       value="#getDataAPR.apr31SC_Outreach#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Case management</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_CaseManagement"
                       value="#getDataAPR.apr31SC_CaseManagement#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Life Skills (outside of case management)</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_LifeSkills"
                       value="#getDataAPR.apr31SC_LifeSkills#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Alcohol and drug abuse services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_AlcoholDrugs"
                       value="#getDataAPR.apr31SC_AlcoholDrugs#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Mental health services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_MentalHealth"
                       value="#getDataAPR.apr31SC_MentalHealth#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">AIDS - related services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_AIDS"
                       value="#getDataAPR.apr31SC_AIDS#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Other health care services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_OtherHealth"
                       value="#getDataAPR.apr31SC_OtherHealth#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Education</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Education"
                       value="#getDataAPR.apr31SC_Education#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Housing placement</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_HousingPlacement"
                       value="#getDataAPR.apr31SC_HousingPlacement#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Employment assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_JobAssist"
                       value="#getDataAPR.apr31SC_JobAssist#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Child care</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_ChildCare"
                       value="#getDataAPR.apr31SC_ChildCare#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Transportation</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Transport"
                       value="#getDataAPR.apr31SC_Transport#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Legal</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Legal"
                       value="#getDataAPR.apr31SC_Legal#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Other</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Other"
                       value="#getDataAPR.apr31SC_Other#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col2">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%"><b>Total documented services match </b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Total"
                       value="#getDataAPR.apr31SC_Total#"
                       placeholder="0"
              
                      maxlength="11"
                      id="sumC2"
                      readonly
                      class="BGLightGray">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>


<table width="100%">
      <thead>
        <th></th>
        <th>Expenditure Amount</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Rental Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_RA"
                       value="#getDataAPR.apr31SC_RA#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col1">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Administration</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_Admin"
                       value="#getDataAPR.apr31SC_Admin#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col1">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%"><b>Total S+C Expenditures</b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SC_SplusCTotal"
                       value="#getDataAPR.apr31SC_SplusCTotal#"
                       placeholder="0"
              
                      maxlength="11"
                      id="sumC1"
                      readonly
                      class="BGLightGray">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
--->

                <input type="hidden"
                       name="apr31SC_Outreach"
                       value="#getDataAPR.apr31SC_Outreach#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_CaseManagement"
                       value="#getDataAPR.apr31SC_CaseManagement#"
                       placeholder="0">
 
                <input type="hidden"
                       name="apr31SC_LifeSkills"
                       value="#getDataAPR.apr31SC_LifeSkills#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_AlcoholDrugs"
                       value="#getDataAPR.apr31SC_AlcoholDrugs#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_MentalHealth"
                       value="#getDataAPR.apr31SC_MentalHealth#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_AIDS"
                       value="#getDataAPR.apr31SC_AIDS#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_OtherHealth"
                       value="#getDataAPR.apr31SC_OtherHealth#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_Education"
                       value="#getDataAPR.apr31SC_Education#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_HousingPlacement"
                       value="#getDataAPR.apr31SC_HousingPlacement#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_JobAssist"
                       value="#getDataAPR.apr31SC_JobAssist#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_ChildCare"
                       value="#getDataAPR.apr31SC_ChildCare#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_Transport"
                       value="#getDataAPR.apr31SC_Transport#"
                       placeholder="0">
                <input type="hidden"
                       name="apr31SC_Legal"
                       value="#getDataAPR.apr31SC_Legal#"
                       placeholder="0"
                       >
 
                <input type="hidden"
                       name="apr31SC_Other"
                       value="#getDataAPR.apr31SC_Other#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_Total"
                       value="#getDataAPR.apr31SC_Total#"
                       placeholder="0"
                       >

                <input type="hidden"
                       name="apr31SC_RA"
                       value="#getDataAPR.apr31SC_RA#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_Admin"
                       value="#getDataAPR.apr31SC_Admin#"
                       placeholder="0">

                <input type="hidden"
                       name="apr31SC_SplusCTotal"
                       value="#getDataAPR.apr31SC_SplusCTotal#"
                       placeholder="0">


    <h3>Q31a1 CoC Financial - Development</h3>
    <table width="100%">
      <thead>
        <th>Expenditure Type</th>
        <th>CoC Program Funds Expenditures</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Acquisition</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Dev_Acquisition"
                       value="#getDataAPR.apr31Dev_Acquisition#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col3">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Rehabilitation</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Dev_Rehab"
                       value="#getDataAPR.apr31Dev_Rehab#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col3">
              </div>
            </div>
          </td>
        </tr>
         <tr>
          <td width="50%">New Construction</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Dev_NewConstruction"
                       value="#getDataAPR.apr31Dev_NewConstruction#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col3">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%"><b>Development - Subtotal </b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Dev_Total"
                       value="#getDataAPR.apr31Dev_Total#"
                       placeholder="0"
              
                      maxlength="11"
                      id="sumC3"
                      readonly
                      class="BGLightGray">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>



    <h3>Q31a2 CoC Expenditures - Supportive Services</h3>
    <table width="100%">
      <thead>
        <th>Expenditure Type</th>
        <th>CoC Program Funds Expenditures</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Assessment of Service Needs</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Assessment"
                       value="#getDataAPR.apr31SS_Assessment#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Assistance with Moving Costs</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_MovingCosts"
                       value="#getDataAPR.apr31SS_MovingCosts#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Case Management</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_CaseManagement"
                       value="#getDataAPR.apr31SS_CaseManagement#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Child Care</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_ChildCare"
                       value="#getDataAPR.apr31SS_ChildCare#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Education Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Education"
                       value="#getDataAPR.apr31SS_Education#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Employment Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_JobAssist"
                       value="#getDataAPR.apr31SS_JobAssist#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Food</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Food"
                       value="#getDataAPR.apr31SS_Food#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Housing/Counseling Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_HousingCounseling"
                       value="#getDataAPR.apr31SS_HousingCounseling#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Legal Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Legal"
                       value="#getDataAPR.apr31SS_Legal#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Life Skills</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_LifeSkills"
                       value="#getDataAPR.apr31SS_LifeSkills#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Mental Health Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_MentalHealth"
                       value="#getDataAPR.apr31SS_MentalHealth#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Outpatient Health Service</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Outpatient"
                       value="#getDataAPR.apr31SS_Outpatient#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Outreach Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Outreach"
                       value="#getDataAPR.apr31SS_Outreach#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Substance Abuse Treatment Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_SA"
                       value="#getDataAPR.apr31SS_SA#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Transportation</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Transport"
                       value="#getDataAPR.apr31SS_Transport#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Utility Deposits</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_UtilityDeposit"
                       value="#getDataAPR.apr31SS_UtilityDeposit#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%"><b>Services - Subtotal</b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31SS_Total"
                       value="#getDataAPR.apr31SS_Total#"
                       placeholder="0"
              
                      maxlength="11"
                      id="sumC4"
                      class="BGLightGray"
                      readonly>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>




    <h3>Q31a3 CoC Expenditures - HMIS</h3>
    <table width="100%">
      <thead>
        <th>Expenditure Type</th>
        <th>CoC Program Funds Expenditures</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Equipment (server, computers, printers)</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31HMIS_Equipment"
                       value="#getDataAPR.apr31HMIS_Equipment#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col5">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Software (software fees, user licenses, software support)</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31HMIS_Software"
                       value="#getDataAPR.apr31HMIS_Software#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col5">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">New Construction</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31HMIS_NewConstruction"
                       value="#getDataAPR.apr31HMIS_NewConstruction#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col5">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Personnel (costs associated with staff)</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31HMIS_Personnel"
                       value="#getDataAPR.apr31HMIS_Personnel#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col5">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Space and operations</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31HMIS_Space"
                       value="#getDataAPR.apr31HMIS_Space#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col5">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%"><b>HMIS - Subtotal</b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31HMIS_Total"
                       value="#getDataAPR.apr31HMIS_Total#"
                       placeholder="0"
              
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC5">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>




    <h3>Q31a4 CoC Expenditures - Leasing, Rental Assistance, Operating and Administration</h3>
    <table width="100%">
      <thead>
        <th>Expenditure Type</th>
        <th>CoC Program Funds Expenditures</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Real Property Leasing</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Expenditures_Leasing"
                       value="#getDataAPR.apr31Expenditures_Leasing#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col6 col10" 
                       >
              </div>
            </div>
          </td>
        </tr>
         <tr>
          <td width="50%">Short-/Medium-term Rental Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Expenditures_ShortTermRA"
                       value="#getDataAPR.apr31Expenditures_ShortTermRA#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col6 col11">
              </div>
            </div>
          </td>
        </tr>
         <tr>
          <td width="50%">Long-term Rental Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Expenditures_LongTermRA"
                       value="#getDataAPR.apr31Expenditures_LongTermRA#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col6 col15">
              </div>
            </div>
          </td>
        </tr>
         <tr>
          <td width="50%">Operating Costs</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Expenditures_Operating"
                       value="#getDataAPR.apr31Expenditures_Operating#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col6 col12">
              </div>
            </div>
          </td>
        </tr>
         <tr>
          <td width="50%">Administration</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Expenditures_Admin"
                       value="#getDataAPR.apr31Expenditures_Admin#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col6 col13">
              </div>
            </div>
          </td>
        </tr>
         <tr>
          <td width="50%"><b>Leasing, Rental Assistance, Operating, Admin. - Subtotal</b></td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Expenditures_Total"
                       value="#getDataAPR.apr31Expenditures_Total#"
                       placeholder="0"
              
                      maxlength="11"
                      readonly
                      class="BGLightGray"
                      id="sumC6">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

<h4>CoC Program Funds and Match Applicable During the Operating Year - Totals</h4>
    <table width="100%">
      <thead>
        <th>Total Expenses</th>
        <th>CoC Funds</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Development</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       
                       value="#getDataAPR.apr31Dev_Total#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       
                       id="sumC3">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Supportive Services</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       
                       value="#getDataAPR.apr31SS_Total#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       id="sumC4">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Real Property Leasing</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       value="#getDataAPR.apr31Expenditures_Leasing#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       id="sumC10">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Short-/Medium-term Rental Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       value="#getDataAPR.apr31Expenditures_ShortTermRA#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       id="sumC11">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Long-term Rental Assistance</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       value="#getDataAPR.apr31Expenditures_LongTermRA#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       id="sumC15">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Operating Costs</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       value="#getDataAPR.apr31Expenditures_Operating#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       
                       id="sumC12">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">HMIS</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       value="#getDataAPR.apr31HMIS_Total#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col9"
                       
                       id="sumC5">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Subtotal</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       value="#getDataAPR.apr31Match_Cash#"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col14"
                       id="sumC9">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Administration</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       placeholder="0"
              
                       readonly
                       class="BGLightGray col14"
                       id="sumC13">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Total Expenses plus Admin</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       placeholder="0"
              
                       readonly
                       id="sumC14"
                       class="BGLightGray col7"
                       >
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Cash Match</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Match_Cash"
                       value="#getDataAPR.apr31Match_Cash#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col8">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">In-Kind Match</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Match_InKind"
                       value="#getDataAPR.apr31Match_InKind#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col8">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Total Match</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                      name="apr31Match_Total"
                      value="#getDataAPR.apr31Match_Total#"
                      placeholder="0"
             
                      maxlength="11"
                      readonly
                      id="sumC8"
                      class="BGLightGray col7">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Match %</td>
          <td>
            <div class="row collapse">
                <div class="small-9 large-12 columns">
                <input type="number"
                      placeholder="Not Collected"
                      readonly
                        class="BGLightGray col7">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Total Expenditures Plus Match</td>
          <td>
            <div class="row collapse">
                <div class="small-9 large-12 columns">
                <input type="number"
                      placeholder="Not Collected"
                      readonly
                      class="BGLightGray col7">
              </div>
            </div>
          </td>
        </tr>        
        </tbody>
    </table>

<!---
    <h4>CoC Program Funds and Match Applicable During the Operating Year - Totals</h4>
    <table width="100%">
      <thead>
        <th>Expenditure Type</th>
        <th>CoC Program Funds Expenditures</th>
      </thead>
      <tbody>
        <tr>
          <td width="50%">Cash Match</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Match_Cash"
                       value="#getDataAPR.apr31Match_Cash#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col8">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">In-Kind Match</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Match_InKind"
                       value="#getDataAPR.apr31Match_InKind#"
                       placeholder="0"
              
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="col8">
              </div>
            </div>
          </td>
        </tr>
        <tr>
          <td width="50%">Total Match</td>
          <td>
            <div class="row collapse">
                <div class="small-3 large-2 columns">
                  <span class="prefix">&##36;</span>
                </div>
                <div class="small-9 large-10 columns">
                <input type="number"
                       name="apr31Match_Total"
                       value="#getDataAPR.apr31Match_Total#"
                       placeholder="0"
              
                      maxlength="11"
                      readonly
                      id="sumC8"
                      class="BGLightGray">
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    --->
  </div>
</div>
</cfoutput>