<cfoutput>
	<div class="row">
		<div class="large-12 columns">

<cfchart chartwidth="950" chartheight="250" font="Lato" format="html" fontSize="11" title="Source of Non-Cash Benefits">
				<cfchartseries type="Bar" seriesLabel="Leavers">
					<cfif apr26Leavers_SNAP_Adult+apr26Stayers_SNAP_Adult GT 0>
						<cfchartdata item="SNAP" value=#apr26Leavers_SNAP_Adult#>
					</cfif>
					<cfif apr26Leavers_Medicaid_Adult+apr26Stayers_Medicaid_Adult GT 0>
						<cfchartdata item="Medicaid" value=#apr26Leavers_Medicaid_Adult#>
					</cfif>
					<cfif apr26Leavers_Medicare_Adult+apr26Stayers_Medicare_Adult GT 0>
						<cfchartdata item="Medicare" value=#apr26Leavers_Medicare_Adult#>
					</cfif>
					<cfif apr26Leavers_StateChildHealthIns_Adult+apr26Stayers_StateChildHealthIns_Adult GT 0>
						<cfchartdata item="SCHIP" value=#apr26Leavers_StateChildHealthIns_Adult#>
					</cfif>
					<cfif apr26Leavers_WIC_Adult+apr26Stayers_WIC_Adults GT 0>
						<cfchartdata item="WIC" value=#apr26Leavers_WIC_Adult#>
					</cfif>
					<cfif apr26Leavers_VAMed_Adult+apr26Stayers_VAMed_Adult GT 0>
						<cfchartdata item="VA Medical" value=#apr26Leavers_VAMed_Adult#>
					</cfif>
					<cfif apr26Leavers_TANFChildcare_Adult+apr26Stayers_TANFChildcare_Adult GT 0>
						<cfchartdata item="TANF Childcare" value=#apr26Leavers_TANFChildcare_Adult#>
					</cfif>
					<cfif apr26Leavers_TANFTransit_Adult+apr26Stayers_TANFTransit_Adult GT 0>
						<cfchartdata item="TANF Transit" value=#apr26Leavers_TANFTransit_Adult#>
					</cfif>
					<cfif apr26Leavers_TempRA_Adult+apr26Stayers_TempRA_Adult GT 0>
						<cfchartdata item="Temp RA" value=#apr26Leavers_TempRA_Adult#>
					</cfif>
					<cfif apr26Leavers_Section8_Adult+apr26Stayers_Section8_Adult GT 0>
						<cfchartdata item="Sect 8" value=#apr26Leavers_Section8_Adult#>
					</cfif>
					<cfif apr26Leavers_Other_Adult+apr26Stayers_Other_Adult GT 0>
						<cfchartdata item="Other" value=#apr26Leavers_Other_Adult#>
					</cfif>
				</cfchartseries>
				<cfchartseries type="Bar" seriesLabel="Stayers">
					<cfif apr26Leavers_SNAP_Adult+apr26Stayers_SNAP_Adult GT 0>
						<cfchartdata item="SNAP" value=#apr26Stayers_SNAP_Adult#>
					</cfif>
					<cfif apr26Leavers_Medicaid_Adult+apr26Stayers_Medicaid_Adult GT 0>
						<cfchartdata item="Medicaid" value=#apr26Stayers_Medicaid_Adult#>
					</cfif>
					<cfif apr26Leavers_Medicare_Adult+apr26Stayers_Medicare_Adult GT 0>
						<cfchartdata item="Medicare" value=#apr26Stayers_Medicare_Adult#>
					</cfif>
					<cfif apr26Leavers_StateChildHealthIns_Adult+apr26Stayers_StateChildHealthIns_Adult GT 0>
						<cfchartdata item="SCHIP" value=#apr26Stayers_StateChildHealthIns_Adult#>
					</cfif>
					<cfif apr26Leavers_WIC_Adult+apr26Stayers_WIC_Adults GT 0>
						<cfchartdata item="WIC" value=#apr26Stayers_WIC_Adults#>
					</cfif>
					<cfif apr26Leavers_VAMed_Adult+apr26Stayers_VAMed_Adult GT 0>
						<cfchartdata item="VA Medical" value=#apr26Stayers_VAMed_Adult#>
					</cfif>
					<cfif apr26Leavers_TANFChildcare_Adult+apr26Stayers_TANFChildcare_Adult GT 0>
						<cfchartdata item="TANF Childcare" value=#apr26Stayers_TANFChildcare_Adult#>
					</cfif>
					<cfif apr26Leavers_TANFTransit_Adult+apr26Stayers_TANFTransit_Adult GT 0>
						<cfchartdata item="TANF Transit" value=#apr26Stayers_TANFTransit_Adult#>
					</cfif>
					<cfif apr26Leavers_TempRA_Adult+apr26Stayers_TempRA_Adult GT 0>
						<cfchartdata item="Temp RA" value=#apr26Stayers_TempRA_Adult#>
					</cfif>
					<cfif apr26Leavers_Section8_Adult+apr26Stayers_Section8_Adult GT 0>
						<cfchartdata item="Sect 8" value=#apr26Stayers_Section8_Adult#>
					</cfif>
					<cfif apr26Leavers_Other_Adult+apr26Stayers_Other_Adult GT 0>
						<cfchartdata item="Other" value=#apr26Stayers_Other_Adult#>
					</cfif>
				</cfchartseries>
		</cfchart>
	</div>
</div>
	</cfoutput>
