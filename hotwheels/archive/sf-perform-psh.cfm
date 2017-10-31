<cfoutput>
 <div class="row">
 	<div class="large-12 columns">
		<div class="panel BGLightGray">

			<ul>
				<li>With a community target of 90%, the percentage of participants remaining in permanent housing or exited to permanent housing is #NumberFormat(PercPersonsRemainedPHOrExitedToPH*100,"0")#%</li>

				<li>With a community target of < 5%, the percentage of participants who exit to a location other than: permanent housing, death, or an institution is #NumberFormat((PerExitTempOtherUnknown)*100,"0")#%.</li>

				<li>With a community target of 15%, the percentage of adult participants who increased employment income between entry and follow-up/exit is #NumberFormat((PerIncreaseEmpInc)*100,"0")#%.</li>

				<li>With a community target of 20%, the percentage of adult participants with increased total income between entry and follow-up/exit is #NumberFormat((PerAdultsIncreasedInc)*100,"0")#%.</li>
				
				<li>With a community target of 80%, the percentage of adult participants who either maintained or increased total income between entry and follow-up/exit is #NumberFormat((PerMaintainIncreaseInc)*100,"0")#%.</li>

				<li>With a community target of 95%, the percentage of participants who exit with any income is 
				<cfif PerLeaversAnyInc EQ 31415926535>N/A<cfelse>#NumberFormat((PerLeaversAnyInc)*100,"0")#%</cfif>
				.</li>

				<li>With a community target of 95%, the percentage of participants with non-cash mainstream benefits (including health insurance) by follow-up/exit is #NumberFormat((PerNonCashBens)*100,"0")#%.</li>
				<cfif AvgOccRate NEQ 0>
				<li>With a community target of 95%, the program's average occupancy rate is #NumberFormat((AvgOccRate)*100,"0")#%.</li>
				<cfelse>
					With a community target of 95%, the program's capacity information is not available.
				</cfif>
			</ul>
		</div>
			
			</div>
		</div>
	</cfoutput>