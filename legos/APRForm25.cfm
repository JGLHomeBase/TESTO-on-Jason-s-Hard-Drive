<!--- Set Variables --->
<cfset TargetTable = "DataAPR25">
<cfset UniqueID = "DataAPR25ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR25ID"
        Form = "dataapr25">
<!---/ Get ID --->

<cfif newCheck.RecordCount EQ 0>
  <cfset newRecord = 1>
<cfelse>
  <cfset newRecord = 0>
</cfif>
<!---/ New Check --->

<!--- Process Forms --->
<cfif FORM.action EQ "process" AND FORM.goldenTicket EQ SESSION.goldenTicket>
  <cfif newRecord EQ 1>
   <cfinsert datasource="#DataSource#" tablename="dataapr25" formfields="aprID, inputUserID, projectID, reviewUserID, apr25Leavers_Earned_Total, apr25Leavers_Unemployment_Total, apr25Leavers_SSI_Total, apr25Leavers_SSDI_Total, apr25Leavers_VetDisability_Total, apr25Leavers_PrivateDisability_Total, apr25Leavers_WorkersComp_Total, apr25Leavers_TANF_Total, apr25Leavers_GA_Total, apr25Leavers_Retirement_Total, apr25Leavers_VetPension_Total, apr25Leavers_JobPension_Total, apr25Leavers_ChildSupport_Total, apr25Leavers_Alimony_Total, apr25Leavers_Other_Total, apr25Leavers_Earned_Adult, apr25Leavers_Unemployment_Adult, apr25Leavers_SSI_Adult, apr25Leavers_SSDI_Adult, apr25Leavers_VetDisability_Adult, apr25Leavers_PrivateDisability_Adult, apr25Leavers_WorkersComp_Adult, apr25Leavers_TANF_Adult, apr25Leavers_GA_Adult, apr25Leavers_Retirement_Adult, apr25Leavers_VetPension_Adult, apr25Leavers_JobPension_Adult, apr25Leavers_ChildSupport_Adult, apr25Leavers_Alimony_Adult, apr25Leavers_Other_Adult, apr25Leavers_Earned_Child, apr25Leavers_Unemployment_Child, apr25Leavers_SSI_Child, apr25Leavers_SSDI_Child, apr25Leavers_VetDisability_Child, apr25Leavers_PrivateDisability_Child, apr25Leavers_WorkersComp_Child, apr25Leavers_TANF_Child, apr25Leavers_GA_Child, apr25Leavers_Retirement_Child, apr25Leavers_VetPension_Child, apr25Leavers_JobPension_Child, apr25Leavers_ChildSupport_Child, apr25Leavers_Alimony_Child, apr25Leavers_Other_Child, apr25Leavers_Earned_Unknown, apr25Leavers_Unemployment_Unknown, apr25Leavers_SSI_Unknown, apr25Leavers_SSDI_Unknown, apr25Leavers_VetDisability_Unknown, apr25Leavers_PrivateDisability_Unknown, apr25Leavers_WorkersComp_Unknown, apr25Leavers_TANF_Unknown, apr25Leavers_GA_Unknown, apr25Leavers_Retirement_Unknown, apr25Leavers_VetPension_Unknown, apr25Leavers_JobPension_Unknown, apr25Leavers_ChildSupport_Unknown, apr25Leavers_Alimony_Unknown, apr25Leavers_Other_Unknown, apr25Leavers_NoSources_Total, apr25Leavers_1Plus_Total, apr25Leavers_DKR_Total, apr25Leavers_Missing_Total, apr25Leavers_Total_Total, apr25Leavers_1Plus_Adult, apr25Leavers_NoSources_Adult, apr25Leavers_DKR_Adult, apr25Leavers_Missing_Adult, apr25Leavers_Total_Adults, apr25Leavers_NoSources_Child, apr25Leavers_1Plus_Child, apr25Leavers_DKR_Child, apr25Leavers_Missing_Child, apr25Leavers_Total_Child, apr25Leavers_NoSources_Unknown, apr25Leavers_1Plus_Unknown, apr25Leavers_DKR_Unknown, apr25Leavers_Missing_Unknown, apr25Leavers_Total_Unknown, apr25Stayers_Earned_Total, apr25Stayers_Unemployment_Total, apr25Stayers_SSI_Total, apr25Stayers_SSDI_Total, apr25Stayers_VetDisability_Total, apr25Stayers_PrivateDisability_Total, apr25Stayers_WorkersComp_Total, apr25Stayers_TANF_Total, apr25Stayers_GA_Total, apr25Stayers_Retirement_Total, apr25Stayers_VetPension_Total, apr25Stayers_JobPension_Total, apr25Stayers_ChildSupport_Total, apr25Stayers_Alimony_Total, apr25Stayers_Other_Total, apr25Stayers_Alimony_Adult, apr25Stayers_Earned_Adult, apr25Stayers_Unemployment_Adult, apr25Stayers_SSI_Adult, apr25Stayers_SSDI_Adult, apr25Stayers_VetDisability_Adult, apr25Stayers_PrivateDisability_Adult, apr25Stayers_WorkersComp_Adult, apr25Stayers_TANF_Adult, apr25Stayers_GA_Adult, apr25Stayers_Retirement_Adult, apr25Stayers_VetPension_Adult, apr25Stayers_JobPension_Adult, apr25Stayers_ChildSupport_Adult, apr25Stayers_Other_Adult, apr25Stayers_ChildSupport_Child, apr25Stayers_VetPension_Child, apr25Stayers_Alimony_Child, apr25Stayers_Earned_Child, apr25Stayers_GA_Child, apr25Stayers_Other_Child, apr25Stayers_TANF_Child, apr25Stayers_SSI_Child, apr25Stayers_Unemployment_Child, apr25Stayers_SSDI_Child, apr25Stayers_VetDisability_Child, apr25Stayers_PrivateDisability_Child, apr25Stayers_WorkersComp_Child, apr25Stayers_Retirement_Child, apr25Stayers_JobPension_Child, apr25Stayers_ChildSupport_Unknown, apr25Stayers_VetPension_Unknown, apr25Stayers_Alimony_Unknown, apr25Stayers_Earned_Unknown, apr25Stayers_GA_Unknown, apr25Stayers_Other_Unknown, apr25Stayers_Unemployment_Unknown, apr25Stayers_SSI_Unknown, apr25Stayers_SSDI_Unknown, apr25Stayers_VetDisability_Unknown, apr25Stayers_PrivateDisability_Unknown, apr25Stayers_WorkersComp_Unknown, apr25Stayers_TANF_Unknown, apr25Stayers_Retirement_Unknown, apr25Stayers_JobPension_Unknown, apr25Stayers_NoSources_Total, apr25Stayers_1Plus_Total, apr25Stayers_DKR_Total, apr25Stayers_Missing_Total, apr25Stayers_Total_Total, apr25Stayers_1Plus_Adult, apr25Stayers_NoSources_Adult, apr25Stayers_NoSources_Child, apr25Stayers_1Plus_Child, apr25Stayers_DKR_Adult, apr25Stayers_Missing_Adult, apr25Stayers_Total_Adult, apr25Stayers_DKR_Child, apr25Stayers_Missing_Child, apr25Stayers_Total_Child, apr25Stayers_NoSources_Unknown, apr25Stayers_1Plus_Unknown, apr25Stayers_DKR_Unknown, apr25Stayers_Missing_Unknown, apr25Stayers_Total_Unknown">
  <cfelse>
    <cfset FORM.DataAPR25ID = newCheck.DataAPR25ID>

    <!--- Set Defaults --->
    <cfif form.apr25Leavers_Earned_Total	 EQ "">	
        <cfset form.apr25Leavers_Earned_Total	 =0></cfif>
    <cfif form.apr25Leavers_Unemployment_Total	 EQ "">	
        <cfset form.apr25Leavers_Unemployment_Total	 =0></cfif>
    <cfif form.apr25Leavers_SSI_Total	 EQ "">	
        <cfset form.apr25Leavers_SSI_Total	 =0></cfif>
    <cfif form.apr25Leavers_SSDI_Total	 EQ "">	
        <cfset form.apr25Leavers_SSDI_Total	 =0></cfif>
    <cfif form.apr25Leavers_VetDisability_Total	 EQ "">	
        <cfset form.apr25Leavers_VetDisability_Total	 =0></cfif>
    <cfif form.apr25Leavers_PrivateDisability_Total	 EQ "">	
        <cfset form.apr25Leavers_PrivateDisability_Total	 =0></cfif>
    <cfif form.apr25Leavers_WorkersComp_Total	 EQ "">	
        <cfset form.apr25Leavers_WorkersComp_Total	 =0></cfif>
    <cfif form.apr25Leavers_TANF_Total	 EQ "">	
        <cfset form.apr25Leavers_TANF_Total	 =0></cfif>
    <cfif form.apr25Leavers_GA_Total	 EQ "">	
        <cfset form.apr25Leavers_GA_Total	 =0></cfif>
    <cfif form.apr25Leavers_Retirement_Total	 EQ "">	
        <cfset form.apr25Leavers_Retirement_Total	 =0></cfif>
    <cfif form.apr25Leavers_VetPension_Total	 EQ "">	
        <cfset form.apr25Leavers_VetPension_Total	 =0></cfif>
    <cfif form.apr25Leavers_JobPension_Total	 EQ "">	
        <cfset form.apr25Leavers_JobPension_Total	 =0></cfif>
    <cfif form.apr25Leavers_ChildSupport_Total	 EQ "">	
        <cfset form.apr25Leavers_ChildSupport_Total	 =0></cfif>
    <cfif form.apr25Leavers_Alimony_Total	 EQ "">	
        <cfset form.apr25Leavers_Alimony_Total	 =0></cfif>
    <cfif form.apr25Leavers_Other_Total	 EQ "">	
        <cfset form.apr25Leavers_Other_Total	 =0></cfif>
    <cfif form.apr25Leavers_Earned_Adult	 EQ "">	
        <cfset form.apr25Leavers_Earned_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Unemployment_Adult	 EQ "">	
        <cfset form.apr25Leavers_Unemployment_Adult	 =0></cfif>
    <cfif form.apr25Leavers_SSI_Adult	 EQ "">	
        <cfset form.apr25Leavers_SSI_Adult	 =0></cfif>
    <cfif form.apr25Leavers_SSDI_Adult	 EQ "">	
        <cfset form.apr25Leavers_SSDI_Adult	 =0></cfif>
    <cfif form.apr25Leavers_VetDisability_Adult	 EQ "">	
        <cfset form.apr25Leavers_VetDisability_Adult	 =0></cfif>
    <cfif form.apr25Leavers_PrivateDisability_Adult	 EQ "">	
        <cfset form.apr25Leavers_PrivateDisability_Adult	 =0></cfif>
    <cfif form.apr25Leavers_WorkersComp_Adult	 EQ "">	
        <cfset form.apr25Leavers_WorkersComp_Adult	 =0></cfif>
    <cfif form.apr25Leavers_TANF_Adult	 EQ "">	
        <cfset form.apr25Leavers_TANF_Adult	 =0></cfif>
    <cfif form.apr25Leavers_GA_Adult	 EQ "">	
        <cfset form.apr25Leavers_GA_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Retirement_Adult	 EQ "">	
        <cfset form.apr25Leavers_Retirement_Adult	 =0></cfif>
    <cfif form.apr25Leavers_VetPension_Adult	 EQ "">	
        <cfset form.apr25Leavers_VetPension_Adult	 =0></cfif>
    <cfif form.apr25Leavers_JobPension_Adult	 EQ "">	
        <cfset form.apr25Leavers_JobPension_Adult	 =0></cfif>
    <cfif form.apr25Leavers_ChildSupport_Adult	 EQ "">	
        <cfset form.apr25Leavers_ChildSupport_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Alimony_Adult	 EQ "">	
        <cfset form.apr25Leavers_Alimony_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Other_Adult	 EQ "">	
        <cfset form.apr25Leavers_Other_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Earned_Child	 EQ "">	
        <cfset form.apr25Leavers_Earned_Child	 =0></cfif>
    <cfif form.apr25Leavers_Unemployment_Child	 EQ "">	
        <cfset form.apr25Leavers_Unemployment_Child	 =0></cfif>
    <cfif form.apr25Leavers_SSI_Child	 EQ "">	
        <cfset form.apr25Leavers_SSI_Child	 =0></cfif>
    <cfif form.apr25Leavers_SSDI_Child	 EQ "">	
        <cfset form.apr25Leavers_SSDI_Child	 =0></cfif>
    <cfif form.apr25Leavers_VetDisability_Child	 EQ "">	
        <cfset form.apr25Leavers_VetDisability_Child	 =0></cfif>
    <cfif form.apr25Leavers_PrivateDisability_Child	 EQ "">	
        <cfset form.apr25Leavers_PrivateDisability_Child	 =0></cfif>
    <cfif form.apr25Leavers_WorkersComp_Child	 EQ "">	
        <cfset form.apr25Leavers_WorkersComp_Child	 =0></cfif>
    <cfif form.apr25Leavers_TANF_Child	 EQ "">	
        <cfset form.apr25Leavers_TANF_Child	 =0></cfif>
    <cfif form.apr25Leavers_GA_Child	 EQ "">	
        <cfset form.apr25Leavers_GA_Child	 =0></cfif>
    <cfif form.apr25Leavers_Retirement_Child	 EQ "">	
        <cfset form.apr25Leavers_Retirement_Child	 =0></cfif>
    <cfif form.apr25Leavers_VetPension_Child	 EQ "">	
        <cfset form.apr25Leavers_VetPension_Child	 =0></cfif>
    <cfif form.apr25Leavers_JobPension_Child	 EQ "">	
        <cfset form.apr25Leavers_JobPension_Child	 =0></cfif>
    <cfif form.apr25Leavers_ChildSupport_Child	 EQ "">	
        <cfset form.apr25Leavers_ChildSupport_Child	 =0></cfif>
    <cfif form.apr25Leavers_Alimony_Child	 EQ "">	
        <cfset form.apr25Leavers_Alimony_Child	 =0></cfif>
    <cfif form.apr25Leavers_Other_Child	 EQ "">	
        <cfset form.apr25Leavers_Other_Child	 =0></cfif>
    <cfif form.apr25Leavers_Earned_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Earned_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_Unemployment_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Unemployment_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_SSI_Unknown	 EQ "">	
        <cfset form.apr25Leavers_SSI_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_SSDI_Unknown	 EQ "">	
        <cfset form.apr25Leavers_SSDI_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_VetDisability_Unknown	 EQ "">	
        <cfset form.apr25Leavers_VetDisability_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_PrivateDisability_Unknown	 EQ "">	
        <cfset form.apr25Leavers_PrivateDisability_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_WorkersComp_Unknown	 EQ "">	
        <cfset form.apr25Leavers_WorkersComp_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_TANF_Unknown	 EQ "">	
        <cfset form.apr25Leavers_TANF_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_GA_Unknown	 EQ "">	
        <cfset form.apr25Leavers_GA_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_Retirement_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Retirement_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_VetPension_Unknown	 EQ "">	
        <cfset form.apr25Leavers_VetPension_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_JobPension_Unknown	 EQ "">	
        <cfset form.apr25Leavers_JobPension_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_ChildSupport_Unknown	 EQ "">	
        <cfset form.apr25Leavers_ChildSupport_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_Alimony_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Alimony_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_Other_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Other_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_NoSources_Total	 EQ "">	
        <cfset form.apr25Leavers_NoSources_Total	 =0></cfif>
    <cfif form.apr25Leavers_1Plus_Total	 EQ "">	
        <cfset form.apr25Leavers_1Plus_Total	 =0></cfif>
    <cfif form.apr25Leavers_DKR_Total	 EQ "">	
        <cfset form.apr25Leavers_DKR_Total	 =0></cfif>
    <cfif form.apr25Leavers_Missing_Total	 EQ "">	
        <cfset form.apr25Leavers_Missing_Total	 =0></cfif>
    <cfif form.apr25Leavers_Total_Total	 EQ "">	
        <cfset form.apr25Leavers_Total_Total	 =0></cfif>
    <cfif form.apr25Leavers_1Plus_Adult	 EQ "">	
        <cfset form.apr25Leavers_1Plus_Adult	 =0></cfif>
    <cfif form.apr25Leavers_NoSources_Adult	 EQ "">	
        <cfset form.apr25Leavers_NoSources_Adult	 =0></cfif>
    <cfif form.apr25Leavers_DKR_Adult	 EQ "">	
        <cfset form.apr25Leavers_DKR_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Missing_Adult	 EQ "">	
        <cfset form.apr25Leavers_Missing_Adult	 =0></cfif>
    <cfif form.apr25Leavers_Total_Adults	 EQ "">	
        <cfset form.apr25Leavers_Total_Adults	 =0></cfif>
    <cfif form.apr25Leavers_NoSources_Child	 EQ "">	
        <cfset form.apr25Leavers_NoSources_Child	 =0></cfif>
    <cfif form.apr25Leavers_1Plus_Child	 EQ "">	
        <cfset form.apr25Leavers_1Plus_Child	 =0></cfif>
    <cfif form.apr25Leavers_DKR_Child	 EQ "">	
        <cfset form.apr25Leavers_DKR_Child	 =0></cfif>
    <cfif form.apr25Leavers_Missing_Child	 EQ "">	
        <cfset form.apr25Leavers_Missing_Child	 =0></cfif>
    <cfif form.apr25Leavers_Total_Child	 EQ "">	
        <cfset form.apr25Leavers_Total_Child	 =0></cfif>
    <cfif form.apr25Leavers_NoSources_Unknown	 EQ "">	
        <cfset form.apr25Leavers_NoSources_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_1Plus_Unknown	 EQ "">	
        <cfset form.apr25Leavers_1Plus_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_DKR_Unknown	 EQ "">	
        <cfset form.apr25Leavers_DKR_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_Missing_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Missing_Unknown	 =0></cfif>
    <cfif form.apr25Leavers_Total_Unknown	 EQ "">	
        <cfset form.apr25Leavers_Total_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Earned_Total	 EQ "">	
        <cfset form.apr25Stayers_Earned_Total	 =0></cfif>
    <cfif form.apr25Stayers_Unemployment_Total	 EQ "">	
        <cfset form.apr25Stayers_Unemployment_Total	 =0></cfif>
    <cfif form.apr25Stayers_SSI_Total	 EQ "">	
        <cfset form.apr25Stayers_SSI_Total	 =0></cfif>
    <cfif form.apr25Stayers_SSDI_Total	 EQ "">	
        <cfset form.apr25Stayers_SSDI_Total	 =0></cfif>
    <cfif form.apr25Stayers_VetDisability_Total	 EQ "">	
        <cfset form.apr25Stayers_VetDisability_Total	 =0></cfif>
    <cfif form.apr25Stayers_PrivateDisability_Total	 EQ "">	
        <cfset form.apr25Stayers_PrivateDisability_Total	 =0></cfif>
    <cfif form.apr25Stayers_WorkersComp_Total	 EQ "">	
        <cfset form.apr25Stayers_WorkersComp_Total	 =0></cfif>
    <cfif form.apr25Stayers_TANF_Total	 EQ "">	
        <cfset form.apr25Stayers_TANF_Total	 =0></cfif>
    <cfif form.apr25Stayers_GA_Total	 EQ "">	
        <cfset form.apr25Stayers_GA_Total	 =0></cfif>
    <cfif form.apr25Stayers_Retirement_Total	 EQ "">	
        <cfset form.apr25Stayers_Retirement_Total	 =0></cfif>
    <cfif form.apr25Stayers_VetPension_Total	 EQ "">	
        <cfset form.apr25Stayers_VetPension_Total	 =0></cfif>
    <cfif form.apr25Stayers_JobPension_Total	 EQ "">	
        <cfset form.apr25Stayers_JobPension_Total	 =0></cfif>
    <cfif form.apr25Stayers_ChildSupport_Total	 EQ "">	
        <cfset form.apr25Stayers_ChildSupport_Total	 =0></cfif>
    <cfif form.apr25Stayers_Alimony_Total	 EQ "">	
        <cfset form.apr25Stayers_Alimony_Total	 =0></cfif>
    <cfif form.apr25Stayers_Other_Total	 EQ "">	
        <cfset form.apr25Stayers_Other_Total	 =0></cfif>
    <cfif form.apr25Stayers_Alimony_Adult	 EQ "">	
        <cfset form.apr25Stayers_Alimony_Adult	 =0></cfif>
    <cfif form.apr25Stayers_Earned_Adult	 EQ "">	
        <cfset form.apr25Stayers_Earned_Adult	 =0></cfif>
    <cfif form.apr25Stayers_Unemployment_Adult	 EQ "">	
        <cfset form.apr25Stayers_Unemployment_Adult	 =0></cfif>
    <cfif form.apr25Stayers_SSI_Adult	 EQ "">	
        <cfset form.apr25Stayers_SSI_Adult	 =0></cfif>
    <cfif form.apr25Stayers_SSDI_Adult	 EQ "">	
        <cfset form.apr25Stayers_SSDI_Adult	 =0></cfif>
    <cfif form.apr25Stayers_VetDisability_Adult	 EQ "">	
        <cfset form.apr25Stayers_VetDisability_Adult	 =0></cfif>
    <cfif form.apr25Stayers_PrivateDisability_Adult	 EQ "">	
        <cfset form.apr25Stayers_PrivateDisability_Adult	 =0></cfif>
    <cfif form.apr25Stayers_WorkersComp_Adult	 EQ "">	
        <cfset form.apr25Stayers_WorkersComp_Adult	 =0></cfif>
    <cfif form.apr25Stayers_TANF_Adult	 EQ "">	
        <cfset form.apr25Stayers_TANF_Adult	 =0></cfif>
    <cfif form.apr25Stayers_GA_Adult	 EQ "">	
        <cfset form.apr25Stayers_GA_Adult	 =0></cfif>
    <cfif form.apr25Stayers_Retirement_Adult	 EQ "">	
        <cfset form.apr25Stayers_Retirement_Adult	 =0></cfif>
    <cfif form.apr25Stayers_VetPension_Adult	 EQ "">	
        <cfset form.apr25Stayers_VetPension_Adult	 =0></cfif>
    <cfif form.apr25Stayers_JobPension_Adult	 EQ "">	
        <cfset form.apr25Stayers_JobPension_Adult	 =0></cfif>
    <cfif form.apr25Stayers_ChildSupport_Adult	 EQ "">	
        <cfset form.apr25Stayers_ChildSupport_Adult	 =0></cfif>
    <cfif form.apr25Stayers_Other_Adult	 EQ "">	
        <cfset form.apr25Stayers_Other_Adult	 =0></cfif>
    <cfif form.apr25Stayers_ChildSupport_Child	 EQ "">	
        <cfset form.apr25Stayers_ChildSupport_Child	 =0></cfif>
    <cfif form.apr25Stayers_VetPension_Child	 EQ "">	
        <cfset form.apr25Stayers_VetPension_Child	 =0></cfif>
    <cfif form.apr25Stayers_Alimony_Child	 EQ "">	
        <cfset form.apr25Stayers_Alimony_Child	 =0></cfif>
    <cfif form.apr25Stayers_Earned_Child	 EQ "">	
        <cfset form.apr25Stayers_Earned_Child	 =0></cfif>
    <cfif form.apr25Stayers_GA_Child	 EQ "">	
        <cfset form.apr25Stayers_GA_Child	 =0></cfif>
    <cfif form.apr25Stayers_Other_Child	 EQ "">	
        <cfset form.apr25Stayers_Other_Child	 =0></cfif>
    <cfif form.apr25Stayers_TANF_Child	 EQ "">	
        <cfset form.apr25Stayers_TANF_Child	 =0></cfif>
    <cfif form.apr25Stayers_SSI_Child	 EQ "">	
        <cfset form.apr25Stayers_SSI_Child	 =0></cfif>
    <cfif form.apr25Stayers_Unemployment_Child	 EQ "">	
        <cfset form.apr25Stayers_Unemployment_Child	 =0></cfif>
    <cfif form.apr25Stayers_SSDI_Child	 EQ "">	
        <cfset form.apr25Stayers_SSDI_Child	 =0></cfif>
    <cfif form.apr25Stayers_VetDisability_Child	 EQ "">	
        <cfset form.apr25Stayers_VetDisability_Child	 =0></cfif>
    <cfif form.apr25Stayers_PrivateDisability_Child	 EQ "">	
        <cfset form.apr25Stayers_PrivateDisability_Child	 =0></cfif>
    <cfif form.apr25Stayers_WorkersComp_Child	 EQ "">	
        <cfset form.apr25Stayers_WorkersComp_Child	 =0></cfif>
    <cfif form.apr25Stayers_Retirement_Child	 EQ "">	
        <cfset form.apr25Stayers_Retirement_Child	 =0></cfif>
    <cfif form.apr25Stayers_JobPension_Child	 EQ "">	
        <cfset form.apr25Stayers_JobPension_Child	 =0></cfif>
    <cfif form.apr25Stayers_ChildSupport_Unknown	 EQ "">	
        <cfset form.apr25Stayers_ChildSupport_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_VetPension_Unknown	 EQ "">	
        <cfset form.apr25Stayers_VetPension_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Alimony_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Alimony_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Earned_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Earned_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_GA_Unknown	 EQ "">	
        <cfset form.apr25Stayers_GA_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Other_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Other_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Unemployment_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Unemployment_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_SSI_Unknown	 EQ "">	
        <cfset form.apr25Stayers_SSI_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_SSDI_Unknown	 EQ "">	
        <cfset form.apr25Stayers_SSDI_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_VetDisability_Unknown	 EQ "">	
        <cfset form.apr25Stayers_VetDisability_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_PrivateDisability_Unknown	 EQ "">	
        <cfset form.apr25Stayers_PrivateDisability_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_WorkersComp_Unknown	 EQ "">	
        <cfset form.apr25Stayers_WorkersComp_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_TANF_Unknown	 EQ "">	
        <cfset form.apr25Stayers_TANF_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Retirement_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Retirement_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_JobPension_Unknown	 EQ "">	
        <cfset form.apr25Stayers_JobPension_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_NoSources_Total	 EQ "">	
        <cfset form.apr25Stayers_NoSources_Total	 =0></cfif>
    <cfif form.apr25Stayers_1Plus_Total	 EQ "">	
        <cfset form.apr25Stayers_1Plus_Total	 =0></cfif>
    <cfif form.apr25Stayers_DKR_Total	 EQ "">	
        <cfset form.apr25Stayers_DKR_Total	 =0></cfif>
    <cfif form.apr25Stayers_Missing_Total	 EQ "">	
        <cfset form.apr25Stayers_Missing_Total	 =0></cfif>
    <cfif form.apr25Stayers_Total_Total	 EQ "">	
        <cfset form.apr25Stayers_Total_Total	 =0></cfif>
    <cfif form.apr25Stayers_1Plus_Adult	 EQ "">	
        <cfset form.apr25Stayers_1Plus_Adult	 =0></cfif>
    <cfif form.apr25Stayers_NoSources_Adult	 EQ "">	
        <cfset form.apr25Stayers_NoSources_Adult	 =0></cfif>
    <cfif form.apr25Stayers_NoSources_Child	 EQ "">	
        <cfset form.apr25Stayers_NoSources_Child	 =0></cfif>
    <cfif form.apr25Stayers_1Plus_Child	 EQ "">	
        <cfset form.apr25Stayers_1Plus_Child	 =0></cfif>
    <cfif form.apr25Stayers_DKR_Adult	 EQ "">	<cfset form.apr25Stayers_DKR_Adult	 =0></cfif>
    <cfif form.apr25Stayers_Missing_Adult	 EQ "">	
        <cfset form.apr25Stayers_Missing_Adult	 =0></cfif>
    <cfif form.apr25Stayers_Total_Adult	 EQ "">	
        <cfset form.apr25Stayers_Total_Adult	 =0></cfif>
    <cfif form.apr25Stayers_DKR_Child	 EQ "">	
        <cfset form.apr25Stayers_DKR_Child	 =0></cfif>
    <cfif form.apr25Stayers_Missing_Child	 EQ "">	<cfset form.apr25Stayers_Missing_Child	 =0></cfif>
    <cfif form.apr25Stayers_Total_Child	 EQ "">	
        <cfset form.apr25Stayers_Total_Child	 =0></cfif>
    <cfif form.apr25Stayers_NoSources_Unknown	 EQ "">	
        <cfset form.apr25Stayers_NoSources_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_1Plus_Unknown	 EQ "">	
        <cfset form.apr25Stayers_1Plus_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_DKR_Unknown	 EQ "">	
        <cfset form.apr25Stayers_DKR_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Missing_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Missing_Unknown	 =0></cfif>
    <cfif form.apr25Stayers_Total_Unknown	 EQ "">	
        <cfset form.apr25Stayers_Total_Unknown	 =0></cfif>
    <!---/ Set Defaults --->
        
    <cfupdate datasource="#DataSource#" tablename="dataapr25" formfields="DataAPR25ID, aprID, inputUserID, projectID, reviewUserID, apr25Leavers_Earned_Total, apr25Leavers_Unemployment_Total, apr25Leavers_SSI_Total, apr25Leavers_SSDI_Total, apr25Leavers_VetDisability_Total, apr25Leavers_PrivateDisability_Total, apr25Leavers_WorkersComp_Total, apr25Leavers_TANF_Total, apr25Leavers_GA_Total, apr25Leavers_Retirement_Total, apr25Leavers_VetPension_Total, apr25Leavers_JobPension_Total, apr25Leavers_ChildSupport_Total, apr25Leavers_Alimony_Total, apr25Leavers_Other_Total, apr25Leavers_Earned_Adult, apr25Leavers_Unemployment_Adult, apr25Leavers_SSI_Adult, apr25Leavers_SSDI_Adult, apr25Leavers_VetDisability_Adult, apr25Leavers_PrivateDisability_Adult, apr25Leavers_WorkersComp_Adult, apr25Leavers_TANF_Adult, apr25Leavers_GA_Adult, apr25Leavers_Retirement_Adult, apr25Leavers_VetPension_Adult, apr25Leavers_JobPension_Adult, apr25Leavers_ChildSupport_Adult, apr25Leavers_Alimony_Adult, apr25Leavers_Other_Adult, apr25Leavers_Earned_Child, apr25Leavers_Unemployment_Child, apr25Leavers_SSI_Child, apr25Leavers_SSDI_Child, apr25Leavers_VetDisability_Child, apr25Leavers_PrivateDisability_Child, apr25Leavers_WorkersComp_Child, apr25Leavers_TANF_Child, apr25Leavers_GA_Child, apr25Leavers_Retirement_Child, apr25Leavers_VetPension_Child, apr25Leavers_JobPension_Child, apr25Leavers_ChildSupport_Child, apr25Leavers_Alimony_Child, apr25Leavers_Other_Child, apr25Leavers_Earned_Unknown, apr25Leavers_Unemployment_Unknown, apr25Leavers_SSI_Unknown, apr25Leavers_SSDI_Unknown, apr25Leavers_VetDisability_Unknown, apr25Leavers_PrivateDisability_Unknown, apr25Leavers_WorkersComp_Unknown, apr25Leavers_TANF_Unknown, apr25Leavers_GA_Unknown, apr25Leavers_Retirement_Unknown, apr25Leavers_VetPension_Unknown, apr25Leavers_JobPension_Unknown, apr25Leavers_ChildSupport_Unknown, apr25Leavers_Alimony_Unknown, apr25Leavers_Other_Unknown, apr25Leavers_NoSources_Total, apr25Leavers_1Plus_Total, apr25Leavers_DKR_Total, apr25Leavers_Missing_Total, apr25Leavers_Total_Total, apr25Leavers_1Plus_Adult, apr25Leavers_NoSources_Adult, apr25Leavers_DKR_Adult, apr25Leavers_Missing_Adult, apr25Leavers_Total_Adults, apr25Leavers_NoSources_Child, apr25Leavers_1Plus_Child, apr25Leavers_DKR_Child, apr25Leavers_Missing_Child, apr25Leavers_Total_Child, apr25Leavers_NoSources_Unknown, apr25Leavers_1Plus_Unknown, apr25Leavers_DKR_Unknown, apr25Leavers_Missing_Unknown, apr25Leavers_Total_Unknown, apr25Stayers_Earned_Total, apr25Stayers_Unemployment_Total, apr25Stayers_SSI_Total, apr25Stayers_SSDI_Total, apr25Stayers_VetDisability_Total, apr25Stayers_PrivateDisability_Total, apr25Stayers_WorkersComp_Total, apr25Stayers_TANF_Total, apr25Stayers_GA_Total, apr25Stayers_Retirement_Total, apr25Stayers_VetPension_Total, apr25Stayers_JobPension_Total, apr25Stayers_ChildSupport_Total, apr25Stayers_Alimony_Total, apr25Stayers_Other_Total, apr25Stayers_Alimony_Adult, apr25Stayers_Earned_Adult, apr25Stayers_Unemployment_Adult, apr25Stayers_SSI_Adult, apr25Stayers_SSDI_Adult, apr25Stayers_VetDisability_Adult, apr25Stayers_PrivateDisability_Adult, apr25Stayers_WorkersComp_Adult, apr25Stayers_TANF_Adult, apr25Stayers_GA_Adult, apr25Stayers_Retirement_Adult, apr25Stayers_VetPension_Adult, apr25Stayers_JobPension_Adult, apr25Stayers_ChildSupport_Adult, apr25Stayers_Other_Adult, apr25Stayers_ChildSupport_Child, apr25Stayers_VetPension_Child, apr25Stayers_Alimony_Child, apr25Stayers_Earned_Child, apr25Stayers_GA_Child, apr25Stayers_Other_Child, apr25Stayers_TANF_Child, apr25Stayers_SSI_Child, apr25Stayers_Unemployment_Child, apr25Stayers_SSDI_Child, apr25Stayers_VetDisability_Child, apr25Stayers_PrivateDisability_Child, apr25Stayers_WorkersComp_Child, apr25Stayers_Retirement_Child, apr25Stayers_JobPension_Child, apr25Stayers_ChildSupport_Unknown, apr25Stayers_VetPension_Unknown, apr25Stayers_Alimony_Unknown, apr25Stayers_Earned_Unknown, apr25Stayers_GA_Unknown, apr25Stayers_Other_Unknown, apr25Stayers_Unemployment_Unknown, apr25Stayers_SSI_Unknown, apr25Stayers_SSDI_Unknown, apr25Stayers_VetDisability_Unknown, apr25Stayers_PrivateDisability_Unknown, apr25Stayers_WorkersComp_Unknown, apr25Stayers_TANF_Unknown, apr25Stayers_Retirement_Unknown, apr25Stayers_JobPension_Unknown, apr25Stayers_NoSources_Total, apr25Stayers_1Plus_Total, apr25Stayers_DKR_Total, apr25Stayers_Missing_Total, apr25Stayers_Total_Total, apr25Stayers_1Plus_Adult, apr25Stayers_NoSources_Adult, apr25Stayers_NoSources_Child, apr25Stayers_1Plus_Child, apr25Stayers_DKR_Adult, apr25Stayers_Missing_Adult, apr25Stayers_Total_Adult, apr25Stayers_DKR_Child, apr25Stayers_Missing_Child, apr25Stayers_Total_Child, apr25Stayers_NoSources_Unknown, apr25Stayers_1Plus_Unknown, apr25Stayers_DKR_Unknown, apr25Stayers_Missing_Unknown, apr25Stayers_Total_Unknown">
  </cfif>
  <cfset SESSION.message = "success">
  <cfset SESSION.messageText = "#ProjectName# updated successfully.">
  <cflocation url="#successpage#">
