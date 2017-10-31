<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">HMIS Data Quality</h2>
			<table width="100%">
				<thead>
					<th width="50%"></th>
					<th>Don't Know or Refused</th>
					<th>Missing Data</th>
					<th>Percentage of Clients with No Data</th>
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
</cfoutput>