<cfoutput>
<div class="row">
	<div class="large-12 columns">
			<h2 class="MakePrimary">Additional Performance Measures</h2>
			<cfif projectComponentID EQ "2" OR projectComponentID EQ "5" OR projectComponentID EQ "10">
			<p> Reduced homelessness by supporting #NumberParticipantsAccessedAndMaintainedPH# participants in accessing and maintaining permanent housing </p>

			<p> Reduced homeless recidivism by placing #TotalLeaversExitingToPH# of #apr07_TotalLeavers# <cfif apr07_TotalLeavers NEQ 0>
				(#NumberFormat(TotalLeaversExitingToPH/apr07_TotalLeavers*100,"0")#%) 
			<cfelse>
				(0%) 
			</cfif> exiting participants in permanent housing (excludes individuals who died) </p>

			<p> This program had a total recidivism rate of #NumberFormat(TotalRecidivismRate,"0")#% </p>

			</cfif>


			<cfif projectComponentID EQ "3">

			<p> Reduced homelessness by housing permanently #TotalLeaversExitingToPH# people of #apr07_TotalLeavers# participants <cfif apr07_TotalLeavers NEQ 0>
				(#NumberFormat(TotalLeaversExitingToPH/apr07_TotalLeavers*100,"0")#%)</cfif>. 
			</p>

			<p> Participants were in this transitional program an average of #apr27_Leavers_Avg# days for leavers and #apr27_Stayers_Avg# days for stayers </p>

			
			</cfif>


			<hr>
	</div>
</div>
</cfoutput>