<cfelseif FORM.action EQ "process">
   <cfset SESSION.message = "alert">
   <cfset SESSION.messageText = "Authentication error. Please try again.">
</cfif>
<cfinclude template="#AbsoluteURL#legos/alert.cfm">
<!---/ Process Forms --->

<!--- Queires --->
<!--- Get Projects --->
<cfinvoke component="knex.projects" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getProjects"
        whatFields = "*"
        Where = "ThisProject">
<!---/ Get Projects --->

<!--- Get DataAPR --->
<cfinvoke component="knex.aprData" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getDataAPR"
        FormID = "*"
        Form = "dataapr25"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="8">
<cfset mathRows="40">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Type of Cash-Income Sources</h3>
    <h4>Number of Leavers</h4>
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>Earned Income</td>
          <td>
<input type="number"
       name="apr25Leavers_Earned_Total"
       value="#getDataAPR.apr25Leavers_Earned_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR1">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Earned_Adult"
       value="#getDataAPR.apr25Leavers_Earned_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1"
       autofocus>
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Earned_Child"
       value="#getDataAPR.apr25Leavers_Earned_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Earned_Unknown"
       value="#getDataAPR.apr25Leavers_Earned_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Unemployment Insurance=</td>
          <td>
<input type="number"
       name="apr25Leavers_Unemployment_Total"
       value="#getDataAPR.apr25Leavers_Unemployment_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Unemployment_Adult"
       value="#getDataAPR.apr25Leavers_Unemployment_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Unemployment_Child"
       value="#getDataAPR.apr25Leavers_Unemployment_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Unemployment_Unknown"
       value="#getDataAPR.apr25Leavers_Unemployment_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row2">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>SSI</td>
          <td>
