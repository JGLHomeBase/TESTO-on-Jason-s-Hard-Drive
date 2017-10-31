<!--- Set Variables --->
<cfset TargetTable = "DataAPR26">
<cfset UniqueID = "DataAPR26ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR26ID"
        Form = "dataapr26">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr26" formfields="aprID, inputUserID, projectID, reviewUserID, apr26Stayers_SNAP_Total, apr26Stayers_SNAP_Adult, apr26Stayers_SNAP_Child, apr26Stayers_SNAP_Unknown, apr26Stayers_Medicaid_Total, apr26Stayers_Medicaid_Adult, apr26Stayers_Medicaid_Child, apr26Stayers_Medicaid_Unknown, apr26Stayers_Medicare_Adult, apr26Stayers_Medicare_Total, apr26Stayers_Medicare_Child, apr26Stayers_Medicare_Unknown, apr26Stayers_StateChildHealthIns_Adult, apr26Stayers_StateChildHealthIns_Total, apr26Stayers_StateChildHealthIns_Child, apr26Stayers_StateChildHealthIns_Unknown, apr26Stayers_WIC_Total, apr26Stayers_WIC_Adults, apr26Stayers_WIC_Child, apr26Stayers_WIC_Unknown, apr26Stayers_VAMed_Adult, apr26Stayers_VAMed_Total, apr26Stayers_VAMed_Child, apr26Stayers_VAMed_Unknown, apr26Stayers_TANFChildcare_Adult, apr26Stayers_TANFChildcare_Total, apr26Stayers_TANFChildcare_Child, apr26Stayers_TANFChildcare_Unknown, apr26Stayers_TANFTransit_Adult, apr26Stayers_TANFTransit_Total, apr26Stayers_TANFTransit_Child, apr26Stayers_TANFTransit_Unknown, apr26Stayers_TANFOther_Adult, apr26Stayers_TANFOther_Total, apr26Stayers_TANFOther_Child, apr26Stayers_TANFOther_Unknown, apr26Stayers_TempRA_Adult, apr26Stayers_TempRA_Total, apr26Stayers_TempRA_Child, apr26Stayers_TempRA_Unknown, apr26Stayers_Section8_Adult, apr26Stayers_Section8_Total, apr26Stayers_Section8_Child, apr26Stayers_Section8_Unknown, apr26Stayers_Other_Adult, apr26Stayers_Other_Total, apr26Stayers_Other_Child, apr26Stayers_Other_Unknown, apr26Stayers_NoSources_Total, apr26Stayers_1Plus_Total, apr26Stayers_DKR_Total, apr26Stayers_Missing_Total, apr26Stayers_Total_Total, apr26Stayers_DKR_Adult, apr26Stayers_NoSources_Adult, apr26Stayers_1Plus_Adult, apr26Stayers_Missing_Adult, apr26Stayers_Total_Adult, apr26Stayers_NoSources_Child, apr26Stayers_1Plus_Child, apr26Stayers_DKR_Child, apr26Stayers_Missing_Child, apr26Stayers_Total_Child, apr26Stayers_NoSources_Unknown, apr26Stayers_1Plus_Unknown, apr26Stayers_DKR_Unknown, apr26Stayers_Missing_Unknown, apr26Stayers_Total_Unknown, apr26Leavers_SNAP_Total, apr26Leavers_SNAP_Adult, apr26Leavers_SNAP_Child, apr26Leavers_SNAP_Unknown, apr26Leavers_Medicaid_Adult, apr26Leavers_Medicaid_Total, apr26Leavers_Medicaid_Child, apr26Leavers_Medicaid_Unknown, apr26Leavers_Medicare_Adult, apr26Leavers_Medicare_Total, apr26Leavers_Medicare_Child, apr26Leavers_Medicare_Unknown, apr26Leavers_StateChildHealthIns_Total, apr26Leavers_StateChildHealthIns_Adult, apr26Leavers_StateChildHealthIns_Child, apr26Leavers_StateChildHealthIns_Unknown, apr26Leavers_WIC_Total, apr26Leavers_WIC_Adult, apr26Leavers_WIC_Child, apr26Leavers_WIC_Unknown, apr26Leavers_VAMed_Total, apr26Leavers_VAMed_Adult, apr26Leavers_VAMed_Child, apr26Leavers_VAMed_Unknown, apr26Leavers_TANFChildcare_Total, apr26Leavers_TANFChildcare_Adult, apr26Leavers_TANFChildcare_Child, apr26Leavers_TANFChildcare_Unknown, apr26Leavers_TANFTransit_Total, apr26Leavers_TANFTransit_Adult, apr26Leavers_TANFTransit_Child, apr26Leavers_TANFTransit_Unknown, apr26Leavers_TANFOther_Total, apr26Leavers_TANFOther_Adult, apr26Leavers_TANFOther_Child, apr26Leavers_TANFOther_Unknown, apr26Leavers_TempRA_Total, apr26Leavers_TempRA_Adult, apr26Leavers_TempRA_Child, apr26Leavers_TempRA_Unknown, apr26Leavers_Section8_Total, apr26Leavers_Section8_Adult, apr26Leavers_Section8_Child, apr26Leavers_Section8_Unknown, apr26Leavers_Other_Adult, apr26Leavers_Other_Total, apr26Leavers_Other_Unknown, apr26Leavers_Other_Child, apr26Leavers_NoSources_Total, apr26Leavers_NoSources_Adult, apr26Leavers_NoSources_Child, apr26Leavers_NoSources_Unknown, apr26Leavers_1Plus_Adult, apr26Leavers_1Plus_Total, apr26Leavers_1Plus_Child, apr26Leavers_1Plus_Unknown, apr26Leavers_DKR_Total, apr26Leavers_DKR_Adult, apr26Leavers_DKR_Child, apr26Leavers_DKR_Unknown, apr26Leavers_Missing_Adult, apr26Leavers_Missing_Total, apr26Leavers_Missing_Child, apr26Leavers_Missing_Unknown, apr26Leavers_Total_Total, apr26Leavers_Total_Adult, apr26Leavers_Total_Child, apr26Leavers_Total_Unknown">
  <cfelse>
    <cfset FORM.DataAPR26ID = newCheck.DataAPR26ID>

    <!--- Set Defaults --->
    <cfif form.apr26Stayers_SNAP_Total	 EQ "">	
        <cfset form.apr26Stayers_SNAP_Total	 =0></cfif>
    <cfif form.apr26Stayers_SNAP_Adult	 EQ "">	
        <cfset form.apr26Stayers_SNAP_Adult	 =0></cfif>
    <cfif form.apr26Stayers_SNAP_Child	 EQ "">	
        <cfset form.apr26Stayers_SNAP_Child	 =0></cfif>
    <cfif form.apr26Stayers_SNAP_Unknown	 EQ "">	
        <cfset form.apr26Stayers_SNAP_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_Medicaid_Total	 EQ "">	
        <cfset form.apr26Stayers_Medicaid_Total	 =0></cfif>
    <cfif form.apr26Stayers_Medicaid_Adult	 EQ "">	
        <cfset form.apr26Stayers_Medicaid_Adult	 =0></cfif>
    <cfif form.apr26Stayers_Medicaid_Child	 EQ "">	
        <cfset form.apr26Stayers_Medicaid_Child	 =0></cfif>
    <cfif form.apr26Stayers_Medicaid_Unknown	 EQ "">	
        <cfset form.apr26Stayers_Medicaid_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_Medicare_Adult	 EQ "">	
        <cfset form.apr26Stayers_Medicare_Adult	 =0></cfif>
    <cfif form.apr26Stayers_Medicare_Total	 EQ "">	
        <cfset form.apr26Stayers_Medicare_Total	 =0></cfif>
    <cfif form.apr26Stayers_Medicare_Child	 EQ "">	
        <cfset form.apr26Stayers_Medicare_Child	 =0></cfif>
    <cfif form.apr26Stayers_Medicare_Unknown	 EQ "">	
        <cfset form.apr26Stayers_Medicare_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_StateChildHealthIns_Adult	 EQ "">	
        <cfset form.apr26Stayers_StateChildHealthIns_Adult	 =0></cfif>
    <cfif form.apr26Stayers_StateChildHealthIns_Total	 EQ "">	
        <cfset form.apr26Stayers_StateChildHealthIns_Total	 =0></cfif>
    <cfif form.apr26Stayers_StateChildHealthIns_Child	 EQ "">	
        <cfset form.apr26Stayers_StateChildHealthIns_Child	 =0></cfif>
    <cfif form.apr26Stayers_StateChildHealthIns_Unknown	 EQ "">	
        <cfset form.apr26Stayers_StateChildHealthIns_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_WIC_Total	 EQ "">	
        <cfset form.apr26Stayers_WIC_Total	 =0></cfif>
    <cfif form.apr26Stayers_WIC_Adults	 EQ "">	
        <cfset form.apr26Stayers_WIC_Adults	 =0></cfif>
    <cfif form.apr26Stayers_WIC_Child	 EQ "">	
        <cfset form.apr26Stayers_WIC_Child	 =0></cfif>
    <cfif form.apr26Stayers_WIC_Unknown	 EQ "">	
        <cfset form.apr26Stayers_WIC_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_VAMed_Adult	 EQ "">	
        <cfset form.apr26Stayers_VAMed_Adult	 =0></cfif>
    <cfif form.apr26Stayers_VAMed_Total	 EQ "">	
        <cfset form.apr26Stayers_VAMed_Total	 =0></cfif>
    <cfif form.apr26Stayers_VAMed_Child	 EQ "">	
        <cfset form.apr26Stayers_VAMed_Child	 =0></cfif>
    <cfif form.apr26Stayers_VAMed_Unknown	 EQ "">	
        <cfset form.apr26Stayers_VAMed_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_TANFChildcare_Adult	 EQ "">	
        <cfset form.apr26Stayers_TANFChildcare_Adult	 =0></cfif>
    <cfif form.apr26Stayers_TANFChildcare_Total	 EQ "">	
        <cfset form.apr26Stayers_TANFChildcare_Total	 =0></cfif>
    <cfif form.apr26Stayers_TANFChildcare_Child	 EQ "">	
        <cfset form.apr26Stayers_TANFChildcare_Child	 =0></cfif>
    <cfif form.apr26Stayers_TANFChildcare_Unknown	 EQ "">	
        <cfset form.apr26Stayers_TANFChildcare_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_TANFTransit_Adult	 EQ "">	
        <cfset form.apr26Stayers_TANFTransit_Adult	 =0></cfif>
    <cfif form.apr26Stayers_TANFTransit_Total	 EQ "">	
        <cfset form.apr26Stayers_TANFTransit_Total	 =0></cfif>
    <cfif form.apr26Stayers_TANFTransit_Child	 EQ "">	
        <cfset form.apr26Stayers_TANFTransit_Child	 =0></cfif>
    <cfif form.apr26Stayers_TANFTransit_Unknown	 EQ "">	
        <cfset form.apr26Stayers_TANFTransit_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_TANFOther_Adult	 EQ "">	
        <cfset form.apr26Stayers_TANFOther_Adult	 =0></cfif>
    <cfif form.apr26Stayers_TANFOther_Total	 EQ "">	
        <cfset form.apr26Stayers_TANFOther_Total	 =0></cfif>
    <cfif form.apr26Stayers_TANFOther_Child	 EQ "">	
        <cfset form.apr26Stayers_TANFOther_Child	 =0></cfif>
    <cfif form.apr26Stayers_TANFOther_Unknown	 EQ "">	
        <cfset form.apr26Stayers_TANFOther_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_TempRA_Adult	 EQ "">	
        <cfset form.apr26Stayers_TempRA_Adult	 =0></cfif>
    <cfif form.apr26Stayers_TempRA_Total	 EQ "">	
        <cfset form.apr26Stayers_TempRA_Total	 =0></cfif>
    <cfif form.apr26Stayers_TempRA_Child	 EQ "">	
        <cfset form.apr26Stayers_TempRA_Child	 =0></cfif>
    <cfif form.apr26Stayers_TempRA_Unknown	 EQ "">	
        <cfset form.apr26Stayers_TempRA_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_Section8_Adult	 EQ "">	
        <cfset form.apr26Stayers_Section8_Adult	 =0></cfif>
    <cfif form.apr26Stayers_Section8_Total	 EQ "">	
        <cfset form.apr26Stayers_Section8_Total	 =0></cfif>
    <cfif form.apr26Stayers_Section8_Child	 EQ "">	
        <cfset form.apr26Stayers_Section8_Child	 =0></cfif>
    <cfif form.apr26Stayers_Section8_Unknown	 EQ "">	
        <cfset form.apr26Stayers_Section8_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_Other_Adult	 EQ "">	
        <cfset form.apr26Stayers_Other_Adult	 =0></cfif>
    <cfif form.apr26Stayers_Other_Total	 EQ "">	
        <cfset form.apr26Stayers_Other_Total	 =0></cfif>
    <cfif form.apr26Stayers_Other_Child	 EQ "">	
        <cfset form.apr26Stayers_Other_Child	 =0></cfif>
    <cfif form.apr26Stayers_Other_Unknown	 EQ "">	
        <cfset form.apr26Stayers_Other_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_NoSources_Total	 EQ "">	
        <cfset form.apr26Stayers_NoSources_Total	 =0></cfif>
    <cfif form.apr26Stayers_1Plus_Total	 EQ "">	
        <cfset form.apr26Stayers_1Plus_Total	 =0></cfif>
    <cfif form.apr26Stayers_DKR_Total	 EQ "">	
        <cfset form.apr26Stayers_DKR_Total	 =0></cfif>
    <cfif form.apr26Stayers_Missing_Total	 EQ "">	
        <cfset form.apr26Stayers_Missing_Total	 =0></cfif>
    <cfif form.apr26Stayers_Total_Total	 EQ "">	
        <cfset form.apr26Stayers_Total_Total	 =0></cfif>
    <cfif form.apr26Stayers_DKR_Adult	 EQ "">	
        <cfset form.apr26Stayers_DKR_Adult	 =0></cfif>
    <cfif form.apr26Stayers_NoSources_Adult	 EQ "">	
        <cfset form.apr26Stayers_NoSources_Adult	 =0></cfif>
    <cfif form.apr26Stayers_1Plus_Adult	 EQ "">	
        <cfset form.apr26Stayers_1Plus_Adult	 =0></cfif>
    <cfif form.apr26Stayers_Missing_Adult	 EQ "">	
        <cfset form.apr26Stayers_Missing_Adult	 =0></cfif>
    <cfif form.apr26Stayers_Total_Adult	 EQ "">	
        <cfset form.apr26Stayers_Total_Adult	 =0></cfif>
    <cfif form.apr26Stayers_NoSources_Child	 EQ "">	
        <cfset form.apr26Stayers_NoSources_Child	 =0></cfif>
    <cfif form.apr26Stayers_1Plus_Child	 EQ "">	
        <cfset form.apr26Stayers_1Plus_Child	 =0></cfif>
    <cfif form.apr26Stayers_DKR_Child	 EQ "">	
        <cfset form.apr26Stayers_DKR_Child	 =0></cfif>
    <cfif form.apr26Stayers_Missing_Child	 EQ "">	
        <cfset form.apr26Stayers_Missing_Child	 =0></cfif>
    <cfif form.apr26Stayers_Total_Child	 EQ "">	
        <cfset form.apr26Stayers_Total_Child	 =0></cfif>
    <cfif form.apr26Stayers_NoSources_Unknown	 EQ "">	
        <cfset form.apr26Stayers_NoSources_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_1Plus_Unknown	 EQ "">	
        <cfset form.apr26Stayers_1Plus_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_DKR_Unknown	 EQ "">	
        <cfset form.apr26Stayers_DKR_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_Missing_Unknown	 EQ "">	
        <cfset form.apr26Stayers_Missing_Unknown	 =0></cfif>
    <cfif form.apr26Stayers_Total_Unknown	 EQ "">	
        <cfset form.apr26Stayers_Total_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_SNAP_Total	 EQ "">	
        <cfset form.apr26Leavers_SNAP_Total	 =0></cfif>
    <cfif form.apr26Leavers_SNAP_Adult	 EQ "">	
        <cfset form.apr26Leavers_SNAP_Adult	 =0></cfif>
    <cfif form.apr26Leavers_SNAP_Child	 EQ "">	
        <cfset form.apr26Leavers_SNAP_Child	 =0></cfif>
    <cfif form.apr26Leavers_SNAP_Unknown	 EQ "">	
        <cfset form.apr26Leavers_SNAP_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Medicaid_Adult	 EQ "">	
        <cfset form.apr26Leavers_Medicaid_Adult	 =0></cfif>
    <cfif form.apr26Leavers_Medicaid_Total	 EQ "">	
        <cfset form.apr26Leavers_Medicaid_Total	 =0></cfif>
    <cfif form.apr26Leavers_Medicaid_Child	 EQ "">	
        <cfset form.apr26Leavers_Medicaid_Child	 =0></cfif>
    <cfif form.apr26Leavers_Medicaid_Unknown	 EQ "">	
        <cfset form.apr26Leavers_Medicaid_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Medicare_Adult	 EQ "">	
        <cfset form.apr26Leavers_Medicare_Adult	 =0></cfif>
    <cfif form.apr26Leavers_Medicare_Total	 EQ "">	
        <cfset form.apr26Leavers_Medicare_Total	 =0></cfif>
    <cfif form.apr26Leavers_Medicare_Child	 EQ "">	
        <cfset form.apr26Leavers_Medicare_Child	 =0></cfif>
    <cfif form.apr26Leavers_Medicare_Unknown	 EQ "">	
        <cfset form.apr26Leavers_Medicare_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_StateChildHealthIns_Total	 EQ "">	
        <cfset form.apr26Leavers_StateChildHealthIns_Total	 =0></cfif>
    <cfif form.apr26Leavers_StateChildHealthIns_Adult	 EQ "">	
        <cfset form.apr26Leavers_StateChildHealthIns_Adult	 =0></cfif>
    <cfif form.apr26Leavers_StateChildHealthIns_Child	 EQ "">	
        <cfset form.apr26Leavers_StateChildHealthIns_Child	 =0></cfif>
    <cfif form.apr26Leavers_StateChildHealthIns_Unknown	 EQ "">	
        <cfset form.apr26Leavers_StateChildHealthIns_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_WIC_Total	 EQ "">	
        <cfset form.apr26Leavers_WIC_Total	 =0></cfif>
    <cfif form.apr26Leavers_WIC_Adult	 EQ "">	
        <cfset form.apr26Leavers_WIC_Adult	 =0></cfif>
    <cfif form.apr26Leavers_WIC_Child	 EQ "">	
        <cfset form.apr26Leavers_WIC_Child	 =0></cfif>
    <cfif form.apr26Leavers_WIC_Unknown	 EQ "">	
        <cfset form.apr26Leavers_WIC_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_VAMed_Total	 EQ "">	
        <cfset form.apr26Leavers_VAMed_Total	 =0></cfif>
    <cfif form.apr26Leavers_VAMed_Adult	 EQ "">	
        <cfset form.apr26Leavers_VAMed_Adult	 =0></cfif>
    <cfif form.apr26Leavers_VAMed_Child	 EQ "">	
        <cfset form.apr26Leavers_VAMed_Child	 =0></cfif>
    <cfif form.apr26Leavers_VAMed_Unknown	 EQ "">	
        <cfset form.apr26Leavers_VAMed_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_TANFChildcare_Total	 EQ "">	
        <cfset form.apr26Leavers_TANFChildcare_Total	 =0></cfif>
    <cfif form.apr26Leavers_TANFChildcare_Adult	 EQ "">	
        <cfset form.apr26Leavers_TANFChildcare_Adult	 =0></cfif>
    <cfif form.apr26Leavers_TANFChildcare_Child	 EQ "">	
        <cfset form.apr26Leavers_TANFChildcare_Child	 =0></cfif>
    <cfif form.apr26Leavers_TANFChildcare_Unknown	 EQ "">	
        <cfset form.apr26Leavers_TANFChildcare_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_TANFTransit_Total	 EQ "">	
        <cfset form.apr26Leavers_TANFTransit_Total	 =0></cfif>
    <cfif form.apr26Leavers_TANFTransit_Adult	 EQ "">	
        <cfset form.apr26Leavers_TANFTransit_Adult	 =0></cfif>
    <cfif form.apr26Leavers_TANFTransit_Child	 EQ "">	
        <cfset form.apr26Leavers_TANFTransit_Child	 =0></cfif>
    <cfif form.apr26Leavers_TANFTransit_Unknown	 EQ "">	
        <cfset form.apr26Leavers_TANFTransit_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_TANFOther_Total	 EQ "">	
        <cfset form.apr26Leavers_TANFOther_Total	 =0></cfif>
    <cfif form.apr26Leavers_TANFOther_Adult	 EQ "">	
        <cfset form.apr26Leavers_TANFOther_Adult	 =0></cfif>
    <cfif form.apr26Leavers_TANFOther_Child	 EQ "">	
        <cfset form.apr26Leavers_TANFOther_Child	 =0></cfif>
    <cfif form.apr26Leavers_TANFOther_Unknown	 EQ "">	
        <cfset form.apr26Leavers_TANFOther_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_TempRA_Total	 EQ "">	
        <cfset form.apr26Leavers_TempRA_Total	 =0></cfif>
    <cfif form.apr26Leavers_TempRA_Adult	 EQ "">	
        <cfset form.apr26Leavers_TempRA_Adult	 =0></cfif>
    <cfif form.apr26Leavers_TempRA_Child	 EQ "">	
        <cfset form.apr26Leavers_TempRA_Child	 =0></cfif>
    <cfif form.apr26Leavers_TempRA_Unknown	 EQ "">	
        <cfset form.apr26Leavers_TempRA_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Section8_Total	 EQ "">	
        <cfset form.apr26Leavers_Section8_Total	 =0></cfif>
    <cfif form.apr26Leavers_Section8_Adult	 EQ "">	
        <cfset form.apr26Leavers_Section8_Adult	 =0></cfif>
    <cfif form.apr26Leavers_Section8_Child	 EQ "">	
        <cfset form.apr26Leavers_Section8_Child	 =0></cfif>
    <cfif form.apr26Leavers_Section8_Unknown	 EQ "">	
        <cfset form.apr26Leavers_Section8_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Other_Adult	 EQ "">	
        <cfset form.apr26Leavers_Other_Adult	 =0></cfif>
    <cfif form.apr26Leavers_Other_Total	 EQ "">	
        <cfset form.apr26Leavers_Other_Total	 =0></cfif>
    <cfif form.apr26Leavers_Other_Unknown	 EQ "">	
        <cfset form.apr26Leavers_Other_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Other_Child	 EQ "">	
        <cfset form.apr26Leavers_Other_Child	 =0></cfif>
    <cfif form.apr26Leavers_NoSources_Total	 EQ "">	
        <cfset form.apr26Leavers_NoSources_Total	 =0></cfif>
    <cfif form.apr26Leavers_NoSources_Adult	 EQ "">	
        <cfset form.apr26Leavers_NoSources_Adult	 =0></cfif>
    <cfif form.apr26Leavers_NoSources_Child	 EQ "">	
        <cfset form.apr26Leavers_NoSources_Child	 =0></cfif>
    <cfif form.apr26Leavers_NoSources_Unknown	 EQ "">	
        <cfset form.apr26Leavers_NoSources_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_1Plus_Adult	 EQ "">	
        <cfset form.apr26Leavers_1Plus_Adult	 =0></cfif>
    <cfif form.apr26Leavers_1Plus_Total	 EQ "">	
        <cfset form.apr26Leavers_1Plus_Total	 =0></cfif>
    <cfif form.apr26Leavers_1Plus_Child	 EQ "">	
        <cfset form.apr26Leavers_1Plus_Child	 =0></cfif>
    <cfif form.apr26Leavers_1Plus_Unknown	 EQ "">	
        <cfset form.apr26Leavers_1Plus_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_DKR_Total	 EQ "">	
        <cfset form.apr26Leavers_DKR_Total	 =0></cfif>
    <cfif form.apr26Leavers_DKR_Adult	 EQ "">	
        <cfset form.apr26Leavers_DKR_Adult	 =0></cfif>
    <cfif form.apr26Leavers_DKR_Child	 EQ "">	
        <cfset form.apr26Leavers_DKR_Child	 =0></cfif>
    <cfif form.apr26Leavers_DKR_Unknown	 EQ "">	
        <cfset form.apr26Leavers_DKR_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Missing_Adult	 EQ "">	
        <cfset form.apr26Leavers_Missing_Adult	 =0></cfif>
    <cfif form.apr26Leavers_Missing_Total	 EQ "">	
        <cfset form.apr26Leavers_Missing_Total	 =0></cfif>
    <cfif form.apr26Leavers_Missing_Child	 EQ "">	
        <cfset form.apr26Leavers_Missing_Child	 =0></cfif>
    <cfif form.apr26Leavers_Missing_Unknown	 EQ "">	
        <cfset form.apr26Leavers_Missing_Unknown	 =0></cfif>
    <cfif form.apr26Leavers_Total_Total	 EQ "">	
        <cfset form.apr26Leavers_Total_Total	 =0></cfif>
    <cfif form.apr26Leavers_Total_Adult	 EQ "">	
        <cfset form.apr26Leavers_Total_Adult	 =0></cfif>
    <cfif form.apr26Leavers_Total_Child	 EQ "">	
        <cfset form.apr26Leavers_Total_Child	 =0></cfif>
    <cfif form.apr26Leavers_Total_Unknown	 EQ "">	
        <cfset form.apr26Leavers_Total_Unknown	 =0></cfif>    
    <!---/ Set Defaults --->        
    <cfupdate datasource="#DataSource#" tablename="dataapr26" formfields="DataAPR26ID, aprID, inputUserID, projectID, reviewUserID, apr26Stayers_SNAP_Total, apr26Stayers_SNAP_Adult, apr26Stayers_SNAP_Child, apr26Stayers_SNAP_Unknown, apr26Stayers_Medicaid_Total, apr26Stayers_Medicaid_Adult, apr26Stayers_Medicaid_Child, apr26Stayers_Medicaid_Unknown, apr26Stayers_Medicare_Adult, apr26Stayers_Medicare_Total, apr26Stayers_Medicare_Child, apr26Stayers_Medicare_Unknown, apr26Stayers_StateChildHealthIns_Adult, apr26Stayers_StateChildHealthIns_Total, apr26Stayers_StateChildHealthIns_Child, apr26Stayers_StateChildHealthIns_Unknown, apr26Stayers_WIC_Total, apr26Stayers_WIC_Adults, apr26Stayers_WIC_Child, apr26Stayers_WIC_Unknown, apr26Stayers_VAMed_Adult, apr26Stayers_VAMed_Total, apr26Stayers_VAMed_Child, apr26Stayers_VAMed_Unknown, apr26Stayers_TANFChildcare_Adult, apr26Stayers_TANFChildcare_Total, apr26Stayers_TANFChildcare_Child, apr26Stayers_TANFChildcare_Unknown, apr26Stayers_TANFTransit_Adult, apr26Stayers_TANFTransit_Total, apr26Stayers_TANFTransit_Child, apr26Stayers_TANFTransit_Unknown, apr26Stayers_TANFOther_Adult, apr26Stayers_TANFOther_Total, apr26Stayers_TANFOther_Child, apr26Stayers_TANFOther_Unknown, apr26Stayers_TempRA_Adult, apr26Stayers_TempRA_Total, apr26Stayers_TempRA_Child, apr26Stayers_TempRA_Unknown, apr26Stayers_Section8_Adult, apr26Stayers_Section8_Total, apr26Stayers_Section8_Child, apr26Stayers_Section8_Unknown, apr26Stayers_Other_Adult, apr26Stayers_Other_Total, apr26Stayers_Other_Child, apr26Stayers_Other_Unknown, apr26Stayers_NoSources_Total, apr26Stayers_1Plus_Total, apr26Stayers_DKR_Total, apr26Stayers_Missing_Total, apr26Stayers_Total_Total, apr26Stayers_DKR_Adult, apr26Stayers_NoSources_Adult, apr26Stayers_1Plus_Adult, apr26Stayers_Missing_Adult, apr26Stayers_Total_Adult, apr26Stayers_NoSources_Child, apr26Stayers_1Plus_Child, apr26Stayers_DKR_Child, apr26Stayers_Missing_Child, apr26Stayers_Total_Child, apr26Stayers_NoSources_Unknown, apr26Stayers_1Plus_Unknown, apr26Stayers_DKR_Unknown, apr26Stayers_Missing_Unknown, apr26Stayers_Total_Unknown, apr26Leavers_SNAP_Total, apr26Leavers_SNAP_Adult, apr26Leavers_SNAP_Child, apr26Leavers_SNAP_Unknown, apr26Leavers_Medicaid_Adult, apr26Leavers_Medicaid_Total, apr26Leavers_Medicaid_Child, apr26Leavers_Medicaid_Unknown, apr26Leavers_Medicare_Adult, apr26Leavers_Medicare_Total, apr26Leavers_Medicare_Child, apr26Leavers_Medicare_Unknown, apr26Leavers_StateChildHealthIns_Total, apr26Leavers_StateChildHealthIns_Adult, apr26Leavers_StateChildHealthIns_Child, apr26Leavers_StateChildHealthIns_Unknown, apr26Leavers_WIC_Total, apr26Leavers_WIC_Adult, apr26Leavers_WIC_Child, apr26Leavers_WIC_Unknown, apr26Leavers_VAMed_Total, apr26Leavers_VAMed_Adult, apr26Leavers_VAMed_Child, apr26Leavers_VAMed_Unknown, apr26Leavers_TANFChildcare_Total, apr26Leavers_TANFChildcare_Adult, apr26Leavers_TANFChildcare_Child, apr26Leavers_TANFChildcare_Unknown, apr26Leavers_TANFTransit_Total, apr26Leavers_TANFTransit_Adult, apr26Leavers_TANFTransit_Child, apr26Leavers_TANFTransit_Unknown, apr26Leavers_TANFOther_Total, apr26Leavers_TANFOther_Adult, apr26Leavers_TANFOther_Child, apr26Leavers_TANFOther_Unknown, apr26Leavers_TempRA_Total, apr26Leavers_TempRA_Adult, apr26Leavers_TempRA_Child, apr26Leavers_TempRA_Unknown, apr26Leavers_Section8_Total, apr26Leavers_Section8_Adult, apr26Leavers_Section8_Child, apr26Leavers_Section8_Unknown, apr26Leavers_Other_Adult, apr26Leavers_Other_Total, apr26Leavers_Other_Unknown, apr26Leavers_Other_Child, apr26Leavers_NoSources_Total, apr26Leavers_NoSources_Adult, apr26Leavers_NoSources_Child, apr26Leavers_NoSources_Unknown, apr26Leavers_1Plus_Adult, apr26Leavers_1Plus_Total, apr26Leavers_1Plus_Child, apr26Leavers_1Plus_Unknown, apr26Leavers_DKR_Total, apr26Leavers_DKR_Adult, apr26Leavers_DKR_Child, apr26Leavers_DKR_Unknown, apr26Leavers_Missing_Adult, apr26Leavers_Missing_Total, apr26Leavers_Missing_Child, apr26Leavers_Missing_Unknown, apr26Leavers_Total_Total, apr26Leavers_Total_Adult, apr26Leavers_Total_Child, apr26Leavers_Total_Unknown">
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
        Form = "dataapr26"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="8">
