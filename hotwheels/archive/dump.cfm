<cfoutput>
	<cfparam name="URL.project" default="0">

	<cfquery datasource="#datasource#" name="getTableList">
		SELECT APRQuestion, tableName, TableID FROM tables WHERE projectData = '1'
	</cfquery>

	<cfloop query="getTableList">
		<cfquery datasource="#datasource#" name="getFields">
			SELECT fieldName FROM fields 
			WHERE fav = '1'
			AND tableID = <cfqueryparam value="#getTableList.TableID#">
		</cfquery>
		<cfif getFields.RecordCount GT 0>
			<cfset fieldList = "">
			<cfloop query="getFields">
				<cfset fieldList = ListAppend("#fieldList#",  "#getFields.fieldName#")>
			</cfloop>
			<cfquery datasource="#datasource#" name="dump">
				SELECT #fieldList# FROM DataAPR#NumberFormat(getTableList.APRQuestion,"00")#
				WHERE projectID = <cfqueryparam value="#URL.project#">
			</cfquery>
			<cfloop list="#fieldList#" index="fieldName">
				<cfset "#fieldName#" = "#dump[fieldName]#" >
			</cfloop>
		</cfif>
	</cfloop>
	<!--- projects table --->
	<cfquery datasource="#datasource#" name="getFields">
		SELECT fieldName FROM fields 
		WHERE fav = '1' AND tableID = <cfqueryparam value="6">
	</cfquery>
	<cfif getFields.RecordCount GT 0>
		<cfset fieldList = "">
		<cfloop query="getFields">
			<cfset fieldList = ListAppend("#fieldList#", "#getFields.fieldName#")>
		</cfloop>
		<cfquery datasource="#datasource#" name="dump">
			SELECT #fieldList#, agencyLongName, projectComponentLongName, projectComponentName, projectNew, projects.projectComponentID FROM projects
			LEFT JOIN agency ON projects.agencyID = agency.agencyID
			LEFT JOIN projectComponent ON projects.projectComponentID = projectComponent.projectComponentID
			WHERE projects.projectID = <cfqueryparam value="#URL.project#">
		</cfquery>
		<cfloop list="#fieldList#" index="fieldName">
			<cfset "#fieldName#" = "#dump[fieldName]#" >
		</cfloop>
		<cfset agencyLongName = dump.agencyLongName>
		<cfset projectComponentLongName = dump.projectComponentLongName>
		<cfset projectComponentName = dump.projectComponentName>
		<cfset projectComponentID = dump.projectComponentID>
		<cfset projectNew = dump.projectNew>
	</cfif>
	<!---/ projects table --->
	<!--- local table --->
	<cfquery datasource="#datasource#" name="getFields">
		SELECT fieldName FROM fields 
		WHERE fav = '1' AND tableID = <cfqueryparam value="43">
	</cfquery>
	<cfif getFields.RecordCount GT 0>
		<cfset fieldList = "">
		<cfloop query="getFields">
			<cfset fieldList = ListAppend("#fieldList#", "#getFields.fieldName#")>
		</cfloop>
		<cfquery datasource="#datasource#" name="dump">
			SELECT #fieldList# FROM DataRFI
			WHERE projectID = <cfqueryparam value="#URL.project#">
		</cfquery>
		<cfloop list="#fieldList#" index="fieldName">
			<cfset "#fieldName#" = "#dump[fieldName]#" >

		</cfloop>
	</cfif>
	<!---/ projects table --->




<!---/ Defaults --->