<input type="number"
       name="apr25Leavers_SSI_Total"
       value="#getDataAPR.apr25Leavers_SSI_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_SSI_Adult"
       value="#getDataAPR.apr25Leavers_SSI_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_SSI_Child"
       value="#getDataAPR.apr25Leavers_SSI_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_SSI_Unknown"
       value="#getDataAPR.apr25Leavers_SSI_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>SSDI</td>
          <td>
<input type="number"
       name="apr25Leavers_SSDI_Total"
       value="#getDataAPR.apr25Leavers_SSDI_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR4">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_SSDI_Adult"
       value="#getDataAPR.apr25Leavers_SSDI_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row4">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_SSDI_Child"
       value="#getDataAPR.apr25Leavers_SSDI_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row4">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_SSDI_Unknown"
       value="#getDataAPR.apr25Leavers_SSDI_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row4">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Veteran's Disability</td>
          <td>
<input type="number"
       name="apr25Leavers_VetDisability_Total"
       value="#getDataAPR.apr25Leavers_VetDisability_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR5">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_VetDisability_Adult"
       value="#getDataAPR.apr25Leavers_VetDisability_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_VetDisability_Child"
       value="#getDataAPR.apr25Leavers_VetDisability_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_VetDisability_Unknown"
       value="#getDataAPR.apr25Leavers_VetDisability_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Private Disability Insurance</td>
          <td>
