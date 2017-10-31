<cfoutput>
<div class="row">
<div class="large-12 columns">

<table width="100%">
	<thead>
		<tr>
			<th width="45%" class="text-left">
				<em>Disabilities</em>
			</th>
			<th class="text-center" >
				<em>Number of Participants</em>
			</th>
		</tr>
	</thead>
	<tbody>
        <!--- Get Mental  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="271"
                  returnvariable="pm">
        <!---/ Get Mental  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
        <tr>
			<td valign="top">
				Mental Illness
			</td>
			<td valign="top" class="text-center">
                <!--- Get Mental  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="271"
                          returnvariable="pm">
                <!---/ Get Mental  --->                
				#pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent Mental  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1144"
                          returnvariable="pm">
                <!---/ Get Percent Mental  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
        <!--- Get Alcohol  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="272"
                  returnvariable="pm">
        <!---/ Get Alcohol  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
		<tr>
			<td valign="top">
				Alcohol Abuse
			</td>
			<td valign="top" class="text-center">
                <!--- Get Alcohol  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="272"
                          returnvariable="pm">
                <!---/ Get Alcohol  --->
				#pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent Alcohol  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1141"
                          returnvariable="pm">
                <!---/ Get Percent Alcohol  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
        <!--- Get Drug  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="273"
                  returnvariable="pm">
        <!---/ Get Drug  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
		<tr>
			<td valign="top">
				Drug Abuse
			</td>
			<td valign="top" class="text-center">
                <!--- Get Drug  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="273"
                          returnvariable="pm">
                <!---/ Get Drug  --->
				#pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent Drug  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1142"
                          returnvariable="pm">
                <!---/ Get Percent Drug  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
        <!--- Get Chronic  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="275"
                  returnvariable="pm">
        <!---/ Get Chronic  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
		<tr>
			<td valign="top">
				Chronic Health Condition
			</td>
			<td valign="top" class="text-center">
                <!--- Get Chronic  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="275"
                          returnvariable="pm">
                <!---/ Get Chronic  --->
				#pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent Chronic  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1138"
                          returnvariable="pm">
                <!---/ Get Percent Chronic  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
        <!--- Get HIV  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="274"
                  returnvariable="pm">
        <!---/ Get HIV  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
		<tr>
			<td valign="top">
				HIV/AIDS and Related Diseases
			</td>
			<td valign="top" class="text-center">
                <!--- Get HIV  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="274"
                          returnvariable="pm">
                <!---/ Get HIV  --->
				#pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent HIV  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1143"
                          returnvariable="pm">
                <!---/ Get Percent HIV  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
        <!--- Get Developmental  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="276"
                  returnvariable="pm">
        <!---/ Get Developmental  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
		<tr>
			<td valign="top">
				Developmental Disability
			</td>
			<td valign="top" class="text-center">
                <!--- Get Developmental  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="276"
                          returnvariable="pm">
                <!---/ Get Developmental  --->
                #pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent Developmental  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1139"
                          returnvariable="pm">
                <!---/ Get Percent Developmental  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
        <!--- Get Physical  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="277"
                  returnvariable="pm">
        <!---/ Get Physical  --->
        <cfif pm.value NEQ "" AND pm.value NEQ "0">
		<tr>
			<td valign="top">
				Physical Disability
			</td>
			<td valign="top" class="text-center">
                <!--- Get Physical  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="277"
                          returnvariable="pm">
                <!---/ Get Physical  --->
                #pm.tiplink# of 
                <!--- Get Total  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="296"
                          returnvariable="pm">
                <!---/ Get Total  --->                
                #pm.tiplink#
                <!--- Get Percent Physical  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1140"
                          returnvariable="pm">
                <!---/ Get Percent Physical  ---> 
                    (#pm.tiplink#)
			</td>
		</tr>
        </cfif>
	</tbody>
</table>
</div>
</div>

</cfoutput>
