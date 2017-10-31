<cfoutput>
<!--- Name and Location --->
	<div class="row">
		<div class="large-12 columns">
			<h1 class="MakePrimary">#ProjectLongName# (#projectComponentName#)</h1>
			<h2 class="MakeSecondary">#agencyLongName#</h2>
			<p>
				<cfif ProjectStreet1 NEQ "">
					#ProjectStreet1#<br>
				</cfif>
				<cfif ProjectStreet2 NEQ "">
					#ProjectStreet2#<br>
				</cfif>
				<cfif ProjectHood  NEQ "">
					#ProjectHood#<br>
				</cfif>
			</p>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<hr>
		</div>
	</div>
<!---/ Name and Location --->	

<!--- Project Overview --->	
	<cfif ProjectOverview NEQ "">
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Project Overview</h2>
			<p>#ProjectOverview#</p>
			<hr>
		</div>
	</div>
	</cfif>
<!---/ Project Overview --->	

<!--- Project Location --->
	<cfif GEOCODELOCATION NEQ "none">
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Project Location</h2>
			<table width="100%">
				<tr>
					<td width="50%">
						<a href="https://maps.google.com/?q=#GeoCodeLocation#" target="_blank">
							<img src="//maps.googleapis.com/maps/api/staticmap?size=475x250&markers=%7Ccolor:0x6ECDDC%7C#GeoCodeLocation#&sensor=false&visual_refresh=true&scale=2&zoom=15&key=#APIKey.Google#" 
								 border="1px" width="475" height="250"/>
						</a>
					</td>
					<td width="50%">
						<cfparam name="HideStreetView" default="0">
						<cfif HideStreetView EQ 1>
							<img src="img/NoImage.png" alt="No Image Available" >
						<cfelse>
							<img src="//maps.googleapis.com/maps/api/streetview?size=475x255&location=#GeoCodeLocation#&sensor=false&key=#APIKey.Google#<cfif ProjectGeoHeading NEQ "">&heading=#ProjectGeoHeading#</cfif>" 
							 border="1px" width="475" height="250"/>
						</cfif>
						
					</td>
				</tr>
			</table>
			<hr>
		</div>
	</div>
	</cfif>
<!---/ Project Location --->	

