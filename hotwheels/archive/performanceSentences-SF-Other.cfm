<cfoutput>
<div class="row">
	<div class="large-12 columns">
			


			<p> Reduced homeless recidivism by placing #TotalLeaversExitingToPH# of #apr07_TotalLeavers# <cfif apr07_TotalLeavers NEQ 0>
				(#NumberFormat(TotalLeaversExitingToPH/apr07_TotalLeavers*100,"0")#%) 
			<cfelse>
				(0%) 
			</cfif> exiting participants in permanent housing (excludes individuals who died) </p>

			
			<hr>
	</div>
</div>
</cfoutput>