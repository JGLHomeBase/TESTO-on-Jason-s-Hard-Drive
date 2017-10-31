<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Results Achieved: Increased Skills and Income</h2>
			<p>#NumberFormat(AdultMaintainIncreaseInc,"0")# of #apr08_Adult_Total#
			<cfif apr08_Adult_Total NEQ 0>
				(#NumberFormat((AdultMaintainIncreaseInc/apr08_Adult_Total)*100,"0")#%)
			</cfif>
			adult participants maintained or increased income.</p>
			<p> #apr15Adult_TotalIncreasedInc# of #apr08_Adult_Total# <cfif apr08_Adult_Total GT 0>(#NumberFormat((apr15Adult_TotalIncreasedInc/apr08_Adult_Total)*100,"0")#%)	
			</cfif> adult participants increased income </p>
			<p>#NumberFormat(NumberAdultsHadEmployment,"0")# of #apr08_Adult_Total# (#NumberFormat(PercAdultsHadEmployment*100,"0")#%) adult participants had employment income.</p>
			<hr>

				<table width="100%">
			<thead>
				<tr>
					<th width="50%" class="text-left">
						<em>Change in Income</em>
					</th>
					<th class="text-center" >
						Leavers
					</th>
					<th class="text-center">
						Stayers
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td valign="top">
						Less Income at Follow Up or Exit
					</td>
					<td valign="top" class="text-center">
						#LeaversWithLessIncomeAtExit# of #apr25Leavers_Total_Adults#
							(#NumberFormat(PercLeaversWithLessIncomeAtExit*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#StayersWithLessIncomeAtExit# of #apr25Stayers_Total_Adult#
							(#NumberFormat(PercStayersWithLessIncomeAtExit*100, "__")#%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						Same Income at Follow Up or Exit
					</td>
					<td valign="top" class="text-center">
						#(apr24Leavers_NumOverall_Same+apr24Leavers_NumOverall_Never)# of #apr25Leavers_Total_Adults#
						(#NumberFormat(PercLeaversWithSameAtExit*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#(apr24Stayers_NumOverall_Same+apr24Stayers_NumOverall_Never)# of #apr25Stayers_Total_Adult#
						(#NumberFormat(PercStayersWithSameAtExit*100, "__")#%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						More Income at Follow Up or Exit
					</td>
					<td valign="top" class="text-center">
						#LeaversWithMoreIncomeAtExit# of #apr25Leavers_Total_Adults#
							(#NumberFormat(PercLeaversWithMoreAtExit*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#StayersWithMoreIncomeAtExit# of #apr25Stayers_Total_Adult#
							(#NumberFormat(PercStayersWithMoreAtExit*100, "__")#%)
					</td>
				</tr>
				
				<cfif LeaversUnknownIncomeExit+apr07_TotalLeavers GT 0>
					<tr>
						<td valign="top">
							Unknown Income at Follow Up or Exit</p>
						</td>
						<td valign="top" class="text-center">
							#LeaversUnknownIncomeExit# of #apr25Leavers_Total_Adults#
							(#NumberFormat(PercLeaversUnknownIncexit*100, "__")#%)
						</td>
						<td valign="top" class="text-center">
							#StayersUnknownIncomeExit# of #apr25Stayers_Total_Adult#
								<cfif apr25Stayers_Total_Adult NEQ 0>
									(#NumberFormat(StayersUnknownIncomeExit/apr25Stayers_Total_Adult*100, "__")#%)
								<cfelse>
									(0%)
								</cfif>
								
						</td>
					</tr>
				</cfif>
				<tr>
					<td colspan="3">
						<table width="100%">
							<tr>
								<td class="text-center">
									<cfif   LeaversWithLessIncomeAtExit+apr29Less90_TempTotal_Total+LeaversWithMoreIncomeAtExit+LeaversUnknownIncomeExit EQ 0 OR  StayersWithLessIncomeAtExit+apr24Stayers_NumOverall_Same+StayersWithMoreIncomeAtExit+StayersUnknownIncomeExit+StayersUnknownIncomeExit EQ 0>
										<cfset ChartWidth="900">
									<cfelse>
										<cfset ChartWidth="450">
									</cfif>
									<cfif LeaversWithLessIncomeAtExit+apr29Less90_TempTotal_Total+LeaversWithMoreIncomeAtExit+LeaversUnknownIncomeExit GT 0>
										<h5>Leavers</h5>
										<cfchart chartwidth="#ChartWidth#" chartheight="300" font="Lato" fontSize="11" format="html">
											<cfchartseries type="Pie" >
												<cfchartdata item="Less" value="#LeaversWithLessIncomeAtExit#">
												<cfchartdata item="Same" value="#(apr24Leavers_NumOverall_Same+apr24Leavers_NumOverall_Never)#">
												<cfchartdata item="More" value="#LeaversWithMoreIncomeAtExit#">
												<cfchartdata item="Unknown" value="#LeaversUnknownIncomeExit#">
											</cfchartseries>
										</cfchart>
									</cfif>
								</td>
								<td class="text-center">
									<cfif StayersWithLessIncomeAtExit+apr24Stayers_NumOverall_Same+StayersWithMoreIncomeAtExit+StayersUnknownIncomeExit GT 0>
										<h5>Stayers</h5>
										<cfchart chartwidth="#ChartWidth#" chartheight="300" font="Lato" fontSize="11" format="html">
											<cfchartseries type="Pie" >
												<cfchartdata item="Less" value="#StayersWithLessIncomeAtExit#">
												<cfchartdata item="Same" value="#(apr24Stayers_NumOverall_Same+apr24Stayers_NumOverall_Never)#">
												<cfchartdata item="More" value="#StayersWithMoreIncomeAtExit#">
												<cfchartdata item="Unknown" value="#StayersUnknownIncomeExit#">
											</cfchartseries>
										</cfchart>
									</cfif>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="large-12 columns">
						<table width="100%">
							<thead>
								<tr>
									<th width="60%" class="text-left">
										<em>Average Monthly Income</em>
									</th>
									<th class="text-right" >
										
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td valign="top">
										Average Monthly Income at Entry (Assumes highest end of APR range; maximum income of $2250/month.)
									</td>
									<td valign="top" class="text-center">
										#LSCurrencyFormat(AverageMonthlyIncomeAtEntryAllAdults)#
									</td>
								</tr>
								<tr>
									<td valign="top">
										Average Monthly Income at Follow Up or Exit (Assumes highest end of APR range; maximum income of $2250/month.)
									</td>
									<td valign="top" class="text-center">
										#LSCurrencyFormat(AverageMonthlyIncomeAtFollowUporExitAllAdults)#
									</td>
								</tr>
							</tbody>
						</table>

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
											#apr25Leavers_Earned_Adult# of #apr25Leavers_Total_Adults# (#NumberFormat(PercAdultLeaversWithEarnedIncome*100, "__")#%)
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


					</td>
				</tr>
			</tbody>
		</table>

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
		<hr>

		</div>
	</div>

</cfoutput>
