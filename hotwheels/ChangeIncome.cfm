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
</cfoutput>