<cfset mathRows="32">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>





<div class="row">
  <div class="large-12 columns">
    <h3>Non-Cash Benefits</h3>
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
            <td>
              Supplemental Nutritional Assistance Program
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_SNAP_Total"
                     value="#getDataAPR.apr26Leavers_SNAP_Total#"
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
                       name="apr26Leavers_SNAP_Adult"
                       value="#getDataAPR.apr26Leavers_SNAP_Adult#"
                       placeholder="0"
                       min="0"
                     step="1"
                       maxlength="11"
                       tabindex="#nexttab++#"
                       class="row9"
                       autofocus>
                <small class="form-error">Must be a whole number</small>
            </td>
            <td>
                <input type="number"
                       name="apr26Leavers_SNAP_Child"
                       value="#getDataAPR.apr26Leavers_SNAP_Child#"
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
                       name="apr26Leavers_SNAP_Unknown"
                       value="#getDataAPR.apr26Leavers_SNAP_Unknown#"
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
            <td>
              MEDICAID Health Insurance
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Medicaid_Total"
                     value="#getDataAPR.apr26Leavers_Medicaid_Total#"
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
                     name="apr26Leavers_Medicaid_Adult"
                     value="#getDataAPR.apr26Leavers_Medicaid_Adult#"
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
                     name="apr26Leavers_Medicaid_Child"
                     value="#getDataAPR.apr26Leavers_Medicaid_Child#"
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
                     name="apr26Leavers_Medicaid_Unknown"
                     value="#getDataAPR.apr26Leavers_Medicaid_Unknown#"
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
            <td>
              MEDICARE Health Insurance
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_Medicare_Total"
                     value="#getDataAPR.apr26Leavers_Medicare_Total#"
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
                     name="apr26Leavers_Medicare_Adult"
                     value="#getDataAPR.apr26Leavers_Medicare_Adult#"
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
                     name="apr26Leavers_Medicare_Child"
                     value="#getDataAPR.apr26Leavers_Medicare_Child#"
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
                     name="apr26Leavers_Medicare_Unknown"
                     value="#getDataAPR.apr26Leavers_Medicare_Unknown#"
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
            <td>
              State Children's Health Insurance
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_StateChildHealthIns_Total"
                     value="#getDataAPR.apr26Leavers_StateChildHealthIns_Total#"
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
                     name="apr26Leavers_StateChildHealthIns_Adult"
                     value="#getDataAPR.apr26Leavers_StateChildHealthIns_Adult#"
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
                     name="apr26Leavers_StateChildHealthIns_Child"
                     value="#getDataAPR.apr26Leavers_StateChildHealthIns_Child#"
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
                     name="apr26Leavers_StateChildHealthIns_Unknown"
                     value="#getDataAPR.apr26Leavers_StateChildHealthIns_Unknown#"
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
            <td>
              WIC
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_WIC_Total"
                     value="#getDataAPR.apr26Leavers_WIC_Total#"
                     placeholder="0"
                     min="0"
                     step="1"
                    maxlength="11"
                    readonly
                    class="BGLightGray"
                    id="sumR13">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_WIC_Adult"
                     value="#getDataAPR.apr26Leavers_WIC_Adult#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row13">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_WIC_Child"
                     value="#getDataAPR.apr26Leavers_WIC_Child#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row13">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_WIC_Unknown"
                     value="#getDataAPR.apr26Leavers_WIC_Unknown#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row13">
              <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
          <tr>
            <td>
              VA Medical Services
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_VAMed_Total"
                     value="#getDataAPR.apr26Leavers_VAMed_Total#"
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
                     name="apr26Leavers_VAMed_Adult"
                     value="#getDataAPR.apr26Leavers_VAMed_Adult#"
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
                     name="apr26Leavers_VAMed_Child"
                     value="#getDataAPR.apr26Leavers_VAMed_Child#"
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
                     name="apr26Leavers_VAMed_Unknown"
                     value="#getDataAPR.apr26Leavers_VAMed_Unknown#"
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
            <td>
              TANF Child Care Services
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_TANFChildcare_Total"
                     value="#getDataAPR.apr26Leavers_TANFChildcare_Total#"
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
                     name="apr26Leavers_TANFChildcare_Adult"
                     value="#getDataAPR.apr26Leavers_TANFChildcare_Adult#"
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
                     name="apr26Leavers_TANFChildcare_Child"
                     value="#getDataAPR.apr26Leavers_TANFChildcare_Child#"
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
                     name="apr26Leavers_TANFChildcare_Unknown"
                     value="#getDataAPR.apr26Leavers_TANFChildcare_Unknown#"
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
            <td>
              TANF Transportation Services
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_TANFTransit_Total"
                     value="#getDataAPR.apr26Leavers_TANFTransit_Total#"
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
                     name="apr26Leavers_TANFTransit_Adult"
                     value="#getDataAPR.apr26Leavers_TANFTransit_Adult#"
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
                     name="apr26Leavers_TANFTransit_Child"
                     value="#getDataAPR.apr26Leavers_TANFTransit_Child#"
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
                     name="apr26Leavers_TANFTransit_Unknown"
                     value="#getDataAPR.apr26Leavers_TANFTransit_Unknown#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row16">
              <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
          <tr>
            <td>
              Other TANF-Funded Services
            </td>
             <td>
            <input type="number"
                   name="apr26Leavers_TANFOther_Total"
                   value="#getDataAPR.apr26Leavers_TANFOther_Total#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR17">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
            <input type="number"
                   name="apr26Leavers_TANFOther_Adult"
                   value="#getDataAPR.apr26Leavers_TANFOther_Adult#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                  tabindex="#nexttab++#"
                  class="row17">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
            <input type="number"
                   name="apr26Leavers_TANFOther_Child"
                   value="#getDataAPR.apr26Leavers_TANFOther_Child#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row17">
            <small class="form-error">Must be a whole number</small>
            </td>
            <td>
            <input type="number"
                   name="apr26Leavers_TANFOther_Unknown"
                   value="#getDataAPR.apr26Leavers_TANFOther_Unknown#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row17">
            <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
          <tr>
            <td>
              Temporary Rental Assistance
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_TempRA_Total"
                     value="#getDataAPR.apr26Leavers_TempRA_Total#"
                     placeholder="0"
                     min="0"
                     step="1"
                    maxlength="11"
                    readonly
                    class="BGLightGray"
                    id="sumR18">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_TempRA_Adult"
                     value="#getDataAPR.apr26Leavers_TempRA_Adult#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row18">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_TempRA_Child"
                     value="#getDataAPR.apr26Leavers_TempRA_Child#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row18">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_TempRA_Unknown"
                     value="#getDataAPR.apr26Leavers_TempRA_Unknown#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row18">
              <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
          <tr>
            <td>
              Section 8, Public Housing, Rental Assistance
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_Section8_Total"
                     value="#getDataAPR.apr26Leavers_Section8_Total#"
                     placeholder="0"
                     min="0"
                     step="1"
                    maxlength="11"
                    readonly
                    class="BGLightGray"
                    id="sumR19">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Section8_Adult"
                     value="#getDataAPR.apr26Leavers_Section8_Adult#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row19">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Section8_Child"
                     value="#getDataAPR.apr26Leavers_Section8_Child#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row19">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Section8_Unknown"
                     value="#getDataAPR.apr26Leavers_Section8_Unknown#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row19">
              <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
          <tr>
            <td>
              Other Source
            </td>
             <td>
              <input type="number"
                     name="apr26Leavers_Other_Total"
                     value="#getDataAPR.apr26Leavers_Other_Total#"
                     placeholder="0"
                     min="0"
                     step="1"
                    maxlength="11"
                    readonly
                    class="BGLightGray"
                    id="sumR20">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Other_Adult"
                     value="#getDataAPR.apr26Leavers_Other_Adult#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row20">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Other_Child"
                     value="#getDataAPR.apr26Leavers_Other_Child#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row20">
              <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                     name="apr26Leavers_Other_Unknown"
                     value="#getDataAPR.apr26Leavers_Other_Unknown#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row20">
              <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
        </tbody>
      </table>
  </div>
