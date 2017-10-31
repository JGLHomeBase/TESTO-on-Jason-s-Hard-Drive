<cfoutput>
<!--- Name and Location --->
	<div class="row">
		<div class="large-12 columns">
			<h1 class="MakePrimary">|ProjectLongName| (|ProjectComponent|)</h1>
			<h2 class="MakeSecondary">|AgencyLongName|</h2>
			<p>
				<cfif ProjectStreet1 NEQ "">
					|ProjectAddress1|<br>
				</cfif>
				<cfif ProjectStreet2 NEQ "">
					|ProjectAddress2|<br>
				</cfif>
				<cfif ProjectHood  NEQ "">
					|ProjectNeighborhood|<br>
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
			<p>|ProjectOverview|</p>
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
						<a href="https://maps.google.com/?q=|GeoCode|" target="_blank">
							<img src="//maps.googleapis.com/maps/api/staticmap?size=475x250&markers=%7Ccolor:0x6ECDDC%7C|GeoCode|&sensor=false&visual_refresh=true&scale=2&zoom=15&key=|GoogleAPIKey|" 
								 border="1px" width="475" height="250"/>
						</a>
					</td>
					<td width="50%">
						<cfparam name="HideStreetView" default="0">
						<cfif HideStreetView EQ 1>
							<img src="img/NoImage.png" alt="No Image Available" >
						<cfelse>
							<img src="//maps.googleapis.com/maps/api/streetview?size=475x255&location=|GeoCode|&sensor=false&key=|GoogleAPIKey|<cfif ProjectGeoHeading NEQ "">&heading=|GeoHeading|</cfif>" 
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
				        <td colspan="3">|ProjectComponent|</td>
				    </tr>
				    <!---/ Project Type --->
				    <!--- Total Project Budget --->
				    <tr>
				        <td width="200"><strong>Total Project Budget</strong></td>
				        <td colspan="3"><cfif NumAns02 EQ 0 OR NumAns02 EQ ""> TBD Local Application Response <cfelse>|NumAns2|</cfif></td>
				    </tr>
				    <!---/ Total Project Budget --->
				   
				    <!--- Amount of Grant --->
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong> 
				        <td width="300">|ContractAmount|
				    	</td>
				        <td width="100">Expended
				    	</td>
				        <td >
				        	<cfif GRANTEXPENDAMOUNT EQ 0 OR GRANTEXPENDAMOUNT EQ ""> TBD Local Application Response <cfelse>|Expended| </cfif>
				    	</td>
				    </tr>
				    <!---/ Amount of Grant --->
				    
				   
				    <tr>
				        <td width="200" valign="top"><strong>Persons Served in Last Operating Year</strong></td>
				        <td colspan="3">
				        	<p>
					        	<cfif apr09_HH_Total NEQ "">
				        			|Households| households
				        			<cfif apr08_Children_Total NEQ 0 AND apr08_Adult_Total EQ 0>
				        				(|Children| children)
				        			<cfelseif apr08_Children_Total NEQ 0>
				        				(|Adults| adults |Children| children)
				        			<cfelseif apr08_Adult_Total NEQ 0>
				        				(|Participants| individuals)
				        			</cfif>
				        			<cfelseif apr08_Children_Total NEQ 0>
				        				|Adults| adults |Children| children
				        			<cfelse>
				        				|Adults| individuals
				        		</cfif>
					        		
				        	</p>
				        	<p>
								Of the persons served last year, at entry 

								|MentalIllness| were mentally ill, 

								|Alcohol| had experience with alcohol abuse, 

								|Drugs| had experience with drug abuse, 

								|HIV| had HIV/AIDS and related diseases, 

								|ChronicHealth| had a chronic health condition, 

								|DevelopmentalDisability| had a developmental disability, and 

								|PhysicalDisability| had a physical disability.    
				        	</p>
				        	<p>
				        		Of the persons served last year, at entry, 

				        		|NoDisablities| had no conditions, 

				        		|OneDisability| had one condition, 

				        		|TwoDisabilities| had two conditions, and 

				        		|ThreePlusDisabilities| had three or more conditions.
				        	</p>


				        	<cfif apr19DV_Yes_Total NEQ 0>
				        		<p>|DomesticViolence| of the adults served had past domestic violence experience; |DVPastYear| had domestic violence experience in the past year.</p>
				        	<cfelseif apr19DV_Yes_Total EQ 0>
				        		<p>None of the persons served had past domestic violence experience.</p>
				        	</cfif>
				        	<p>
				        	The program served 
				        	|Seniors| seniors and 
				        	|Veterans| veterans.
				        	</p>
				        </td>
				    </tr>
				    <!---/ Persons Served  --->

				   
				    <!--- Population Served --->
				    <cfif popServed NEQ "">
				    	<tr>
					        <td width="200"><strong>Population Served</strong></td>
					        <td colspan="3">|PopulationServed|</td>
					    </tr>
				    </cfif>
				    <!---/ Population Served --->
				    <!--- Services Provided --->
				    <cfif ServicesProvided NEQ "">
					    <tr>
					        <td width="200"><strong>Services Provided</strong></td>
					        <td colspan="3">|ServicesProvided|</td>
					    </tr>
				    </cfif>
				    <!---/  Services Provided --->

				    <!--- Housing Provided --->
				    <cfif HousingProvided NEQ "">
				    <tr>
				        <td width="200"><strong>Housing Provided</strong></td>
				        <td colspan="3">|HousingProvided|</td>
				    </tr>
				    </cfif>
				    <!---/  Housing Provided --->

				    <!--- Venues for Service --->
				    <cfif VenuesForService NEQ "">
					    <tr>
					        <td width="200"><strong>Venue(s) for Service</strong></td>
					        <td colspan="3">|Venues|</td>
					    </tr>
				    </cfif>
				    <!---/  Venues for Service --->
				</tbody>
			</table>
        <h></h>
        <h></h>
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
					Excluding |dead| tenant<cfif dead GT 1>s</cfif> who passed away,
				</cfif>
				|ExitToPH| of |Living|
				(|PercLivingExitPH|%)
				participants exited to permanent housing. (4a2)
			</p>
						<cfif (apr29Less90_Dead_Total+apr29More90_Dead_Total) GT 0>
							Excluding |dead| tenant<cfif (apr29Less90_Dead_Total+apr29More90_Dead_Total) GT 1>s</cfif> who passed away,
						</cfif>
						|ExitToPH| of |LivingLeavers| 
							<cfif (apr07_TotalLeavers-(apr29Less90_Dead_Total+apr29More90_Dead_Total)) NEQ 0>
								(|PercLivingExitPH|%)
							</cfif>
						exiting tenants left for permanent housing opportunities
                    <cfif ((apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total)/(apr07_TotalLeavers-(apr29Less90_Dead_Total+apr29More90_Dead_Total))) GT 0>, including
							<cfif (apr29More90_OwnedNoSubsidy_Total+apr29More90_OwnedSubsidy_Total+apr29Less90_OwnedNoSubsidy_Total+apr29Less90_OwnedSubsidy_Total) NEQ 0>
								|ExitOwned| in housing they own, 
							</cfif>

							<cfif (apr29More90_RentalVASHSubsidy_Total+apr29Less90_RentalVASHSubsidy_Total) NEQ 0>
								|ExitVASHRental| in VASH subsidized rental housing, 
								<cfif (apr29More90_RentalOtherSubsidy_Total+apr29Less90_RentalOtherSubsidy_Total) NEQ 0>
									|ExitOtherSub| with other rental subsidies, 
								</cfif>
							<cfelse>
								<cfif (apr29More90_RentalOtherSubsidy_Total+apr29Less90_RentalOtherSubsidy_Total) NEQ 0>
									|ExitOtherSub| in subsidized rental housing, 
								</cfif>
							</cfif>
							<cfif (apr29More90_RentalNoSubsidy_Total+ apr29Less90_RentalNoSubsidy_Total) NEQ 0>
								|ExitNoSub| in unsubsidized rental housing, 
							</cfif>

							<cfif (apr29More90_PSH_Total+apr29Less90_PSH_Total) NEQ 0>
								|ExitPSH| in permanent supportive housing, 
							</cfif>
							<cfif ExitPermONS EQ 0 AND ExitPermVASH EQ 0 AND ExitPermPSH EQ 0 AND TotalLeaversExitingToPH NEQ 0 AND (TotalLeaversExitingToPH-ExitPermFamily) NEQ 1>
									|ExitPermFriendsOrFamily| living permanently with friends or family.
							<cfelseif (TotalLeaversExitingToPH) NEQ 0>
									and |ExitPermFriendsOrFamily| living permanently with friends or family.
							</cfif>
						<cfelse>.</cfif>
					</p>
				<!---/ PSH-SHP and S+C --->
				
				<!--- TH Sentences --->
				<p>
						<cfif (apr07_TotalLeavers-(apr29Less90_Dead_Total+apr29More90_Dead_Total)) NEQ 0>
							<cfif (apr29More90_TempTotal_Total+apr29Less90_TempTotal_Total) EQ 0>
								|ExitTemporary| of |LivingLeavers| (|PercExitTemporary|%) exiting participants were living in temporary destinations.
							<cfelse>
								|ExitTemporary| of |LivingLeavers| (|PercExitTemporary|%) exiting participants were living in temporary destinations, including
								<cfif (apr29More90_NoHumanHabitation_Total+apr29Less90_NoHumanHabitation_Total) NEQ 0>
									|ExitNotMeantForHuman| in places not meant for human habitation, 
								</cfif>
								<cfif (apr29More90_EShelter_Total+apr29Less90_EmergShelter_Total) NEQ 0>
									|ExitEmergencyShelter| in emergency shelters, 
								</cfif>
								<cfif (apr29More90_SH_Total+apr29Less90_SH_Total) NEQ 0>
									|ExitSafeHaven| in Safe Havens, 
								</cfif>
								<cfif (apr29More90_Hotel_Total+apr29Less90_Hotel_Total) NEQ 0>
									|ExitHotel| in hotels or motels, 
								</cfif>
								<cfif (apr29More90_TempFamily_Total+apr29More90_TempFriends_Total+apr29Less90_TempFriend_Total+apr29Less90_TempFamily_Total) NEQ 0>
									|ExitTempFriendsOrFamily| staying temporarily with friends or family, 
								</cfif>

									<cfif (apr29More90_NoHumanHabitation_Total+apr29Less90_NoHumanHabitation_Total) EQ 0 AND (apr29More90_EShelter_Total+apr29Less90_EmergShelter_Total) EQ 0 AND (apr29More90_SH_Total+apr29Less90_SH_Total) EQ 0 AND (apr29More90_Hotel_Total+apr29Less90_Hotel_Total) EQ 0 AND (apr29More90_TempFamily_Total+apr29More90_TempFriends_Total+apr29Less90_TempFriend_Total+apr29Less90_TempFamily_Total) EQ 0>
										|ExitTH| in transitional housing.
									<cfelse>
										and |ExitTH| in transitional housing.
									</cfif>
								</cfif>
							
							</cfif>
						</p>
			<!---/ TH Sentences --->

			<!--- Inst Sentences --->
			<p>
				|ExitInstitution| went to an institution<cfif (apr29Less90_InstTotal_Total+apr29More90_InstTotal_Total) GT 0>, including</cfif>
				<cfif apr29Less90_Detox_Total GT 0 OR apr29More90_Detox_Total GT 0>
					|ExitDetox| in detox,
				</cfif>
				<cfif apr29Less90_Foster_Total GT 0 OR apr29More90_Foster_Total GT 0>
					|ExitFosterCare| in foster care,
				</cfif>
				<cfif apr29Less90_Hospital_Total GT 0 OR apr29More90_Hospital_Total GT 0>
					|ExitHospital| in hospital(s),
				</cfif>
				<cfif apr29Less90_Psych_Total GT 0 OR apr29More90_Psych_Total GT 0>
					|ExitPyschiatric| in psychiatric facilities,
				</cfif>
				<cfif (apr29Less90_InstTotal_Total+apr29More90_InstTotal_Total) GT 0>and |ExitJail| in jail.</cfif>
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
						|ExitLessThan90DaysPerm| of |LeaversLessThan90|
							(|PercExitLessThan90DaysPerm|%)
					</td>
					<td valign="top" class="text-center">
						|ExitMoreThan90DaysPerm| of |LeaversMoreThan90|
							(|PercExitMoreThan90DaysPerm|%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						Temporary Destinations
					</td>
					<td valign="top" class="text-center">
						|ExitLessThan90DaysTemp| of |LeaversLessThan90|
						(|PercExitLessThan90DaysTemp|%)
					</td>
					<td valign="top" class="text-center">
						|ExitMoreThan90DaysTemp| of |LeaversMoreThan90|
						(|PercExitMoreThan90DaysTemp|%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						Institutional Settings
					</td>
					<td valign="top" class="text-center">
						|ExitLessThan90DaysInst| of |LeaversLessThan90|
							(|PercExitLessThan90DaysInst|%)
					</td>
					<td valign="top" class="text-center">
						|ExitMoreThan90DaysInst| of |LeaversMoreThan90|
							(|PercExitMoreThan90DaysInst|%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						Other Destinations</p>
					</td>
					<td valign="top" class="text-center">
						|ExitLessThan90DaysOther| of |LeaversLessThan90|
						(|PercExitLessThan90DaysOther|%)
					</td>
					<td valign="top" class="text-center">
						|ExitMoreThan90DaysOther| of |LeaversMoreThan90|
							(|PercExitMoreThan90DaysOther|%)
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
		</div>
	</div>
<!---/ Residential Stability --->

<!--- Income --->
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Program Performance and Client Outcomes: Income and Mainstream Resources (Scored Factors 4b-4c)</h2>
				<p> |IncreasedTotalInc| of |Adults|
				<cfif apr08_Adult_Total GT 0>(|PercIncreasedTotalInc|%) </cfif>
				adult participants increased income. (4b) </p>
				<p>|NonCashBenefits| of |Participants| (|PercNonCashBenefits|%) participants had at least one source of non-cash mainstream resources at follow-up or program exit. (4c)</p>
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
						|AdultLeaversLessIncome| of |AdultLeavers|
							(|PercAdultLeaversLessIncome|%)
					</td>
					<td valign="top" class="text-center">
						|AdultStayersLessIncome| of |AdultStayers|
							(|PercAdultStayersLessIncome|%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						Same Income at Follow Up or Exit
					</td>
					<td valign="top" class="text-center">
						|AdultLeaversSameIncome| of |AdultLeavers|
						(|PercAdultLeaversSameIncome|%)
					</td>
					<td valign="top" class="text-center">
						|AdultStayersSameIncome| of |AdultStayers|
						(|PercAdultStayersSameIncome|%)
					</td>
				</tr>
				<tr>
					<td valign="top">
						More Income at Follow Up or Exit
					</td>
					<td valign="top" class="text-center">
						|AdultLeaversMoreIncome| of |AdultLeavers|
							(|PercAdultLeaversMoreIncome|%)
					</td>
					<td valign="top" class="text-center">
						|AdultStayersMoreIncome| of |AdultStayers|
							(|PercAdultStayersMoreIncome|%)
					</td>
				</tr>
				
				<cfif LeaversUnknownIncomeExit+apr07_TotalLeavers GT 0>
					<tr>
						<td valign="top">
							Unknown Income at Follow Up or Exit</p>
						</td>
						<td valign="top" class="text-center">
							|AdultLeaversUnknownIncome| of |AdultLeavers|
							(|AdultLeaversUnknownIncome|%)
						</td>
						<td valign="top" class="text-center">
							|AdultStayersUnknownIncome| of |AdultStayers|
								<cfif apr25Stayers_Total_Adult NEQ 0>
									(|PercAdultStayersUnknownIncome|%)
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
										|AverageIncomeAtEntry|
									</td>
								</tr>
								<tr>
									<td valign="top">
										Average Monthly Income at Follow Up or Exit (Assumes highest end of APR range; maximum income of $2250/month.)
									</td>
									<td valign="top" class="text-center">
										|AverageIncomeAtFollowUpExit|
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
											|AdultLeaversEarned| of |AdultLeavers| (|PercAdultLeaversEarned|%)
										</td>
										<td valign="top" class="text-center">
											|AdultStayersEarned| of |AdultStayers| (|PercAdultStayersEarned|%)
										</td>
									</tr>
								</cfif>
								<cfif apr25Leavers_Unemployment_Adult + apr25Stayers_Unemployment_Adult GT 0>
									<tr>
										<td valign="top">
											Unemployment
										</td>
										<td valign="top" class="text-center">
											|AdultLeaversUnemployment| of |AdultLeavers| (|PercAdultLeaversUnemployment|%)
										</td>
										<td valign="top" class="text-center">
											|AdultStayersUnemployment| of |AdultStayers| (|PercAdultStayersUnemployment|%)
										</td>
									</tr>
								</cfif>
								<cfif apr25Leavers_SSI_Adult + apr25Stayers_SSI_Adult GT 0>
								<tr>
									<td valign="top">
										SSI
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversSSI| of |AdultLeavers| (|PercAdultLeaversSSI|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersSSI| of |AdultStayers| (|PercAdultStayersSSI|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_SSDI_Adult + apr25Stayers_SSDI_Adult GT 0>
								<tr>
									<td valign="top">
										SSDI
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversSSDI| of |AdultLeavers| (|PercAdultLeaversSSDI|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersSSDI| of |AdultStayers| (|PercAdultStayersSSDI|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_VetDisability_Adult + apr25Stayers_VetDisability_Adult GT 0>
									<tr>
										<td valign="top">
											Veterans Disability Income
										</td>
										<td valign="top" class="text-center">
											|AdultLeaversVetDisability| of |AdultLeavers| (|PercAdultLeaversVetDisability|%)
										</td>
										<td valign="top" class="text-center">
											|AdultStayersVetDisability| of |AdultStayers| (|PercAdultStayersVetDisability|%)
										</td>
									</tr>
								</cfif>
								<cfif apr25Leavers_PrivateDisability_Adult + apr25Stayers_PrivateDisability_Adult GT 0>
								<tr>
									<td valign="top">
										Private Disability Insurance
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversPrivDisability| of |AdultLeavers| (|PercAdultLeaversPrivDisability|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersPrivDisability| of |AdultStayers| (|PercAdultStayersPrivDisability|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_WorkersComp_Adult + apr25Stayers_WorkersComp_Adult GT 0>
								<tr>
									<td valign="top">
										Workers Compensation
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversWorkersComp| of |AdultLeavers| (|PercAdultLeaversWorkersComp|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersWorkersComp| of |AdultStayers| (|PercAdultStayersWorkersComp|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_TANF_Adult + apr25Stayers_TANF_Adult GT 0>
								<tr>
									<td valign="top">
										TANF
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversTANF| of |AdultLeavers| (|PercAdultLeaversTANF|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersTANF| of |AdultStayers| (|PercAdultStayersTANF|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_GA_Adult + apr25Stayers_GA_Adult GT 0>
								<tr>
									<td valign="top">
										General Assistance
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversGA| of |AdultLeavers| (|PercAdultLeaversGA|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersGA|
 of |AdultStayers| (|PercAdultStayersGA|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_Retirement_Adult + apr25Stayers_Retirement_Adult GT 0>
									<tr>
										<td valign="top">
											Retirement
										</td>
										<td valign="top" class="text-center">
											|AdultLeaversRetirement| of |AdultLeavers| (|PercAdultLeaversRetirement|%)
										</td>
										<td valign="top" class="text-center">
											|AdultStayersRetirement| of |AdultStayers| (|PercAdultStayersRetirement|%)
										</td>
									</tr>
								</cfif>
								<cfif apr25Leavers_VetPension_Adult + apr25Stayers_VetPension_Adult GT 0>
								<tr>
									<td valign="top">
										Veterans Pension
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversVetPension| of |AdultLeavers| (|PercAdultLeaversVetPension|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersVetPension| of |AdultStayers| (|PercAdultStayersVetPension|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_JobPension_Adult + apr25Stayers_JobPension_Adult GT 0>
									<tr>
										<td valign="top">
											Pension from Former Job
										</td>
										<td valign="top" class="text-center">
											|AdultLeaversJobPension| of |AdultLeavers| (|PercAdultLeaversJobPension|%)
										</td>
										<td valign="top" class="text-center">
											|AdultStayersJobPension| of |AdultStayers| (|PercAdultStayersJobPension|%)
										</td>
									</tr>
								</cfif>
								<cfif apr25Leavers_ChildSupport_Adult + apr25Stayers_ChildSupport_Adult GT 0>
								<tr>
									<td valign="top">
										Child Support
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversChildSupport| of |AdultLeavers| (|PercAdultLeaversChildSupport|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersChildSupport| of |AdultStayers| (|PercAdultStayersChildSupport|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_Alimony_Adult + apr25Stayers_Alimony_Adult GT 0>
								<tr>
									<td valign="top">
										Alimony
									</td>
									<td valign="top" class="text-center">
										|AdultLeaversAlimony| of |AdultLeavers| (|PercAdultLeaversAlimony|%)
									</td>
									<td valign="top" class="text-center">
										|AdultStayersAlimony| of |AdultStayers| (|PercAdultStayersAlimony|%)
									</td>
								</tr>
								</cfif>
								<cfif apr25Leavers_Other_Adult + apr25Stayers_Other_Adult>
									<tr>
										<td valign="top">
											Other Source
										</td>
										<td valign="top" class="text-center">
											|AdultLeaversOther| of |AdultLeavers| (|PercAdultLeaversOther|%)
										</td>
										<td valign="top" class="text-center">
											|AdultStayersOther| of |AdultStayers| (|PercAdultStayersOther|%)
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
						|LeaversSNAP| of |Leavers| (|PercLeaversSNAP|%)
					</td>
					<td valign="top" class="text-center">
						|StayersSNAP| of |Stayers| (|PercStayersSNAP|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicaid_Total+apr26Stayers_Medicaid_Total GT 0>
				<tr>
					<td valign="top">
						Medicaid
					</td>
					<td valign="top" class="text-center">
						|LeaversMedicaid| of |Leavers| (|PercLeaversMedicaid|%)
					</td>
					<td valign="top" class="text-center">
						|StayersMedicaid| of |Stayers| (|PercStayersMedicaid|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Medicare_Total+apr26Stayers_Medicare_Total GT 0>
				<tr>
					<td valign="top">
						Medicare
					</td>
					<td valign="top" class="text-center">
						|LeaversMedicare| of |Leavers| (|PercLeaversMedicare|%)
					</td>
					<td valign="top" class="text-center">
						|StayersMedicare| of |Stayers| (|PercStayersMedicare|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_StateChildHealthIns_Total+apr26Stayers_StateChildHealthIns_Total GT 0>
				<tr>
					<td valign="top">
						State Children's Health Insurance
					</td>
					<td valign="top" class="text-center">
						|LeaversChildHealth| of |Leavers| (|PercLeaversChildHealth|%)
					</td>
					<td valign="top" class="text-center">
						|StayersChildHealth| of |Stayers| (|PercStayersChildHealth|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_WIC_Total+apr26Stayers_WIC_Total GT 0>
				<tr>
					<td valign="top">
						WIC
					</td>
					<td valign="top" class="text-center">
						|LeaversWIC| of |Leavers| (|PercLeaversWIC|%)
					</td>
					<td valign="top" class="text-center">
						|StayersWIC| of |Stayers| (|PercStayersWIC|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_VAMed_Total+apr26Stayers_VAMed_Total GT 0>
				<tr>
					<td valign="top">
						VA Medical Services
					</td>
					<td valign="top" class="text-center">
						|LeaversVAMedical| of |Leavers| (|PercLeaversVAMedical|%)
					</td>
					<td valign="top" class="text-center">
						|StayersVAMedical| of |Stayers| (|PercStayersVAMedical|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TANFChildcare_Total+apr26Stayers_TANFChildcare_Total GT 0>
				<tr>
					<td valign="top">
						TANF Child Care
					</td>
					<td valign="top" class="text-center">
						|LeaversTANFChild| of |Leavers| (|PercLeaversTANFChild|%)
					</td>
					<td valign="top" class="text-center">
						|StayersTANFChild| of |Stayers| (|PercStayersTANFChild|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TANFTransit_Total+apr26Stayers_TANFTransit_Total GT 0>
				<tr>
					<td valign="top">
						TANF Transit
					</td>
					<td valign="top" class="text-center">
						|LeaversTANFTransit| of |Leavers| (|PercLeaversTANFTransit|%)
					</td>
					<td valign="top" class="text-center">
						|StayersTANFTransit| of |Stayers| (|PercStayersTANFTransit|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_TempRA_Total+apr26Stayers_TempRA_Total GT 0>
				<tr>
					<td valign="top">
						Other Temporary Rental Assistance
					</td>
					<td valign="top" class="text-center">
						|LeaversTempRA| of |Leavers| (|PercLeaversTempRA|%)
					</td>
					<td valign="top" class="text-center">
						|StayersTempRA| of |Stayers| (|PercStayersTempRA|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Section8_Total+apr26Stayers_Section8_Total GT 0>
				<tr>
					<td valign="top">
						Section 8
					</td>
					<td valign="top" class="text-center">
						|LeaversSection8| of |Leavers| (|PercLeaversSection8|%)
					</td>
					<td valign="top" class="text-center">
						|StayersSection8| of |Stayers| (|PercStayersSection8|%)
					</td>
				</tr>
				</cfif>
				<cfif apr26Leavers_Other_Total+apr26Stayers_Other_Total GT 0>
				<tr>
					<td valign="top">
						Other Source
					</td>
					<td valign="top" class="text-center">
						|LeaversOtherNonCash| of |Leavers| (|PercLeaversOtherNonCash|%)
					</td>
					<td valign="top" class="text-center">
						|StayersOtherNonCash| of |Stayers| (|PercStayersOtherNonCash|%)
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

		</div>
	</div>
<!---/ Income --->

<!--- Utilization --->

<h2 class="MakePrimary">Program Performance and Client Outcomes: Program Occupancy (Scored Factors 4d and 5b)</h2>

<p> The average unit occupancy rate for this program is |AverageUtilization|%. (4d) </p>

<div class="row">
	<div class="large-12 columns">
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
						       				|JanUtilization|%
						       			</cfif>
						       			(|JanPIT| of |Units|)</td>
						       		</tr>
						       		<tr>
						       			<td>April</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				|AprUtilization|%
						       			</cfif>
						       			(|AprPIT| of |Units|)</td>
						       		</tr>
						       		<tr>
						       			<td>July</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				|JulUtilization|%
						       			</cfif>
						       			(|JulPIT| of |Units|)</td>
						       		</tr>
						       		<tr>
						       			<td>October</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				|OctUtilization|%
						       			</cfif>
						       			(|OctPIT| of |Units|)</td>
						       		</tr>
					       		</tbody>
		       				</table>
		       			<!---/ Data Table --->
	</div>
</div>
<!---/ Utilization --->

<!--- Length of Participation --->
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Program Performance and Client Outcomes: Length of Stay (Scored Factor 4e)</h2>

		<table width="100%">
			<thead>
				<th></th>
				<th class="text-center">Average Length (Days)</th>
				<th class="text-center">Median Length (Days)</th>
			</thead>
			<tbody>
				<tr>
					<td>Leavers</td>
					<td class="text-center">|LeaversAverageLength|</td>
					<td class="text-center">|StayersAverageLength|</td>
				</tr>
				<tr>
					<td>Stayers</td>
					<td class="text-center">"|LeaversMedianLength|
"</td>
					<td class="text-center">|StayersMedianLength|</td>
				</tr>
			</tbody>
		</table>

	<p>Information to be added from Renewal Project Local Application response (Program Performance and Client Outcomes question 2).</p>

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
	</div>
</div>
<!---/ Length of Stay --->

<!--- Returns to Homelessness --->
<div class="row">
	<div class="large-12 columns">

<h2 class="MakePrimary">Program Performance and Client Outcomes: Returns to Homelessness (Unscored Factor 4f)</h2>

	<cfif dead GT 0>
		Excluding |dead| participants<cfif dead GT 1>s</cfif> who passed away,
	</cfif>
	<p>|ExitToHomelessness| of |Living| (|PercExitToHomelessness|%) participants exited to emergency shelter, transitional housing, a hotel or motel, or a place not meant for human habitation.</p>

	<p>Information to be added from Renewal Project Local Application response (Program Performance and Client Outcomes question 3).</p>
	</div>
</div>
<!---/ Returns to Homelessness --->

<!--- Budget and Admin Efficiency --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Budget & Administrative Efficiency (Scored Factors 5a-5b)</h2>

		<p>Information to be added from Renewal Project Local Application response (Budget and Cost Effectiveness questions), as well as match and leverage information.</p>

	</div>
</div>
<!---/ Budget and Admin Efficiency --->

<!--- Service Improvement Efforts --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Service Improvement Efforts (Scored Factors 6a-6c)</h2>

		<p>Information to be added from Renewal Project Local Application response (Service Improvement Efforts questions).</p>

	</div>
</div>
<!---/ Service Improvement Efforts --->

<!--- HMIS and Data Improvement Efforts --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">HMIS & Data Collection Capacity (Scored Factors 7a-7d)</h2>

		<p>Information to be added from Renewal Project Local Application response (HMIS and Data Collection Capacity questions).</p>

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
							<td>|FirstNameDKR|</td>
							<td>|FirstNameMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercFirstNameMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_LName_DKR + apr07_LName_Missing) GT 0>
						<tr>
							<td>Last Name</td>
							<td>|LastNameDKR|</td>
							<td>|LastNameMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercLastNameMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_SSN_DKR + apr07_SSN_Missing) GT 0>
						<tr>
							<td>SSN</td>
							<td>|SSNDKR|</td>
							<td>|SSNMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercSSNMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_DoB_DKR + apr07_DoB_Missing) GT 0>
						<tr>
							<td>Date of Birth (DOB)</td>
							<td>|DoBDKR|</td>
							<td>|DoBMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercDoBMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Race_DKR + apr07_Race_Missing) GT 0>
						<tr>
							<td>Race</td>
							<td>|RaceDKR|</td>
							<td>|RaceMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercRaceMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Ethnicity_DKR + apr07_Ethnicity_Missing) GT 0>
						<tr>
							<td>Ethnicity</td>
							<td>|EthnicityDKR|</td>
							<td>|EthnicityMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercEthnicityMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Gender_DKR + apr07_Gender_Missing) GT 0>
						<tr>
							<td>Gender</td>
							<td>|GenderDKR|</td>
							<td>|GenderMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercGenderMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Vet_DKR + apr07_Vet_Missing) GT 0>
						<tr>
							<td>Veteran Status</td>
							<td>|VeteranDKR|</td>
							<td>|VeteranMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercVeteranMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Disabling_DKR + apr07_Disabling_Missing) GT 0>
						<tr>
							<td>Disabling Condition</td>
							<td>|DisablingDKR|</td>
							<td>|DisablingMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercDisablingMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_ResidencePrior_DKR + apr07_ResidencePrior_Missing) GT 0>
						<tr>
							<td>Residence Prior to Entry</td>
							<td>|ResidenceDKR|</td>
							<td>|ResidenceMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercResidenceMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Zip_DKR + apr07_Zip_Missing) GT 0>
						<tr>
							<td>Zip of Last Permanent Address</td>
							<td>|ZipDKR|</td>
							<td>|ZipMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercZipMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_HousingStatus_DKR + apr07_HousingStatus_Missing) GT 0>
						<tr>
							<td>Housing Status (at entry)</td>
							<td>|HousingStatusDKR|</td>
							<td>|HousingStatusMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercHousingStatusMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_IncEntry_DKR + apr07_IncEntry_Missing) GT 0>
						<tr>
							<td>Income (at entry)</td>
							<td>|IncEntryDKR|</td>
							<td>|IncEntryMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercIncEntryMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_IncExit_DKR + apr07_IncExit_Missing) GT 0>
						<tr>
							<td>Income (at exit)</td>
							<td>|IncExitDKR|</td>
							<td>|IncExitMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercIncExitMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_NonCashEntry_DKR + apr07_NonCashEntry_Missing) GT 0>
						<tr>
							<td>Non-cash benefits (at entry)</td>
							<td>|NonCashEntryDKR|</td>
							<td>|NonCashEntryMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercNonCashEntryMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_NonCashExit_DKR + apr07_NonCashExit_Missing) GT 0>
						<tr>
							<td>Non-cash benefits (at exit)</td>
							<td>|NonCashExitDKR|</td>
							<td>|NonCashExitMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercNonCashExitMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_PhysDisability_DKR + apr07_PhysDisability_Missing) GT 0>
						<tr>
							<td>Physical Disability (at entry)</td>
							<td>|PhysDisabilityDKR|</td>
							<td>|PhysDisabilityMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercPhysDisabilityMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_DevDisability_DKR + apr07_DevDisability_Missing) GT 0>
						<tr>
							<td>Developmental Disability (at entry)</td>
							<td>|DevDisabilityDKR|</td>
							<td>|DevDisabilityMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercDevDisabilityMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_ChronicHealth_DKR + apr07_ChronicHealth_Missing) GT 0>
						<tr>
							<td>Chronic Health Condition (at entry)</td>
							<td>|ChronicDKR|</td>
							<td>|ChronicMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercChronicMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_HIV_DKR + apr07_HIV_Missing) GT 0>
						<tr>
							<td>HIV/AIDS (at entry)</td>
							<td>|HIVDKR|</td>
							<td>|HIVMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercHIVMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_MentalHealth_DKR + apr07_ChronicHealth_Missing) GT 0>
						<tr>
							<td>Mental Health (at entry)</td>
							<td>|MentalHealthDKR|</td>
							<td>|MentalHealthMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercMentalHealthMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_SA_DKR + apr07_SA_Missing) GT 0>
						<tr>
							<td>Substance Abuse (at entry)</td>
							<td>|SADKR|</td>
							<td>|SAMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercSAMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_DV_DKR + apr07_DV_Missing) GT 0>
						<tr>
							<td>Domestic Violence (at entry)</td>
							<td>|DVDKR|</td>
							<td>|DVMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercDVMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<cfif (apr07_Dest_DKR + apr07_Dest_Missing) GT 0>
						<tr>
							<td>Destination</td>
							<td>|DestinationDKR|</td>
							<td>|DestinationMissing|</td>
							<td>
								<cfif apr08_Total NEQ 0>
									|PercDestinationMissingDKR|%
								</cfif>
							</td>
						</tr>
					</cfif>
					<tr>
						<td><b>Overall</b></td>
						<td><b>|DKRHMISData|</b></td>
						<td><b>|MissingHMISData|</b></td>
						<td><b>|PercMissingDKRHMIS|%</b></td>
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

		<p>Information to be added from Renewal Project Local Application response (Community Vision & Coordination questions).</p>

	</div>
</div>
<!---/ Community Vision and Coordination --->

<!--- Increase in Permanent Housing Beds --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Increase in Permanent Housing Beds (Bonus Points Scored Factor 9a)</h2>

		<p>Information to be added from Renewal Project Local Application response (Bonus question).</p>

	</div>
</div>
<!---/ Increase in Permanent Housing Beds --->
</cfoutput>