<!--- At A Glance --->
<div class="row">
	<div class="large-12 columns">
			<h2  class="MakePrimary">Program at a Glance</h2>
			<table width="100%">
				<tbody>
				    <!--- Project Type --->
				    <tr>
				        <td width="200"><strong>Funding Category</strong></td>
				        <td colspan="3">#projectComponentLongName#</td>
				    </tr>
				    <!---/ Project Type --->
				    <!--- Total Project Budget --->
				    <cfif NumAns02 EQ 0 OR NumAns02 EQ "">
                    <tr>
				        <td width="200"><strong>Total Project Budget</strong></td>
				        <td colspan="3"> #LSCurrencyFormat(NumAns02, "local")#</td>
				    </tr>
                    </cfif>
				    <!---/ Total Project Budget --->
				   
				    <!--- Amount of Grant --->
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong> 
				        <td width="300">#LSCurrencyFormat(apr03Amount, "local")#
				    	</td>
                        <cfif GRANTEXPENDAMOUNT NEQ 0>
                        <td width="100"><strong>Expended</strong>
				    	</td>
				        <td >
				         #LSCurrencyFormat(GRANTEXPENDAMOUNT, "local")# 
				    	</td>
                        </cfif>
				    </tr>
				    <!---/ Amount of Grant --->
				    
				   
				    <tr>
				        <td width="200" valign="top"><strong>Persons Served in Last Operating Year</strong></td>
				        <td colspan="3">
				        	<p>
					        	<cfif apr09_HH_Total NEQ "">
				        			#apr09_HH_Total# households
				        			<cfif apr08_Children_Total NEQ 0 AND apr08_Adult_Total EQ 0>
				        				(#apr08_Children_Total# children)
				        			<cfelseif apr08_Children_Total NEQ 0>
				        				(#apr08_Adult_Total# adults #apr08_Children_Total# children)
				        			<cfelseif apr08_Adult_Total NEQ 0>
				        				(#apr08_Adult_Total# individuals)
				        			</cfif>
				        			<cfelseif apr08_Children_Total NEQ 0>
				        				#apr08_Adult_Total# adults #apr08_Children_Total# children
				        			<cfelse>
				        				#apr08_Adult_Total# individuals
				        		</cfif>
					        		
				        	</p>
				        	<p>
								Of the persons served last year, at entry 

								#apr18_MentalIllness_Total# were mentally ill, 

								#apr18_Alcohol_Total# had experience with alcohol abuse, 

								#apr18_Drug_Total# had experience with drug abuse, 

								#apr18_HIV_Total# had HIV/AIDS and related diseases, 

								#apr18_ChronicHealth_Total# had a chronic health condition, 

								#apr18_DevDisability_Total# had a developmental disability, and 

								#apr18_PhysDisability_Total# had a physical disability.    
				        	</p>
				        	<p>
				        		Of the persons served last year, at entry, 

				        		#apr18_None_Total# had no conditions, 

				        		#apr18_1Condition_Total# had one condition, 

				        		#apr18_2Conditions_Total# had two conditions, and 

				        		#apr18_3PlusConditions_Total# had three or more conditions.
				        	</p>


				        	<cfif apr19DV_Yes_Total NEQ 0>
				        		<p>#apr19DV_Yes_Total# of the adults served had past domestic violence experience; #DVPastYear# had domestic violence experience in the past year.</p>
				        	<cfelseif apr19DV_Yes_Total EQ 0>
				        		<p>None of the persons served had past domestic violence experience.</p>
				        	</cfif>
				        	<p>
				        	The program served 
				        	#apr16_62Plus_Total# seniors and 
				        	#apr21_Vet_Total# veterans.
				        	</p>
				        </td>
				    </tr>
				    <!---/ Persons Served  --->

				   
				    <!--- Population Served --->
				    <cfif popServed NEQ "">
				    	<tr>
					        <td width="200"><strong>Population Served</strong></td>
					        <td colspan="3">#popServed#</td>
					    </tr>
				    </cfif>
				    <!---/ Population Served --->
				    <!--- Services Provided --->
				    <cfif ServicesProvided NEQ "">
					    <tr>
					        <td width="200"><strong>Services Provided</strong></td>
					        <td colspan="3">#ServicesProvided#</td>
					    </tr>
				    </cfif>
				    <!---/  Services Provided --->

				    <!--- Housing Provided --->
				    <cfif HousingProvided NEQ "">
				    <tr>
				        <td width="200"><strong>Housing Provided</strong></td>
				        <td colspan="3">#HousingProvided#</td>
				    </tr>
				    </cfif>
				    <!---/  Housing Provided --->

				    <!--- Venues for Service --->
				    <cfif VenuesForService NEQ "">
					    <tr>
					        <td width="200"><strong>Venue(s) for Service</strong></td>
					        <td colspan="3">#VenuesForService#</td>
					    </tr>
				    </cfif>
				    <!---/  Venues for Service --->
				</tbody>
			</table>
	</div>
</div>
<!---/ At a Glance --->

<!---/ Residential Stability --->
	<div class="row">
		<div class="large-12 columns text-left">
			<h2 class="MakePrimary">Program Performance and Client Outcomes: Housing Stability (Scored Factor 4a)</h2>
			<div class="row">
		<div class="large-12 columns text-left">
			<p>
				<cfif dead GT 0>
					Excluding #dead# tenant<cfif dead GT 1>s</cfif> who passed away,
				</cfif>
				#(TotalLeaversExitingToPH)# of #(LivingLeavers)# 
				(#NumberFormat(((TotalLeaversExitingToPH)/LivingLeavers)*100, "__")#%)
				exiting participants exited to permanent housing. (4a2)
			</p>					
				<p>
				    <cfif TotalLeaversExitingToPH GT 0>		
                        Of the #TotalLeaversExitingToPH# participants who exited to permanent housing destinations, 

						<cfset ExitPermONS = (apr29More90_OwnedNoSubsidy_Total+apr29More90_OwnedSubsidy_Total+apr29Less90_OwnedNoSubsidy_Total+apr29Less90_OwnedSubsidy_Total)>
							<cfif ExitPermONS NEQ 0>
								#ExitPermONS# exited to housing they own, 
							</cfif>

							<cfset ExitPermVASH = (apr29More90_RentalVASHSubsidy_Total+apr29Less90_RentalVASHSubsidy_Total)>
							<cfset ExitPermOtherSub = (apr29More90_RentalOtherSubsidy_Total+apr29Less90_RentalOtherSubsidy_Total)>
							<cfif ExitPermVASH NEQ 0>
								#ExitPermVASH# exited to VASH subsidized rental housing, 
								<cfif ExitPermOtherSub NEQ 0>
									#ExitPermOtherSub# exited with other rental subsidies, 
								</cfif>
							<cfelse>
								<cfif ExitPermOtherSub NEQ 0>
									#ExitPermOtherSub# exited to subsidized rental housing, 
								</cfif>
							</cfif>
							<cfif (apr29More90_RentalNoSubsidy_Total+ apr29Less90_RentalNoSubsidy_Total) NEQ 0>
								#(apr29More90_RentalNoSubsidy_Total+ apr29Less90_RentalNoSubsidy_Total)# exited to unsubsidized rental housing, 
							</cfif>

							<cfset ExitPermPSH = (apr29More90_PSH_Total+apr29Less90_PSH_Total)>
							<cfif ExitPermPSH NEQ 0>
								#ExitPermPSH# exited to permanent supportive housing, 
							</cfif>
							<cfset ExitPermFamily = (apr29More90_PermFamily_Total+apr29More90_PermFriend_Total+apr29Less90_PermFamily_Total+apr29Less90_PermFriend_Total)>
							<cfif ExitPermONS EQ 0 AND ExitPermVASH EQ 0 AND ExitPermPSH EQ 0 AND TotalLeaversExitingToPH NEQ 0 AND (TotalLeaversExitingToPH-ExitPermFamily) NEQ 1>
									#ExitPermFamily# exited to live permanently with friends or family.
							<cfelseif (TotalLeaversExitingToPH) NEQ 0>
									and #ExitPermFamily# exited to live permanently with friends or family.
							</cfif>
						<cfelse>.</cfif>
					</p>
				<!---/ PSH-SHP and S+C --->
				
				<!--- TH Sentences --->
				<p>
						<cfif LivingLeavers NEQ 0>
							<cfset ExitTransPercent = ((apr29More90_TempTotal_Total+apr29Less90_TempTotal_Total)/LivingLeavers)>
							<cfif (apr29More90_TempTotal_Total+apr29Less90_TempTotal_Total) EQ 0>
								#(apr29More90_TempTotal_Total+apr29Less90_TempTotal_Total)# of #LivingLeavers# (#NumberFormat(ExitTransPercent*100, "__")#%) exiting participants were living in temporary destinations.
							<cfelse>
								#((apr29More90_TempTotal_Total+apr29Less90_TempTotal_Total))# of #LivingLeavers# (#NumberFormat(ExitTransPercent*100, "__")#%) exiting participants were living in temporary destinations, including
								<cfset ExitTransNoHabit = apr29More90_NoHumanHabitation_Total+apr29Less90_NoHumanHabitation_Total>
								<cfif ExitTransNoHabit NEQ 0>
									#ExitTransNoHabit# in places not meant for human habitation, 
								</cfif>
								<cfset ExitTransShelter = apr29More90_EShelter_Total+apr29Less90_EmergShelter_Total>
								<cfif ExitTransShelter NEQ 0>
									#ExitTransShelter# in emergency shelters, 
								</cfif>
								<cfset ExitTransSafeHaven = apr29More90_SH_Total+apr29Less90_SH_Total>
								<cfif ExitTransSafeHaven NEQ 0>
									#ExitTransSafeHaven# in Safe Havens, 
								</cfif>
								<cfset ExitTransHotel = apr29More90_Hotel_Total+apr29Less90_Hotel_Total>
								<cfif ExitTransHotel NEQ 0>
									#ExitTransHotel# in hotels or motels, 
								</cfif>
								<cfset ExitTransFamily = (apr29More90_TempFamily_Total+apr29More90_TempFriends_Total+apr29Less90_TempFriend_Total+apr29Less90_TempFamily_Total)>
								<cfif ExitTransFamily NEQ 0>
									#ExitTransFamily# staying temporarily with friends or family, 
								</cfif>

								<cfset ExitTransHomeless = (apr29More90_TH_Total+apr29Less90_TH_Total)>
									<cfif ExitTransNoHabit EQ 0 AND ExitTransShelter EQ 0 AND ExitTransSafeHaven EQ 0 AND ExitTransHotel EQ 0 AND ExitTransFamily EQ 0>
										#ExitTransHomeless# in transitional housing.
									<cfelse>
										and #ExitTransHomeless# in transitional housing.
									</cfif>
								</cfif>
							
							</cfif>
						</p>
			<!---/ TH Sentences --->

			<!--- Inst Sentences --->
			<p>
				#(apr29Less90_InstTotal_Total+apr29More90_InstTotal_Total)# went to an institution<cfif (apr29Less90_InstTotal_Total+apr29More90_InstTotal_Total) GT 0>, including</cfif>
				<cfif apr29Less90_Detox_Total GT 0 OR apr29More90_Detox_Total GT 0>
					#(apr29Less90_Detox_Total + apr29More90_Detox_Total)# in detox,
				</cfif>
				<cfif apr29Less90_Foster_Total GT 0 OR apr29More90_Foster_Total GT 0>
					#(apr29Less90_Foster_Total + apr29More90_Foster_Total)# in foster care,
				</cfif>
				<cfif apr29Less90_Hospital_Total GT 0 OR apr29More90_Hospital_Total GT 0>
					#(apr29Less90_Hospital_Total + apr29More90_Hospital_Total)# in hospital(s),
				</cfif>
				<cfif apr29Less90_Psych_Total GT 0 OR apr29More90_Psych_Total GT 0>
					#(apr29Less90_Psych_Total + apr29More90_Psych_Total)# in psychiatric facilities,
				</cfif>
				<cfif (apr29Less90_InstTotal_Total+apr29More90_InstTotal_Total) GT 0>and #(apr29More90_Jail_Total+apr29Less90_Jail_Total)# in jail.</cfif>
			</p>
			<!---/ Inst Sentences --->
		</div>
	</div>


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
						#apr29Less90_TempTotal_Total# of #apr29Less90_Total_Total#
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
									<cfif  apr29Less90_PermTotal_Total+apr29Less90_TempTotal_Total+apr29Less90_InstTotal_Total+apr29Less90_OtherTotal_Total EQ 0 OR  apr29More90_PermTotal_Total+apr29More90_TempTotal_Total+apr29More90_InstTotal_Total+apr29More90_OtherTotal_Total EQ 0>
										<cfset ChartWidth="900">
									<cfelse>
										<cfset ChartWidth="450">
									</cfif>
									<cfif apr29Less90_PermTotal_Total+apr29Less90_TempTotal_Total+apr29Less90_InstTotal_Total+apr29Less90_OtherTotal_Total GT 0>
										<h5>Less Than 90 Days</h5>
										<cfchart chartwidth="#ChartWidth#" chartheight="300" font="Lato" fontSize="11" format="html">
											<cfchartseries type="Pie" >
												<cfchartdata item="Permanent" value="#apr29Less90_PermTotal_Total#">
												<cfchartdata item="Temporary" value="#apr29Less90_TempTotal_Total#">
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


			<hr>
		<p>See Local Application responses to <em>Program Performance and Client Outcomes</em> question 1(a) for additional information.</p>         
		</div>
	</div>
<!---/ Residential Stability --->

<!--- Income --->
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Program Performance and Client Outcomes: Income and Mainstream Resources (Scored Factors 4b-4c)</h2>
				<p> #apr15Adult_TotalIncreasedInc# of #apr08_Adult_Total#
				<cfif apr08_Adult_Total GT 0>(#NumberFormat((apr15Adult_TotalIncreasedInc/apr08_Adult_Total)*100,"0")#%) </cfif>
				adult participants increased income. (4b) </p>
				<p>#NumberFormat((apr26Leavers_1Plus_Total+apr26Stayers_1Plus_Total),"0")# of #apr08_Total# (#NumberFormat(((apr26Leavers_1Plus_Total+apr26Stayers_1Plus_Total)/apr08_Total)*100,"0")#%) participants had at least one source of non-cash mainstream resources at follow-up or program exit. (4c)</p>
			<hr>

				<table width="100%">
			<thead>
				<tr>
					<th width="50%" class="text-left">
						<em>Change in Income</em>
					</th>
					<th class="text-center" >
						Adult Leavers
					</th>
					<th class="text-center">
						Adult Stayers
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
										<em>Adult Leavers</em>
									</th>
									<th class="text-center" >
										<em>Adult Stayers</em>
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
				<cfif apr26Leavers_SNAP_Total+apr26Stayers_SNAP_Total GT 0>
				<tr>
					<td valign="top">
						Supplemental Nutrition Assistance Program
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_SNAP_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithSNAP*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_SNAP_Total# of #apr25Stayers_Total_Total# (#NumberFormat(PercStayersWithSNAP*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicaid_Total+apr26Stayers_Medicaid_Total GT 0>
				<tr>
					<td valign="top">
						Medicaid
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Medicaid_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithMedicaid*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Medicaid_Total# of #apr25Stayers_Total_Total# (#NumberFormat(PercStayersWithMedicaid*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicare_Total+apr26Stayers_Medicare_Total GT 0>
				<tr>
					<td valign="top">
						Medicare
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Medicare_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithMedicare*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Medicare_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithMedicare*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_StateChildHealthIns_Total+apr26Stayers_StateChildHealthIns_Total GT 0>
				<tr>
					<td valign="top">
						State Children's Health Insurance
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_StateChildHealthIns_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithStateChildrensHealthInsurance*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_StateChildHealthIns_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithStateChildrensHealthInsurance*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_WIC_Total+apr26Stayers_WIC_Total GT 0>
				<tr>
					<td valign="top">
						WIC
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_WIC_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithWIC*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_WIC_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithWIC*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_VAMed_Total+apr26Stayers_VAMed_Total GT 0>
				<tr>
					<td valign="top">
						VA Medical Services
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_VAMed_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithVAMedical*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_VAMed_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithVAMedical*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
				<tr>
					<td valign="top">
						TANF Child Care
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TANFChildcare_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithTANFChildCare*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFChildcare_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithTANFChildCare*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
				<tr>
					<td valign="top">
						TANF Transit
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TANFTransit_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithTANFTrans*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TANFTransit_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithTANFTrans*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TempRA_Total+apr26Stayers_TempRA_Total GT 0>
				<tr>
					<td valign="top">
						Other Temporary Rental Assistance
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_TempRA_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithTempRentalAssistance*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_TempRA_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithTempRentalAssistance*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Section8_Total+apr26Stayers_Section8_Total GT 0>
				<tr>
					<td valign="top">
						Section 8
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Section8_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithTANFSection8*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Section8_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithTANFSection8*100, "__")#%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Other_Total+apr26Stayers_Other_Total GT 0>
				<tr>
					<td valign="top">
						Other Source
					</td>
					<td valign="top" class="text-center">
						#apr26Leavers_Other_Total# of #apr07_TotalLeavers# (#NumberFormat(PercLeaversWithOther*100, "__")#%)
					</td>
					<td valign="top" class="text-center">
						#apr26Stayers_Other_Total# of #(apr07_TotalClients-apr07_TotalLeavers)# (#NumberFormat(PercStayersWithOther*100, "__")#%)
					</td>
				</tr>
				</cfif>
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
					<cfif apr26Leavers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
						<cfchartdata item="TANF Childcare" value=#apr26Leavers_TANFChildcare_Total#>
					</cfif>
					<cfif apr26Leavers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
						<cfchartdata item="TANF Transit" value=#apr26Leavers_TANFTransit_Total#>
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
					<cfif apr26Leavers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
						<cfchartdata item="TANF Childcare" value=#apr26Stayers_TANFChildcare_Total#>
					</cfif>
					<cfif apr26Leavers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
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
		<hr>
		<p>See Local Application responses to <em>Program Performance and Client Outcomes</em> questions 1(b) and 1(c) for additional information.</p>
		</div>
	</div>
<!---/ Income --->

<!--- Utilization --->
<div class="row">
	<div class="large-12 columns">
<h2 class="MakePrimary">Program Performance and Client Outcomes: Program Occupancy (Scored Factors 4d and 5b)</h2>

<p> The average unit occupancy rate for this program is #NumberFormat((((apr09_Jan_Total+apr09_Apr_Total+apr09_Jul_Total+apr09_Oct_Total)/4)/apr05_Total_ActualUnits)*100, "__")#%. (4d) </p>


		    	<cfchart  
				    chartHeight = "300" 
				    chartWidth = "975" 
				    font = "Lato" 
				    fontBold = "no" 
				    fontItalic = "no" 
				    fontSize = "11" 
				    format = "html" 
				    gridlines = "5" 
				    showBorder = "yes" 
				    showLegend = "no" 
				    showMarkers = "yes" 
				    showXGridlines = "yes"
				    showYGridlines = "no" 
				    sortXAxis = "no" 
				    tipStyle = "MouseOver"
				    title = "Point in time unit utilization rate on the last Wednesday of:"> 
				    <cfchartseries 
					    type="bar"
					    seriesLabel="Persons Served">
					    <cfchartdata item="January" value="#apr09_Jan_Total#">
				    	<cfchartdata item="April" value="#apr09_Apr_Total#">
			    		<cfchartdata item="July" value="#apr09_Jul_Total#">
			    		<cfchartdata item="October" value="#apr09_Oct_Total#">
					</cfchartseries>
					<cfchartseries 
					    type="line"
					    seriesLabel="Capacity">
					    <cfchartdata item="January" value="#apr05_Total_ActualUnits#">
				    	<cfchartdata item="April" value="#apr05_Total_ActualUnits#">
			    		<cfchartdata item="July" value="#apr05_Total_ActualUnits#">
			    		<cfchartdata item="October" value="#apr05_Total_ActualUnits#">
					</cfchartseries>
				</cfchart>

		       			<!--- Data Table --->
		       				<table width="100%">
					       		<tbody>
						       		<tr>
						       			<td>January</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Jan_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Jan_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
						       		<tr>
						       			<td>April</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Apr_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Apr_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
						       		<tr>
						       			<td>July</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Jul_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Jul_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
						       		<tr>
						       			<td>October</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Oct_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Oct_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
					       		</tbody>
		       				</table>
		       			<!---/ Data Table --->
		<p>See Local Application responses to <em>Program Performance and Client Outcomes</em> question 1(d) for additional information.</p>
	</div>
</div>
<!---/ Utilization --->

<!--- Length of Participation --->
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Program Performance and Client Outcomes: Length of Stay (Scored Factor 4e)</h2>
			<p>#ProjectOverview#</p>

		<table width="100%">
			<thead>
				<th></th>
				<th class="text-center">Average Length (Days)</th>
				<th class="text-center">Median Length (Days)</th>
			</thead>
			<tbody>
				<tr>
					<td>Leavers</td>
					<td class="text-center">#apr27_Leavers_Avg#</td>
					<td class="text-center">#apr27_Stayers_Avg#</td>
				</tr>
				<tr>
					<td>Stayers</td>
					<td class="text-center">#apr27_Leavers_Median#</td>
					<td class="text-center">#apr27_Stayers_Median#</td>
				</tr>
			</tbody>
		</table>



<h3 class="">Length of Participation by Exit Status</h3>
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
		<p><br>See Local Application responses to <em>Program Performance and Client Outcomes</em> question 2 for additional information.</p>                            
	</div>
</div>
<!---/ Length of Stay --->

<!--- Returns to Homelessness --->
<div class="row">
	<div class="large-12 columns">

<h2 class="MakePrimary">Program Performance and Client Outcomes: Returns to Homelessness (Unscored Factor 4f)</h2>

	<cfif dead GT 0>
		Excluding #dead# participants<cfif dead GT 1>s</cfif> who passed away,
	</cfif>
	<p>#(apr29Less90_EmergShelter_Total+apr29More90_EShelter_Total+apr29Less90_TH_Total+apr29More90_TH_Total+apr29Less90_Hotel_Total+apr29More90_Hotel_Total+apr29More90_NoHumanHabitation_Total+apr29More90_NoHumanHabitation_Total)# of #(apr08_Total-dead)# (#NumberFormat(((apr29Less90_EmergShelter_Total+apr29More90_EShelter_Total+apr29Less90_TH_Total+apr29More90_TH_Total+apr29Less90_Hotel_Total+apr29More90_Hotel_Total+apr29More90_NoHumanHabitation_Total+apr29More90_NoHumanHabitation_Total)/(apr08_Total-dead))*100, "__")#%) participants exited to emergency shelter, transitional housing, a hotel or motel, or a place not meant for human habitation.</p>

		<p>See Local Application responses to <em>Program Performance and Client Outcomes</em> question 3 for additional information.</p>
	</div>
</div>
<!---/ Returns to Homelessness --->

<!--- Budget and Admin Efficiency --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Budget & Administrative Efficiency (Scored Factors 5a-5b)</h2>

		<p>See Local Application responses to <em>Budget and Cost Effectiveness</em> questions.</p>

	</div>
</div>
<!---/ Budget and Admin Efficiency --->

<!--- Service Improvement Efforts --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Service Improvement Efforts (Scored Factors 6a-6c)</h2>

		<p>See Local Application responses to <em>Service Improvement Efforts</em> questions.</p>

	</div>
</div>
<!---/ Service Improvement Efforts --->

<!--- HMIS and Data Improvement Efforts --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">HMIS & Data Collection Capacity (Scored Factors 7a-7d)</h2>

		<p>See Local Application responses to <em>HMIS and Data Collection Capacity</em> questions.</p>

			<h3 class="MakePrimary">HMIS Data Quality (7c)</h3>
			<table width="100%">
				<thead>
					<th width="50%"></th>
					<th>Don't Know or Refused</th>
					<th>Missing Data</th>
					<th>Percentage of Data Elements with No Data</th>
				</thead>
				<tbody>
					<cfif (apr07_FName_DKR + apr07_FName_Missing) GT 0>
						<tr>
							<td>First Name</td>
							<td>#apr07_FName_DKR#</td>
							<td>#apr07_FName_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_FName_DKR+apr07_FName_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_LName_DKR + apr07_LName_Missing) GT 0>
						<tr>
							<td>Last Name</td>
							<td>#apr07_LName_DKR#</td>
							<td>#apr07_LName_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_LName_DKR+apr07_LName_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_SSN_DKR + apr07_SSN_Missing) GT 0>
						<tr>
							<td>SSN</td>
							<td>#apr07_SSN_DKR#</td>
							<td>#apr07_SSN_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_SSN_DKR+apr07_SSN_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_DoB_DKR + apr07_DoB_Missing) GT 0>
						<tr>
							<td>Date of Birth (DOB)</td>
							<td>#apr07_DoB_DKR#</td>
							<td>#apr07_DoB_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_DoB_DKR+apr07_DoB_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Race_DKR + apr07_Race_Missing) GT 0>
						<tr>
							<td>Race</td>
							<td>#apr07_Race_DKR#</td>
							<td>#apr07_Race_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Race_DKR+apr07_Race_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Ethnicity_DKR + apr07_Ethnicity_Missing) GT 0>
						<tr>
							<td>Ethnicity</td>
							<td>#apr07_Ethnicity_DKR#</td>
							<td>#apr07_Ethnicity_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Ethnicity_DKR+apr07_Ethnicity_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Gender_DKR + apr07_Gender_Missing) GT 0>
						<tr>
							<td>Gender</td>
							<td>#apr07_Gender_DKR#</td>
							<td>#apr07_Gender_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Gender_DKR+apr07_Gender_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Vet_DKR + apr07_Vet_Missing) GT 0>
						<tr>
							<td>Veteran Status</td>
							<td>#apr07_Vet_DKR#</td>
							<td>#apr07_Vet_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Vet_DKR+apr07_Vet_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Disabling_DKR + apr07_Disabling_Missing) GT 0>
						<tr>
							<td>Disabling Condition</td>
							<td>#apr07_Disabling_DKR#</td>
							<td>#apr07_Disabling_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Disabling_DKR+apr07_Disabling_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_ResidencePrior_DKR + apr07_ResidencePrior_Missing) GT 0>
						<tr>
							<td>Residence Prior to Entry</td>
							<td>#apr07_ResidencePrior_DKR#</td>
							<td>#apr07_ResidencePrior_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_ResidencePrior_DKR+apr07_ResidencePrior_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Zip_DKR + apr07_Zip_Missing) GT 0>
						<tr>
							<td>Zip of Last Permanent Address</td>
							<td>#apr07_Zip_DKR#</td>
							<td>#apr07_Zip_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Zip_DKR+apr07_Zip_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_HousingStatus_DKR + apr07_HousingStatus_Missing) GT 0>
						<tr>
							<td>Housing Status (at entry)</td>
							<td>#apr07_HousingStatus_DKR#</td>
							<td>#apr07_HousingStatus_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_HousingStatus_DKR+apr07_HousingStatus_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_IncEntry_DKR + apr07_IncEntry_Missing) GT 0>
						<tr>
							<td>Income (at entry)</td>
							<td>#apr07_IncEntry_DKR#</td>
							<td>#apr07_IncEntry_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_IncEntry_DKR+apr07_IncEntry_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_IncExit_DKR + apr07_IncExit_Missing) GT 0>
						<tr>
							<td>Income (at exit)</td>
							<td>#apr07_IncExit_DKR#</td>
							<td>#apr07_IncExit_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_IncExit_DKR+apr07_IncExit_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_NonCashEntry_DKR + apr07_NonCashEntry_Missing) GT 0>
						<tr>
							<td>Non-cash benefits (at entry)</td>
							<td>#apr07_NonCashEntry_DKR#</td>
							<td>#apr07_NonCashEntry_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_NonCashEntry_DKR+apr07_NonCashEntry_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_NonCashExit_DKR + apr07_NonCashExit_Missing) GT 0>
						<tr>
							<td>Non-cash benefits (at exit)</td>
							<td>#apr07_NonCashExit_DKR#</td>
							<td>#apr07_NonCashExit_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_NonCashExit_DKR+apr07_NonCashExit_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_PhysDisability_DKR + apr07_PhysDisability_Missing) GT 0>
						<tr>
							<td>Physical Disability (at entry)</td>
							<td>#apr07_PhysDisability_DKR#</td>
							<td>#apr07_PhysDisability_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_PhysDisability_DKR+apr07_PhysDisability_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_DevDisability_DKR + apr07_DevDisability_Missing) GT 0>
						<tr>
							<td>Developmental Disability (at entry)</td>
							<td>#apr07_DevDisability_DKR#</td>
							<td>#apr07_DevDisability_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_DevDisability_DKR+apr07_DevDisability_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_ChronicHealth_DKR + apr07_ChronicHealth_Missing) GT 0>
						<tr>
							<td>Chronic Health Condition (at entry)</td>
							<td>#apr07_ChronicHealth_DKR#</td>
							<td>#apr07_ChronicHealth_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_ChronicHealth_DKR+apr07_ChronicHealth_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_HIV_DKR + apr07_HIV_Missing) GT 0>
						<tr>
							<td>HIV/AIDS (at entry)</td>
							<td>#apr07_HIV_DKR#</td>
							<td>#apr07_HIV_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_HIV_DKR+apr07_HIV_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_MentalHealth_DKR + apr07_ChronicHealth_Missing) GT 0>
						<tr>
							<td>Mental Health (at entry)</td>
							<td>#apr07_MentalHealth_DKR#</td>
							<td>#apr07_MentalHealth_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_MentalHealth_DKR+apr07_MentalHealth_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_SA_DKR + apr07_SA_Missing) GT 0>
						<tr>
							<td>Substance Abuse (at entry)</td>
							<td>#apr07_SA_DKR#</td>
							<td>#apr07_SA_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_SA_DKR+apr07_SA_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_DV_DKR + apr07_DV_Missing) GT 0>
						<tr>
							<td>Domestic Violence (at entry)</td>
							<td>#apr07_DV_DKR#</td>
							<td>#apr07_DV_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_DV_DKR+apr07_DV_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Dest_DKR + apr07_Dest_Missing) GT 0>
						<tr>
							<td>Destination</td>
							<td>#apr07_Dest_DKR#</td>
							<td>#apr07_Dest_Missing#</td>
							<td>
								<cfif apr08_Total NEQ 0>
									#NumberFormat((apr07_Dest_DKR+apr07_Dest_Missing)/apr08_Total*100,0)#%
								</cfif>
							</td>
						</tr>
					</cfif>
					<tr>
						<td><b>Overall</b></td>
						<td><b>#TotalDataDK#</b></td>
						<td><b>#TotalDataMissing#</b></td>
						<td><b>#NumberFormat(PerMissingOrNull,0)#%</b></td>
					</tr>
				</tbody>
			</table>
			<hr>

	</div>
</div>
<!---/ HMIS and Data Improvement Efforts --->

<!--- Community Vision and Coordination --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Community Vision & Coordination (Scored Factors 8a-8e)</h2>

		<p>See Local Application responses to <em>Community Vision & Coordination</em> questions.</p>

	</div>
</div>
<!---/ Community Vision and Coordination --->

</cfoutput>