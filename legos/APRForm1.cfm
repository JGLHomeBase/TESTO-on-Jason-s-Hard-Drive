<!--- Set Variables --->
<cfset TargetTable = "dataapr01">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR01ID"
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
    <cfinsert datasource="#DataSource#" tablename="dataapr01" formfields="projectID, inputUserID, reviewUserID, aprID, apr01ProjectName, apr01Recipient, apr01GrantNumber, apr01Prefix, apr01FirstName, apr01MiddleName, apr01LastName, apr01suffix, apr01Title, apr01StreetAddress1, apr01StreetAddress2, apr01City, apr01State, apr01ZipCode, apr01EmailAddress, apr01PhoneNumber, apr01Extension, apr01FaxNumber">
  <cfelse>
    <cfset FORM.DataAPR01ID = newCheck.DataAPR01ID>
    <cfupdate datasource="#DataSource#" tablename="dataapr01" formfields="DataAPR01ID, projectID, inputUserID, reviewUserID, aprID, apr01ProjectName, apr01Recipient, apr01GrantNumber, apr01Prefix, apr01FirstName, apr01MiddleName, apr01LastName, apr01suffix, apr01Title, apr01StreetAddress1, apr01StreetAddress2, apr01City, apr01State, apr01ZipCode, apr01EmailAddress, apr01PhoneNumber, apr01Extension, apr01FaxNumber">
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
          <td class="text-right">
            Project Name
          </td>
          <td>
            <!--- apr01ProjectName --->
            <cfif newRecord EQ 1>
              <cfset apr01ProjectName = getProjects.projectLongName>
            <cfelse>
              <cfset apr01ProjectName = getDataAPR.apr01ProjectName>
            </cfif>
            <input type="text"
                   name="apr01ProjectName"
                   value="#apr01ProjectName#"
                   placeholder="Acme House"
                   maxlength="256"
                   tabindex="#nexttab++#"
                   autofocus>
            <!---/ apr01ProjectName --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Recipient
          </td>
          <td>
            <!--- apr01Recipient --->
            <input type="text"
                   name="apr01Recipient"
                   value="#getDataAPR.apr01Recipient#"
                   placeholder="Acme Housing Agency"
                   maxlength="256"
                   tabindex="#nexttab++#">
            <!---/ apr01Recipient --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Grant Number
          </td>
          <td>
            <!--- apr01GrantNumber --->
            <input type="text"
                   name="apr01GrantNumber"
                   value="#getDataAPR.apr01GrantNumber#"
                   placeholder="Grant Number"
                   maxlength="256"
                   tabindex="#nexttab++#">
            <!---/ apr01GrantNumber --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Prefix
          </td>
          <td>
            <!--- apr01Prefix --->
           <input type="text"
                  name="apr01Prefix"
                  value="#getDataAPR.apr01Prefix#"
                  placeholder="Mrs."
                  maxlength="10"
                  tabindex="#nexttab++#">
            <!---/ apr01Prefix --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           First Name
          </td>
          <td>
            <!--- apr01FirstName --->
           <input type="text"
                   name="apr01FirstName"
                   value="#getDataAPR.apr01FirstName#"
                   placeholder="First Name"
                   maxlength="256"
                  tabindex="#nexttab++#">
            <!---/ apr01FirstName --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Middle Name
          </td>
          <td>
            <!--- apr01Prefix --->
           <input type="text"
                   name="apr01MiddleName"
                   value="#getDataAPR.apr01MiddleName#"
                   placeholder="Middle Name"
                   maxlength="256"
                  tabindex="#nexttab++#">
            <!---/ apr01Prefix --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Last Name
          </td>
          <td>
            <!--- apr01LastName --->
           <input type="text"
                   name="apr01LastName"
                   value="#getDataAPR.apr01LastName#"
                   placeholder="Last Name"
                   maxlength="256"
                  tabindex="#nexttab++#">
            <!---/ apr01LastName --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Suffix
          </td>
          <td>
           <input type="text"
                 name="apr01suffix"
                 value="#getDataAPR.apr01suffix#"
                 placeholder="Suffix"
                 maxlength="256"
                  tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Title
          </td>
          <td>
            <!--- apr01Title --->
           <input type="text"
                 name="apr01Title"
                 value="#getDataAPR.apr01Title#"
                 placeholder="Title"
                 maxlength="256"
                  tabindex="#nexttab++#">
            <!---/ apr01Title --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Street Address 1
          </td>
          <td>
            <!--- apr01StreetAddress1 --->
            <cfif newRecord EQ 1>
              <cfset apr01StreetAddress1 = getProjects.ProjectStreet1>
            <cfelse>
              <cfset apr01StreetAddress1 = getDataAPR.apr01StreetAddress1>
            </cfif>
          <input type="text"
                 name="apr01StreetAddress1"
                 value="#apr01StreetAddress1#"
                 placeholder="Street Address 1"
                 maxlength="256"
                 tabindex="#nexttab++#">
            <!---/ apr01StreetAddress1 --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Street Address 2
          </td>
          <td>
            <!--- apr01StreetAddress2 --->
             <cfif newRecord EQ 1>
              <cfset apr01StreetAddress2 = getProjects.ProjectStreet2>
              <cfelse>
                <cfset apr01StreetAddress2 = getDataAPR.apr01StreetAddress2>
              </cfif>
           <input type="text"
                   name="apr01StreetAddress2"
                   value="#apr01StreetAddress2#"
                   placeholder="Street Address 2"
                   maxlength="256"
                  tabindex="#nexttab++#">
            <!---/ apr01StreetAddress2 --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           City
          </td>
          <td>
            <!--- apr01City  --->
            <cfif newRecord EQ 1>
              <cfset apr01City = getProjects.ProjectCity>
              <cfelse>
                <cfset apr01City = getDataAPR.apr01City>
              </cfif>
          <input type="text"
                 name="apr01City"
                 value="#apr01City#"
                 placeholder="City"
                 maxlength="256"
                 tabindex="#nexttab++#">
            <!---/ apr01City  --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           State
          </td>
          <td>
            <!--- apr01State --->
             <cfif newRecord EQ 1>
              <cfset apr01State = getProjects.ProjectState>
              <cfelse>
                <cfset apr01State = getDataAPR.apr01State>
              </cfif>
          <input type="text"
                   name="apr01State"
                   value="#apr01State#"
                   placeholder="State"
                   maxlength="256"
                 tabindex="#nexttab++#">
            <!---/ apr01State --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Zip Code
          </td>
          <td>
            <!--- apr01ZipCode --->
            <cfif newRecord EQ 1>
              <cfset apr01ZipCode = getProjects.ProjectZip>
              <cfelse>
                <cfset apr01ZipCode = getDataAPR.apr01ZipCode>
              </cfif>
           <input type="text"
                   name="apr01ZipCode"
                   value="#apr01ZipCode#"
                   placeholder="Zip Code"
                   maxlength="20"
                  tabindex="#nexttab++#">
            <!---/ apr01ZipCode --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Email Address
          </td>
          <td>
            <!--- apr01EmailAddress --->
           <input type="email"
                  name="apr01EmailAddress"
                  value="#getDataAPR.apr01EmailAddress#"
                  placeholder="E-mail Address"
                  maxlength="256"
                  pattern=".+@.+\..+"
                  tabindex="#nexttab++#">
            <small class="form-error">Please enter a valid e-mail address.</small>
            <!---/ apr01EmailAddress --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Confirm Email Address
          </td>
          <td>
            <!--- apr01EmailAddress --->
          <input type="email"
                       name=""
                       value="#getDataAPR.apr01EmailAddress#"
                       placeholder="E-mail Address"
                       disabled>
            <!---/ apr01EmailAddress --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Phone Number
          </td>
          <td>
            <!--- apr01PhoneNumber --->
          <input type="tel"
                 name="apr01PhoneNumber"
                 value="#getDataAPR.apr01PhoneNumber#"
                 placeholder="800-867-5309"
                 pattern="^\(?\d{3}\)?-?\d{3}-?\d{4}$"
                 maxlength="256"
                 tabindex="#nexttab++#">
                    <small class="form-error">Please enter a valid phone number, including area code.</small>
            <!---/ apr01PhoneNumber --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Extension
          </td>
          <td>
            <!--- apr01Extension --->
           <input type="text"
                   name="apr01Extension"
                   value="#getDataAPR.apr01Extension#"
                   placeholder="Extension "
                   maxlength="20"
                  tabindex="#nexttab++#">
            <!---/ apr01Extension --->
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Fax Number
          </td>
          <td>
            <!--- apr01FaxNumber  --->
           <input type="tel"
                   name="apr01FaxNumber"
                   value="#getDataAPR.apr01FaxNumber#"
                   placeholder="Fax Number"
                   maxlength="256"
                  pattern="^\(?\d{3}\)?-?\d{3}-?\d{4}$"
                  tabindex="#nexttab++#">
              <small class="form-error">Please enter a valid fax number, including area code.</small>
            <!---/ apr01FaxNumber  --->
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>