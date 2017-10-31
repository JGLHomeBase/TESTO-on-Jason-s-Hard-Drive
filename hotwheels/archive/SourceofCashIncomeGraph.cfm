<cfoutput>
	<div class="row">
		<div class="large-12 columns">
<cfchart chartwidth="950" chartheight="250" font="Lato" format="html" fontSize="11" title="Source of Cash Income">
		<cfchartseries type="Bar" seriesLabel="Leavers">
			<cfif apr25Leavers_Earned_Total+apr25Stayers_Earned_Total GT 0>
				<cfchartdata item="Earned" value=#apr25Leavers_Earned_Total#>
			</cfif>
			<cfif apr25Leavers_Unemployment_Adult+apr25Stayers_Unemployment_Adult GT 0>
				<cfchartdata item="Unemployment" value=#apr25Leavers_Unemployment_Adult#>
			</cfif>
			<cfif apr25Leavers_SSI_Adult+apr25Stayers_SSI_Adult GT 0>
				<cfchartdata item="SSI" value=#apr25Leavers_SSI_Adult#>
			</cfif>
			<cfif apr25Leavers_SSDI_Adult+apr25Stayers_SSDI_Adult GT 0>
				<cfchartdata item="SSDI" value=#apr25Leavers_SSDI_Adult#>
			</cfif>
			<cfif apr25Leavers_VetDisability_Adult+apr25Stayers_VetDisability_Adult GT 0>
				<cfchartdata item="Vets Disab." value=#apr25Leavers_VetDisability_Adult#>
			</cfif>
			<cfif apr25Leavers_PrivateDisability_Adult+apr25Stayers_PrivateDisability_Adult GT 0>
				<cfchartdata item="Private Disab." value=#apr25Leavers_PrivateDisability_Adult#>
			</cfif>
			<cfif apr25Leavers_WorkersComp_Adult+apr25Stayers_WorkersComp_Adult GT 0>
				<cfchartdata item="Workers Comp" value=#apr25Leavers_WorkersComp_Adult#>
			</cfif>
			<cfif apr25Leavers_TANF_Adult+apr25Stayers_TANF_Adult GT 0>
				<cfchartdata item="TANF" value=#apr25Leavers_TANF_Adult#>
			</cfif>
			<cfif apr25Leavers_GA_Adult+apr25Stayers_GA_Adult GT 0>
				<cfchartdata item="GA" value=#apr25Leavers_GA_Adult#>
			</cfif>
			<cfif apr25Leavers_Retirement_Adult+apr25Stayers_Retirement_Adult GT 0>
				<cfchartdata item="Retirement" value=#apr25Leavers_Retirement_Adult#>
			</cfif>
			<cfif apr25Leavers_VetPension_Adult+apr25Stayers_VetPension_Adult GT 0>
				<cfchartdata item="Vets Pension" value=#apr25Leavers_VetPension_Adult#>
			</cfif>
			<cfif apr25Leavers_JobPension_Adult+apr25Stayers_JobPension_Adult GT 0>
				<cfchartdata item="Pension" value=#apr25Leavers_JobPension_Adult#>
			</cfif>
			<cfif apr25Leavers_ChildSupport_Adult+apr25Stayers_ChildSupport_Adult GT 0>
				<cfchartdata item="Child Support" value=#apr25Leavers_ChildSupport_Adult#>
			</cfif>
			<cfif apr25Leavers_Alimony_Adult+apr25Stayers_Alimony_Adult GT 0>
				<cfchartdata item="Alimony" value=#apr25Leavers_Alimony_Adult#>
			</cfif>
			<cfif apr25Leavers_Other_Adult+apr25Stayers_Other_Adult GT 0>
				<cfchartdata item="Other" value=#apr25Leavers_Alimony_Adult#>
			</cfif>
		</cfchartseries>
		<cfchartseries type="Bar" seriesLabel="Stayers">
			<cfif apr25Leavers_Earned_Total+apr25Stayers_Earned_Total GT 0>
				<cfchartdata item="Earned" value=#apr25Stayers_Earned_Total#>
			</cfif>
			<cfif apr25Leavers_Unemployment_Adult+apr25Stayers_Unemployment_Adult GT 0>
				<cfchartdata item="Unemployment" value=#apr25Stayers_Unemployment_Adult#>
			</cfif>
			<cfif apr25Leavers_SSI_Adult+apr25Stayers_SSI_Adult GT 0>
				<cfchartdata item="SSI" value=#apr25Stayers_SSI_Adult#>
			</cfif>
			<cfif apr25Leavers_SSDI_Adult+apr25Stayers_SSDI_Adult GT 0>
				<cfchartdata item="SSDI" value=#apr25Stayers_SSDI_Adult#>
			</cfif>
			<cfif apr25Leavers_VetDisability_Adult+apr25Stayers_VetDisability_Adult GT 0>
				<cfchartdata item="Vets Disab." value=#apr25Stayers_VetDisability_Adult#>
			</cfif>
			<cfif apr25Leavers_PrivateDisability_Adult+apr25Stayers_PrivateDisability_Adult GT 0>
				<cfchartdata item="Private Disab." value=#apr25Stayers_PrivateDisability_Adult#>
			</cfif>
			<cfif apr25Leavers_WorkersComp_Adult+apr25Stayers_WorkersComp_Adult GT 0>
				<cfchartdata item="Workers Comp" value=#apr25Stayers_WorkersComp_Adult#>
			</cfif>
			<cfif apr25Leavers_TANF_Adult+apr25Stayers_TANF_Adult GT 0>
				<cfchartdata item="TANF" value=#apr25Stayers_TANF_Adult#>
			</cfif>
			<cfif apr25Leavers_GA_Adult+apr25Stayers_GA_Adult GT 0>
				<cfchartdata item="GA" value=#apr25Stayers_GA_Adult#>
			</cfif>
			<cfif apr25Leavers_Retirement_Adult+apr25Stayers_Retirement_Adult GT 0>
				<cfchartdata item="Retirement" value=#apr25Stayers_Retirement_Adult#>
			</cfif>
			<cfif apr25Leavers_VetPension_Adult+apr25Stayers_VetPension_Adult GT 0>
				<cfchartdata item="Vets Pension" value=#apr25Stayers_VetPension_Adult#>
			</cfif>
			<cfif apr25Leavers_JobPension_Adult+apr25Stayers_JobPension_Adult GT 0>
				<cfchartdata item="Pension" value=#apr25Stayers_JobPension_Adult#>
			</cfif>
			<cfif apr25Leavers_ChildSupport_Adult+apr25Stayers_ChildSupport_Adult GT 0>
				<cfchartdata item="Child Support" value=#apr25Stayers_ChildSupport_Adult#>
			</cfif>
			<cfif apr25Leavers_Alimony_Adult+apr25Stayers_Alimony_Adult GT 0>
				<cfchartdata item="Alimony" value=#apr25Stayers_Alimony_Adult#>
			</cfif>
			<cfif apr25Leavers_Other_Adult+apr25Stayers_Other_Adult GT 0>
				<cfchartdata item="Other" value=#apr25Stayers_Other_Adult#>
			</cfif>
		</cfchartseries>
</cfchart>
	</div>
</div>
</cfoutput>



