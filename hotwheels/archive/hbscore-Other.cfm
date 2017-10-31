<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<table width="100%">
				<thead>
					<th colspan="2">Rating on Performance Compared to Other Supportive Services Only (Other) Programs</th>
				</thead>
				<tbody>
					<tr>
						<td>
							Percentage of exiting participants who exit to permanent housing (excludes

individuals who died): #NumberFormat(PerExitingToPH*100,"0")#%
						</td>
						<td class="text-center">
							#ShortAns01#
						</td>

					</tr>
					<tr>
						<td>
							Percentage increase in income of adults between entry and exit/follow­up:

#NumberFormat(PerAvgIncreaseInc*100,"0")#%
						</td>
						<td class="text-center">
							#ShortAns02#
						</td>
					</tr>
					<tr>
						<td>
							Percentage of adult participants employed:

#NumberFormat(PercAdultsHadEmployment*100,"0")#%
						</td>
						<td class="text-center">
							#ShortAns03#
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</cfoutput>