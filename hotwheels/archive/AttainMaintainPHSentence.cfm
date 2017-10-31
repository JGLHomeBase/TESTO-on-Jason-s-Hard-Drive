<cfoutput>
	<div class="row">
		<div class="large-12 columns text-left">
					<p>
						#MaintainedHousingOver1Year# of #ClientsOver1Year# 
						<cfif ClientsOver1Year NEQ 0>
							(#NumberFormat(MaintainedHousingOver1YearPer*100, "__")#%)
						</cfif>
						individuals maintained their housing for more than one year. <cfif StayLT12 GT 0>This calculation disregards #StayLT12# stayers who were in the program less than one year.</cfif>
					</p>
					<p>
						#MaintainedHousingOver6Months# of #ClientsOver6Months# 
						<cfif ClientsOver6Months NEQ 0 >
							(#NumberFormat((MaintainedHousingOver6MonthsPer)*100, "__")#%)
						</cfif>
						individuals maintained their housing for more than six months. <cfif StayLT6 GT 0>This calculation disregards #StayLT6# stayers who were in the program less than six months.</cfif>
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
</cfoutput>