<cfif projectName EQ "">
<cfset projectName = 0>
</cfif>
<cfif projectLongName EQ "">
<cfset projectLongName = 0>
</cfif>
<cfif apr03TargetSubpopulation EQ "">
<cfset apr03TargetSubpopulation = 0>
</cfif>
<cfif apr04SiteConfiguration EQ "">
<cfset apr04SiteConfiguration = 0>
</cfif>
<cfif apr04SiteTypePrincipalServiceSite EQ "">
<cfset apr04SiteTypePrincipalServiceSite = 0>
</cfif>
<cfif apr08_Adult_Total EQ "">
<cfset apr08_Adult_Total = 0>
</cfif>
<cfif apr05_Total_ActualUnits EQ "">
<cfset apr05_Total_ActualUnits = 0>
</cfif>
<cfif apr08_Children_Total EQ "">
<cfset apr08_Children_Total = 0>
</cfif>
<cfif apr05_Total_ActualBeds EQ "">
<cfset apr05_Total_ActualBeds = 0>
</cfif>
<cfif apr08_Total EQ "">
<cfset apr08_Total = 0>
</cfif>
<cfif apr07_TotalClients EQ "">
<cfset apr07_TotalClients = 0>
</cfif>
<cfif apr07_TotalLeavers EQ "">
<cfset apr07_TotalLeavers = 0>
</cfif>
<cfif apr07_FName_DKR EQ "">
<cfset apr07_FName_DKR = 0>
</cfif>
<cfif apr07_FName_Missing EQ "">
<cfset apr07_FName_Missing = 0>
</cfif>
<cfif apr07_LName_DKR EQ "">
<cfset apr07_LName_DKR = 0>
</cfif>
<cfif apr07_LName_Missing EQ "">
<cfset apr07_LName_Missing = 0>
</cfif>
<cfif apr07_SSN_DKR EQ "">
<cfset apr07_SSN_DKR = 0>
</cfif>
<cfif apr07_SSN_Missing EQ "">
<cfset apr07_SSN_Missing = 0>
</cfif>
<cfif apr07_DoB_DKR EQ "">
<cfset apr07_DoB_DKR = 0>
</cfif>
<cfif apr07_DoB_Missing EQ "">
<cfset apr07_DoB_Missing = 0>
</cfif>
<cfif apr07_Race_DKR EQ "">
<cfset apr07_Race_DKR = 0>
</cfif>
<cfif apr07_Race_Missing EQ "">
<cfset apr07_Race_Missing = 0>
</cfif>
<cfif apr07_Ethnicity_DKR EQ "">
<cfset apr07_Ethnicity_DKR = 0>
</cfif>
<cfif apr07_Ethnicity_Missing EQ "">
<cfset apr07_Ethnicity_Missing = 0>
</cfif>
<cfif apr07_Gender_DKR EQ "">
<cfset apr07_Gender_DKR = 0>
</cfif>
<cfif apr07_Gender_Missing EQ "">
<cfset apr07_Gender_Missing = 0>
</cfif>
<cfif apr07_Vet_DKR EQ "">
<cfset apr07_Vet_DKR = 0>
</cfif>
<cfif apr07_Vet_Missing EQ "">
<cfset apr07_Vet_Missing = 0>
</cfif>
<cfif apr07_Disabling_DKR EQ "">
<cfset apr07_Disabling_DKR = 0>
</cfif>
<cfif apr07_Disabling_Missing EQ "">
<cfset apr07_Disabling_Missing = 0>
</cfif>
<cfif apr07_ResidencePrior_DKR EQ "">
<cfset apr07_ResidencePrior_DKR = 0>
</cfif>
<cfif apr07_ResidencePrior_Missing EQ "">
<cfset apr07_ResidencePrior_Missing = 0>
</cfif>
<cfif apr07_Zip_DKR EQ "">
<cfset apr07_Zip_DKR = 0>
</cfif>
<cfif apr07_Zip_Missing EQ "">
<cfset apr07_Zip_Missing = 0>
</cfif>
<cfif apr07_HousingStatus_DKR EQ "">
<cfset apr07_HousingStatus_DKR = 0>
</cfif>
<cfif apr07_HousingStatus_Missing EQ "">
<cfset apr07_HousingStatus_Missing = 0>
</cfif>
<cfif apr07_IncEntry_DKR EQ "">
<cfset apr07_IncEntry_DKR = 0>
</cfif>
<cfif apr07_IncEntry_Missing EQ "">
<cfset apr07_IncEntry_Missing = 0>
</cfif>
<cfif apr07_IncExit_DKR EQ "">
<cfset apr07_IncExit_DKR = 0>
</cfif>
<cfif apr07_IncExit_Missing EQ "">
<cfset apr07_IncExit_Missing = 0>
</cfif>
<cfif apr07_NonCashEntry_DKR EQ "">
<cfset apr07_NonCashEntry_DKR = 0>
</cfif>
<cfif apr07_NonCashEntry_Missing EQ "">
<cfset apr07_NonCashEntry_Missing = 0>
</cfif>
<cfif apr07_NonCashExit_DKR EQ "">
<cfset apr07_NonCashExit_DKR = 0>
</cfif>
<cfif apr07_NonCashExit_Missing EQ "">
<cfset apr07_NonCashExit_Missing = 0>
</cfif>
<cfif apr07_PhysDisability_DKR EQ "">
<cfset apr07_PhysDisability_DKR = 0>
</cfif>
<cfif apr07_PhysDisability_Missing EQ "">
<cfset apr07_PhysDisability_Missing = 0>
</cfif>
<cfif apr07_DevDisability_DKR EQ "">
<cfset apr07_DevDisability_DKR = 0>
</cfif>
<cfif apr07_DevDisability_Missing EQ "">
<cfset apr07_DevDisability_Missing = 0>
</cfif>
<cfif apr07_ChronicHealth_DKR EQ "">
<cfset apr07_ChronicHealth_DKR = 0>
</cfif>
<cfif apr07_ChronicHealth_Missing EQ "">
<cfset apr07_ChronicHealth_Missing = 0>
</cfif>
<cfif apr07_HIV_DKR EQ "">
<cfset apr07_HIV_DKR = 0>
</cfif>
<cfif apr07_HIV_Missing EQ "">
<cfset apr07_HIV_Missing = 0>
</cfif>
<cfif apr07_MentalHealth_DKR EQ "">
<cfset apr07_MentalHealth_DKR = 0>
</cfif>
<cfif apr07_MentalHealth_Missing EQ "">
<cfset apr07_MentalHealth_Missing = 0>
</cfif>
<cfif apr07_SA_DKR EQ "">
<cfset apr07_SA_DKR = 0>
</cfif>
<cfif apr07_SA_Missing EQ "">
<cfset apr07_SA_Missing = 0>
</cfif>
<cfif apr07_DV_DKR EQ "">
<cfset apr07_DV_DKR = 0>
</cfif>
<cfif apr07_DV_Missing EQ "">
<cfset apr07_DV_Missing = 0>
</cfif>
<cfif apr07_Dest_DKR EQ "">
<cfset apr07_Dest_DKR = 0>
</cfif>
<cfif apr07_Dest_Missing EQ "">
<cfset apr07_Dest_Missing = 0>
</cfif>
<cfif apr21_Vet_Total EQ "">
<cfset apr21_Vet_Total = 0>
</cfif>
<cfif apr03Amount EQ "">
<cfset apr03Amount = 0>
</cfif>
<cfif apr19DV_Yes_Total EQ "">
<cfset apr19DV_Yes_Total = 0>
</cfif>
<cfif apr09_HH_Total EQ "">
<cfset apr09_HH_Total = 0>
</cfif>
<cfif apr29Less90_EmergShelter_Total EQ "">
<cfset apr29Less90_EmergShelter_Total = 0>
</cfif>
<cfif apr09_Jan_Total EQ "">
<cfset apr09_Jan_Total = 0>
</cfif>
<cfif apr19WhenDV_3Months_Total EQ "">
<cfset apr19WhenDV_3Months_Total = 0>
</cfif>
<cfif apr19WhenDV_3to6_Total EQ "">
<cfset apr19WhenDV_3to6_Total = 0>
</cfif>
<cfif apr19WhenDV_6to12_Total EQ "">
<cfset apr19WhenDV_6to12_Total = 0>
</cfif>
<cfif apr09_Apr_Total EQ "">
<cfset apr09_Apr_Total = 0>
</cfif>
<cfif apr09_Jul_Total EQ "">
<cfset apr09_Jul_Total = 0>
</cfif>
<cfif apr09_Oct_Total EQ "">
<cfset apr09_Oct_Total = 0>
</cfif>
<cfif apr18_MentalIllness_Total EQ "">
<cfset apr18_MentalIllness_Total = 0>
</cfif>
<cfif apr18_Alcohol_Total EQ "">
<cfset apr18_Alcohol_Total = 0>
</cfif>
<cfif apr18_Drug_Total EQ "">
<cfset apr18_Drug_Total = 0>
</cfif>
<cfif apr18_ChronicHealth_Total EQ "">
<cfset apr18_ChronicHealth_Total = 0>
</cfif>
<cfif apr18_HIV_Total EQ "">
<cfset apr18_HIV_Total = 0>
</cfif>
<cfif apr18_DevDisability_Total EQ "">
<cfset apr18_DevDisability_Total = 0>
</cfif>
<cfif apr18_PhysDisability_Total EQ "">
<cfset apr18_PhysDisability_Total = 0>
</cfif>
<cfif apr23_NoInc_Entry EQ "">
<cfset apr23_NoInc_Entry = 0>
</cfif>
<cfif apr23_NoInc_FollowUp EQ "">
<cfset apr23_NoInc_FollowUp = 0>
</cfif>
<cfif apr23_NoInc_Exit EQ "">
<cfset apr23_NoInc_Exit = 0>
</cfif>
<cfif apr23_1to150_Entry EQ "">
<cfset apr23_1to150_Entry = 0>
</cfif>
<cfif apr23_1to150_FollowUp EQ "">
<cfset apr23_1to150_FollowUp = 0>
</cfif>
<cfif apr23_1to150_Exit EQ "">
<cfset apr23_1to150_Exit = 0>
</cfif>
<cfif apr23_151to250_Entry EQ "">
<cfset apr23_151to250_Entry = 0>
</cfif>
<cfif apr23_151to250_FollowUp EQ "">
<cfset apr23_151to250_FollowUp = 0>
</cfif>
<cfif apr23_151to250_Exit EQ "">
<cfset apr23_151to250_Exit = 0>
</cfif>
<cfif apr23_251to500_Entry EQ "">
<cfset apr23_251to500_Entry = 0>
</cfif>
<cfif apr23_251to500_FollowUp EQ "">
<cfset apr23_251to500_FollowUp = 0>
</cfif>
<cfif apr23_251to500_Exit EQ "">
<cfset apr23_251to500_Exit = 0>
</cfif>
<cfif apr23_500to1000_Entry EQ "">
<cfset apr23_500to1000_Entry = 0>
</cfif>
<cfif apr23_500to1000_FollowUp EQ "">
<cfset apr23_500to1000_FollowUp = 0>
</cfif>
<cfif apr23_500to1000_Exit EQ "">
<cfset apr23_500to1000_Exit = 0>
</cfif>
<cfif apr23_1001to1500_Entry EQ "">
<cfset apr23_1001to1500_Entry = 0>
</cfif>
<cfif apr23_1001to1500_FollowUp EQ "">
<cfset apr23_1001to1500_FollowUp = 0>
</cfif>
<cfif apr23_1001to1500_Exit EQ "">
<cfset apr23_1001to1500_Exit = 0>
</cfif>
<cfif apr23_1501to2000_Entry EQ "">
<cfset apr23_1501to2000_Entry = 0>
</cfif>
<cfif apr23_1501to2000_FollowUp EQ "">
<cfset apr23_1501to2000_FollowUp = 0>
</cfif>
<cfif apr23_1501to2000_Exit EQ "">
<cfset apr23_1501to2000_Exit = 0>
</cfif>
<cfif apr23_2000Plus_Entry EQ "">
<cfset apr23_2000Plus_Entry = 0>
</cfif>
<cfif apr23_2000Plus_FollowUp EQ "">
<cfset apr23_2000Plus_FollowUp = 0>
</cfif>
<cfif apr23_2000Plus_Exit EQ "">
<cfset apr23_2000Plus_Exit = 0>
</cfif>
<cfif apr23_DKR_Entry EQ "">
<cfset apr23_DKR_Entry = 0>
</cfif>
<cfif apr23_DKR_FollowUp EQ "">
<cfset apr23_DKR_FollowUp = 0>
</cfif>
<cfif apr23_DKR_Exit EQ "">
<cfset apr23_DKR_Exit = 0>
</cfif>
<cfif apr23_Missing_Entry EQ "">
<cfset apr23_Missing_Entry = 0>
</cfif>
<cfif apr23_Missing_FollowUp EQ "">
<cfset apr23_Missing_FollowUp = 0>
</cfif>
<cfif apr18_None_Total EQ "">
<cfset apr18_None_Total = 0>
</cfif>
<cfif apr18_1Condition_Total EQ "">
<cfset apr18_1Condition_Total = 0>
</cfif>
<cfif apr18_2Conditions_Total EQ "">
<cfset apr18_2Conditions_Total = 0>
</cfif>
<cfif apr18_3PlusConditions_Total EQ "">
<cfset apr18_3PlusConditions_Total = 0>
</cfif>
<cfif NumAns08 EQ "">
<cfset NumAns08 = 0>
</cfif>
<cfif NumAns09 EQ "">
<cfset NumAns09 = 0>
</cfif>
<cfif NumAns10 EQ "">
<cfset NumAns10 = 0>
</cfif>
<cfif NumAns11 EQ "">
<cfset NumAns11 = 0>
</cfif>
<cfif NumAns12 EQ "">
<cfset NumAns12 = 0>
</cfif>
<cfif NumAns13 EQ "">
<cfset NumAns13 = 0>
</cfif>
<cfif apr24Stayers_NumOverall_Lost EQ "">
<cfset apr24Stayers_NumOverall_Lost = 0>
</cfif>
<cfif apr24Stayers_NumOverall_Same EQ "">
<cfset apr24Stayers_NumOverall_Same = 0>
</cfif>
<cfif apr24Stayers_NumOverall_More EQ "">
<cfset apr24Stayers_NumOverall_More = 0>
</cfif>
<cfif apr24Stayers_NumOverall_Gained EQ "">
<cfset apr24Stayers_NumOverall_Gained = 0>
</cfif>
<cfif apr16_62Plus_Total EQ "">
<cfset apr16_62Plus_Total = 0>
</cfif>
<cfif NumAns04 EQ "">
<cfset NumAns04 = 0>
</cfif>
<cfif NumAns05 EQ "">
<cfset NumAns05 = 0>
</cfif>
<cfif NumAns06 EQ "">
<cfset NumAns06 = 0>
</cfif>
<cfif NumAns07 EQ "">
<cfset NumAns07 = 0>
</cfif>
<cfif apr24Leavers_NumEarned_More EQ "">
<cfset apr24Leavers_NumEarned_More = 0>
</cfif>
<cfif apr24Leavers_NumEarned_Gained EQ "">
<cfset apr24Leavers_NumEarned_Gained = 0>
</cfif>
<cfif apr24Leavers_NumOther_More EQ "">
<cfset apr24Leavers_NumOther_More = 0>
</cfif>
<cfif apr25Leavers_Earned_Total EQ "">
<cfset apr25Leavers_Earned_Total = 0>
</cfif>
<cfif apr24Leavers_NumOther_Gained EQ "">
<cfset apr24Leavers_NumOther_Gained = 0>
</cfif>
<cfif apr25Leavers_Earned_Adult EQ "">
<cfset apr25Leavers_Earned_Adult = 0>
</cfif>
<cfif apr25Leavers_Unemployment_Adult EQ "">
<cfset apr25Leavers_Unemployment_Adult = 0>
</cfif>
<cfif apr25Leavers_SSI_Adult EQ "">
<cfset apr25Leavers_SSI_Adult = 0>
</cfif>
<cfif apr25Leavers_SSDI_Adult EQ "">
<cfset apr25Leavers_SSDI_Adult = 0>
</cfif>
<cfif apr25Leavers_VetDisability_Adult EQ "">
<cfset apr25Leavers_VetDisability_Adult = 0>
</cfif>
<cfif apr25Leavers_PrivateDisability_Adult EQ "">
<cfset apr25Leavers_PrivateDisability_Adult = 0>
</cfif>
<cfif apr25Leavers_WorkersComp_Adult EQ "">
<cfset apr25Leavers_WorkersComp_Adult = 0>
</cfif>
<cfif apr25Leavers_TANF_Adult EQ "">
<cfset apr25Leavers_TANF_Adult = 0>
</cfif>
<cfif apr25Leavers_GA_Adult EQ "">
<cfset apr25Leavers_GA_Adult = 0>
</cfif>
<cfif apr25Leavers_Retirement_Adult EQ "">
<cfset apr25Leavers_Retirement_Adult = 0>
</cfif>
<cfif apr25Leavers_VetPension_Adult EQ "">
<cfset apr25Leavers_VetPension_Adult = 0>
</cfif>
<cfif apr25Leavers_JobPension_Adult EQ "">
<cfset apr25Leavers_JobPension_Adult = 0>
</cfif>
<cfif apr25Leavers_ChildSupport_Adult EQ "">
<cfset apr25Leavers_ChildSupport_Adult = 0>
</cfif>
<cfif apr25Leavers_Alimony_Adult EQ "">
<cfset apr25Leavers_Alimony_Adult = 0>
</cfif>
<cfif apr25Leavers_Other_Adult EQ "">
<cfset apr25Leavers_Other_Adult = 0>
</cfif>


<cfif NumAns01 EQ "">
<cfset NumAns01 = 0>
</cfif>
<cfif NumAns02 EQ "">
<cfset NumAns02 = 0>
</cfif>
<cfif NumAns03 EQ "">
<cfset NumAns03 = 0>
</cfif>
<cfif apr25Leavers_NoSources_Total EQ "">
<cfset apr25Leavers_NoSources_Total = 0>
</cfif>
<cfif apr25Leavers_1Plus_Total EQ "">
<cfset apr25Leavers_1Plus_Total = 0>
</cfif>
<cfif apr25Leavers_DKR_Total EQ "">
<cfset apr25Leavers_DKR_Total = 0>
</cfif>
<cfif apr25Leavers_Missing_Total EQ "">
<cfset apr25Leavers_Missing_Total = 0>
</cfif>
<cfif apr24Leavers_NumOverall_Lost EQ "">
<cfset apr24Leavers_NumOverall_Lost = 0>
</cfif>
<cfif apr24Leavers_NumOverall_Less EQ "">
<cfset apr24Leavers_NumOverall_Less = 0>
</cfif>
<cfif apr25Leavers_1Plus_Adult EQ "">
<cfset apr25Leavers_1Plus_Adult = 0>
</cfif>
<cfif apr25Leavers_NoSources_Adult EQ "">
<cfset apr25Leavers_NoSources_Adult = 0>
</cfif>
<cfif apr25Leavers_DKR_Adult EQ "">
<cfset apr25Leavers_DKR_Adult = 0>
</cfif>
<cfif apr24Leavers_NumOverall_Same EQ "">
<cfset apr24Leavers_NumOverall_Same = 0>
</cfif>
<cfif apr25Leavers_Missing_Adult EQ "">
<cfset apr25Leavers_Missing_Adult = 0>
</cfif>
<cfif apr25Leavers_Total_Adults EQ "">
<cfset apr25Leavers_Total_Adults = 0>
</cfif>
<cfif apr24Leavers_NumOverall_More EQ "">
<cfset apr24Leavers_NumOverall_More = 0>
</cfif>
<cfif apr24Leavers_NumOverall_Gained EQ "">
<cfset apr24Leavers_NumOverall_Gained = 0>
</cfif>
<cfif apr25Stayers_Earned_Total EQ "">
<cfset apr25Stayers_Earned_Total = 0>
</cfif>
<cfif apr25Stayers_WorkersComp_Total EQ "">
<cfset apr25Stayers_WorkersComp_Total = 0>
</cfif>