</div>


  <div class="row">
    <div class="large-12 columns">
    <h3>Number of Non-Cash Benefit Sources</h3>
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
            <td>
              No Sources
            </td>
            <td>
        <input type="number"
               name="apr26Leavers_NoSources_Total"
               value="#getDataAPR.apr26Leavers_NoSources_Total#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
              ID="sumR1"
              ReadOnly
              class="BGLightGray col1">
        <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
                 name="apr26Leavers_NoSources_Adult"
                 value="#getDataAPR.apr26Leavers_NoSources_Adult#"
                 placeholder="0"
                 min="0"
                     step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class="row1 col2">
          <small class="form-error">Must be a whole number</small>
        </td>
            <td>
              <input type="number"
               name="apr26Leavers_NoSources_Child"
               value="#getDataAPR.apr26Leavers_NoSources_Child#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="row1 col3">
        <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
               name="apr26Leavers_NoSources_Unknown"
               value="#getDataAPR.apr26Leavers_NoSources_Unknown#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="col4 row1">
        <small class="form-error">Must be a whole number</small>
            </td>
          </tr>


          <tr>
            <td>
              1+ Source(s)
            </td>
            <td>
        <input type="number"
               name="apr26Leavers_1Plus_Total"
               value="#getDataAPR.apr26Leavers_1Plus_Total#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
              ID="sumR2"
              ReadOnly
              class="BGLightGray col1"> 
        <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
               name="apr26Leavers_1Plus_Adult"
               value="#getDataAPR.apr26Leavers_1Plus_Adult#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
                tabindex="#nexttab++#"
                class="row2 col2">
        <small class="form-error">This field is requried</small>
            </td>
            <td> 
              <input type="number"
               name="apr26Leavers_1Plus_Child"
               value="#getDataAPR.apr26Leavers_1Plus_Child#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="col3 row2">
            <small class="form-error">This field is requried</small>
            </td>
            <td> 
              <input type="number"
               name="apr26Leavers_1Plus_Unknown"
               value="#getDataAPR.apr26Leavers_1Plus_Unknown#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="col4 row2">
          <small class="form-error">Must be a whole number</small>
            </td>
          </tr>


          <tr>
            <td>
              Don't Know/Refused
            </td>
            <td>
        <input type="number"
               name="apr26Leavers_DKR_Total"
               value="#getDataAPR.apr26Leavers_DKR_Total#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
              ID="sumR3"
              ReadOnly
              class="BGLightGray col1">
        <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
               name="apr26Leavers_DKR_Adult"
               value="#getDataAPR.apr26Leavers_DKR_Adult#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="row3 col2">
        <small class="form-error">Must be a whole number</small>
            </td>
            <td>
              <input type="number"
               name="apr26Leavers_DKR_Child"
               value="#getDataAPR.apr26Leavers_DKR_Child#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="row3 col3">
        <small class="form-error">Must be a whole number</small>
            </td>
            <td> 
              <input type="number"
               name="apr26Leavers_DKR_Unknown"
               value="#getDataAPR.apr26Leavers_DKR_Unknown#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="row3 col4">
        <small class="form-error">Must be a whole number</small>
            </td>
        </tr>
        <tr>
           <td>
            Information Missing
            </td>
            <td>
              <input type="number"
               name="apr26Leavers_Missing_Total"
               value="#getDataAPR.apr26Leavers_Missing_Total#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
              ID="sumR4"
              ReadOnly
              class="BGLightGray col1">
        <small class="form-error">Must be a whole number</SmallBox>
      </td>
      <td>
        <input type="number"
               name="apr26Leavers_Missing_Adult"
               value="#getDataAPR.apr26Leavers_Missing_Adult#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="row4 col2">
           <small class="form-error">Must be a whole number</small>
      </td>
      <td>
        <input type="number"
               name="apr26Leavers_Missing_Child"
               value="#getDataAPR.apr26Leavers_Missing_Child#"
               placeholder="0"
               min="0"
                     step="1"
               maxlength="11"
               tabindex="#nexttab++#"
               class="row4 col3">
           <small class="form-error">Must be a whole number</small>
      </td>
      <td>
      <input type="number"
             name="apr26Leavers_Missing_Unknown"
             value="#getDataAPR.apr26Leavers_Missing_Unknown#"
             placeholder="0"
             min="0"
                     step="1"
             maxlength="11"
             tabindex="#nexttab++#"
             class="row4 col4">
      <small class="form-error">Must be a whole number</small>
          </tr>

           <tr>
           <td>
            <strong>Total</strong>
            </td>
            <td>
              <input type="number"
               name="apr26Leavers_Total_Total"
               value="#getDataAPR.apr26Leavers_Total_Total#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
             
              ID="sumC1"
              ReadOnly
              class="subtotal_leavers BGLightGray">
        
      </td>
      <td>
        <input type="number"
               name="apr26Leavers_Total_Adult"
               value="#getDataAPR.apr26Leavers_Total_Adult#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
               ID="sumC2"
              ReadOnly
              class="BGLightGray">
        <small class="form-error">Must be a whole number</small>
      </td>
      <td>
        <input type="number"
               name="apr26Leavers_Total_Child"
               value="#getDataAPR.apr26Leavers_Total_Child#"
               placeholder="0"
               min="0"
                     step="1"
              maxlength="11"
               ID="sumC3"
              ReadOnly
              class="BGLightGray">
           <small class="form-error">Must be a whole number</small>
      </td>
      <td>
      <input type="number"
             name="apr26Leavers_Total_Unknown"
             value="#getDataAPR.apr26Leavers_Total_Unknown#"
             placeholder="0"
             min="0"
                     step="1"
            maxlength="11"
              ID="sumC4"
              ReadOnly
              class="BGLightGray">
      <small class="form-error">Must be a whole number</small>
          </tr>

          </table>
      </div>
  </div>