<input type="number"
       name="apr25Leavers_PrivateDisability_Total"
       value="#getDataAPR.apr25Leavers_PrivateDisability_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_PrivateDisability_Adult"
       value="#getDataAPR.apr25Leavers_PrivateDisability_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_PrivateDisability_Child"
       value="#getDataAPR.apr25Leavers_PrivateDisability_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_PrivateDisability_Unknown"
       value="#getDataAPR.apr25Leavers_PrivateDisability_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row6">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Worker's Compensation</td>
          <td>
<input type="number"
       name="apr25Leavers_WorkersComp_Total"
       value="#getDataAPR.apr25Leavers_WorkersComp_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_WorkersComp_Adult"
       value="#getDataAPR.apr25Leavers_WorkersComp_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_WorkersComp_Child"
       value="#getDataAPR.apr25Leavers_WorkersComp_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_WorkersComp_Unknown"
       value="#getDataAPR.apr25Leavers_WorkersComp_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>TANF or Equivalent</td>
          <td>
<input type="number"
       name="apr25Leavers_TANF_Total"
       value="#getDataAPR.apr25Leavers_TANF_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR8">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_TANF_Adult"
       value="#getDataAPR.apr25Leavers_TANF_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row8">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_TANF_Child"
       value="#getDataAPR.apr25Leavers_TANF_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row8">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_TANF_Unknown"
       value="#getDataAPR.apr25Leavers_TANF_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row8">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>General Assistance</td>
          <td>
