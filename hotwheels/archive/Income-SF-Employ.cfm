<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			

			<p>#LeaversIncrEmpInc# of #apr23_Total_Exit# (#NumberFormat(PerLeaversIncrEmpInc*100,"0")#%) of adult leavers increased employment income from entry to exit.</p>

			
			<p>#LeaversWithMoreIncomeAtExit# of #apr25Leavers_Total_Adults# (#NumberFormat(PercLeaversWithMoreAtExit*100, "__")#%) of leavers increased their income from entry to exit.</p>
			
			
			<p> #apr15Adult_TotalIncreasedInc# of #apr08_Adult_Total# <cfif apr08_Adult_Total GT 0>(#NumberFormat((apr15Adult_TotalIncreasedInc/apr08_Adult_Total)*100,"0")#%)	
			</cfif> adult participants increased income </p>
			<p>#NumberFormat(NumberAdultsHadEmployment,"0")# of #apr08_Adult_Total# (#NumberFormat(PercAdultsHadEmployment*100,"0")#%) adult participants had employment income.</p>
			<hr>

			
		
		<hr>

		</div>
	</div>

</cfoutput>
