<cfoutput>
	<div class="row">
		<div class="large-12 columns text-left">
			<cfoutput>
				<cfif apr07_TotalLeavers NEQ 0>
				#NumberofLeaversExitWithKnownCashInc# of #apr07_TotalLeavers# (#NumberFormat(NumberofLeaversExitWithKnownCashInc/apr07_TotalLeavers*100, "__")#%) total leavers exited with known cash income.
				<cfelse>
				#NumberofLeaversExitWithKnownCashInc# of #apr07_TotalLeavers#  total leavers exited with known cash income.	
				</cfif>
                <cfif apr07_TotalLeavers NEQ 0>
				#NumberofLeaversExitWithKnownNonCashInc# of #apr07_TotalLeavers# (#NumberFormat(NumberofLeaversExitWithKnownNonCashInc/apr07_TotalLeavers*100, "__")#%) total leavers exited with known non-cash income.
				<cfelse>
				#NumberofLeaversExitWithKnownNonCashInc# of #apr07_TotalLeavers#  total leavers exited with known non-cash income.	
				</cfif>
			</cfoutput>
		</div>
	</div>
</div>
</div>
</cfoutput>