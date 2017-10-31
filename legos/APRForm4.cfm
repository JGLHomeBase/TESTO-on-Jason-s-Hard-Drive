<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR04ID"
        Form = "dataapr04">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr04" formfields="aprID, inputUserID, projectID, reviewUserID, apr04StreetAddress, apr04City, apr04State, apr04ZipCode, apr04SiteConfiguration, apr04SiteTypePrincipalServiceSite, apr04HousingTypePrincipalServiceSite">
  <cfelse>
    <cfset FORM.DataAPR04ID = newCheck.DataAPR04ID>
    <cfupdate datasource="#DataSource#" tablename="dataapr04" formfields="DataAPR04ID, aprID, inputUserID, projectID, reviewUserID, apr04StreetAddress, apr04City, apr04State, apr04ZipCode, apr04SiteConfiguration, apr04SiteTypePrincipalServiceSite, apr04HousingTypePrincipalServiceSite">  </cfif>
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
        Form = "dataapr04"
        Where = "thisProject">
<!---/ Get DataAPR --->

<!--- Queires --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <table width="100%">
      <tbody>
        <tr>
          <td class="text-right" width="50%">
            Street/PO Box
          </td>
          <td>
            <cfif newRecord EQ 1>
              <cfset apr04StreetAddress = getProjects.ProjectStreet1>
            <cfelse>
              <cfset apr04StreetAddress = getDataAPR.apr04StreetAddress>
            </cfif>
            <input type="text"
                   name="apr04StreetAddress"
                   value="#apr04StreetAddress#"
                   placeholder="870 Market Street"
                   maxlength="256"
                   tabindex="#nexttab++#"
                   autofocus>
          </td>
        </tr>
        <tr>
          <td class="text-right">
            City
          </td>
          <td>
            <cfif newRecord EQ 1>
              <cfset apr04City = getProjects.ProjectCity>
            <cfelse>
              <cfset apr04City = getDataAPR.apr04City>
            </cfif>
            <input type="text"
                   name="apr04City"
                   value="#apr04City#"
                   placeholder="San Francisco"
                  maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
            State
          </td>
          <td>
            <cfif newRecord EQ 1>
              <cfset apr04State = getProjects.ProjectState>
              <cfelse>
                <cfset apr04State = getDataAPR.apr04State>
              </cfif>
            <input type="text"
                   name="apr04State"
                   value="#apr04State#"
                   placeholder="CA"
                  maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Zip Code
          </td>
          <td>
            <cfif newRecord EQ 1>
              <cfset apr04ZipCode = getProjects.ProjectZip>
              <cfelse>
                <cfset apr04ZipCode = getDataAPR.apr04ZipCode>
              </cfif>
            <input type="text"
                   name="apr04ZipCode"
                   value="#apr04ZipCode#"
                   placeholder="94102"
                  maxlength="20"
                   tabindex="#nexttab++#">
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <table width="100%">
      <tbody>
        <tr>
          <td class="text-right" width="50%">
           Identify the program site configuration type 
          </td>
          <td>
            <input type="text"
                   name="apr04SiteConfiguration"
                   value="#getDataAPR.apr04SiteConfiguration#"
                   placeholder="single-building, single-site/multiple-building, multiple-sites"
                  maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
           Identify the site type for the principal service site
          </td>
          <td>
            <input type="text"
                     name="apr04SiteTypePrincipalServiceSite"
                     value="#getDataAPR.apr04SiteTypePrincipalServiceSite#"
                     placeholder="ES, TH, SH, RRH, PSH, Non-Residential: Services Only"
                    maxlength="256"
                   tabindex="#nexttab++#">
          </td>
        </tr>
        <tr>
          <td class="text-right">
            Identify the housing type for the principal service site
          </td>
          <td>
            <input type="text"
                         name="apr04HousingTypePrincipalServiceSite"
                         value="#getDataAPR.apr04HousingTypePrincipalServiceSite#"
                         placeholder="Residential: special needs only, Residential: special needs and non-special needs, Non-residential: services only"
                        maxlength="256"
                        tabindex="#nexttab++#">
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>