<cfoutput>
	<div class="row">
		<div class="large-12 columns">
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
												<cfchartdata item="Same" value="#apr24Leavers_NumOverall_Same#">
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
												<cfchartdata item="Same" value="#apr24Stayers_NumOverall_Same#">
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

		<table width="100%">
			<thead>
				<th>Number of Cash Income Sources</th>
				<th class="text-center">Adult Leavers</th>
				<th class="text-center">Adult Stayers</th>
			</thead>
			<tbody>
				<tr>
					<td>No Sources</td>
					<td class="text-center">
						#apr25Leavers_NoSources_Adult# of #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
						 (#NumberFormat(apr25Leavers_NoSources_Adult/apr25Leavers_Total_Adults*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr25Stayers_NoSources_Adult# of #apr25Stayers_Total_Adult#
						<cfif apr25Stayers_Total_Adult NEQ 0>
						 (#NumberFormat(apr25Stayers_NoSources_Adult/apr25Stayers_Total_Adult*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
				<tr>
					<td>1 + Source(s)</td>
					<td class="text-center">
						#apr25Leavers_1Plus_Adult# of #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
						 (#NumberFormat(apr25Leavers_1Plus_Adult/apr25Leavers_Total_Adults*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr25Stayers_1Plus_Adult# of #apr25Stayers_Total_Adult#
						<cfif apr25Stayers_Total_Adult NEQ 0>
						 (#NumberFormat(apr25Stayers_1Plus_Adult/apr25Stayers_Total_Adult*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
				<tr>
					<td>Don't Know/Refused</td>
					<td class="text-center">
						#apr25Leavers_DKR_Adult# of #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
						 (#NumberFormat(apr25Leavers_DKR_Adult/apr25Leavers_Total_Adults*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr25Stayers_DKR_Adult# of #apr25Stayers_Total_Adult#
						<cfif apr25Stayers_Total_Adult NEQ 0>
						 (#NumberFormat(apr25Stayers_DKR_Adult/apr25Stayers_Total_Adult*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
				<tr>
					<td>Information Missing</td>
					<td class="text-center">
						#apr25Leavers_Missing_Adult# of #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
						 (#NumberFormat(apr25Leavers_Missing_Adult/apr25Leavers_Total_Adults*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr25Stayers_Missing_Adult# of #apr25Stayers_Total_Adult#
						<cfif apr25Stayers_Total_Adult NEQ 0>
						 (#NumberFormat(apr25Stayers_Missing_Adult/apr25Stayers_Total_Adult*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
			</tbody>
		</table>
 
		<cfchart chartwidth="950" chartheight="250" font="Lato" format="html" fontSize="11" title="Source of Non-Cash Benefits">
				<cfchartseries type="Bar" seriesLabel="Leavers">
					<cfif apr26Leavers_SNAP_Total+apr26Stayers_SNAP_Total GT 0>
						<cfchartdata item="SNAP" value=#apr26Leavers_SNAP_Total#>
					</cfif>
					<cfif apr26Leavers_Medicaid_Total+apr26Stayers_Medicaid_Total GT 0>
						<cfchartdata item="Medicaid" value=#apr26Leavers_Medicaid_Total#>
					</cfif>
					<cfif apr26Leavers_Medicare_Total+apr26Stayers_Medicare_Total GT 0>
						<cfchartdata item="Medicare" value=#apr26Leavers_Medicare_Total#>
					</cfif>
					<cfif apr26Leavers_StateChildHealthIns_Total+apr26Stayers_StateChildHealthIns_Total GT 0>
						<cfchartdata item="SCHIP" value=#apr26Leavers_StateChildHealthIns_Total#>
					</cfif>
					<cfif apr26Leavers_WIC_Total+apr26Stayers_WIC_Total GT 0>
						<cfchartdata item="WIC" value=#apr26Leavers_WIC_Total#>
					</cfif>
					<cfif apr26Leavers_VAMed_Total+apr26Stayers_VAMed_Total GT 0>
						<cfchartdata item="VA Medical" value=#apr26Leavers_VAMed_Total#>
					</cfif>
					<cfif apr26Stayers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
						<cfchartdata item="TANF Childcare" value=#apr26Stayers_TANFChildcare_Total#>
					</cfif>
					<cfif apr26Stayers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
						<cfchartdata item="TANF Transit" value=#apr26Stayers_TANFTransit_Total#>
					</cfif>
					<cfif apr26Leavers_TempRA_Total+apr26Stayers_TempRA_Total GT 0>
						<cfchartdata item="Temp RA" value=#apr26Leavers_TempRA_Total#>
					</cfif>
					<cfif apr26Leavers_Section8_Total+apr26Stayers_Section8_Total GT 0>
						<cfchartdata item="Sect 8" value=#apr26Leavers_Section8_Total#>
					</cfif>
					<cfif apr26Leavers_Other_Total+apr26Stayers_Other_Total GT 0>
						<cfchartdata item="Other" value=#apr26Leavers_Other_Total#>
					</cfif>
				</cfchartseries>
				<cfchartseries type="Bar" seriesLabel="Stayers">
					<cfif apr26Leavers_SNAP_Total+apr26Stayers_SNAP_Total GT 0>
						<cfchartdata item="SNAP" value=#apr26Stayers_SNAP_Total#>
					</cfif>
					<cfif apr26Leavers_Medicaid_Total+apr26Stayers_Medicaid_Total GT 0>
						<cfchartdata item="Medicaid" value=#apr26Stayers_Medicaid_Total#>
					</cfif>
					<cfif apr26Leavers_Medicare_Total+apr26Stayers_Medicare_Total GT 0>
						<cfchartdata item="Medicare" value=#apr26Stayers_Medicare_Total#>
					</cfif>
					<cfif apr26Leavers_StateChildHealthIns_Total+apr26Stayers_StateChildHealthIns_Total GT 0>
						<cfchartdata item="SCHIP" value=#apr26Stayers_StateChildHealthIns_Total#>
					</cfif>
					<cfif apr26Leavers_WIC_Total+apr26Stayers_WIC_Total GT 0>
						<cfchartdata item="WIC" value=#apr26Stayers_WIC_Total#>
					</cfif>
					<cfif apr26Leavers_VAMed_Total+apr26Stayers_VAMed_Total GT 0>
						<cfchartdata item="VA Medical" value=#apr26Stayers_VAMed_Total#>
					</cfif>
					<cfif apr26Stayers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
						<cfchartdata item="TANF Childcare" value=#apr26Stayers_TANFChildcare_Total#>
					</cfif>
					<cfif apr26Stayers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
						<cfchartdata item="TANF Transit" value=#apr26Stayers_TANFTransit_Total#>
					</cfif>
					<cfif apr26Leavers_TempRA_Total+apr26Stayers_TempRA_Total GT 0>
						<cfchartdata item="Temp RA" value=#apr26Stayers_TempRA_Total#>
					</cfif>
					<cfif apr26Leavers_Section8_Total+apr26Stayers_Section8_Total GT 0>
						<cfchartdata item="Sect 8" value=#apr26Stayers_Section8_Total#>
					</cfif>
					<cfif apr26Leavers_Other_Total+apr26Stayers_Other_Total GT 0>
						<cfchartdata item="Other" value=#apr26Stayers_Other_Total#>
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
				<cfif apr26Leavers_SNAP_Total+apr26Stayers_SNAP_Total GT 0>
				<tr>
					<td valign="top">
						Supplemental Nutrition Assistance Program
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_SNAP_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithSNAP*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_SNAP_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithSNAP*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicaid_Total+apr26Stayers_Medicaid_Total GT 0>
				<tr>
					<td valign="top">
						Medicaid
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Medicaid_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithMedicaid*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Medicaid_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithMedicaid*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicare_Total+apr26Stayers_Medicare_Total GT 0>
				<tr>
					<td valign="top">
						Medicare
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Medicare_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithMedicare*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Medicare_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithMedicare*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_StateChildHealthIns_Total+apr26Stayers_StateChildHealthIns_Total GT 0>
				<tr>
					<td valign="top">
						State Children's Health Insurance
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_StateChildHealthIns_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithStateChildrensHealthInsurance*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_StateChildHealthIns_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithStateChildrensHealthInsurance*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_WIC_Total+apr26Stayers_WIC_Total GT 0>
				<tr>
					<td valign="top">
						WIC
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_WIC_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithWIC*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_WIC_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithWIC*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_VAMed_Total+apr26Stayers_VAMed_Total GT 0>
				<tr>
					<td valign="top">
						VA Medical Services
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_VAMed_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithVAMedical*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_VAMed_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithVAMedical*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Stayers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
				<tr>
					<td valign="top">
						TANF Child Care
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TANFChildcare_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithTANFChildCare*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFChildcare_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithTANFChildCare*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Stayers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
				<tr>
					<td valign="top">
						TANF Transit
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFTransit_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithTANFTrans*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFTransit_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithTANFTrans*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TempRA_Total+apr26Stayers_TempRA_Total GT 0>
				<tr>
					<td valign="top">
						Other Temporary Rental Assistance
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TempRA_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithTempRentalAssistance*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TempRA_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithTempRentalAssistance*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Section8_Total+PercTotalStayersWithTANFSection8 GT 0>
				<tr>
					<td valign="top">
						Section 8
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Section8_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithTANFSection8*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Section8_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithTANFSection8*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Other_Total+apr26Stayers_Other_Total GT 0>
				<tr>
					<td valign="top">
						Other Source
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Other_Total# of #apr26Leavers_Total_Total# (#NumberFormat(PercTotalLeaversWithOther*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Other_Total# of #apr26Stayers_Total_Total# (#NumberFormat(PercTotalStayersWithOther*100, "__")#%)
					</td>
				</tr>
				</cfif>
			</tbody>
		</table>

		<table width="100%">
			<thead>
				<th>Number of Non-Cash Income Sources</th>
				<th class="text-center">Leavers</th>
				<th class="text-center">Stayers</th>
			</thead>
			<tbody>
				<tr>
					<td>No Sources</td>
					<td class="text-center">
						#apr26Leavers_NoSources_Total# of #apr26Leavers_Total_Total#
						<cfif apr26Leavers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Leavers_NoSources_Total/apr26Leavers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr26Stayers_NoSources_Total# of #apr26Stayers_Total_Total#
						<cfif apr26Stayers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Stayers_NoSources_Total/apr26Stayers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
				<tr>
					<td>1+ Source(s)</td>
					<td class="text-center">
						#apr26Leavers_1Plus_Total# of #apr26Leavers_Total_Total#
						<cfif apr26Leavers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Leavers_1Plus_Total/apr26Leavers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr26Stayers_1Plus_Total# of #apr26Stayers_Total_Total#
						<cfif apr26Stayers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Stayers_1Plus_Total/apr26Stayers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
				<tr>
					<td>Don't Know/Refused</td>
					<td class="text-center">
						#apr26Leavers_DKR_Total# of #apr26Leavers_Total_Total#
						<cfif apr26Leavers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Leavers_DKR_Total/apr26Leavers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr26Stayers_DKR_Total# of #apr26Stayers_Total_Total#
						<cfif apr26Stayers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Stayers_DKR_Total/apr26Stayers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
				<tr>
					<td>Don't Know/Refused</td>
					<td class="text-center">
						#apr26Leavers_Missing_Total# of #apr26Leavers_Total_Total#
						<cfif apr26Leavers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Leavers_Missing_Total/apr26Leavers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
					<td class="text-center">
						#apr26Stayers_Missing_Total# of #apr26Stayers_Total_Total#
						<cfif apr26Stayers_Total_Total NEQ 0>
						 (#NumberFormat(apr26Stayers_Missing_Total/apr26Stayers_Total_Total*100,"0")#%)
						 <cfelse>
						 (N/A)
						</cfif>
					</td>
				</tr>
			</tbody>
		</table>




		
		<hr>

		</div>
	</div>

</cfoutput>