<cfif apr25Stayers_Alimony_Adult EQ "">
<cfset apr25Stayers_Alimony_Adult = 0>
</cfif>
<cfif apr25Stayers_Earned_Adult EQ "">
<cfset apr25Stayers_Earned_Adult = 0>
</cfif>
<cfif apr25Stayers_Unemployment_Adult EQ "">
<cfset apr25Stayers_Unemployment_Adult = 0>
</cfif>
<cfif apr25Stayers_SSI_Adult EQ "">
<cfset apr25Stayers_SSI_Adult = 0>
</cfif>
<cfif apr25Stayers_SSDI_Adult EQ "">
<cfset apr25Stayers_SSDI_Adult = 0>
</cfif>
<cfif apr25Stayers_VetDisability_Adult EQ "">
<cfset apr25Stayers_VetDisability_Adult = 0>
</cfif>
<cfif apr25Stayers_PrivateDisability_Adult EQ "">
<cfset apr25Stayers_PrivateDisability_Adult = 0>
</cfif>
<cfif apr25Stayers_WorkersComp_Adult EQ "">
<cfset apr25Stayers_WorkersComp_Adult = 0>
</cfif>
<cfif apr25Stayers_TANF_Adult EQ "">
<cfset apr25Stayers_TANF_Adult = 0>
</cfif>
<cfif apr25Stayers_GA_Adult EQ "">
<cfset apr25Stayers_GA_Adult = 0>
</cfif>
<cfif apr25Stayers_Retirement_Adult EQ "">
<cfset apr25Stayers_Retirement_Adult = 0>
</cfif>
<cfif apr25Stayers_VetPension_Adult EQ "">
<cfset apr25Stayers_VetPension_Adult = 0>
</cfif>
<cfif apr25Stayers_JobPension_Adult EQ "">
<cfset apr25Stayers_JobPension_Adult = 0>
</cfif>
<cfif apr25Stayers_ChildSupport_Adult EQ "">
<cfset apr25Stayers_ChildSupport_Adult = 0>
</cfif>
<cfif apr25Stayers_Other_Adult EQ "">
<cfset apr25Stayers_Other_Adult = 0>
</cfif>
<cfif apr25Stayers_DKR_Total EQ "">
<cfset apr25Stayers_DKR_Total = 0>
</cfif>
<cfif apr25Stayers_Missing_Total EQ "">
<cfset apr25Stayers_Missing_Total = 0>
</cfif>
<cfif apr25Stayers_Total_Total EQ "">
<cfset apr25Stayers_Total_Total = 0>
</cfif>
<cfif apr25Stayers_1Plus_Adult EQ "">
<cfset apr25Stayers_1Plus_Adult = 0>
</cfif>
<cfif apr25Stayers_NoSources_Adult EQ "">
<cfset apr25Stayers_NoSources_Adult = 0>
</cfif>
<cfif apr25Stayers_DKR_Adult EQ "">
<cfset apr25Stayers_DKR_Adult = 0>
</cfif>
<cfif apr25Stayers_Missing_Adult EQ "">
<cfset apr25Stayers_Missing_Adult = 0>
</cfif>
<cfif apr25Stayers_Total_Adult EQ "">
<cfset apr25Stayers_Total_Adult = 0>
</cfif>


<cfif apr25Stayers_Total_Unknown EQ "">
<cfset apr25Stayers_Total_Unknown = 0>
</cfif>
<cfif apr26Stayers_SNAP_Adult EQ "">
<cfset apr26Stayers_SNAP_Adult = 0>
</cfif>
<cfif apr26Stayers_Medicaid_Adult EQ "">
<cfset apr26Stayers_Medicaid_Adult = 0>
</cfif>
<cfif apr24Both_NumOverall_Less EQ "">
<cfset apr24Both_NumOverall_Less = 0>
</cfif>
<cfif apr26Stayers_Medicare_Adult EQ "">
<cfset apr26Stayers_Medicare_Adult = 0>
</cfif>
<cfif apr26Stayers_StateChildHealthIns_Adult EQ "">
<cfset apr26Stayers_StateChildHealthIns_Adult = 0>
</cfif>
<cfif apr24Both_NumOverall_AvgGain EQ "">
<cfset apr24Both_NumOverall_AvgGain = 0>
</cfif>
<cfif apr26Stayers_WIC_Adults EQ "">
<cfset apr26Stayers_WIC_Adults = 0>
</cfif>
<cfif apr26Stayers_VAMed_Adult EQ "">
<cfset apr26Stayers_VAMed_Adult = 0>
</cfif>
<cfif apr26Stayers_TANFChildcare_Adult EQ "">
<cfset apr26Stayers_TANFChildcare_Adult = 0>
</cfif>