<div class="row">
  <div class="large-12 columns">
    <h3>Number of Non-Cash Benefit Sources</h3>
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
            <td>
              Supplemental Nutritional Assistance Program
            </td>
            <td>
              <input type="number"
                     name="apr26Stayers_SNAP_Total"
                     value="#getDataAPR.apr26Stayers_SNAP_Total#"
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
                       name="apr26Stayers_SNAP_Adult"
                       value="#getDataAPR.apr26Stayers_SNAP_Adult#"
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
                       name="apr26Stayers_SNAP_Child"
                       value="#getDataAPR.apr26Stayers_SNAP_Child#"
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
                       name="apr26Stayers_SNAP_Unknown"
                       value="#getDataAPR.apr26Stayers_SNAP_Unknown#"
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
            <td>
              MEDICAID Health Insurance
            </td>
            <td>
              <input type="number"
                     name="apr26Stayers_Medicaid_Total"
                     value="#getDataAPR.apr26Stayers_Medicaid_Total#"
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
                     name="apr26Stayers_Medicaid_Adult"
                     value="#getDataAPR.apr26Stayers_Medicaid_Adult#"
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
                     name="apr26Stayers_Medicaid_Child"
                     value="#getDataAPR.apr26Stayers_Medicaid_Child#"
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
                     name="apr26Stayers_Medicaid_Unknown"
                     value="#getDataAPR.apr26Stayers_Medicaid_Unknown#"
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
            <td>
              MEDICARE Health Insurance
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_Medicare_Total"
                     value="#getDataAPR.apr26Stayers_Medicare_Total#"
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
                     name="apr26Stayers_Medicare_Adult"
                     value="#getDataAPR.apr26Stayers_Medicare_Adult#"
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
                     name="apr26Stayers_Medicare_Child"
                     value="#getDataAPR.apr26Stayers_Medicare_Child#"
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
                     name="apr26Stayers_Medicare_Unknown"
                     value="#getDataAPR.apr26Stayers_Medicare_Unknown#"
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
            <td>
              State Children's Health Insurance
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_StateChildHealthIns_Total"
                     value="#getDataAPR.apr26Stayers_StateChildHealthIns_Total#"
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
                     name="apr26Stayers_StateChildHealthIns_Adult"
                     value="#getDataAPR.apr26Stayers_StateChildHealthIns_Adult#"
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
                     name="apr26Stayers_StateChildHealthIns_Child"
                     value="#getDataAPR.apr26Stayers_StateChildHealthIns_Child#"
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
                     name="apr26Stayers_StateChildHealthIns_Unknown"
                     value="#getDataAPR.apr26Stayers_StateChildHealthIns_Unknown#"
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
            <td>
              WIC
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_WIC_Total"
                     value="#getDataAPR.apr26Stayers_WIC_Total#"
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
                     name="apr26Stayers_WIC_Adults"
                     value="#getDataAPR.apr26Stayers_WIC_Adults#"
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
                     name="apr26Stayers_WIC_Child"
                     value="#getDataAPR.apr26Stayers_WIC_Child#"
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
                     name="apr26Stayers_WIC_Unknown"
                     value="#getDataAPR.apr26Stayers_WIC_Unknown#"
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
            <td>
              VA Medical Services
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_VAMed_Total"
                     value="#getDataAPR.apr26Stayers_VAMed_Total#"
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
                     name="apr26Stayers_VAMed_Adult"
                     value="#getDataAPR.apr26Stayers_VAMed_Adult#"
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
                     name="apr26Stayers_VAMed_Child"
                     value="#getDataAPR.apr26Stayers_VAMed_Child#"
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
                     name="apr26Stayers_VAMed_Unknown"
                     value="#getDataAPR.apr26Stayers_VAMed_Unknown#"
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
            <td>
              TANF Child Care Services
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_TANFChildcare_Total"
                     value="#getDataAPR.apr26Stayers_TANFChildcare_Total#"
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
                     name="apr26Stayers_TANFChildcare_Adult"
                     value="#getDataAPR.apr26Stayers_TANFChildcare_Adult#"
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
                     name="apr26Stayers_TANFChildcare_Child"
                     value="#getDataAPR.apr26Stayers_TANFChildcare_Child#"
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
                     name="apr26Stayers_TANFChildcare_Unknown"
                     value="#getDataAPR.apr26Stayers_TANFChildcare_Unknown#"
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
            <td>
              TANF Transportation Services
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_TANFTransit_Total"
                     value="#getDataAPR.apr26Stayers_TANFTransit_Total#"
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
                     name="apr26Stayers_TANFTransit_Adult"
                     value="#getDataAPR.apr26Stayers_TANFTransit_Adult#"
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
                     name="apr26Stayers_TANFTransit_Child"
                     value="#getDataAPR.apr26Stayers_TANFTransit_Child#"
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
                     name="apr26Stayers_TANFTransit_Unknown"
                     value="#getDataAPR.apr26Stayers_TANFTransit_Unknown#"
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
            <td>
              Other TANF-Funded Services
            </td>
             <td>
            <input type="number"
                   name="apr26Stayers_TANFOther_Total"
                   value="#getDataAPR.apr26Stayers_TANFOther_Total#"
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
                   name="apr26Stayers_TANFOther_Adult"
                   value="#getDataAPR.apr26Stayers_TANFOther_Adult#"
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
                   name="apr26Stayers_TANFOther_Child"
                   value="#getDataAPR.apr26Stayers_TANFOther_Child#"
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
                   name="apr26Stayers_TANFOther_Unknown"
                   value="#getDataAPR.apr26Stayers_TANFOther_Unknown#"
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
            <td>
              Temporary Rental Assistance
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_TempRA_Total"
                     value="#getDataAPR.apr26Stayers_TempRA_Total#"
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
                     name="apr26Stayers_TempRA_Adult"
                     value="#getDataAPR.apr26Stayers_TempRA_Adult#"
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
                     name="apr26Stayers_TempRA_Child"
                     value="#getDataAPR.apr26Stayers_TempRA_Child#"
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
                     name="apr26Stayers_TempRA_Unknown"
                     value="#getDataAPR.apr26Stayers_TempRA_Unknown#"
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
            <td>
              Section 8, Public Housing, Rental Assistance
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_Section8_Total"
                     value="#getDataAPR.apr26Stayers_Section8_Total#"
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
                     name="apr26Stayers_Section8_Adult"
                     value="#getDataAPR.apr26Stayers_Section8_Adult#"
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
                     name="apr26Stayers_Section8_Child"
                     value="#getDataAPR.apr26Stayers_Section8_Child#"
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
                     name="apr26Stayers_Section8_Unknown"
                     value="#getDataAPR.apr26Stayers_Section8_Unknown#"
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
            <td>
              Other Source
            </td>
             <td>
              <input type="number"
                     name="apr26Stayers_Other_Total"
                     value="#getDataAPR.apr26Stayers_Other_Total#"
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
                     name="apr26Stayers_Other_Adult"
                     value="#getDataAPR.apr26Stayers_Other_Adult#"
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
                     name="apr26Stayers_Other_Child"
                     value="#getDataAPR.apr26Stayers_Other_Child#"
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
                     name="apr26Stayers_Other_Unknown"
                     value="#getDataAPR.apr26Stayers_Other_Unknown#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row32">
              <small class="form-error">Must be a whole number</small>
            </td>
          </tr>
        </tbody>
      </table>
  </div>