<input type="number"
       name="apr25Leavers_GA_Total"
       value="#getDataAPR.apr25Leavers_GA_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR9">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_GA_Adult"
       value="#getDataAPR.apr25Leavers_GA_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_GA_Child"
       value="#getDataAPR.apr25Leavers_GA_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_GA_Unknown"
       value="#getDataAPR.apr25Leavers_GA_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Retirement (Social Security)</td>
          <td>
<input type="number"
       name="apr25Leavers_Retirement_Total"
       value="#getDataAPR.apr25Leavers_Retirement_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR10">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Retirement_Adult"
       value="#getDataAPR.apr25Leavers_Retirement_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row10">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Retirement_Child"
       value="#getDataAPR.apr25Leavers_Retirement_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row10">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Retirement_Unknown"
       value="#getDataAPR.apr25Leavers_Retirement_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row10">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Veteran's Pension</td>
          <td>
<input type="number"
       name="apr25Leavers_VetPension_Total"
       value="#getDataAPR.apr25Leavers_VetPension_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR11">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_VetPension_Adult"
       value="#getDataAPR.apr25Leavers_VetPension_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_VetPension_Child"
       value="#getDataAPR.apr25Leavers_VetPension_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_VetPension_Unknown"
       value="#getDataAPR.apr25Leavers_VetPension_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Pension from Former Job</td>
          <td>
