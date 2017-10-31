<cfoutput>
	<div class="row">
		<div class="large-12 columns">
              <!--- Get Goals --->
              <cfinvoke component="knex.customGoals" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getcustomGoals"
                    whatFields = "*"
                    Where = "ThisProject">
              <!---/ Get Goals --->
			
			<table width="100%">
				<thead>
					<th width="50%" class="text-right"></th>
					<th colspan="2" width="20%" class="text-center">Target ## of Persons</th>
					<th colspan="2" width="20%" class="text-center">Actual Outcomes</th>
					<th width="10%" class="text-center">Difference Between Target and Performance</th>
				</thead>
				<tbody>
					<cfloop query="getcustomGoals">
						<tr>
							<td>#getcustomGoals.goalName#</td>
							<td class="text-center">#getcustomGoals.goalTarget#</td>
							<td class="text-center">#getcustomGoals.goalTargetPer#%</td>
							<td class="text-center">#getcustomGoals.GoalSuccess# of #getcustomGoals.goalParticipants#</td>
							<td class="text-center">
								<cfif goalParticipants NEQ 0>
									<cfset SuccessPer = NumberFormat(GoalSuccess/goalParticipants*100,"0")>
								<cfelse>
									<cfset SuccessPer = 0>
								</cfif>
								#SuccessPer#%
							</td>
							<td class="text-center">
								<cfif (SuccessPer-goalTargetPer) GT 0>
									<span class="MakeGreen">#abs(SuccessPer-goalTargetPer)#%</span>
								<cfelse>
									<span class="MakeRed">#abs(SuccessPer-goalTargetPer)#%</span>
								</cfif>
								 
							</td>
						</tr>
					</cfloop>
					<cfif getcustomGoals.recordCount EQ 0>
						<tr>
							<td colspan="6" class="text-center"><i>No Additonal Peformance Measures Set</i></td>
						</tr>
					</cfif>
				</tbody>
			</table>
		</div>
	</div>
</cfoutput>