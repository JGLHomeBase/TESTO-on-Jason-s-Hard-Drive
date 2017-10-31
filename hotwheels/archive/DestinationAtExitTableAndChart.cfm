<cfoutput>


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

</cfoutput>