<input type="number"
       name="apr25Leavers_JobPension_Total"
       value="#getDataAPR.apr25Leavers_JobPension_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR12">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_JobPension_Adult"
       value="#getDataAPR.apr25Leavers_JobPension_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row12">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_JobPension_Child"
       value="#getDataAPR.apr25Leavers_JobPension_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row12">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_JobPension_Unknown"
       value="#getDataAPR.apr25Leavers_JobPension_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row12">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Child Support</td>
          <td>
<input type="number"
       name="apr25Leavers_ChildSupport_Total"
       value="#getDataAPR.apr25Leavers_ChildSupport_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR14">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_ChildSupport_Adult"
       value="#getDataAPR.apr25Leavers_ChildSupport_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row14">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_ChildSupport_Child"
       value="#getDataAPR.apr25Leavers_ChildSupport_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row14">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_ChildSupport_Unknown"
       value="#getDataAPR.apr25Leavers_ChildSupport_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row14">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Alimony (Spousal Support)</td>
          <td>
<input type="number"
       name="apr25Leavers_Alimony_Total"
       value="#getDataAPR.apr25Leavers_Alimony_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR15">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Alimony_Adult"
       value="#getDataAPR.apr25Leavers_Alimony_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Alimony_Child"
       value="#getDataAPR.apr25Leavers_Alimony_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Alimony_Unknown"
       value="#getDataAPR.apr25Leavers_Alimony_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
