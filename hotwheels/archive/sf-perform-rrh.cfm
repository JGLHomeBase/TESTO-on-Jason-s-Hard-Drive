<cfoutput>
 <div class="row">
 	<div class="large-12 columns">
		<div class="panel BGLightGray">

			<ul>
				<li>With a community target of 80%, the percentage of participants exited to permanent housing is #NumberFormat(PerExitToPermDest*100,"0")#%.</li>

				<li>With a community target of 30%, the percentage of adult participants who increased employment income between entry and follow-up/exit is #NumberFormat((PerIncreaseEmpInc)*100,"0")#%.</li>

				<li>With a community target of 54%, the percentage of adult participants with increased total income between entry and follow-up/exit is #NumberFormat((PerAdultsIncreasedInc)*100,"0")#%.</li>

				<li>With a community target of 70%, the percentage of adult participants who either maintained or increased total income between entry and follow-up/exit is #NumberFormat((PerMaintainIncreaseInc)*100,"0")#%.</li>

				<li>With a community target of 95%, the percentage of participants who exit with any income is #NumberFormat((PerLeaversAnyInc)*100,"0")#%.</li>

				<li>With a community target of 95%, the percentage of participants with non-cash mainstream benefits (including health insurance) by follow-up/exit is #NumberFormat((PerNonCashBens)*100,"0")#%.</li>

				<li>With a community target of 95%, the program's average occupancy rate is #NumberFormat((AvgOccRate)*100,"0")#%.</li>

				

			</ul>
		</div>
			
			</div>
		</div>
	</cfoutput>