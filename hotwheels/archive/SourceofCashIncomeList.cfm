<cfoutput>
<div class="row">
	<div class="large-12 columns">


<table width="100%">
	<thead>
		<tr>
			<th width="50%" class="text-left">
				<em>Sources of Cash Income</em>
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
		<cfif apr25Leavers_Earned_Total + apr25Stayers_Earned_Total GT 0>
			<tr>
				<td valign="top">
					<em>Earned Income</em>
				</td>
				<td valign="top" class="text-center">
					#apr25Leavers_Earned_Total# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithEarnedIncome*100, "__")#%)
				</td>
				<td valign="top" class="text-center">
					#apr25Stayers_Earned_Total# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithEarnedIncome*100, "__")#%)
				</td>
			</tr>
		</cfif>
		<cfif apr25Leavers_Unemployment_Adult + apr25Stayers_Unemployment_Adult GT 0>
			<tr>
				<td valign="top">
					Unemployment
				</td>
				<td valign="top" class="text-center">
					#apr25Leavers_Unemployment_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithUnemploymentIncome*100, "__")#%)
				</td>
				<td valign="top" class="text-center">
					#apr25Stayers_Unemployment_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithUnemploymentIncome*100, "__")#%)
				</td>
			</tr>
		</cfif>
		<cfif apr25Leavers_SSI_Adult + apr25Stayers_SSI_Adult GT 0>
		<tr>
			<td valign="top">
				SSI
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_SSI_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithSSI*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_SSI_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithSSI*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_SSDI_Adult + apr25Stayers_SSDI_Adult GT 0>
		<tr>
			<td valign="top">
				SSDI
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_SSDI_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithSSDI*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_SSDI_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithSSDI*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_VetDisability_Adult + apr25Stayers_VetDisability_Adult GT 0>
			<tr>
				<td valign="top">
					Veterans Disability Income
				</td>
				<td valign="top" class="text-center">
					#apr25Leavers_VetDisability_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithVeteransDisability*100, "__")#%)
				</td>
				<td valign="top" class="text-center">
					#apr25Stayers_VetDisability_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithVeteransDisability*100, "__")#%)
				</td>
			</tr>
		</cfif>
		<cfif apr25Leavers_PrivateDisability_Adult + apr25Stayers_PrivateDisability_Adult GT 0>
		<tr>
			<td valign="top">
				Private Disability Insurance
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_PrivateDisability_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithPrivateDisability*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_PrivateDisability_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithPrivateDisability*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_WorkersComp_Adult + apr25Stayers_WorkersComp_Adult GT 0>
		<tr>
			<td valign="top">
				Workers Compensation
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_WorkersComp_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithWorkersComp*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_WorkersComp_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithWorkersComp*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_TANF_Adult + apr25Stayers_TANF_Adult GT 0>
		<tr>
			<td valign="top">
				TANF
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_TANF_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithTANF*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_TANF_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithTANF*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_GA_Adult + apr25Stayers_GA_Adult GT 0>
		<tr>
			<td valign="top">
				General Assistance
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_GA_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithGA*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_GA_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithGA*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_Retirement_Adult + apr25Stayers_Retirement_Adult GT 0>
			<tr>
				<td valign="top">
					Retirement
				</td>
				<td valign="top" class="text-center">
					#apr25Leavers_Retirement_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithRetirement*100, "__")#%)
				</td>
				<td valign="top" class="text-center">
					#apr25Stayers_Retirement_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithRetirement*100, "__")#%)
				</td>
			</tr>
		</cfif>
		<cfif apr25Leavers_VetPension_Adult + apr25Stayers_VetPension_Adult GT 0>
		<tr>
			<td valign="top">
				Veterans Pension
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_VetPension_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithVeteranPension*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_VetPension_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithVeteranPension*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_JobPension_Adult + apr25Stayers_JobPension_Adult GT 0>
			<tr>
				<td valign="top">
					Pension from Former Job
				</td>
				<td valign="top" class="text-center">
					#apr25Leavers_JobPension_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithPension*100, "__")#%)
				</td>
				<td valign="top" class="text-center">
					#apr25Stayers_JobPension_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithPension*100, "__")#%)
				</td>
			</tr>
		</cfif>
		<cfif apr25Leavers_ChildSupport_Adult + apr25Stayers_ChildSupport_Adult GT 0>
		<tr>
			<td valign="top">
				Child Support
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_ChildSupport_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithChildSupport*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_ChildSupport_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithChildSupport*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_Alimony_Adult + apr25Stayers_Alimony_Adult GT 0>
		<tr>
			<td valign="top">
				Alimony
			</td>
			<td valign="top" class="text-center">
				#apr25Leavers_Alimony_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithAlimony*100, "__")#%)
			</td>
			<td valign="top" class="text-center">
				#apr25Stayers_Alimony_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithAlimony*100, "__")#%)
			</td>
		</tr>
		</cfif>
		<cfif apr25Leavers_Other_Adult + apr25Stayers_Other_Adult>
			<tr>
				<td valign="top">
					Other Source
				</td>
				<td valign="top" class="text-center">
					#apr25Leavers_Other_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithOtherSource*100, "__")#%)
				</td>
				<td valign="top" class="text-center">
					#apr25Stayers_Other_Adult# of #apr25Stayers_Total_Adult# (#NumberFormat(PercAdultStayersWithOtherSource*100, "__")#%)
				</td>
			</tr>
		</cfif>
		
	</tbody>
</table>
</cfoutput>

	</div>
</div>