<small class="form-error">Must be a whole number</small>

          </td>
        </tr>
        <tr>
          <td>Other Source</td>
          <td>
<input type="number"
       name="apr25Leavers_Other_Total"
       value="#getDataAPR.apr25Leavers_Other_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR16">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Other_Adult"
       value="#getDataAPR.apr25Leavers_Other_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row16">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Other_Child"
       value="#getDataAPR.apr25Leavers_Other_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row16">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Other_Unknown"
       value="#getDataAPR.apr25Leavers_Other_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row16">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="row">
  <div class="large-12 columns">
    <h3>Number of Cash-Income Sources</h3>
    <h4>Number of Leavers</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>No Sources</td>
          <td>
<input type="number"
       name="apr25Leavers_NoSources_Total"
       value="#getDataAPR.apr25Leavers_NoSources_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col1"
      id="sumR17">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_NoSources_Adult"
       value="#getDataAPR.apr25Leavers_NoSources_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17 col2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_NoSources_Child"
       value="#getDataAPR.apr25Leavers_NoSources_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17 col3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_NoSources_Unknown"
       value="#getDataAPR.apr25Leavers_NoSources_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17 col4">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>1 + Source (s)</td>
          <td>
<input type="number"
       name="apr25Leavers_1Plus_Total"
       value="#getDataAPR.apr25Leavers_1Plus_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col1"
      id="sumR18">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_1Plus_Adult"
       value="#getDataAPR.apr25Leavers_1Plus_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row18 col2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_1Plus_Child"
       value="#getDataAPR.apr25Leavers_1Plus_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row18 col3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_1Plus_Unknown"
       value="#getDataAPR.apr25Leavers_1Plus_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row18 col4">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
<input type="number"
       name="apr25Leavers_DKR_Total"
       value="#getDataAPR.apr25Leavers_DKR_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col1"
      id="sumR19">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_DKR_Adult"
       value="#getDataAPR.apr25Leavers_DKR_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row19 col2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_DKR_Child"
       value="#getDataAPR.apr25Leavers_DKR_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row19 col3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_DKR_Unknown"
       value="#getDataAPR.apr25Leavers_DKR_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row19 col4">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing </td>
          <td>
<input type="number"
       name="apr25Leavers_Missing_Total"
       value="#getDataAPR.apr25Leavers_Missing_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col1"
      id="sumR20">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Missing_Adult"
       value="#getDataAPR.apr25Leavers_Missing_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row20 col2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Missing_Child"
       value="#getDataAPR.apr25Leavers_Missing_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row20 col3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Missing_Unknown"
       value="#getDataAPR.apr25Leavers_Missing_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row20 col4">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
<input type="number"
       name="apr25Leavers_Total_Total"
       value="#getDataAPR.apr25Leavers_Total_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
     
      readonly
      class="subtotal_leavers BGLightGray"
      id="sumC1">

          </td>
          <td>
<input type="number"
       name="apr25Leavers_Total_Adults"
       value="#getDataAPR.apr25Leavers_Total_Adults#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumC2">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Total_Child"
       value="#getDataAPR.apr25Leavers_Total_Child#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumC3">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Leavers_Total_Unknown"
       value="#getDataAPR.apr25Leavers_Total_Unknown#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumC4">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Type of Cash-Income Sources</h3>
    <h4>Number of Stayers</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>Earned Income</td>
          <td>
<input type="number"
       name="apr25Stayers_Earned_Total"
       value="#getDataAPR.apr25Stayers_Earned_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR21">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Earned_Adult"
       value="#getDataAPR.apr25Stayers_Earned_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row21">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Earned_Child"
       value="#getDataAPR.apr25Stayers_Earned_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row21">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Earned_Unknown"
       value="#getDataAPR.apr25Stayers_Earned_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row21">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Unemployment Insurance=</td>
          <td>
<input type="number"
       name="apr25Stayers_Unemployment_Total"
       value="#getDataAPR.apr25Stayers_Unemployment_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR22">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Unemployment_Adult"
       value="#getDataAPR.apr25Stayers_Unemployment_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row22">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Unemployment_Child"
       value="#getDataAPR.apr25Stayers_Unemployment_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row22">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Unemployment_Unknown"
       value="#getDataAPR.apr25Stayers_Unemployment_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row22">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>SSI</td>
          <td>
<input type="number"
       name="apr25Stayers_SSI_Total"
       value="#getDataAPR.apr25Stayers_SSI_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR23">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_SSI_Adult"
       value="#getDataAPR.apr25Stayers_SSI_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row23">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_SSI_Child"
       value="#getDataAPR.apr25Stayers_SSI_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row23">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_SSI_Unknown"
       value="#getDataAPR.apr25Stayers_SSI_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row23">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>SSDI</td>
          <td>
<input type="number"
       name="apr25Stayers_SSDI_Total"
       value="#getDataAPR.apr25Stayers_SSDI_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR24">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_SSDI_Adult"
       value="#getDataAPR.apr25Stayers_SSDI_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row24">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_SSDI_Child"
       value="#getDataAPR.apr25Stayers_SSDI_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row24">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_SSDI_Unknown"
       value="#getDataAPR.apr25Stayers_SSDI_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row24">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Veteran's Disability</td>
          <td>
<input type="number"
       name="apr25Stayers_VetDisability_Total"
       value="#getDataAPR.apr25Stayers_VetDisability_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR25">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_VetDisability_Adult"
       value="#getDataAPR.apr25Stayers_VetDisability_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row25">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_VetDisability_Child"
       value="#getDataAPR.apr25Stayers_VetDisability_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row25">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_VetDisability_Unknown"
       value="#getDataAPR.apr25Stayers_VetDisability_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row25">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Private Disability Insurance</td>
          <td>
<input type="number"
       name="apr25Stayers_PrivateDisability_Total"
       value="#getDataAPR.apr25Stayers_PrivateDisability_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR26">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_PrivateDisability_Adult"
       value="#getDataAPR.apr25Stayers_PrivateDisability_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row26">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_PrivateDisability_Child"
       value="#getDataAPR.apr25Stayers_PrivateDisability_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row26">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_PrivateDisability_Unknown"
       value="#getDataAPR.apr25Stayers_PrivateDisability_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row26">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Worker's Compensation</td>
          <td>
