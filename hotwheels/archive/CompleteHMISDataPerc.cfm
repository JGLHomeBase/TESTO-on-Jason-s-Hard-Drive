<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<cfset tmapr08_Total = apr08_Total*23>
			<p> #TotalCompleteDataNoSSNNumber# of #tmapr08_Total# (#NumberFormat(PerHMISComplete*100,"0")#%) of required HMIS data elements reported in the APR (excluding SSN) are complete.
		</div>
	</div>
</cfoutput>
