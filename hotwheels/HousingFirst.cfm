<cfoutput>
<!--- Display --->
	<div class="row">
		<div class="large-12 columns">
<h2 class="MakePrimary">Housing First</h2>

<table>
<thead>
<tr>
<th  class="text-left">
<h4><em>Principles of Housing First</em></h4>
</th>
<th class="text-center">
<h4><em>Project Alignment</em></h4>
</th>
</tr>
</thead>
<tbody>
<tr>
<td width="75%" class="text-left"><strong>Tenant screening and selection practices promote the acceptance of applicants regardless of their sobriety or use of substances, completion of treatment, and participation in services:</strong></td>
<td class="text-center"><!---/ Get NumAns06 --->    
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1029"
              returnvariable="pm">
    <!---/ Get NumAns06 --->
    <cfif pm.value EQ "1">
        Yes
    <!--- Get NumAns06 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1029"
              returnvariable="pm">
    <!---/ Get NumAns06 --->
    <cfelseif pm.value EQ "0">
        No
    </cfif></td>
</tr>
<tr>
<td width="75%" class="text-left"><strong>Housing accepts referrals directly from shelters, street outreach, drop-in centers, and other parts of the crisis response system frequented by vulnerable people experiencing homelessness:</strong></td>
<td class="text-center"><!--- Get NumAns13 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1036"
              returnvariable="pm">
    <!---/ Get NumAns13 --->
    <cfif pm.value EQ "1">
        Yes
    <!--- Get NumAns13 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1036"
              returnvariable="pm">
    <!---/ Get NumAns13 --->
    <cfelseif pm.value EQ "0">
        No
    </cfif></td>
</tr>
<tr>
<td width="75%" class="text-left"><strong>Participation in services or program compliance is not a condition of housing tenancy:</strong></td>
<td class="text-center"><!--- Get NumAns14 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1037"
              returnvariable="pm">
    <!---/ Get NumAns14 --->
    <cfif pm.value EQ "1">
        Yes
    <!--- Get NumAns14 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1037"
              returnvariable="pm">
    <!---/ Get NumAns14 --->
    <cfelseif pm.value EQ "0">
        No
    </cfif></td>
</tr>
<tr>
<td width="75%" class="text-left"><strong>Use of alcohol or drugs, in and of itself, is not considered a reason for eviction:</strong></td>
<td class="text-center"><!--- Get NumAns15 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1038"
              returnvariable="pm">
    <!---/ Get NumAns15 --->
    <cfif pm.value EQ "1">
        Yes
    <!--- Get NumAns15 --->
    <cfinvoke component="knex.pm"
              method="getProject"
              apr="#URL.apr#"
              project="#URL.project#"
              pm="1038"
              returnvariable="pm">
    <!---/ Get NumAns15 --->
    <cfelseif pm.value EQ "0">
        No
    </cfif></td>
</tr>
</tbody>
</table>

<!--- Get LongAns02 --->
<cfinvoke component="knex.pm"
          method="getProject"
          apr="#URL.apr#"
          project="#URL.project#"
          pm="1055"
          returnvariable="pm">
<!---/ Get LongAns02 --->
<cfif pm.value NEQ "" AND pm.value NEQ "0">
<h3>Explanation of Housing First</h3>
    <p>
        <!--- Get Measure --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="1055"
                  returnvariable="pm">
        <!---/ Get Measure --->
    	#pm.prettyvalue#
    </p>
</cfif>
</div>
</div>
</cfoutput>