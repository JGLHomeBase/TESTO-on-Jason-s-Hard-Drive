<cfoutput>

<!--- Display --->
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
				    <tr>
				        <td width="200"><strong>Total Project Budget</strong></td>
				        <td colspan="3">#LSCurrencyFormat(NumAns02, "local")#</td>
				    </tr>
				    <!---/ Total Project Budget --->
				   
				    <!--- Amount of Grant --->
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong> 
				        <td width="300">#LSCurrencyFormat(apr03Amount, "local")#
				    	</td>
				        <td width="100">Expended
				    	</td>
				        <td >
				        	<cfif apr30Total_Total_Total GT 0>
				        		#LSCurrencyFormat(apr30Total_Total_Total, "local")# 
				        	<cfelseif apr30Total_Total_SHP GT 0>
				        		#LSCurrencyFormat(apr30Total_Total_SHP, "local")#
				        	<cfelseif apr31SC_SplusCTotal GT 0>
				        		#LSCurrencyFormat(apr31SC_SplusCTotal, "local")#
				        	</cfif>
				    	</td>
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
<!---/ Display --->

</cfoutput>