<input type="number"
       name="apr25Stayers_WorkersComp_Total"
       value="#getDataAPR.apr25Stayers_WorkersComp_Total#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR27">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_WorkersComp_Adult"
       value="#getDataAPR.apr25Stayers_WorkersComp_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row27">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_WorkersComp_Child"
       value="#getDataAPR.apr25Stayers_WorkersComp_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row27">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_WorkersComp_Unknown"
       value="#getDataAPR.apr25Stayers_WorkersComp_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row27">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>TANF or Equivalent</td>
          <td>
<input type="number"
       name="apr25Stayers_TANF_Total"
       value="#getDataAPR.apr25Stayers_TANF_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR28">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_TANF_Adult"
       value="#getDataAPR.apr25Stayers_TANF_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row28">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_TANF_Child"
       value="#getDataAPR.apr25Stayers_TANF_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row28">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_TANF_Unknown"
       value="#getDataAPR.apr25Stayers_TANF_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row28">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>General Assistance</td>
          <td>
<input type="number"
       name="apr25Stayers_GA_Total"
       value="#getDataAPR.apr25Stayers_GA_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR29">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_GA_Adult"
       value="#getDataAPR.apr25Stayers_GA_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row29">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_GA_Child"
       value="#getDataAPR.apr25Stayers_GA_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row29">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_GA_Unknown"
       value="#getDataAPR.apr25Stayers_GA_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row29">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Retirement (Social Security)</td>
          <td>
<input type="number"
       name="apr25Stayers_Retirement_Total"
       value="#getDataAPR.apr25Stayers_Retirement_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR30">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Retirement_Adult"
       value="#getDataAPR.apr25Stayers_Retirement_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row30">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Retirement_Child"
       value="#getDataAPR.apr25Stayers_Retirement_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row30">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Retirement_Unknown"
       value="#getDataAPR.apr25Stayers_Retirement_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row30">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Veteran's Pension</td>
          <td>
<input type="number"
       name="apr25Stayers_VetPension_Total"
       value="#getDataAPR.apr25Stayers_VetPension_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR31">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_VetPension_Adult"
       value="#getDataAPR.apr25Stayers_VetPension_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row31">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_VetPension_Child"
       value="#getDataAPR.apr25Stayers_VetPension_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row31">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_VetPension_Unknown"
       value="#getDataAPR.apr25Stayers_VetPension_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row31">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Pension from Former Job</td>
          <td>
<input type="number"
       name="apr25Stayers_JobPension_Total"
       value="#getDataAPR.apr25Stayers_JobPension_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR32">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_JobPension_Adult"
       value="#getDataAPR.apr25Stayers_JobPension_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row32">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_JobPension_Child"
       value="#getDataAPR.apr25Stayers_JobPension_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row32">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_JobPension_Unknown"
       value="#getDataAPR.apr25Stayers_JobPension_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row32">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Child Support</td>
          <td>
<input type="number"
       name="apr25Stayers_ChildSupport_Total"
       value="#getDataAPR.apr25Stayers_ChildSupport_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
       class="BGLightGray"
       id="sumR34">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_ChildSupport_Adult"
       value="#getDataAPR.apr25Stayers_ChildSupport_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row34">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_ChildSupport_Child"
       value="#getDataAPR.apr25Stayers_ChildSupport_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row34">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_ChildSupport_Unknown"
       value="#getDataAPR.apr25Stayers_ChildSupport_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row34">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Alimony (Spousal Support)</td>
          <td>
<input type="number"
       name="apr25Stayers_Alimony_Total"
       value="#getDataAPR.apr25Stayers_Alimony_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR35">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Alimony_Adult"
       value="#getDataAPR.apr25Stayers_Alimony_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row35">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Alimony_Child"
       value="#getDataAPR.apr25Stayers_Alimony_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row35">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Alimony_Unknown"
       value="#getDataAPR.apr25Stayers_Alimony_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row35">
<small class="form-error">Must be a whole number</small>

          </td>
        </tr>
        <tr>
          <td>Other Source</td>
          <td>
<input type="number"
       name="apr25Stayers_Other_Total"
       value="#getDataAPR.apr25Stayers_Other_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
       readonly
       class="BGLightGray"
       id="sumR36">
<small class="form-error">Must be a whole number</small>
          </td>
          <td> 
<input type="number"
       name="apr25Stayers_Other_Adult"
       value="#getDataAPR.apr25Stayers_Other_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row36">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Other_Child"
       value="#getDataAPR.apr25Stayers_Other_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row36">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Other_Unknown"
       value="#getDataAPR.apr25Stayers_Other_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row36">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Number of Cash-Income Sources</h3>
    <h4>Number of Stayers</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>No Sources</td>
          <td>
<input type="number"
       name="apr25Stayers_NoSources_Total"
       value="#getDataAPR.apr25Stayers_NoSources_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col5"
      id="sumR37">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_NoSources_Adult"
       value="#getDataAPR.apr25Stayers_NoSources_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row37 col6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_NoSources_Child"
       value="#getDataAPR.apr25Stayers_NoSources_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row37 col7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_NoSources_Unknown"
       value="#getDataAPR.apr25Stayers_NoSources_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row37 col8">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>1 + Source (s)</td>
          <td>
<input type="number"
       name="apr25Stayers_1Plus_Total"
       value="#getDataAPR.apr25Stayers_1Plus_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col5"
      id="sumR38">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_1Plus_Adult"
       value="#getDataAPR.apr25Stayers_1Plus_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row38 col6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_1Plus_Child"
       value="#getDataAPR.apr25Stayers_1Plus_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row38 col7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_1Plus_Unknown"
       value="#getDataAPR.apr25Stayers_1Plus_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row38 col8">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
          <td>
<input type="number"
       name="apr25Stayers_DKR_Total"
       value="#getDataAPR.apr25Stayers_DKR_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col5"
      id="sumR39">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_DKR_Adult"
       value="#getDataAPR.apr25Stayers_DKR_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row39 col6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_DKR_Child"
       value="#getDataAPR.apr25Stayers_DKR_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row39 col7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_DKR_Unknown"
       value="#getDataAPR.apr25Stayers_DKR_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row39 col8">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing </td>
          <td>
<input type="number"
       name="apr25Stayers_Missing_Total"
       value="#getDataAPR.apr25Stayers_Missing_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray col5"
      id="sumR40">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Missing_Adult"
       value="#getDataAPR.apr25Stayers_Missing_Adult#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row40 col6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Missing_Child"
       value="#getDataAPR.apr25Stayers_Missing_Child#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row40 col7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Missing_Unknown"
       value="#getDataAPR.apr25Stayers_Missing_Unknown#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row40 col8">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
<input type="number"
       name="apr25Stayers_Total_Total"
       value="#getDataAPR.apr25Stayers_Total_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      
      readonly
      class="subtotal_stayers BGLightGray"
      id="sumC5">

          </td>
          <td>
<input type="number"
       name="apr25Stayers_Total_Adult"
       value="#getDataAPR.apr25Stayers_Total_Adult#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumC6">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Total_Child"
       value="#getDataAPR.apr25Stayers_Total_Child#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumC7">
<small class="form-error">Must be a whole number</small>
          </td>
          <td>
<input type="number"
       name="apr25Stayers_Total_Unknown"
       value="#getDataAPR.apr25Stayers_Total_Unknown#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumC8">
<small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

</cfoutput>