<cfif apr24Both_AvgChangeOverall_AvgGain EQ "">
<cfset apr24Both_AvgChangeOverall_AvgGain = 0>
</cfif>
<cfif apr26Stayers_TANFTransit_Adult EQ "">
<cfset apr26Stayers_TANFTransit_Adult = 0>
</cfif>
<cfif apr26Stayers_TANFOther_Adult EQ "">
<cfset apr26Stayers_TANFOther_Adult = 0>
</cfif>
<cfif apr26Stayers_TempRA_Adult EQ "">
<cfset apr26Stayers_TempRA_Adult = 0>
</cfif>
<cfif apr26Stayers_Section8_Adult EQ "">
<cfset apr26Stayers_Section8_Adult = 0>
</cfif>
<cfif apr26Stayers_Other_Adult EQ "">
<cfset apr26Stayers_Other_Adult = 0>
</cfif>
<cfif apr26Stayers_DKR_Adult EQ "">
<cfset apr26Stayers_DKR_Adult = 0>
</cfif>
<cfif apr26Stayers_NoSources_Adult EQ "">
<cfset apr26Stayers_NoSources_Adult = 0>
</cfif>
<cfif apr26Stayers_1Plus_Adult EQ "">
<cfset apr26Stayers_1Plus_Adult = 0>
</cfif>
<cfif apr26Stayers_Missing_Adult EQ "">
<cfset apr26Stayers_Missing_Adult = 0>
</cfif>
<cfif apr26Leavers_SNAP_Adult EQ "">
<cfset apr26Leavers_SNAP_Adult = 0>
</cfif>
<cfif apr26Leavers_Medicaid_Adult EQ "">
<cfset apr26Leavers_Medicaid_Adult = 0>
</cfif>
<cfif apr26Leavers_Medicare_Adult EQ "">
<cfset apr26Leavers_Medicare_Adult = 0>
</cfif>
<cfif apr26Leavers_StateChildHealthIns_Adult EQ "">
<cfset apr26Leavers_StateChildHealthIns_Adult = 0>
</cfif>
<cfif apr26Leavers_WIC_Adult EQ "">
<cfset apr26Leavers_WIC_Adult = 0>
</cfif>
<cfif apr26Leavers_VAMed_Adult EQ "">
<cfset apr26Leavers_VAMed_Adult = 0>
</cfif>
<cfif apr26Leavers_TANFChildcare_Adult EQ "">
<cfset apr26Leavers_TANFChildcare_Adult = 0>
</cfif>
<cfif apr26Leavers_TANFTransit_Adult EQ "">
<cfset apr26Leavers_TANFTransit_Adult = 0>
</cfif>
<cfif apr26Leavers_TANFOther_Adult EQ "">
<cfset apr26Leavers_TANFOther_Adult = 0>
</cfif>
<cfif apr26Leavers_TempRA_Adult EQ "">
<cfset apr26Leavers_TempRA_Adult = 0>
</cfif>
<cfif apr26Leavers_Section8_Adult EQ "">
<cfset apr26Leavers_Section8_Adult = 0>
</cfif>
<cfif apr26Leavers_Other_Adult EQ "">
<cfset apr26Leavers_Other_Adult = 0>
</cfif>
<cfif apr26Leavers_Total_Total EQ "">
<cfset apr26Leavers_Total_Total = 0>
</cfif>
<cfif apr26Leavers_NoSources_Total EQ "">
<cfset apr26Leavers_NoSources_Total = 0>
</cfif>
<cfif apr26Leavers_NoSources_Adult EQ "">
<cfset apr26Leavers_NoSources_Adult = 0>
</cfif>
<cfif apr27_30Less_Total EQ "">
<cfset apr27_30Less_Total = 0>
</cfif>
<cfif apr27_30Less_Leavers EQ "">
<cfset apr27_30Less_Leavers = 0>
</cfif>
<cfif apr26Leavers_1Plus_Adult EQ "">
<cfset apr26Leavers_1Plus_Adult = 0>
</cfif>
<cfif apr27_30Less_Stayers EQ "">
<cfset apr27_30Less_Stayers = 0>
</cfif>
<cfif apr26Leavers_1Plus_Total EQ "">
<cfset apr26Leavers_1Plus_Total = 0>
</cfif>
<cfif apr26Leavers_DKR_Total EQ "">
<cfset apr26Leavers_DKR_Total = 0>
</cfif>
<cfif apr26Leavers_Missing_Adult EQ "">
<cfset apr26Leavers_Missing_Adult = 0>
</cfif>
<cfif apr29More90_OwnedNoSubsidy_Total EQ "">
<cfset apr29More90_OwnedNoSubsidy_Total = 0>
</cfif>
<cfif apr29More90_OwnedSubsidy_Total EQ "">
<cfset apr29More90_OwnedSubsidy_Total = 0>
</cfif>
<cfif apr27_31to60_Total EQ "">
<cfset apr27_31to60_Total = 0>
</cfif>
<cfif apr27_31to60_Leavers EQ "">
<cfset apr27_31to60_Leavers = 0>
</cfif>
<cfif apr29More90_RentalNoSubsidy_Total EQ "">
<cfset apr29More90_RentalNoSubsidy_Total = 0>
</cfif>
<cfif apr27_31to60_Stayers EQ "">
<cfset apr27_31to60_Stayers = 0>
</cfif>
<cfif apr29More90_RentalVASHSubsidy_Total EQ "">
<cfset apr29More90_RentalVASHSubsidy_Total = 0>
</cfif>
<cfif apr27_181to365_Total EQ "">
<cfset apr27_181to365_Total = 0>
</cfif>
<cfif apr29More90_PSH_Total EQ "">
<cfset apr29More90_PSH_Total = 0>
</cfif>
<cfif apr29More90_RentalOtherSubsidy_Total EQ "">
<cfset apr29More90_RentalOtherSubsidy_Total = 0>
</cfif>
<cfif apr27_61to180_Total EQ "">
<cfset apr27_61to180_Total = 0>
</cfif>
<cfif apr27_61to180_Leavers EQ "">
<cfset apr27_61to180_Leavers = 0>
</cfif>
<cfif apr27_61to180_Stayers EQ "">
<cfset apr27_61to180_Stayers = 0>
</cfif>
<cfif apr29More90_PermFamily_Total EQ "">
<cfset apr29More90_PermFamily_Total = 0>
</cfif>
<cfif apr27_181to365_Leavers EQ "">
<cfset apr27_181to365_Leavers = 0>
</cfif>
<cfif apr29More90_PermFriend_Total EQ "">
<cfset apr29More90_PermFriend_Total = 0>
</cfif>
<cfif apr27_181to365_Stayers EQ "">
<cfset apr27_181to365_Stayers = 0>
</cfif>
<cfif apr29More90_PermTotal_Total EQ "">
<cfset apr29More90_PermTotal_Total = 0>
</cfif>
<cfif apr27_366to730_Total EQ "">
<cfset apr27_366to730_Total = 0>
</cfif>
<cfif apr27_366to730_Leavers EQ "">
<cfset apr27_366to730_Leavers = 0>
</cfif>
<cfif apr27_366to730_Stayers EQ "">
<cfset apr27_366to730_Stayers = 0>
</cfif>
<cfif apr27_731to1095_Total EQ "">
<cfset apr27_731to1095_Total = 0>
</cfif>
<cfif apr27_731to1095_Leavers EQ "">
<cfset apr27_731to1095_Leavers = 0>
</cfif>
<cfif apr27_731to1095_Stayers EQ "">
<cfset apr27_731to1095_Stayers = 0>
</cfif>
<cfif apr27_1096to1460_Total EQ "">
<cfset apr27_1096to1460_Total = 0>
</cfif>
<cfif apr27_1096to1460_Leavers EQ "">
<cfset apr27_1096to1460_Leavers = 0>
</cfif>
<cfif apr27_1096to1460_Stayers EQ "">
<cfset apr27_1096to1460_Stayers = 0>
</cfif>
<cfif apr27_1461to1825_Total EQ "">
<cfset apr27_1461to1825_Total = 0>
</cfif>
<cfif apr27_1461to1825_Leavers EQ "">
<cfset apr27_1461to1825_Leavers = 0>
</cfif>
<cfif apr27_1461to1825_Stayers EQ "">
<cfset apr27_1461to1825_Stayers = 0>
</cfif>
<cfif apr27_1825More_Total EQ "">
<cfset apr27_1825More_Total = 0>
</cfif>
<cfif apr27_1825More_Leavers EQ "">
<cfset apr27_1825More_Leavers = 0>
</cfif>
<cfif apr27_1825More_Stayers EQ "">
<cfset apr27_1825More_Stayers = 0>
</cfif>
<cfif apr27_Total_Stayers EQ "">
<cfset apr27_Total_Stayers = 0>
</cfif>
<cfif apr27_Leavers_Avg EQ "">
<cfset apr27_Leavers_Avg = 0>
</cfif>
<cfif apr27_Stayers_Avg EQ "">
<cfset apr27_Stayers_Avg = 0>
</cfif>
<cfif apr27_Leavers_Median EQ "">
<cfset apr27_Leavers_Median = 0>
</cfif>
<cfif apr27_Stayers_Median EQ "">
<cfset apr27_Stayers_Median = 0>
</cfif>
<cfif apr29More90_EShelter_Total EQ "">
<cfset apr29More90_EShelter_Total = 0>
</cfif>
<cfif apr29More90_TH_Total EQ "">
<cfset apr29More90_TH_Total = 0>
</cfif>
<cfif apr29More90_TempFamily_Total EQ "">
<cfset apr29More90_TempFamily_Total = 0>
</cfif>
<cfif apr29More90_TempFriends_Total EQ "">
<cfset apr29More90_TempFriends_Total = 0>
</cfif>
<cfif apr29More90_NoHumanHabitation_Total EQ "">
<cfset apr29More90_NoHumanHabitation_Total = 0>
</cfif>
<cfif apr29More90_SH_Total EQ "">
<cfset apr29More90_SH_Total = 0>
</cfif>
<cfif apr29More90_Hotel_Total EQ "">
<cfset apr29More90_Hotel_Total = 0>
</cfif>
<cfif apr29More90_TempTotal_Total EQ "">
<cfset apr29More90_TempTotal_Total = 0>
</cfif>
<cfif apr29More90_Foster_Total EQ "">
<cfset apr29More90_Foster_Total = 0>
</cfif>
<cfif apr29More90_Psych_Total EQ "">
<cfset apr29More90_Psych_Total = 0>
</cfif>
<cfif apr29More90_Hospital_Total EQ "">
<cfset apr29More90_Hospital_Total = 0>
</cfif>
<cfif apr29More90_Jail_Total EQ "">
<cfset apr29More90_Jail_Total = 0>
</cfif>
<cfif apr29More90_InstTotal_Total EQ "">
<cfset apr29More90_InstTotal_Total = 0>
</cfif>
<cfif apr29More90_Dead_Total EQ "">
<cfset apr29More90_Dead_Total = 0>
</cfif>
<cfif apr08_Jul_Total EQ "">
<cfset apr08_Jul_Total = 0>
</cfif>
<cfif apr08_Oct_Total EQ "">
<cfset apr08_Oct_Total = 0>
</cfif>
<cfif apr29More90_DKR_Total EQ "">
<cfset apr29More90_DKR_Total = 0>
</cfif>
<cfif apr29More90_Missing_Total EQ "">
<cfset apr29More90_Missing_Total = 0>
</cfif>
<cfif apr29More90_OtherTotal_Total EQ "">
<cfset apr29More90_OtherTotal_Total = 0>
</cfif>
<cfif apr29More90_Total_Total EQ "">
<cfset apr29More90_Total_Total = 0>
</cfif>
<cfif apr29Less90_OwnedNoSubsidy_Total EQ "">
<cfset apr29Less90_OwnedNoSubsidy_Total = 0>
</cfif>

<cfif apr29Less90_RentalNoSubsidy_Total EQ "">
<cfset apr29Less90_RentalNoSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_RentalVASHSubsidy_Total EQ "">
<cfset apr29Less90_RentalVASHSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_RentalOtherSubsidy_Total EQ "">
<cfset apr29Less90_RentalOtherSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_PSH_Total EQ "">
<cfset apr29Less90_PSH_Total = 0>
</cfif>
<cfif apr29Less90_PermFamily_Total EQ "">
<cfset apr29Less90_PermFamily_Total = 0>
</cfif>
<cfif apr29Less90_PermFriend_Total EQ "">
<cfset apr29Less90_PermFriend_Total = 0>
</cfif>
<cfif apr29Less90_PermTotal_Total EQ "">
<cfset apr29Less90_PermTotal_Total = 0>
</cfif>
<cfif apr29Less90_TH_Total EQ "">
<cfset apr29Less90_TH_Total = 0>
</cfif>
<cfif apr26Stayers_Total_Total EQ "">
<cfset apr26Stayers_Total_Total = 0>
</cfif>
<cfif apr29Less90_TempFamily_Total EQ "">
<cfset apr29Less90_TempFamily_Total = 0>
</cfif>
<cfif apr29Less90_TempFriend_Total EQ "">
<cfset apr29Less90_TempFriend_Total = 0>
</cfif>
<cfif apr29Less90_NoHumanHabitation_Total EQ "">
<cfset apr29Less90_NoHumanHabitation_Total = 0>
</cfif>
<cfif apr29Less90_SH_Total EQ "">
<cfset apr29Less90_SH_Total = 0>
</cfif>
<cfif apr29Less90_Hotel_Total EQ "">
<cfset apr29Less90_Hotel_Total = 0>
</cfif>
<cfif apr29Less90_TempTotal_Total EQ "">
<cfset apr29Less90_TempTotal_Total = 0>
</cfif>
<cfif apr29Less90_Foster_Total EQ "">
<cfset apr29Less90_Foster_Total = 0>
</cfif>
<cfif apr29Less90_Psych_Total EQ "">
<cfset apr29Less90_Psych_Total = 0>
</cfif>
<cfif apr29Less90_Detox_Total EQ "">
<cfset apr29Less90_Detox_Total = 0>
</cfif>
<cfif apr29Less90_Hospital_Total EQ "">
<cfset apr29Less90_Hospital_Total = 0>
</cfif>
<cfif apr29Less90_Jail_Total EQ "">
<cfset apr29Less90_Jail_Total = 0>
</cfif>
<cfif apr29Less90_InstTotal_Total EQ "">
<cfset apr29Less90_InstTotal_Total = 0>
</cfif>
<cfif apr29Less90_Dead_Total EQ "">
<cfset apr29Less90_Dead_Total = 0>
</cfif>
<cfif apr29Less90_DKR_Total EQ "">
<cfset apr29Less90_DKR_Total = 0>
</cfif>
<cfif apr29Less90_Missing_Total EQ "">
<cfset apr29Less90_Missing_Total = 0>
</cfif>
<cfif apr29Less90_OtherTotal_Total EQ "">
<cfset apr29Less90_OtherTotal_Total = 0>
</cfif>
<cfif apr29Less90_Total_Total EQ "">
<cfset apr29Less90_Total_Total = 0>
</cfif>
<cfif apr31SC_SplusCTotal EQ "">
<cfset apr31SC_SplusCTotal = 0>
</cfif>
<cfif apr30Total_Total_SHP EQ "">
<cfset apr30Total_Total_SHP = 0>
</cfif>
<cfif apr30Total_Total_Total EQ "">
<cfset apr30Total_Total_Total = 0>
</cfif>

<cfif apr24Stayers_NumOverall_Less EQ "">
<cfset apr24Stayers_NumOverall_Less = 0>
</cfif>
<cfif NumAns14 EQ "">
<cfset NumAns14 = 0>
</cfif>
<cfif NumAns15 EQ "">
<cfset NumAns15 = 0>
</cfif>
<cfif NumAns16 EQ "">
<cfset NumAns16 = 0>
</cfif>
<cfif NumAns17 EQ "">
<cfset NumAns17 = 0>
</cfif>
<cfif NumAns18 EQ "">
<cfset NumAns18 = 0>
</cfif>
<cfif NumAns19 EQ "">
<cfset NumAns19 = 0>
</cfif>
<cfif NumAns20 EQ "">
<cfset NumAns20 = 0>
</cfif>
<cfif NumAns21 EQ "">
<cfset NumAns21 = 0>
</cfif>
<cfif NumAns22 EQ "">
<cfset NumAns22 = 0>
</cfif>
<cfif NumAns23 EQ "">
<cfset NumAns23 = 0>
</cfif>
<cfif NumAns24 EQ "">
<cfset NumAns24 = 0>
</cfif>
<cfif NumAns25 EQ "">
<cfset NumAns25 = 0>
</cfif>
<cfif NumAns26 EQ "">
<cfset NumAns26 = 0>
</cfif>
<cfif NumAns27 EQ "">
<cfset NumAns27 = 0>
</cfif>
<cfif NumAns28 EQ "">
<cfset NumAns28 = 0>
</cfif>
<cfif NumAns29 EQ "">
<cfset NumAns29 = 0>
</cfif>
<cfif NumAns30 EQ "">
<cfset NumAns30 = 0>
</cfif>

