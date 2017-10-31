<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<table width="100%">
				<thead>
					<th colspan="2">Rating on Performance Compared to Other Permanent Housing Programs</th>
				</thead>
				<tbody>
					<tr>
						<td>
							Percentage of participants who maintain permanent housing for over 6 months: #NumberFormat(MaintainedHousingOver6Months,"0")#%
						</td>
						<td class="text-center">
							#ShortAns01#
						</td>
					</tr>
					<tr>
						<td>
							Percentage of participants who maintain permanent housing for over 12 months: #NumberFormat(MaintainedHousingOver1Year,"0")#%
						</td>
						<td class="text-center">
							#ShortAns02#
						</td>
					</tr>
					<tr>
						<td>
							Percentage of exiting participants who exit to other permanent housing (excludes individuals who died): #NumberFormat(PerExitingToPH*100,"0")#%
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