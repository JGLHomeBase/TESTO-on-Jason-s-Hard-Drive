<!--- Set Variables --->
<cfset TargetTable = "DataAPR00">
<cfset UniqueID = "DataAPR00ID">
<!---/ Set Variables --->

<!--- New Check --->
      <!--- Get ID --->
      <cfinvoke component="knex.aprData" 
            method="newCheck"
            DataSource = "#DataSource#"
            returnVariable = "newCheck"
            FormID = "DataAPR00ID"
            Form = "dataapr00">
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
      <cfinsert datasource="#DataSource#" tablename="dataapr01" formfields="">
    <cfelse>
       <cfset FORM.DataAPR00ID = "newCheck.DataAPR00ID">
       <cfupdate datasource="#DataSource#" tablename="dataapr01" formfields="">
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
        Form = "dataapr00"
        Where = "thisProject">
<!---/ Get DataAPR --->    
<!--- Queires --->

<!--- Math --->
<cfset mathCols="0">
<cfset mathRows="0">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
         <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
         <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
          <td>

          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>