<cfoutput>
<div class="row">
	<div class="large-12 columns">
			<cfif projectComponentID EQ "2" OR projectComponentID EQ "5" OR projectComponentID EQ "10">
				<h3 class="MakePrimary">2c.) Maintaining Permanent Housing over 6 Months</h3>
					<p>
						#MaintainedHousingOver6Months# of #ClientsOver6Months# 
						<cfif ClientsOver6Months NEQ 0 >
							(#NumberFormat((MaintainedHousingOver6MonthsPer)*100, "__")#%)
						</cfif>
						individuals maintained their housing for more than six months. <cfif StayLT6 GT 0>This calculation disregards #StayLT6# stayers who were in the program less than six months.</cfif>
					</p>
					<div class="row">
					<div class="large-12 columns">
						<h3 class="">Length of Participation</h3>
						<cfchart chartwidth="950" chartheight="250" font="Lato" format="html" fontSize="11" title="Length of Participation by Exit Status">
								<cfchartseries type="Bar" seriesLabel="Leavers">
									<cfif apr27_30Less_Leavers+apr27_30Less_Stayers GT 0>
										<cfchartdata item="30 days or less" value=#apr27_30Less_Leavers#>
									</cfif>
									<cfif apr27_31to60_Leavers+apr27_31to60_Stayers GT 0>
										<cfchartdata item="1-2 months" value=#apr27_31to60_Leavers#>
									</cfif>
									<cfif apr27_61to180_Leavers+apr27_61to180_Stayers GT 0>
										<cfchartdata item="3-6 months" value=#apr27_61to180_Leavers#>
									</cfif>
									<cfif apr27_181to365_Stayers+apr27_181to365_Leavers GT 0>
										<cfchartdata item="6 months - 1 year" value=#apr27_181to365_Leavers#>
									</cfif>
									<cfif apr27_366to730_Stayers+apr27_366to730_Leavers GT 0>
										<cfchartdata item="1-2 years" value=#apr27_366to730_Leavers#>
									</cfif>
									<cfif apr27_731to1095_Leavers+apr27_731to1095_Stayers GT 0>
										<cfchartdata item="2-3 years" value=#apr27_731to1095_Leavers#>
									</cfif>
									<cfif apr27_1096to1460_Leavers+apr27_1096to1460_Stayers GT 0>
										<cfchartdata item="3-4 years" value=#apr27_1096to1460_Leavers#>
									</cfif>
									<cfif apr27_1461to1825_Leavers+apr27_1461to1825_Stayers GT 0>
										<cfchartdata item="4-5 years" value=#apr27_1461to1825_Leavers#>
									</cfif>
									<cfif apr27_1825More_Stayers+apr27_1825More_Leavers GT 0>
										<cfchartdata item="5+ years" value=#apr27_1825More_Leavers#>
									</cfif>
								</cfchartseries>
								<cfchartseries type="Bar" seriesLabel="Stayers">
									<cfif apr27_30Less_Leavers+apr27_30Less_Stayers GT 0>
										<cfchartdata item="30 days or less" value=#apr27_30Less_Stayers#>
									</cfif>
									<cfif apr27_31to60_Leavers+apr27_31to60_Stayers GT 0>
										<cfchartdata item="1-2 months" value=#apr27_31to60_Stayers#>
									</cfif>
									<cfif apr27_61to180_Leavers+apr27_61to180_Stayers GT 0>
										<cfchartdata item="3-6 months" value=#apr27_61to180_Stayers#>
									</cfif>
									<cfif apr27_181to365_Stayers+apr27_181to365_Leavers GT 0>
										<cfchartdata item="6 months - 1 year" value=#apr27_181to365_Stayers#>
									</cfif>
									<cfif apr27_366to730_Stayers+apr27_366to730_Leavers GT 0>
										<cfchartdata item="1-2 years" value=#apr27_366to730_Stayers#>
									</cfif>
									<cfif apr27_731to1095_Leavers+apr27_731to1095_Stayers GT 0>
										<cfchartdata item="2-3 years" value=#apr27_731to1095_Stayers#>
									</cfif>
									<cfif apr27_1461to1825_Leavers+apr27_1461to1825_Stayers GT 0>
										<cfchartdata item="3-4 years" value=#apr27_1096to1460_Stayers#>
									</cfif>
									<cfif apr27_1461to1825_Leavers+apr27_1461to1825_Stayers GT 0>
										<cfchartdata item="4-5 years" value=#apr27_1461to1825_Stayers#>
									</cfif>
									<cfif apr27_1825More_Stayers+apr27_1825More_Leavers GT 0>
										<cfchartdata item="5+ years" value=#apr27_1825More_Stayers#>
									</cfif>
								</cfchartseries>
						</cfchart>
					</div>
				</div>
			</cfif>


			<cfif projectComponentID EQ "3">
				<h3 class="MakePrimary">2c.) Exiting to Permanent Housing</h3>
						<p>
						<cfif dead GT 0>
							Excluding #dead# tenant<cfif dead GT 1>s</cfif> who passed away,
						</cfif>
						#TotalLeaversExitingToPH# of #LivingLeavers# 
							<cfif (LivingLeavers) NEQ 0>
								(#NumberFormat((TotalLeaversExitingToPH/LivingLeavers)*100, "__")#%)
							</cfif>
						exiting tenants left for permanent housing opportunities<cfif TotalLeaversExitingToPH GT 0>, including
						<cfset ExitPermONS = (apr29More90_OwnedNoSubsidy_Total+apr29More90_OwnedSubsidy_Total)>
							<cfif ExitPermONS NEQ 0>
								#ExitPermONS# in housing they own, 
							</cfif>

							<cfset ExitPermVASH = (apr29More90_RentalVASHSubsidy_Total)>
							<cfset ExitPermOtherSub = (apr29More90_RentalOtherSubsidy_Total)>
							<cfif ExitPermVASH NEQ 0>
								#ExitPermVASH# in VASH subsidized rental housing, 
								<cfif ExitPermOtherSub NEQ 0>
									#ExitPermOtherSub# with other rental subsidies, 
								</cfif>
							<cfelse>
								<cfif ExitPermOtherSub NEQ 0>
									#ExitPermOtherSub# in subsidized rental housing, 
								</cfif>
							</cfif>
							<cfif (apr29More90_RentalNoSubsidy_Total) NEQ 0>
								#(apr29More90_RentalNoSubsidy_Total)# in unsubsidized rental housing, 
							</cfif>

							<cfset ExitPermPSH = apr29More90_PSH_Total>
							<cfif ExitPermPSH NEQ 0>
								#ExitPermPSH# in permanent supportive housing, 
							</cfif>
							<cfset ExitPermFamily = (apr29More90_PermFamily_Total+apr29More90_PermFriend_Total)>
							<cfif ExitPermONS EQ 0 AND ExitPermVASH EQ 0 AND ExitPermPSH EQ 0 AND TotalLeaversExitingToPH NEQ 0 AND (TotalLeaversExitingToPH-ExitPermFamily) NEQ 1>
									#ExitPermFamily# living permanently with friends or family.
							<cfelseif (TotalLeaversExitingToPH) NEQ 0>
									and #ExitPermFamily# living permanently with friends or family.
							</cfif>
						<cfelse>.</cfif>
					</p>
				<div class="row">
					<div class="large-12 columns">



						<table width="100%">
							<thead>
								<tr>
									<th width="50%" class="text-left">
										<em>Destination of Leavers at Program Exit</em>
									</th>
									<th class="text-center" >
										Less Than 90 Days
									</th>
									<th class="text-center">
										Greater Than 90 Day
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td valign="top">
										Permanent Destinations
									</td>
									<td valign="top" class="text-center">
										#apr29Less90_PermTotal_Total# of #apr29Less90_Total_Total#
											(#NumberFormat(PercExitPermDest90DaysOrLess*100, "__")#%)
									</td>
									<td valign="top" class="text-center">
										#apr29More90_PermTotal_Total# of #apr29More90_Total_Total#
											(#NumberFormat(PercExitPermDestMoreThan90Days*100, "__")#%)
									</td>
								</tr>
								<tr>
									<td valign="top">
										Temporary Destinations
									</td>
									<td valign="top" class="text-center">
										#apr29Less90_Temapr08_Total_Total# of #apr29Less90_Total_Total#
										(#NumberFormat(PercExitTempDest90DaysOrLess*100, "__")#%)
									</td>
									<td valign="top" class="text-center">
										#apr29More90_TempTotal_Total# of #apr29More90_Total_Total#
										(#NumberFormat(PercExitTempDestMoreThan90Days*100, "__")#%)
									</td>
								</tr>
								<tr>
									<td valign="top">
										Institutional Settings
									</td>
									<td valign="top" class="text-center">
										#apr29Less90_InstTotal_Total# of #apr29Less90_Total_Total#
											(#NumberFormat(PercExitInstitution90DaysOrLess*100, "__")#%)
									</td>
									<td valign="top" class="text-center">
										#apr29More90_InstTotal_Total# of #apr29More90_Total_Total#
											(#NumberFormat(PercExitInstitutionsMoreThan90Days*100, "__")#%)
									</td>
								</tr>
								<tr>
									<td valign="top">
										Other Destinations</p>
									</td>
									<td valign="top" class="text-center">
										#apr29Less90_OtherTotal_Total# of #apr29Less90_Total_Total#
										(#NumberFormat(PercExitOtherDestinations90DaysOrLess*100, "__")#%)
									</td>
									<td valign="top" class="text-center">
										#apr29More90_OtherTotal_Total# of #apr29More90_Total_Total#
											(#NumberFormat(PercExitOtherDestinationsMoreThan90Days*100, "__")#%)
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<table width="100%">
											<tr>
												<td class="text-center">
													<cfif  apr29Less90_PermTotal_Total+apr29Less90_Temapr08_Total_Total+apr29Less90_InstTotal_Total+apr29Less90_OtherTotal_Total EQ 0 OR  apr29More90_PermTotal_Total+apr29More90_TempTotal_Total+apr29More90_InstTotal_Total+apr29More90_OtherTotal_Total EQ 0>
														<cfset ChartWidth="900">
													<cfelse>
														<cfset ChartWidth="450">
													</cfif>
													<cfif apr29Less90_PermTotal_Total+apr29Less90_Temapr08_Total_Total+apr29Less90_InstTotal_Total+apr29Less90_OtherTotal_Total GT 0>
														<h5>Less Than 90 Days</h5>
														<cfchart chartwidth="#ChartWidth#" chartheight="300" font="Lato" fontSize="11" format="html">
															<cfchartseries type="Pie" >
																<cfchartdata item="Permanent" value="#apr29Less90_PermTotal_Total#">
																<cfchartdata item="Temporary" value="#apr29Less90_Temapr08_Total_Total#">
																<cfchartdata item="Institutional" value="#apr29Less90_InstTotal_Total#">
																<cfchartdata item="Other" value="#apr29Less90_OtherTotal_Total#">
															</cfchartseries>
														</cfchart>
													</cfif>
												</td>
												<td class="text-center">
													<cfif apr29More90_PermTotal_Total+apr29More90_TempTotal_Total+apr29More90_InstTotal_Total+apr29More90_OtherTotal_Total GT 0>
														<h5>Greater Than 90 Days</h5>
														<cfchart chartwidth="#ChartWidth#" chartheight="300" font="Lato" fontSize="11" format="html">
															<cfchartseries type="Pie" >
																<cfchartdata item="Permanent" value="#apr29More90_PermTotal_Total#">
																<cfchartdata item="Temporary" value="#apr29More90_TempTotal_Total#">
																<cfchartdata item="Institutional" value="#apr29More90_InstTotal_Total#">
																<cfchartdata item="Other" value="#apr29More90_OtherTotal_Total#">
															</cfchartseries>
														</cfchart>
													</cfif>
												</td>
											</tr>
										</table>
										
										
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>	
			</cfif>


			<hr>
	</div>
</div>
</cfoutput>