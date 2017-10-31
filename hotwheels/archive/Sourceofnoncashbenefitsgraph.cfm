<cfoutput>
	<div class="row">
		<div class="large-12 columns">

<table width="100%">
			<thead>
				<tr>
					<th width="50%" class="text-left">
						<em>Sources of Non-Cash Benefits</em>
					</th>
					<th class="text-center" >
						<em>Leavers</em>
					</th>
					<th class="text-center" >
						<em>Stayers</em>
					</th>
				</tr>
			</thead>
			<tbody>
				<cfif apr26Leavers_SNAP_Adult+apr26Stayers_SNAP_Adult GT 0>
				<tr>
					<td valign="top">
						Supplemental Nutrition Assistance Program
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_SNAP_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithSNAP*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_SNAP_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithSNAP*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicaid_Adult+apr26Stayers_Medicaid_Adult GT 0>
				<tr>
					<td valign="top">
						Medicaid
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Medicaid_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithMedicaid*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Medicaid_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithMedicaid*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicare_Adult+apr26Stayers_Medicare_Adult GT 0>
				<tr>
					<td valign="top">
						Medicare
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Medicare_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithMedicare*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Medicare_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithMedicare*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_StateChildHealthIns_Adult+apr26Stayers_StateChildHealthIns_Adult GT 0>
				<tr>
					<td valign="top">
						State Children's Health Insurance
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_StateChildHealthIns_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithStateChildrensHealthInsurance*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_StateChildHealthIns_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithStateChildrensHealthInsurance*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_WIC_Adult+apr26Stayers_WIC_Adults GT 0>
				<tr>
					<td valign="top">
						WIC
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_WIC_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithWIC*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_WIC_Adults# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithWIC*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_VAMed_Adult+apr26Stayers_VAMed_Adult GT 0>
				<tr>
					<td valign="top">
						VA Medical Services
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_VAMed_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithVAMedical*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_VAMed_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithVAMedical*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TANFChildcare_Adult+apr26Stayers_TANFChildcare_Adult GT 0>
				<tr>
					<td valign="top">
						TANF Child Care
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TANFChildcare_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithTANFChildCare*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFChildcare_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithTANFChildCare*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TANFTransit_Adult+apr26Stayers_TANFTransit_Adult GT 0>
				<tr>
					<td valign="top">
						TANF Transit
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TANFTransit_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithTANFTrans*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFTransit_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithTANFTrans*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TempRA_Adult+apr26Stayers_TempRA_Adult GT 0>
				<tr>
					<td valign="top">
						Other Temporary Rental Assistance
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TempRA_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithTempRentalAssistance*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TempRA_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithTempRentalAssistance*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Section8_Adult+PercAdultStayersWithTANFSection8 GT 0>
				<tr>
					<td valign="top">
						Section 8
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Section8_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithTANFSection8*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Section8_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithTANFSection8*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Other_Adult+apr26Stayers_Other_Adult GT 0>
				<tr>
					<td valign="top">
						Other Source
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Other_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithOther*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Other_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithOther*100, "__")#%)
					</td>
				</tr>
				</cfif>
			</tbody>
		</table>
	</div>
</div>
</cfoutput>	