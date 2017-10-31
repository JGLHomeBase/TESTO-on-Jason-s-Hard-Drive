<cfoutput>
<div class="row">
	<div class="large-12 columns">
			

			<p> Reduced homelessness by supporting #NumberParticipantsAccessedAndMaintainedPH# participants in accessing and maintaining permanent housing </p>

			<p> Reduced homeless recidivism by placing #TotalLeaversExitingToPH# of #apr07_TotalLeavers# <cfif apr07_TotalLeavers NEQ 0>
				(#NumberFormat(TotalLeaversExitingToPH/apr07_TotalLeavers*100,"0")#%) 
			<cfelse>
				(0%) 
			</cfif> exiting participants in permanent housing (excludes individuals who died) </p>

			<p> This program had a total recidivism rate of #NumberFormat(TotalRecidivismRate,"0")#% </p>

			<hr>
	</div>
</div>
</cfoutput>