<cfoutput>

<div class="row">
	<div class="large-12 columns">
		<h3 class="">Length of Participation</h3>
		<cfchart chartwidth="960" chartheight="250" font="Lato" format="html" fontSize="11" title="Length of Participation by Exit Status" yAxisTitle="Number of Participants">
				<cfchartseries type="Bar" seriesLabel="Leavers">
						<cfchartdata item="30 days or less" value=#apr27_30Less_Leavers#>
				
						<cfchartdata item="1-2 months" value=#apr27_31to60_Leavers#>
				
						<cfchartdata item="3-6 months" value=#apr27_61to180_Leavers#>
					
						<cfchartdata item="6 months - 1 year" value=#apr27_181to365_Leavers#>
					
						<cfchartdata item="1-2 years" value=#apr27_366to730_Leavers#>
				
						<cfchartdata item="2-3 years" value=#apr27_731to1095_Leavers#>
					
						<cfchartdata item="3-4 years" value=#apr27_1096to1460_Leavers#>
					
						<cfchartdata item="4-5 years" value=#apr27_1461to1825_Leavers#>
					
						<cfchartdata item="5+ years" value=#apr27_1825More_Leavers#>
				</cfchartseries>
				<cfchartseries type="Bar" seriesLabel="Stayers">
					
						<cfchartdata item="30 days or less" value=#apr27_30Less_Stayers#>
				
						<cfchartdata item="1-2 months" value=#apr27_31to60_Stayers#>
				
						<cfchartdata item="3-6 months" value=#apr27_61to180_Stayers#>
				
						<cfchartdata item="6 months - 1 year" value=#apr27_181to365_Stayers#>
					
						<cfchartdata item="1-2 years" value=#apr27_366to730_Stayers#>
					
						<cfchartdata item="2-3 years" value=#apr27_731to1095_Stayers#>
				
						<cfchartdata item="3-4 years" value=#apr27_1096to1460_Stayers#>
				
						<cfchartdata item="4-5 years" value=#apr27_1461to1825_Stayers#>
					
						<cfchartdata item="5+ years" value=#apr27_1825More_Stayers#>
		</cfchartseries>
		</cfchart>
	</div>
</div>

</cfoutput>