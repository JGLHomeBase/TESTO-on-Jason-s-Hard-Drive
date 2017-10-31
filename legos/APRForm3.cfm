<!--- Set Variables --->
<cfset TargetTable = "dataapr03">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR03ID"
        Form = "#TargetTable#">
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
    <cfset FORM.apr03Amount = LSParseCurrency(FORM.apr03Amount)>
    <cfinsert datasource="#DataSource#" tablename="dataapr03" formfields="apr03ProgramType, apr03ComponentType, apr03GrantOperatingYear, apr03VAWA, apr03SpecialInitative, apr03TargetSubpopulation, apr03CoCName, apr03HUDGrantExtension, apr03FinalAPR, apr03Corrected, apr03ReportingObligation, apr03TwentyYearUseRequirement, apr03LOCCS, apr03Renewal, aprID, inputUserID, projectID, reviewUserID, apr03Amount">
  <cfelse>
    <cfset FORM.DataAPR03ID = newCheck.DataAPR03ID>
    <cfset FORM.apr03Amount = LSParseCurrency(FORM.apr03Amount)>
    <cfupdate datasource="#DataSource#" tablename="dataapr03" formfields="DataAPR03ID, apr03ProgramType, apr03ComponentType, apr03GrantOperatingYear, apr03VAWA, apr03SpecialInitative, apr03TargetSubpopulation, apr03CoCName, apr03HUDGrantExtension, apr03FinalAPR, apr03Corrected, apr03ReportingObligation, apr03TwentyYearUseRequirement, apr03LOCCS, apr03Renewal, aprID, inputUserID, projectID, reviewUserID, apr03Amount">
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
<!--- Get Records --->
<cfinvoke component="knex.projects" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getProjects"
        whatFields = "*"
        Join = "LComponent"
        Where = "ThisProject">
<!---/ Get Records --->

<!--- Get DataAPR --->
<cfinvoke component="knex.aprData" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getDataAPR"
        FormID = "*"
        Form = "#TargetTable#"
        Where = "thisProject">
<!---/ Get DataAPR --->

<!--- Queries --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <table width="100%">
      <tbody>
        <tr>
          <td class="text-right" width="50%">
            Program Type
          </td>
          <td>
            <cfif newRecord EQ 1>
              <cfset apr03ProgramType = "Continuum of Care Program">
            <cfelse>
              <cfset apr03ProgramType = getDataAPR.apr03ProgramType>
            </cfif>
            <input type="text"
                   name="apr03ProgramType"
                   value="#apr03ProgramType#"
                   placeholder="Program Type"
                   maxlength="256"
                   tabindex="#nexttab++#"
                   autofocus>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Component Type
          </td>
          <td>

            <!--- Get Components --->
            <cfinvoke component="knex.component" 
              method="get"
              DataSource = "#DataSource#"
              returnVariable = "getProjectCom"
              whatFields = "*"
              Where = "Active"
              Order = "projectComponentLongName ASC">
            <!---/ Get Components --->

            <cfif newRecord EQ 1>
              <cfset apr03ComponentType = getProjects.projectComponentLongName>
            <cfelse>
              <cfset apr03ComponentType = getDataAPR.apr03ComponentType>
            </cfif>
            <select name="apr03ComponentType" tabindex="#nexttab++#">
              <option value="#apr03ComponentType#" selected>#apr03ComponentType#</option> 
            <cfloop query="getProjectCom">
              <option value="#getProjectCom.projectComponentLongName#">#getProjectCom.projectComponentLongName#</option> 
            </cfloop>  
            </select>
            
        </tr>
        <tr>
          <td class="text-right">
            Identify if this project is operated by a victim service provider as defined by the Violence Against Women and Department of Justice Re-authorization Act of 2005 (VAWA)
          </td>
          <td>
            <select name="apr03VAWA" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03VAWA EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03VAWA EQ 0 OR newRecord EQ 1>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Was this project funded under a special initiative?
          </td>
          <td>
            <select name="apr03SpecialInitative" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03SpecialInitative EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03SpecialInitative EQ 0 OR newRecord EQ 1>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Target Subpopulation
          </td>
          <td>
            <input type="text"
                   name="apr03TargetSubpopulation"
                   value="#getDataAPR.apr03TargetSubpopulation#"
                   placeholder="Target Subpopulation"
                  maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
            CoC Amount of Contract or Award
          </td>
          <td>
            <input type="text"
                   name="apr03Amount"
                   value="#LSCurrencyFormat(getDataAPR.apr03Amount)#"
                   placeholder="Amount of Contract or Award"
                  maxlength="11,2"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
            CoC Number and Name
          </td>
          <td>
            <input type="text"
                   name="apr03CoCName"
                   value="#getDataAPR.apr03CoCName#"
                   placeholder="CoC Number and Name"
                  maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        
        <tr>
          <td class="text-right">
            Grant Operating Year Covered by This APR
          </td>
          <td>
            <input type="text"
                   name="apr03GrantOperatingYear"
                   value="#getDataAPR.apr03GrantOperatingYear#"
                   placeholder="Grant Operating Year Covered by This APR"
                  maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Is this an APR for a grant that received a HUD-approved grant extension?
          </td>
          <td>
            <select name="apr03HUDGrantExtension" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03HUDGrantExtension EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03HUDGrantExtension EQ 0 OR newRecord EQ 1>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Is this a final APR?
          </td>
          <td>
            <select name="apr03FinalAPR" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03FinalAPR EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03FinalAPR EQ 0>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Is this a corrected APR?
          </td>
          <td>
            <select name="apr03Corrected" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03Corrected EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03Corrected EQ 0 OR newRecord EQ 1>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Is this APR fulfilling the reporting obligation associated with a use requirement?
          </td>
          <td>
            <select name="apr03ReportingObligation" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03ReportingObligation EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03ReportingObligation EQ 0>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            In what year does the 20-year use requirement end?
          </td>
          <td>
            <input type="text"
                   name="apr03TwentyYearUseRequirement"
                   value="#getDataAPR.apr03TwentyYearUseRequirement#"
                   placeholder="2016"
                  maxlength="4"
                   tabindex="#nexttab++#">
          </td>
        </tr>
         <tr>
          <td class="text-right">
            Have you completed your final draw in LOCCS?
          </td>
          <td>
            <select name="apr03LOCCS" tabindex="#nexttab++#">
                   <option value="1" <cfif getDataAPR.apr03LOCCS EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03LOCCS EQ 0 OR newRecord EQ 1>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
         <tr>
          <td class="text-right">
            Have you renewed this project?
          </td>
          <td>
            <select name="apr03Renewal" tabindex="#nexttab++#">
                   option <cfif getDataAPR.apr03Renewal EQ "">selected</cfif>></option>
                   <option value="1" <cfif getDataAPR.apr03Renewal EQ 1>selected</cfif>>Yes</option>
                   <option value="0" <cfif getDataAPR.apr03Renewal EQ 0>selected</cfif>>No</option>
            </select>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>