</div>


      <div class="row">
        <div class="large-12 columns">
        <h3>Number of Non-Cash Benefit Sources</h3>
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
                <td>
                  No Sources
                </td>
                <td>
            <input type="number"
                   name="apr26Stayers_NoSources_Total"
                   value="#getDataAPR.apr26Stayers_NoSources_Total#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                  ID="sumR5"
                  ReadOnly
                  class="BGLightGray col5">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                     name="apr26Stayers_NoSources_Adult"
                     value="#getDataAPR.apr26Stayers_NoSources_Adult#"
                     placeholder="0"
                     min="0"
                     step="1"
                     maxlength="11"
                     tabindex="#nexttab++#"
                     class="row5 col6">
              <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_NoSources_Child"
                   value="#getDataAPR.apr26Stayers_NoSources_Child#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_NoSources_Unknown"
                   value="#getDataAPR.apr26Stayers_NoSources_Unknown#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col8 row5">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  1+ Source(s)
                </td>
                <td>
            <input type="number"
                   name="apr26Stayers_1Plus_Total"
                   value="#getDataAPR.apr26Stayers_1Plus_Total#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                  ID="sumR6"
                  ReadOnly
                  class="BGLightGray col5"> 
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_1Plus_Adult"
                   value="#getDataAPR.apr26Stayers_1Plus_Adult#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col6">
            <small class="form-error">This field is requried</small>
                </td>
                <td> 
                  <input type="number"
                   name="apr26Stayers_1Plus_Child"
                   value="#getDataAPR.apr26Stayers_1Plus_Child#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col7 row6">
                <small class="form-error">This field is requried</small>
                </td>
                <td> 
                  <input type="number"
                   name="apr26Stayers_1Plus_Unknown"
                   value="#getDataAPR.apr26Stayers_1Plus_Unknown#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                     tabindex="#nexttab++#"
                     class="col8 row6">
              <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Don't Know/Refused
                </td>
                <td>
            <input type="number"
                   name="apr26Stayers_DKR_Total"
                   value="#getDataAPR.apr26Stayers_DKR_Total#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                  ID="sumR7"
                  ReadOnly
                  class="BGLightGray col5">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_DKR_Adult"
                   value="#getDataAPR.apr26Stayers_DKR_Adult#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_DKR_Child"
                   value="#getDataAPR.apr26Stayers_DKR_Child#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td> 
                  <input type="number"
                   name="apr26Stayers_DKR_Unknown"
                   value="#getDataAPR.apr26Stayers_DKR_Unknown#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              <tr>
                 <td>
                  Information Missing
                </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_Missing_Total"
                   value="#getDataAPR.apr26Stayers_Missing_Total#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                  ID="sumR8"
                  ReadOnly
                  class="BGLightGray col5">
            <small class="form-error">Must be a whole number</SmallBox>
          </td>
          <td>
            <input type="number"
                   name="apr26Stayers_Missing_Adult"
                   value="#getDataAPR.apr26Stayers_Missing_Adult#"
                   placeholder="0"
                   min="0"
                     step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col6">
               <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr26Stayers_Missing_Child"
                   value="#getDataAPR.apr26Stayers_Missing_Child#"
                   placeholder="0"
                   min="0"
                    step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col7">
               <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr26Stayers_Missing_Unknown"
                 value="#getDataAPR.apr26Stayers_Missing_Unknown#"
                 placeholder="0"
                 min="0"
                     step="1"
                 maxlength="11"
                tabindex="#nexttab++#"
                class="row8 col8">
          <small class="form-error">Must be a whole number</small>
              </tr>

               <tr>
                 <td>
                  <strong>Total</strong>
                </td>
                <td>
                  <input type="number"
                   name="apr26Stayers_Total_Total"
                   value="#getDataAPR.apr26Stayers_Total_Total#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                  
                  ID="sumC5"
                  ReadOnly
                  class="subtotal_stayers BGLightGray">
            
          </td>
          <td>
            <input type="number"
                   name="apr26Stayers_Total_Adult"
                   value="#getDataAPR.apr26Stayers_Total_Adult#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                   ID="sumC6"
                  ReadOnly
                  class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr26Stayers_Total_Child"
                   value="#getDataAPR.apr26Stayers_Total_Child#"
                   placeholder="0"
                   min="0"
                     step="1"
                  maxlength="11"
                   ID="sumC7"
                  ReadOnly
                  class="BGLightGray">
               <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr26Stayers_Total_Unknown"
                 value="#getDataAPR.apr26Stayers_Total_Unknown#"
                 placeholder="0"
                 min="0"
                     step="1"
                maxlength="11"
                  ID="sumC8"
                  ReadOnly
                  class="BGLightGray">
          <small class="form-error">Must be a whole number</small>
              </tr>

            </body>
          </table>
        </div>
    </div>

</cfoutput>