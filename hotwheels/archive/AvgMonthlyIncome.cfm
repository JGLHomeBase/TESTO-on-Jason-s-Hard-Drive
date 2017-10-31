<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<table width="100%">
				<thead>
					<tr>
						<th width="60%" class="text-left">
							<em>Average Monthly Income</em>
						</th>
						<th class="text-right" >
							
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td valign="top">
							Average Monthly Income at Entry (Assumes highest end of APR range; maximum income of $2250/month.)
						</td>
						<td valign="top" class="text-center">
							#LSCurrencyFormat(AverageMonthlyIncomeAtEntryAllAdults)#
						</td>
					</tr>
					<tr>
						<td valign="top">
							Average Monthly Income at Follow Up or Exit (Assumes highest end of APR range; maximum income of $2250/month.)
						</td>
						<td valign="top" class="text-center">
							#LSCurrencyFormat(AverageMonthlyIncomeAtFollowUporExitAllAdults)#
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</cfoutput>
		




		