<cfif apr29Less90_OwnedNoSubsidy_Total EQ "">
<cfset apr29Less90_OwnedNoSubsidy_Total = 0>
</cfif>
<cfif apr29More90_OwnedSubsidy_Total EQ "">
<cfset apr29More90_OwnedSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_RentalNoSubsidy_Total EQ "">
<cfset apr29Less90_RentalNoSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_RentalVASHSubsidy_Total EQ "">
<cfset apr29Less90_RentalVASHSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_RentalOtherSubsidy_Total EQ "">
<cfset apr29Less90_RentalOtherSubsidy_Total = 0>
</cfif>
<cfif apr29Less90_PSH_Total EQ "">
<cfset apr29Less90_PSH_Total = 0>
</cfif>
<cfif apr29Less90_PermFamily_Total EQ "">
<cfset apr29Less90_PermFamily_Total = 0>
</cfif>
<cfif apr29Less90_PermFriend_Total EQ "">
<cfset apr29Less90_PermFriend_Total = 0>
</cfif>


<cfif apr26Leavers_SNAP_Total EQ "">
<cfset apr26Leavers_SNAP_Total = 0>
</cfif>

<cfif apr26Leavers_Medicaid_Total EQ "">
<cfset apr26Leavers_Medicaid_Total = 0>
</cfif>

<cfif apr26Leavers_Medicare_Total EQ "">
<cfset apr26Leavers_Medicare_Total = 0>
</cfif>
<cfif apr26Leavers_StateChildHealthIns_Total EQ "">
<cfset apr26Leavers_StateChildHealthIns_Total = 0>
</cfif>

<cfif apr26Leavers_WIC_Total EQ "">
<cfset apr26Leavers_WIC_Total = 0>
</cfif>

<cfif apr26Leavers_VAMed_Total EQ "">
<cfset apr26Leavers_VAMed_Total = 0>
</cfif>

<cfif apr26Leavers_TANFChildcare_Total EQ "">
<cfset apr26Leavers_TANFChildcare_Total = 0>
</cfif>

<cfif apr26Leavers_TANFTransit_Total EQ "">
<cfset apr26Leavers_TANFTransit_Total = 0>
</cfif>

<cfif apr26Leavers_TANFOther_Total EQ "">
<cfset apr26Leavers_TANFOther_Total = 0>
</cfif>
<cfif apr26Leavers_TempRA_Total EQ "">
<cfset apr26Leavers_TempRA_Total = 0>
</cfif>

<cfif apr26Stayers_SNAP_Total EQ "">
<cfset apr26Stayers_SNAP_Total = 0>
</cfif>

<cfif apr26Stayers_Medicaid_Total EQ "">
<cfset apr26Stayers_Medicaid_Total = 0>
</cfif>

<cfif apr26Stayers_Medicare_Total EQ "">
<cfset apr26Stayers_Medicare_Total = 0>
</cfif>

<cfif apr26Stayers_StateChildHealthIns_Total EQ "">
<cfset apr26Stayers_StateChildHealthIns_Total = 0>
</cfif>

<cfif apr26Stayers_WIC_Total EQ "">
<cfset apr26Stayers_WIC_Total = 0>
</cfif>
<cfif apr26Stayers_VAMed_Total EQ "">
<cfset apr26Stayers_VAMed_Total = 0>
</cfif>

<cfif apr26Stayers_TANFChildcare_Total EQ "">
<cfset apr26Stayers_TANFChildcare_Total = 0>
</cfif>

<cfif apr26Stayers_TANFTransit_Total EQ "">
<cfset apr26Stayers_TANFTransit_Total = 0>
</cfif>

<cfif apr26Stayers_TANFOther_Total EQ "">
<cfset apr26Stayers_TANFOther_Total = 0>
</cfif>

<cfif apr26Stayers_TempRA_Total EQ "">
<cfset apr26Stayers_TempRA_Total = 0>
</cfif>

<cfif apr26Stayers_Section8_Total EQ "">
<cfset apr26Stayers_Section8_Total = 0>
</cfif>
<cfif apr26Stayers_Other_Total EQ "">
<cfset apr26Stayers_Other_Total = 0>
</cfif>

<cfif apr26Leavers_Section8_Total EQ "">
<cfset apr26Leavers_Section8_Total = 0>
</cfif>

<cfif apr26Leavers_Other_Total EQ "">
<cfset apr26Leavers_Other_Total = 0>
</cfif>

<cfif apr24Leavers_NumOverall_Never EQ "">
<cfset apr24Leavers_NumOverall_Never = 0>
</cfif>
<cfif apr24Stayers_NumOverall_Never EQ "">
<cfset apr24Stayers_NumOverall_Never = 0>
</cfif>

<cfif apr36_TotalIncome_PercDiff EQ "">
<cfset apr36_TotalIncome_PercDiff = 0>
</cfif>

