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

<!--- Program Location --->
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
<!---/ Program Location --->

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
				</tbody>
			</table>
	</div>
</div>
<!---/ At A Glance --->
                
<!--- Factor1: Outcomes --->
    <!--- Utlization --->
    <div class="row">
        <div class="large-12 columns">
            <h2 class="MakePrimary"> Factor 1: Outcomes </h2>
            <h3 class="">Capacity</h3>
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
        </div>
    </div>

    <!---/ Utlization --->    
    
    <!--- Housing Stability --->

	<div class="row">
		<div class="large-12 columns text-left">
            <h3 class=""> Housing Stability </h3>
                <p>
                    <cfif dead GT 0>
                        Excluding #dead# tenant<cfif dead GT 1>s</cfif> who passed away,
                    </cfif>
                    #(apr25Stayers_Total_Total+apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total)# of #(apr07_TotalClients-dead)# 
                    (#NumberFormat(((apr25Stayers_Total_Total+apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total)/apr08_Total)*100, "__")#%)
                    participants remained in the project or exited to permanent housing.
                </p>
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

							<cfset ExitPermPSH = (apr29More90_PSH_Total+apr29Less90_PSH_Total )>
							<cfif ExitPermPSH NEQ 0>
								#ExitPermPSH# in permanent supportive housing, 
							</cfif>
							<cfset ExitPermFamily = (apr29More90_PermFamily_Total+apr29More90_PermFriend_Total+ apr29Less90_PermFamily_Total+apr29Less90_PermFriend_Total)>
							<cfif ExitPermONS EQ 0 AND ExitPermVASH EQ 0 AND ExitPermPSH EQ 0 AND TotalLeaversExitingToPH NEQ 0 AND (TotalLeaversExitingToPH-ExitPermFamily) NEQ 1>
									#ExitPermFamily# living permanently with friends or family.
							<cfelseif (TotalLeaversExitingToPH) NEQ 0>
									and #ExitPermFamily# living permanently with friends or family.
							</cfif>
						<cfelse>.</cfif>
					</p>
				<!---/ PSH-SHP and S+C --->
				
				<!--- TH Sentences --->
				<p>
						<cfif LivingLeavers NEQ 0>
							<cfif dead GT 0>
							Excluding #dead# tenant<cfif dead GT 1>s</cfif> who passed away,
							</cfif>
							<cfset ExitTransPercent = ((apr29More90_TempTotal_Total+apr29Less90_Temapr08_Total_Total)/LivingLeavers)>
							<cfif (apr29More90_TempTotal_Total+apr29Less90_Temapr08_Total_Total) EQ 0>
								#(apr29More90_TempTotal_Total+apr29Less90_Temapr08_Total_Total)# of #LivingLeavers# (#NumberFormat(ExitTransPercent*100, "__")#%) exiting participants were living in temporary destinations.
							<cfelse>
								#((apr29More90_TempTotal_Total+apr29Less90_Temapr08_Total_Total))# of #LivingLeavers# (#NumberFormat(ExitTransPercent*100, "__")#%) exiting participants were living in temporary destinations, including
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
    <!---/ Housing Stability --->
    
    <!--- Destination At Exit --->
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
    <!---/ Destination At Exit --->
    
    <!--- Length of Participation --->
    <div class="row">
        <div class="large-12 columns">
            <h3 class="">Length of Participation</h3>
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
    <!---/ Length of Participation --->

    <!--- Income and Benefits --->
                                
    <div class="row">
		<div class="large-12 columns text-left">
            <h3 class=""> Income and Benefits </h3>				
                    <p>
                        
						#LeaversIncrease# of #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
							(#NumberFormat(((apr24Leavers_NumEarned_More+apr24Leavers_NumEarned_Gained)/apr25Leavers_Total_Adults)*100, "__")#%)
						</cfif>
						of adult leavers increased their employment income from entry to exit. 
							
					</p>
					<p>
                        
						#LeaversOtherIncrease# or #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
							(#NumberFormat(((apr24Leavers_NumOther_More+apr24Leavers_NumOther_Gained)/apr25Leavers_Total_Adults)*100, "__")#%)
						</cfif>
						 of adult leavers increased their non-employment income from entry to exit.
							
					</p>
				</div>
			</div>
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
		</div>
	</div>
                                
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
									<cfif   LeaversWithLessIncomeAtExit+apr29Less90_Temapr08_Total_Total+LeaversWithMoreIncomeAtExit+LeaversUnknownIncomeExit EQ 0 OR  StayersWithLessIncomeAtExit+apr24Stayers_NumOverall_Same+StayersWithMoreIncomeAtExit+StayersUnknownIncomeExit+StayersUnknownIncomeExit EQ 0>
										<cfset ChartWidth="900">
									<cfelse>
										<cfset ChartWidth="450">
									</cfif>
									<cfif LeaversWithLessIncomeAtExit+apr29Less90_Temapr08_Total_Total+LeaversWithMoreIncomeAtExit+LeaversUnknownIncomeExit GT 0>
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

        <!--- Sources of Cash Income --->                                            
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

                </div>
            </div> 
            <div class="row">
                <div class="large-12 columns">
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
            </div>
        </div>                                            
        <!---/ Sources of Cash Income --->                                        

        <!--- Sources of Non-Cash Income --->                                    
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
        <div class="row">
            <div class="large-12 columns">

                    <table width="100%">
                        <thead>
                            <th>Number of Non-Cash Benefit Sources</th>
                            <th>Percent of Adults</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td> No Source</td>

                                <td>#(apr26Stayers_NoSources_Adult+apr26Leavers_NoSources_Adult)# of #apr08_Adult_Total# 
                                    <cfif apr08_Adult_Total NEQ 0>
                                    (#numberFormat((apr26Stayers_NoSources_Adult+apr26Leavers_NoSources_Adult)/apr08_Adult_Total*100, "0")#%)
                                    </cfif>
                                </td>
                            </tr>
                            </tr>
                            <tr>
                                <td>1 or More Sources</td>
                                <td>#(apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult)# of #apr08_Adult_Total# 
                                    <cfif apr08_Adult_Total NEQ 0>(#numberFormat((apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult)/apr08_Adult_Total*100, "0")#%)
                                    </cfif>
                                </td>
                            </tr>
                            <tr>
                                <td>Don't Know or Refused</td>
                                <td>#(apr26Leavers_DKR_Total+apr26Stayers_DKR_Adult)# of #apr08_Adult_Total# 
                                    <cfif apr08_Adult_Total NEQ 0>
                                    (#numberFormat((apr26Leavers_DKR_Total+apr26Stayers_DKR_Adult)/apr08_Adult_Total*100, "0")#%)
                                    </cfif>
                                </td>
                            </tr>
                            <tr>
                                <td>Missing Information</td>

                                <td>#(apr26Leavers_Missing_Adult+apr26Stayers_Missing_Adult)# of #apr08_Adult_Total#
                                    <cfif apr08_Adult_Total NEQ 0>
                                    (#numberFormat((apr26Leavers_Missing_Adult+apr26Stayers_Missing_Adult)/apr08_Adult_Total*100, "0")#%)
                                    </cfif>
                                </td>
                            </tr>
                        </body>
                    </table>
            </div>
        </div>
        <!---/ Sources of Non-Cash Income --->                                                      
    <!---/ Income and Benefits --->                           
<!---/ Factor1: Outcomes --->    

<!--- Factor2: Leverage --->
<div class="row">
    <div class="large-12 columns">
        <h2 class="MakePrimary"> Factor 2: Leverage </h2>
        <p> <em> See HomeBase score sheet, Project Application, and Supplemental Application Form. </em>
        </p>
    </div>
</div>
<!---/ Factor2: Leverage --->

<!--- Factor 3: Agency/Collaborative Capacity --->
<div class="row">
    <div class="large-12 columns">
        <h2 class="MakePrimary"> Factor 3: Agency/Collaborative Capacity </h2>
        <p> <em> See Supplemental Application Form and information below. </em>
        </p>
    </div>
</div>
    <!--- Historical Expenditures --->                        
    <div class="row">
        <div class="large-12 columns">
                <h3 class="MakePrimary">Historical Grant Expenditure</h3>
                <table width="100%">
                    <tbody>

                        <tr>
                            <td> <h3  class="MakePrimary">Year</h3></td>
                            <td> <h3  class="MakePrimary">Grant Amount</h3></td>
                            <td> <h3  class="MakePrimary">Grant Expended</h3></td>
                            <td> <h3  class="MakePrimary">Percentage Not Expended</h3></td>
                        </tr>
                        <tr>
                            <td> <h3  class="MakePrimary">2013</h3></td>
                            <td>#LSCurrencyFormat(NumAns09)#</td>
                            <td>#LSCurrencyFormat(NumAns10)#</td>
                            <td>#NumberFormat(NumAns13,"0")#%</td>
                        </tr>
                        <tr>
                            <td> <h3  class="MakePrimary">2012</h3></td>
                            <td>#LSCurrencyFormat(NumAns07)#</td>
                            <td>#LSCurrencyFormat(NumAns08)#</td>
                            <td>#NumberFormat(NumAns12,"0")#%</td>
                        </tr>
                        <tr>
                            <td> <h3  class="MakePrimary">2011</h3></td>
                            <td>#LSCurrencyFormat(NumAns05)#</td>
                            <td>#LSCurrencyFormat(NumAns06)#</td>
                            <td>#NumberFormat(NumAns11,"0")#%</td>
                        </tr>
                        <tr>
                            <td> <h3  class="MakePrimary">Total</h3></td>
                            <td></td>
                            <td></td>
                            <td>#NumberFormat(NumAns11,"0")#%</td>
                        </tr>                    
                    </body>
                </table>
        </div>
    </div>
    <!---/ Historical Expenditures --->                                             
<!---/ Factor 3: Agency/Collaborative Capacity --->

<!--- Factor 4: HMIS Data Quality --->                            
    <div class="row">
		<div class="large-12 columns text-left">
			<cfoutput>
				<cfset tmapr08_Total = (apr07_TotalLeavers-apr29Less90_DKR_Total-apr29More90_DKR_Total-apr29More90_Missing_Total-apr29Less90_Missing_Total)>
				#tmapr08_Total# of #apr07_TotalLeavers#
				<cfif apr07_TotalLeavers NEQ 0>
					(#NumberFormat((tmapr08_Total/apr07_TotalLeavers)*100, "__")#%) Leavers exited to known destinations.
				</cfif>
			</cfoutput>
		</div>
	</div>    
	<div class="row">
		<div class="large-12 columns">
			<cfset tmapr08_Total = apr08_Total*23>
			<p> #TotalCompleteDataNoSSNNumber# of #tmapr08_Total# (#NumberFormat(PerHMISComplete*100,"0")#%) of required HMIS data elements reported in the APR (excluding SSN) are complete.
		</div>
	</div>    
	<div class="row">
		<div class="large-12 columns text-left">
			<cfoutput>
				<cfif apr07_TotalLeavers NEQ 0>
				#NumberofLeaversExitWithKnownCashInc# of #apr07_TotalLeavers# (#NumberFormat(NumberofLeaversExitWithKnownCashInc/apr07_TotalLeavers*100, "__")#%) total leavers exited with known cash income.
				<cfelse>
				#NumberofLeaversExitWithKnownCashInc# of #apr07_TotalLeavers#  total leavers exited with known cash income.	
				</cfif>
                <cfif apr07_TotalLeavers NEQ 0>
				#NumberofLeaversExitWithKnownNonCashInc# of #apr07_TotalLeavers# (#NumberFormat(NumberofLeaversExitWithKnownNonCashInc/apr07_TotalLeavers*100, "__")#%) total leavers exited with known non-cash income.
				<cfelse>
				#NumberofLeaversExitWithKnownNonCashInc# of #apr07_TotalLeavers#  total leavers exited with known non-cash mainstream resources.	
				</cfif>
			</cfoutput>
		</div>
	</div>    
<!---/ Factor 4: HMIS Data Quality --->   

</cfoutput>