<!---/ Defaults !!! --->







	<!--- MATH!!! --->
	<CFSET MaintainedHousingOver1Year=(apr27_366to730_Total+apr27_731to1095_Total+apr27_1096to1460_Total+apr27_1461to1825_Total+apr27_1825More_Total)>
	<CFSET ClientsOver1Year=(apr08_Total - (apr27_181to365_Stayers + apr27_61to180_Stayers + apr27_31to60_Stayers + apr27_30Less_Stayers))>
	<cfif ClientsOver1Year NEQ 0>
		<CFSET MaintainedHousingOver1YearPer=MaintainedHousingOver1Year/ClientsOver1Year>
	<cfelse>
		<CFSET MaintainedHousingOver1YearPer=0>
	</cfif>

	<CFSET MaintainedHousingOver6Months=(apr27_181to365_Total+apr27_366to730_Total+apr27_731to1095_Total+apr27_1096to1460_Total+apr27_1461to1825_Total+apr27_1825More_Total)>
	<CFSET ClientsOver6Months=(apr08_Total - (apr27_61to180_Stayers + apr27_31to60_Stayers + apr27_30Less_Stayers))>
	<cfif ClientsOver6Months NEQ 0>
		<CFSET MaintainedHousingOver6MonthsPer=MaintainedHousingOver6Months/ClientsOver6Months>
	<cfelse>
		<CFSET MaintainedHousingOver6MonthsPer=0>
	</cfif>
	<cfset dead = apr29Less90_Dead_Total+apr29More90_Dead_Total>
	
	<cfif (apr07_TotalLeavers-dead) NEQ 0>
		<CFSET PerExitingToPH=(apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total)/(apr07_TotalLeavers-dead)>
	<cfelse>
		<CFSET PerExitingToPH=0>
	</cfif>
	
	<CFSET LivingLeaversLessThan90Days=(apr29Less90_Total_Total-apr29Less90_Dead_Total)>
	<CFSET LivingLeaversMoreThan90Days=(apr29More90_Total_Total-apr29More90_Dead_Total)>

	<cfif LivingLeaversLessThan90Days NEQ 0>
		<CFSET PercExitPermDest90DaysOrLess=(apr29Less90_PermTotal_Total/LivingLeaversLessThan90Days)>
	<cfelse>
		<CFSET PercExitPermDest90DaysOrLess=0>
	</cfif>

	<cfif LivingLeaversMoreThan90Days NEQ 0>
		<CFSET PercExitPermDestMoreThan90Days=(apr29More90_PermTotal_Total/apr29More90_Total_Total)>
	<cfelse>
		<CFSET PercExitPermDestMoreThan90Days=0>
	</cfif>

	<cfif LivingLeaversLessThan90Days NEQ 0>
		<CFSET PercExitTempDest90DaysOrLess=(apr29Less90_TempTotal_Total/apr29Less90_Total_Total)>
	<cfelse>
		<CFSET PercExitTempDest90DaysOrLess=0>
	</cfif>

	<cfif LivingLeaversMoreThan90Days NEQ 0>
		<CFSET PercExitTempDestMoreThan90Days=(apr29More90_TempTotal_Total/apr29More90_Total_Total)>
	<cfelse>
		<CFSET PercExitTempDestMoreThan90Days=0>
	</cfif>

	<cfif LivingLeaversLessThan90Days NEQ 0>
		<CFSET PercExitInstitution90DaysOrLess=(apr29Less90_InstTotal_Total/apr29Less90_Total_Total)>
	<cfelse>
		<CFSET PercExitInstitution90DaysOrLess=0>
	</cfif>

	<cfif LivingLeaversMoreThan90Days NEQ 0>
		<CFSET PercExitInstitutionsMoreThan90Days=(apr29More90_InstTotal_Total/apr29More90_Total_Total)>
	<cfelse>
		<CFSET PercExitInstitutionsMoreThan90Days=0>
	</cfif>


	
	
	
	<CFSET NumberAdultsHadEmployment=(apr25Leavers_Earned_Adult+apr25Stayers_Earned_Adult)>

	<cfif apr08_Adult_Total NEQ 0>
		<CFSET PercAdultsHadEmployment=(NumberAdultsHadEmployment/apr08_Adult_Total)>
	<cfelse>
		<CFSET PercAdultsHadEmployment=0>
	</cfif>
	<CFSET TotalLeaversExitingToPH=(apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total)>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercLeaversExitingToPH=(TotalLeaversExitingToPH/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercLeaversExitingToPH=0>
	</cfif>
	<CFSET LeaversWithLessIncomeAtExit=(apr24Leavers_NumOverall_Lost+apr24Leavers_NumOverall_Less)>
	<cfparam name="StayersWithLessIncomeAtExit" default="0">

	<cfif apr24Stayers_NumOverall_Lost EQ "">
		<cfset apr24Stayers_NumOverall_Lost = 0>
	</cfif>
	<cfif apr24Stayers_NumOverall_Less EQ "">
		<cfset apr24Stayers_NumOverall_Less = 0>
	</cfif>
	<cfif StayersWithLessIncomeAtExit EQ "">
		<cfset apr24Stayers_NumOverall_Less = 0>
	</cfif>
	<CFSET StayersWithLessIncomeAtExit=(apr24Stayers_NumOverall_Lost+apr24Stayers_NumOverall_Less)>
	<CFSET LeaversWithMoreIncomeAtExit=(apr24Leavers_NumOverall_More+apr24Leavers_NumOverall_Gained)>
	<CFSET StayersWithMoreIncomeAtExit=(apr24Stayers_NumOverall_More+apr24Stayers_NumOverall_Gained)>
	<CFSET NumberPersonsRemainedPHOrExitedToPH=(apr25Stayers_Total_Total+apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total)>
	<CFSET NumberAdults1PlusMainstreamResource=(apr26Leavers_1Plus_Adult+apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult+apr25Leavers_1Plus_Adult+apr25Stayers_1Plus_Adult)>
	<CFSET LeaversUnknownIncomeExit=(apr25Leavers_Total_Adults-LeaversWithLessIncomeAtExit-LeaversWithMoreIncomeAtExit-apr24Leavers_NumOverall_Same-apr24Leavers_NumOverall_Never)>
	<CFSET StayersUnknownIncomeExit=(apr25Stayers_Total_Adult-StayersWithMoreIncomeAtExit-StayersWithLessIncomeAtExit-apr24Stayers_NumOverall_Same-apr24Stayers_NumOverall_Never)>
	
	<cfif (apr29Less90_Total_Total+apr29More90_PermTotal_Total) NEQ 0>
		<CFSET PercparticipantsExitToOtherPH=(apr29Less90_PermTotal_Total+apr29Less90_PermTotal_Total)/(apr29Less90_Total_Total+apr29More90_PermTotal_Total)>
	<cfelse>
		<CFSET PercparticipantsExitToOtherPH=0>
	</cfif>




	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversWithLessIncomeAtExit=(LeaversWithLessIncomeAtExit/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercLeaversWithLessIncomeAtExit=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercStayersWithLessIncomeAtExit=(StayersWithLessIncomeAtExit/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercStayersWithLessIncomeAtExit=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversWithSameAtExit=((apr24Leavers_NumOverall_Same+apr24Leavers_NumOverall_Never)/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercLeaversWithSameAtExit=0>
	</cfif>

	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercStayersWithSameAtExit=((apr24Stayers_NumOverall_Same+apr24Stayers_NumOverall_Never)/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercStayersWithSameAtExit=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversWithMoreAtExit=(LeaversWithMoreIncomeAtExit/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercLeaversWithMoreAtExit=0>
	</cfif>

	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercStayersWithMoreAtExit=(StayersWithMoreIncomeAtExit/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercStayersWithMoreAtExit=0>
	</cfif>

	<cfif apr08_Total NEQ 0>
		<CFSET PercAdultsWhoIncreasedIncome=((LeaversWithMoreIncomeAtExit+StayersWithMoreIncomeAtExit)/apr08_Total)>
		<CFSET PercPersonsRemainedPHOrExitedToPH=(NumberPersonsRemainedPHOrExitedToPH/apr08_Total)>
	<cfelse>
		<CFSET PercAdultsWhoIncreasedIncome=0>
		<CFSET PercPersonsRemainedPHOrExitedToPH=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithEarnedIncome=(apr25Leavers_Earned_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithEarnedIncome=0>
	</cfif>

	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithEarnedIncome=(apr25Stayers_Earned_Total/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithEarnedIncome=0>
	</cfif>

	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithEarnedIncome=(apr25Stayers_Earned_Total/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithEarnedIncome=0>
	</cfif>

	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithEarnedIncome=(apr25Stayers_Earned_Total/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithEarnedIncome=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithUnemploymentIncome=(apr25Leavers_Unemployment_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithUnemploymentIncome=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithUnemploymentIncome=(apr25Stayers_Unemployment_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithUnemploymentIncome=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithSSI=(apr25Leavers_SSI_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithSSI=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithSSI=(apr25Stayers_SSI_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithSSI=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithSSDI=(apr25Leavers_SSDI_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithSSDI=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithSSDI=(apr25Stayers_SSDI_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithSSDI=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithVeteransDisability=(apr25Leavers_VetDisability_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithVeteransDisability=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithVeteransDisability=(apr25Stayers_VetDisability_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithVeteransDisability=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithPrivateDisability=(apr25Leavers_PrivateDisability_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithPrivateDisability=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithWorkersComp=(apr25Leavers_WorkersComp_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithWorkersComp=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithWorkersComp=(apr25Stayers_WorkersComp_Total/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithWorkersComp=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithTANF=(apr25Leavers_TANF_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithTANF=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithTANF=(apr25Stayers_TANF_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithTANF=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithGA=(apr25Leavers_GA_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithGA=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithGA=(apr25Leavers_GA_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithGA=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithGA=(apr25Leavers_GA_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithGA=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithGA=(apr25Stayers_GA_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithGA=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithRetirement=(apr25Leavers_Retirement_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithRetirement=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithRetirement=(apr25Stayers_Retirement_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithRetirement=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithVeteranPension=(apr25Leavers_VetPension_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithVeteranPension=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithVeteranPension=(apr25Stayers_VetPension_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithVeteranPension=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithPension=(apr25Leavers_JobPension_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithPension=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithPension=(apr25Stayers_JobPension_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithPension=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithChildSupport=(apr25Leavers_ChildSupport_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithChildSupport=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithChildSupport=(apr25Stayers_ChildSupport_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithChildSupport=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithAlimony=(apr25Leavers_Alimony_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithAlimony=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithAlimony=(apr25Stayers_Alimony_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithAlimony=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithOtherSource=(apr25Leavers_Other_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithOtherSource=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithOtherSource=(apr25Stayers_Other_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithOtherSource=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithNoSourceCash=(apr25Leavers_NoSources_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithNoSourceCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithNoSourceCash=(apr25Stayers_NoSources_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithNoSourceCash=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWith1PlusSourceCash=(apr25Leavers_1Plus_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWith1PlusSourceCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWith1PlusSourceCash=(apr25Stayers_1Plus_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWith1PlusSourceCash=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithDontKnowRefusedSourceCash=(apr25Leavers_DKR_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithDontKnowRefusedSourceCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithDontKnowRefusedSourceCash=(apr25Stayers_DKR_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithDontKnowRefusedSourceCash=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithMissingSourceCash=(apr25Leavers_Missing_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithMissingSourceCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithMissingSourceCash=(apr25Leavers_Missing_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithMissingSourceCash=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithSNAP=(apr26Leavers_SNAP_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithSNAP=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithSNAP=(apr26Stayers_SNAP_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithSNAP=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithMedicaid=(apr26Leavers_Medicaid_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithMedicaid=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithMedicaid=(apr26Stayers_Medicaid_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithMedicaid=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithMedicare=(apr26Leavers_Medicare_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithMedicare=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithMedicare=(apr26Stayers_Medicare_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithMedicare=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithStateChildrensHealthInsurance=(apr26Leavers_StateChildHealthIns_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithStateChildrensHealthInsurance=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithStateChildrensHealthInsurance=(apr26Stayers_StateChildHealthIns_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithStateChildrensHealthInsurance=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithWIC=(apr26Leavers_WIC_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithWIC=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithWIC=(apr26Stayers_WIC_Adults/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithWIC=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithVAMedical=(apr26Leavers_VAMed_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithVAMedical=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithVAMedical=(apr26Stayers_VAMed_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithVAMedical=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithTANFChildCare=(apr26Leavers_TANFChildcare_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithTANFChildCare=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithTANFChildCare=(apr26Stayers_TANFChildcare_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithTANFChildCare=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithTANFTrans=(apr26Leavers_TANFTransit_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithTANFTrans=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithTANFTrans=(apr26Stayers_TANFTransit_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithTANFTrans=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithTANFOther=(apr26Leavers_TANFOther_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithTANFOther=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithTANFOther=(apr26Stayers_TANFOther_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithTANFOther=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithTempRentalAssistance=(apr26Leavers_TempRA_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithTempRentalAssistance=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithTempRentalAssistance=(apr26Stayers_TempRA_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithTempRentalAssistance=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithTANFSection8=(apr26Leavers_Section8_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithTANFSection8=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithTANFSection8=(apr26Stayers_Section8_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithTANFSection8=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithOther=(apr26Leavers_Other_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithOther=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithOther=(apr26Stayers_Other_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithOther=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWithNoSourceNonCash=(apr26Leavers_NoSources_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWithNoSourceNonCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWithNoSourceNonCash=(apr26Stayers_NoSources_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWithNoSourceNonCash=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversWith1PlusNonCash=(apr26Leavers_1Plus_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversWith1PlusNonCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersWith1PlusNonCash=(apr26Stayers_1Plus_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersWith1PlusNonCash=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversUnknownRefusedNonCash=(apr26Leavers_DKR_Total/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversUnknownRefusedNonCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersUnknownRefusedNonCash=(apr26Stayers_DKR_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersUnknownRefusedNonCash=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercAdultLeaversMissingNonCash=(apr26Leavers_Missing_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercAdultLeaversMissingNonCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<CFSET PercAdultStayersMissingNonCash=(apr26Stayers_Missing_Adult/apr25Stayers_Total_Adult)>
	<cfelse>
		<CFSET PercAdultStayersMissingNonCash=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET NumberParticipantsAccessedAndMaintainedPH=(apr29Less90_PermTotal_Total+apr29More90_PermTotal_Total+apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET NumberParticipantsAccessedAndMaintainedPH=0>
	</cfif>
	<cfif apr08_Adult_Total NEQ 0>
		<CFSET PercAdults1PlusMainstreamResourceACHIEVEMENT=(NumberAdults1PlusMainstreamResource/apr08_Adult_Total)>
	<cfelse>
		<CFSET PercAdults1PlusMainstreamResourceACHIEVEMENT=0>
	</cfif>
	<cfif apr08_Total NEQ 0>
		<CFSET TotalRecidivismRate=((apr08_Total-apr25Stayers_Total_Total-apr29Less90_InstTotal_Total-apr29More90_InstTotal_Total-apr29Less90_PermTotal_Total-apr29More90_PermTotal_Total-apr29Less90_Dead_Total-apr29More90_Dead_Total)/apr08_Total)>
	<cfelse>
		<CFSET TotalRecidivismRate=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversUnknownIncexit=(LeaversUnknownIncomeExit/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PercLeaversUnknownIncexit=0>
	</cfif>
	<cfif apr27_Total_Stayers NEQ 0>
		<CFSET PercStayersUnknownIncexit=(StayersUnknownIncomeExit/apr27_Total_Stayers)>
	<cfelse>
		<CFSET PercStayersUnknownIncexit=0>
	</cfif>

	<cfif ProjectStreet1 NEQ "" AND 
		 ProjectState NEQ "" AND 
		 ProjectCity NEQ "">
		<cfset GeoCodeLocation = "#URLEncodedFormat("#ProjectStreet1#, #ProjectCity# #ProjectState#")#">
	<cfelse>
		<cfset GeoCodeLocation = "none">
	</cfif>

	<cfparam name="apr19WhenDV_3Months_Total" default="0">
	<cfparam name="apr19WhenDV_3to6_Total" default="0">
	<cfparam name="apr19WhenDV_6to12_Total" default="0">

	<cfif apr19WhenDV_3Months_Total EQ "">
		<cfset apr19WhenDV_3Months_Total = 0>
	</cfif>
	<cfif apr19WhenDV_3to6_Total EQ "">
		<cfset apr19WhenDV_3to6_Total = 0>
	</cfif>
	<cfif apr19WhenDV_6to12_Total EQ "">
		<cfset apr19WhenDV_6to12_Total = 0>
	</cfif>
	<cfset DVPastYear=apr19WhenDV_3Months_Total+apr19WhenDV_3to6_Total+apr19WhenDV_6to12_Total>
	


	<cfset StayLT12 = apr27_30Less_Stayers+apr27_31to60_Stayers+apr27_61to180_Stayers+apr27_181to365_Stayers>
	<cfset LeaveLT12 = apr27_30Less_Leavers+apr27_31to60_Leavers+apr27_61to180_Leavers+apr27_181to365_Leavers>
	<cfset StayLT6 = apr27_30Less_Stayers+apr27_31to60_Stayers+apr27_61to180_Stayers>
	<cfset LeaveLT6 = apr27_30Less_Leavers+apr27_31to60_Leavers+apr27_61to180_Leavers>
	<cfset LeaveGT6 = apr07_TotalLeavers-LeaveLT6>
	<cfset LivingLeavers = apr29Less90_Total_Total+LivingLeaversMoreThan90Days>
	<cfset LivingOtherLT90 = apr29Less90_OtherTotal_Total-apr29Less90_Dead_Total>
	<cfset LivingOtherMT90 = apr29More90_OtherTotal_Total-apr29More90_Dead_Total>
	<cfif LivingLeaversLessThan90Days NEQ 0>
		<CFSET PercExitOtherDestinations90DaysOrLess=(apr29Less90_OtherTotal_Total/apr29Less90_Total_Total)>
	<cfelse>
		<CFSET PercExitOtherDestinations90DaysOrLess=0>
	</cfif>
	
	<cfif apr29More90_Total_Total NEQ 0>
		<CFSET PercExitOtherDestinationsMoreThan90Days=(apr29More90_OtherTotal_Total/apr29More90_Total_Total)>
	<cfelse>
		<CFSET PercExitOtherDestinationsMoreThan90Days=0>
	</cfif>
	<cfparam name="AverageMonthlyIncomeAtEntryAllAdults" default="0">
	<cfif AverageMonthlyIncomeAtEntryAllAdults EQ "">
		<cfset AverageMonthlyIncomeAtEntryAllAdults = 0>
	</cfif>
	<cfif apr19WhenDV_3Months_Total EQ "">
		<cfset apr19WhenDV_3Months_Total = 0>
	</cfif>
	<cfif apr23_NoInc_Entry EQ "">
		<cfset apr23_NoInc_Entry = 0>
	</cfif>
	<cfif apr23_1to150_Entry EQ "">
		<cfset apr23_1to150_Entry = 0>
	</cfif>
	<cfif apr23_151to250_Entry EQ "">
		<cfset apr23_151to250_Entry = 0>
	</cfif>
	<cfif apr23_251to500_Entry EQ "">
		<cfset apr23_251to500_Entry = 0>
	</cfif>
	<cfif apr23_500to1000_Entry EQ "">
		<cfset apr23_500to1000_Entry = 0>
	</cfif>
	<cfif apr23_1001to1500_Entry EQ "">
		<cfset apr23_1001to1500_Entry = 0>
	</cfif>
	<cfif apr23_1501to2000_Entry EQ "">
		<cfset apr23_1501to2000_Entry = 0>
	</cfif>
	<cfif apr23_2000Plus_Entry EQ "">
		<cfset apr23_2000Plus_Entry = 0>
	</cfif>
	


	<cfparam name="apr08_Adult_Total" default="0">
	<cfif apr08_Adult_Total EQ "">
		<cfset apr08_Adult_Total = 0>
	</cfif>
	<cfparam name="apr23_DKR_Entry" default="0">
	<cfif apr23_DKR_Entry EQ "">
		<cfset apr23_DKR_Entry = 0>
	</cfif>
	<cfparam name="apr23_Missing_Entry" default="0">
	<cfif apr23_Missing_Entry EQ "">
		<cfset apr23_Missing_Entry = 0>
	</cfif>
	<cfif (apr08_Adult_Total-(apr23_DKR_Entry+apr23_Missing_Entry)) NEQ 0>
	<CFSET AverageMonthlyIncomeAtEntryAllAdults=((apr23_NoInc_Entry*0)+(apr23_1to150_Entry*150)+(apr23_151to250_Entry*250)+(apr23_251to500_Entry*500)+(apr23_500to1000_Entry*1000)+(apr23_1001to1500_Entry*1500)+(apr23_1501to2000_Entry*2000)+(apr23_2000Plus_Entry*2250))/
							(apr08_Adult_Total-(apr23_DKR_Entry+apr23_Missing_Entry))>
	</cfif>
	<cfparam name="AverageMonthlyIncomeAtFollowUporExitAllAdults" default="0">
	<cfif apr23_Missing_Entry EQ "">
		<cfset apr23_Missing_Entry = 0>
	</cfif>
	<cfif apr23_Missing_FollowUp EQ "">
		<cfset apr23_Missing_FollowUp = 0>
	</cfif>
	<cfif apr23_DKR_Exit EQ "">
		<cfset apr23_DKR_Exit = 0>
	</cfif>
	<cfif apr23_DKR_FollowUp EQ "">
		<cfset apr23_DKR_FollowUp = 0>
	</cfif>
	<cfif (apr08_Adult_Total-(apr23_DKR_FollowUp+apr23_DKR_Exit+apr23_Missing_FollowUp+apr23_Missing_Entry)) NEQ 0>
	
	<cfif apr23_Missing_Exit EQ "">
		<cfset apr23_Missing_Exit = 0>
	</cfif>
	<CFSET AverageMonthlyIncomeAtFollowUporExitAllAdults=(((apr23_NoInc_FollowUp+apr23_NoInc_Exit)*0)+((apr23_1to150_FollowUp+apr23_1to150_Exit)*150)+((apr23_151to250_FollowUp+apr23_151to250_Exit)*250)+((apr23_251to500_FollowUp+apr23_251to500_Exit)*500)+((apr23_500to1000_FollowUp+apr23_500to1000_Exit)*1000)+((apr23_1001to1500_FollowUp+apr23_1001to1500_Exit)*1500)+((apr23_1501to2000_FollowUp+apr23_1501to2000_Exit)*2000)+(apr23_2000Plus_Exit+apr23_2000Plus_FollowUp)*2250)/(apr08_Adult_Total-(apr23_DKR_FollowUp+apr23_DKR_Exit+apr23_Missing_FollowUp+apr23_Missing_Exit))>
	</cfif>
	<cfset apr15Adult_TotalIncreasedInc=LeaversWithMoreIncomeAtExit+StayersWithMoreIncomeAtExit>
	<cfif LivingLeavers NEQ 0>
	<cfset Percapr08_apr30Total_Total_TotalitToPH=TotalLeaversExitingToPH/LivingLeavers>
	<cfelse>
		<cfset Percapr08_apr30Total_Total_TotalitToPH=0>
	</cfif>
	<cfif apr25Stayers_Total_Adult NEQ 0>
		<cfset PercAdultStayersWithPrivateDisability = apr25Stayers_PrivateDisability_Adult/apr25Stayers_Total_Adult>
	<cfelse>
		<cfset PercAdultStayersWithPrivateDisability = 0>
	</cfif>
	<cfset AdultMaintainIncreaseInc = (apr24Leavers_NumOverall_Same+apr24Stayers_NumOverall_Same+LeaversWithMoreIncomeAtExit+StayersWithMoreIncomeAtExit)>
	<cfif apr08_Adult_Total NEQ 0>
		<CFSET PercAdultsMaintainedOrIncreasedIncome=(AdultMaintainIncreaseInc/apr08_Adult_Total)>
	<cfelse>
		<CFSET PercAdultsMaintainedOrIncreasedIncome=0>
	</cfif>
	<cfif AverageMonthlyIncomeAtEntryAllAdults NEQ 0>
		<cfset Bobby = (AverageMonthlyIncomeAtFollowUporExitAllAdults-AverageMonthlyIncomeAtEntryAllAdults)/
AverageMonthlyIncomeAtEntryAllAdults>
	<cfelse>
		<cfset Bobby = 0>
	</cfif>

	<cfif AverageMonthlyIncomeAtEntryAllAdults NEQ 0>
		<cfset PerAvgIncreaseInc = (apr24Both_AvgChangeOverall_AvgGain/
AverageMonthlyIncomeAtEntryAllAdults)>
	<cfelse>
		<cfset PerAvgIncreaseInc = 0>
	</cfif>

	<cfparam name="BudgetLink" default="">
	
	<cfif apr30Total_Total_Total GT 0>
		<cfset GrantExpendAmount = apr30Total_Total_Total>
	<cfelseif apr30Total_Total_SHP GT 0>
		<cfset GrantExpendAmount = apr30Total_Total_SHP>
	<cfelseif apr31SC_SplusCTotal GT 0>
		<cfset GrantExpendAmount = apr31SC_SplusCTotal>
	<cfelse>
		<cfset GrantExpendAmount = 0>
	</cfif>
	<cfif IsDefined("apr03Amount") AND apr03Amount NEQ 0>
		<cfset GrantExpendPercent = (GrantExpendAmount/apr03Amount)*100>
	<cfelse>
		<cfset GrantExpendPercent = 0>
	</cfif>

	<CFSET TotalDataDK = apr07_FName_DKR + apr07_LName_DKR + apr07_SSN_DKR + apr07_DoB_DKR + apr07_Race_DKR + apr07_Ethnicity_DKR + apr07_Gender_DKR + apr07_Vet_DKR + apr07_Disabling_DKR + apr07_ResidencePrior_DKR + apr07_Zip_DKR + apr07_HousingStatus_DKR + apr07_IncEntry_DKR + apr07_IncExit_DKR + apr07_NonCashEntry_DKR + apr07_NonCashExit_DKR + apr07_PhysDisability_DKR + apr07_PhysDisability_DKR + apr07_ChronicHealth_DKR + apr07_HIV_DKR + apr07_MentalHealth_DKR + apr07_SA_DKR + apr07_DV_DKR + apr07_Dest_DKR>

	<CFSET TotalDataMissing = apr07_FName_Missing + apr07_LName_Missing + apr07_SSN_Missing + apr07_DoB_Missing + apr07_Race_Missing + apr07_Ethnicity_Missing + apr07_Gender_Missing + apr07_Vet_Missing + apr07_Disabling_Missing + apr07_ResidencePrior_Missing + apr07_Zip_Missing + apr07_HousingStatus_Missing + apr07_IncEntry_Missing + apr07_IncExit_Missing + apr07_NonCashEntry_Missing + apr07_NonCashExit_Missing + apr07_PhysDisability_Missing + apr07_DevDisability_Missing + apr07_ChronicHealth_Missing + apr07_HIV_Missing + apr07_MentalHealth_Missing + apr07_SA_Missing + apr07_DV_Missing + apr07_Dest_Missing>
	<cfif apr08_Total NEQ 0>
		<CFSET PerMissingOrNull = ((TotalDataDK + TotalDataMissing) / (apr08_Total*24)*100)>
	<cfelse>
		<CFSET PerMissingOrNull = 0>
	</cfif>

	<cfset LeaversIncrease = (apr24Leavers_NumEarned_More+apr24Leavers_NumEarned_Gained)>
	<cfset LeaversOtherIncrease = (apr24Leavers_NumOther_More+apr24Leavers_NumOther_Gained)>
	<cfset NumberofLeaversExitToKnownDestination = (apr25Leavers_Total_Adults-(apr29More90_DKR_Total+apr29Less90_DKR_Total+apr29Less90_Missing_Total+apr29More90_Missing_Total))>
		<cfset NumberofLeaversExitWithKnownIncBen = (apr25Leavers_NoSources_Total+apr25Leavers_1Plus_Total+apr26Leavers_NoSources_Total+apr26Leavers_1Plus_Total)>
	<cfset TotalDataDKNoSSN = (TotalDataDK-apr07_SSN_DKR)>
	<cfset TotalDataMissingNoSSN = (TotalDataMissing-apr07_SSN_Missing)>
	
	<cfset TotalCompleteDataNoSSNNumber = (apr08_Total*23-(TotalDataDKNoSSN + TotalDataMissingNoSSN))>
	<cfif apr08_Total EQ 0>
		<cfset PerHMISComplete = 0>
	<cfelse>
		<cfset PerHMISComplete = (TotalCompleteDataNoSSNNumber)/(apr08_Total*23)>
	</cfif>
        
        <cfset NumberofLeaversExitWithKnownCashInc = (apr25Leavers_NoSources_Total+apr25Leavers_1Plus_Total)>

<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversExitKnownCashInc=(NumberofLeaversExitWithKnownCashInc/apr25Leavers_Total_Adults)*100>
	<cfelse>
		<CFSET PercLeaversExitKnownCashInc=0>
	</cfif>
    

<cfset NumberofLeaversExitWithKnownNonCashInc = (apr26Leavers_NoSources_Total+apr26Leavers_1Plus_Total)>

<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversExitKnownNonCashInc=(NumberofLeaversExitWithKnownNonCashInc/apr25Leavers_Total_Adults)*100>
	<cfelse>
		<CFSET PercLeaversExitKnownNonCashInc=0>
	</cfif>

        
        <cfset NumberStayersMoreThan6Months = apr27_181to365_Stayers + apr27_366to730_Stayers + apr27_731to1095_Stayers + apr27_1096to1460_Stayers + apr27_1461to1825_Stayers + apr27_1825More_Stayers>
        <cfset NumberStayersLessThan6Months = apr27_30Less_Stayers + apr27_31to60_Stayers + apr27_61to180_Stayers>
	<cfif NumberStayersMoreThan6Months EQ 0>
		<cfset PercPersonsRemaininPHOver6MonthsorExitToPH = 0>
	<cfelse>
		<cfset PercPersonsRemaininPHOver6MonthsorExitToPH = ((NumberStayersMoreThan6Months + TotalLeaversExitingToPH)/(apr08_Total - NumberStayersLessThan6Months))>
	</cfif>
        
        
	<cfif apr07_TotalLeavers NEQ 0>
		<cfset PerLeaversWithBens = (apr26Leavers_1Plus_Total/apr07_TotalLeavers)>
	<cfelse>
		<cfset PerLeaversWithBens = 0>
	</cfif>

	
		<cfset LeaversIncrEmpInc = (apr24Leavers_NumEarned_More+apr24Leavers_NumEarned_Gained)>
	

	<cfif apr23_Total_Exit EQ "">
		<cfset apr23_Total_Exit = 0>
	</cfif>
	
	<cfif apr23_Total_Exit NEQ 0>
		<cfset PerLeaversIncrEmpInc = (LeaversIncrEmpInc/apr23_Total_Exit)>
	<cfelse>
		<cfset PerLeaversIncrEmpInc = 0>
	</cfif>
	
	<cfif apr08_Total NEQ 0>
		<cfset PerExitTempOtherUnknown = ((apr07_TotalLeavers-apr29Less90_PermTotal_Total-apr29More90_PermTotal_Total-dead-apr29More90_InstTotal_Total-apr29Less90_InstTotal_Total)/ apr08_Total)>
	<cfelse>
		<cfset PerExitTempOtherUnknown = 0>
	</cfif>

<cfif apr24Both_NumEarned_More EQ "">
	<CFSET apr24Both_NumEarned_More=0>
</cfif>

<cfif apr24Both_NumEarned_Gained EQ "">
	<CFSET apr24Both_NumEarned_Gained=0>
</cfif>
<cfif (apr08_Adult_Total) NEQ 0>
		<CFSET PerIncreaseEmpInc=((apr24Both_NumEarned_More+apr24Both_NumEarned_Gained)/apr08_Adult_Total)>
	<cfelse>
		<CFSET PerIncreaseEmpInc=0>
	</cfif>

<cfif (apr08_Adult_Total) NEQ 0>
		<CFSET PerAdultsIncreasedInc=(apr15Adult_TotalIncreasedInc/apr08_Adult_Total)>
	<cfelse>
		<CFSET PerAdultsIncreasedInc=0>
	</cfif>
	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PerLeaversIncreasedInc=(LeaversWithMoreIncomeAtExit/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PerLeaversIncreasedInc=0>
	</cfif>
	<cfif (LivingLeavers) NEQ 0>
		<CFSET PerLeaversIncreasedInc=(TotalLeaversExitingToPH/LivingLeavers)>
	<cfelse>
		<CFSET PerLeaversIncreasedInc=0>
	</cfif>
<cfif (apr08_Adult_Total) NEQ 0>
		<CFSET PerMaintainIncreaseInc=(AdultMaintainIncreaseInc/apr08_Adult_Total)>
	<cfelse>
		<CFSET PerMaintainIncreaseInc=0>
	</cfif>

<cfif (apr25Leavers_Total_Adults) NEQ 0>
		<CFSET PerLeaversAnyInc=(apr25Leavers_1Plus_Adult/apr25Leavers_Total_Adults)>
	<cfelse>
		<CFSET PerLeaversAnyInc=31415926535>
	</cfif>
<cfif apr26Stayers_1Plus_Total EQ "">
	<cfset apr26Stayers_1Plus_Total = 0>
</cfif>
<cfif (apr08_Total) NEQ 0>
		<CFSET PerNonCashBens=((apr26Leavers_1Plus_Total+apr26Stayers_1Plus_Total)/apr08_Total)>
	<cfelse>
		<CFSET PerNonCashBens=0>
	</cfif>
<cfif (apr05_Total_ActualUnits) NEQ 0>
		<CFSET AvgOccRate=(((apr09_Jan_Total+apr09_Apr_Total+apr09_Jul_Total+apr09_Oct_Total)/4)/apr05_Total_ActualUnits)>
	<cfelse>
		<CFSET AvgOccRate=0 >
	</cfif>
<cfif (apr07_TotalLeavers) NEQ 0>
		<CFSET PerExitToPermDest=((apr29More90_PermTotal_Total+apr29Less90_PermTotal_Total)/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PerExitToPermDest=0 >
	</cfif>
<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithSNAP=(apr26Leavers_SNAP_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithSNAP=0>
	</cfif>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithMedicaid=(apr26Leavers_Medicaid_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithMedicaid=0>
	</cfif>

	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithMedicare=(apr26Leavers_Medicare_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithMedicare=0>
	</cfif>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithStateChildrensHealthInsurance=(apr26Leavers_StateChildHealthIns_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithStateChildrensHealthInsurance=0>
	</cfif>

	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithWIC=(apr26Leavers_WIC_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithWIC=0>
	</cfif>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithVAMedical=(apr26Leavers_VAMed_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithVAMedical=0>
	</cfif>

	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithTANFChildcare=(apr26Leavers_TANFChildcare_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithTANFChildcare=0>
	</cfif>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithTANFTrans=(apr26Leavers_TANFTransit_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithTANFTrans=0>
	</cfif>

	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithTANFOther=(apr26Leavers_TANFOther_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithTANFOther=0>
	</cfif>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithTempRentalAssistance=(apr26Leavers_TempRA_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithTempRentalAssistance=0>
	</cfif>

	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithTANFSection8=(apr26Leavers_Section8_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithTANFSection8=0>
	</cfif>
	<cfif apr07_TotalLeavers NEQ 0>
		<CFSET PercTotalLeaversWithOther=(apr26Leavers_Other_Total/apr07_TotalLeavers)>
	<cfelse>
		<CFSET PercTotalLeaversWithOther=0>
	</cfif>




	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithSNAP=(apr26Stayers_SNAP_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithSNAP=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithMedicaid=(apr26Stayers_Medicaid_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithMedicaid=0>
	</cfif>

	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithMedicare=(apr26Stayers_Medicare_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithMedicare=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithStateChildrensHealthInsurance=(apr26Stayers_StateChildHealthIns_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithStateChildrensHealthInsurance=0>
	</cfif>

	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithWIC=(apr26Stayers_WIC_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithWIC=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithVAMedical=(apr26Stayers_VAMed_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithVAMedical=0>
	</cfif>

	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithTANFChildcare=(apr26Stayers_TANFChildcare_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithTANFChildcare=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithTANFTrans=(apr26Stayers_TANFTransit_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithTANFTrans=0>
	</cfif>

	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithTANFOther=(apr26Stayers_TANFOther_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithTANFOther=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithTempRentalAssistance=(apr26Stayers_TempRA_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithTempRentalAssistance=0>
	</cfif>

	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithTANFSection8=(apr26Stayers_Section8_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithTANFSection8=0>
	</cfif>
	<cfif apr25Stayers_Total_Total NEQ 0>
		<CFSET PercTotalStayersWithOther=(apr26Stayers_Other_Total/apr25Stayers_Total_Total)>
	<cfelse>
		<CFSET PercTotalStayersWithOther=0>
	</cfif>

	<cfif apr08_Total NEQ 0>
		<CFSET PerHMISCompleteWithSSN=((apr08_Total*24-(TotalDataDK + TotalDataMissing))/(apr08_Total*24))>
	<cfelse>
		<CFSET PerHMISCompleteWithSSN=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversExitKnownIncAndBens=(NumberofLeaversExitWithKnownIncBen/apr25Leavers_Total_Adults)*100>
	<cfelse>
		<CFSET PercLeaversExitKnownIncAndBens=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PercLeaversExitKnownDest=(NumberofLeaversExitToKnownDestination/apr25Leavers_Total_Adults)*100>
	<cfelse>
		<CFSET PercLeaversExitKnownDest=0>
	</cfif>

	<cfif apr08_Adult_Total NEQ 0>
		<CFSET PercAdultsNonCashBens=((apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult)/apr08_Adult_Total)*100>
	<cfelse>
		<CFSET PercAdultsNonCashBens=0>
	</cfif>

	<cfif apr25Leavers_Total_Adults NEQ 0>
		<CFSET PerLeaversIncrNonEmpInc=(LeaversOtherIncrease/apr25Leavers_Total_Adults)*100>
	<cfelse>
		<CFSET PerLeaversIncrNonEmpInc=0>
	</cfif>
	<cfif (NumAns05+NumAns07+NumAns09) NEQ 0>
		<cfset PerGrantExpendedHist = (1-((NumAns06+NumAns08+NumAns10)/(NumAns05+NumAns07+NumAns09)))>
	<cfelse>
		<cfset PerGrantExpendedHist = 0>
	</cfif>
	<cfif apr08_Total NEQ 0>
		<CFSET PerMissingOrNullSFScoring = (TotalDataDK*.5 + TotalDataMissing) / (apr08_Total*24)>
	<cfelse>
		<CFSET PerMissingOrNullSFScoring = 0>
	</cfif>
	<CFSET PerHMISCompleteSFScoring = (1-PerMissingOrNullSFScoring)>

    <cfif LivingLeavers NEQ 0>
		<CFSET PercTotalLeaversExitingToPH=(TotalLeaversExitingToPH/LivingLeavers)*100>
	<cfelse>
		<CFSET PercTotalLeaversExitingToPH=0>
	</cfif>
        
     <cfif apr08_Adult_Total NEQ 0>
		<CFSET Percapr15Adult_TotalOneMoreNCBen=(apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult)/apr08_Adult_Total*100>
	<cfelse>
		<CFSET Percapr15Adult_TotalOneMoreNCBen=0>
	</cfif>
    
    <cfif apr20Homeless_Subtotal EQ "">
        <cfset apr20Homeless_Subtotal = 0>
    </cfif>
        
    <cfif apr08_Total NEQ 0>
		<CFSET PercPriorResHomeless=(apr20Homeless_Subtotal/apr08_Total)*100>
	<cfelse>
		<CFSET PercPriorResHomeless=0>
	</cfif>
        
        
</cfoutput>


