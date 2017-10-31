<!--- Set Variables --->
<cfset TargetTable = "DataAPR22">
<cfset UniqueID = "DataAPR22ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR22ID"
        Form = "dataapr22">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr22" formfields="aprID, inputUserID, projectID, reviewUserID, apr22Leavers_DevDisability_Child, apr22Leavers_Mental_All, apr22Leavers_Mental_Adult, apr22Leavers_Mental_Child, apr22Leavers_Mental_AgeUnknown, apr22Leavers_Alcohol_All, apr22Leavers_Alcohol_Adult, apr22Leavers_Alcohol_Child, apr22Leavers_Alcohol_AgeUnknown, apr22Leavers_Drug_All, apr22Leavers_ChronicHealth_All, apr22Leavers_Drug_Adult, apr22Leavers_Drug_Child, apr22Leavers_Drug_AgeUnknown, apr22Stayers_Drug_Child, apr22Leavers_ChronicHealth_Adult, apr22Leavers_ChronicHealth_Child, apr22Leavers_ChronicHealth_AgeUnknown, apr22Leavers_HIV_All, apr22Leavers_HIV_Adult, apr22Leavers_HIV_Child, apr22Leavers_HIV_AgeUnknown, apr22Leavers_DevDisability_All, apr22Leavers_DevDisability_Adult, apr22Leavers_DevDisability_AgeUnknown, apr22Leavers_PhysDisability_All, apr22Leavers_PhysDisability_Adult, apr22Leavers_PhysDisability_Child, apr22Leavers_PhysDisability_AgeUnknown, apr22Leavers_None_All, apr22Leavers_None_Adult, apr22Leavers_None_Child, apr22Leavers_None_AgeUnknown, apr22Leavers_1_All, apr22Leavers_1_Adult, apr22Leavers_1_Child, apr22Leavers_1_AgeUnknown, apr22Leavers_2_All, apr22Leavers_2_Adult, apr22Leavers_2_Child, apr22Leavers_2_AgeUnknown, apr22Leavers_3_All, apr22Leavers_3_Adult, apr22Leavers_3_Child, apr22Leavers_3_AgeUnknown, apr22Leavers_Unknown_All, apr22Leavers_Unknown_Adult, apr22Leavers_Unknown_Child, apr22Leavers_Unknown_AgeUnknown, apr22Leavers_DKR_All, apr22Leavers_DKR_Adult, apr22Leavers_DKR_Child, apr22Leavers_DKR_AgeUnknown, apr22Leavers_Missing_All, apr22Leavers_Missing_Adult, apr22Leavers_Missing_Child, apr22Leavers_Missing_AgeUnknown, apr22Leavers_Total_All, apr22Leavers_Total_Adult, apr22Leavers_Total_Child, apr22Leavers_Total_AgeUnknown, apr22Stayers_Mental_All, apr22Stayers_Mental_Adult, apr22Stayers_Mental_Child, apr22Stayers_Mental_AgeUnknown, apr22Stayers_Alcohol_All, apr22Stayers_Alcohol_Adult, apr22Stayers_Alcohol_Child, apr22Stayers_Alcohol_AgeUnknown, apr22Stayers_Drug_All, apr22Stayers_Drug_Adult, apr22Stayers_Drug_AgeUnknown, apr22Stayers_ChronicHealth_All, apr22Stayers_ChronicHealth_Adult, apr22Stayers_ChronicHealth_Child, apr22Stayers_ChronicHealth_AgeUnknown, apr22Stayers_HIV_All, apr22Stayers_HIV_Adult, apr22Stayers_HIV_Child, apr22Stayers_HIV_AgeUnknown, apr22Stayers_DevDisability_All, apr22Stayers_DevDisability_Adult, apr22Stayers_DevDisability_Child, apr22Stayers_DevDisability_AgeUnknown, apr22Stayers_PhysDisability_All, apr22Stayers_PhysDisability_Adult, apr22Stayers_PhysDisability_Child, apr22Stayers_PhysDisability_AgeUnknown, apr22Stayers_None_All, apr22Stayers_None_Adult, apr22Stayers_None_Child, apr22Stayers_None_AgeUnknown, apr22Stayers_1_All, apr22Stayers_1_Adult, apr22Stayers_1_Child, apr22Stayers_1_AgeUnknown, apr22Stayers_2_All, apr22Stayers_2_Adult, apr22Stayers_2_Child, apr22Stayers_2_AgeUnknown, apr22Stayers_3_All, apr22Stayers_3_Adult, apr22Stayers_3_Child, apr22Stayers_3_AgeUnknown, apr22Stayers_Unknown_All, apr22Stayers_Unknown_Adult, apr22Stayers_Unknown_Child, apr22Stayers_Unknown_AgeUnknown, apr22Stayers_DKR_All, apr22Stayers_DKR_Adult, apr22Stayers_DKR_Child, apr22Stayers_DKR_AgeUnknown, apr22Stayers_Missing_All, apr22Stayers_Missing_Adult, apr22Stayers_Missing_Child, apr22Stayers_Missing_AgeUnknown, apr22Stayers_Total_All, apr22Stayers_Total_Adult, apr22Stayers_Total_Child, apr22Stayers_Total_AgeUnknown">
  <cfelse>
    <cfset FORM.DataAPR22ID = newCheck.DataAPR22ID>
        
<!--- Set Defaults --->        
<cfif form.apr22Leavers_DevDisability_Child	 EQ "">	
    <cfset form.apr22Leavers_DevDisability_Child	 =0></cfif>
<cfif form.apr22Leavers_Mental_All	 EQ "">	
    <cfset form.apr22Leavers_Mental_All	 =0></cfif>
<cfif form.apr22Leavers_Mental_Adult	 EQ "">	
    <cfset form.apr22Leavers_Mental_Adult	 =0></cfif>
<cfif form.apr22Leavers_Mental_Child	 EQ "">	
    <cfset form.apr22Leavers_Mental_Child	 =0></cfif>
<cfif form.apr22Leavers_Mental_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_Mental_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_Alcohol_All	 EQ "">	
    <cfset form.apr22Leavers_Alcohol_All	 =0></cfif>
<cfif form.apr22Leavers_Alcohol_Adult	 EQ "">	
    <cfset form.apr22Leavers_Alcohol_Adult	 =0></cfif>
<cfif form.apr22Leavers_Alcohol_Child	 EQ "">	
    <cfset form.apr22Leavers_Alcohol_Child	 =0></cfif>
<cfif form.apr22Leavers_Alcohol_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_Alcohol_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_Drug_All	 EQ "">	
    <cfset form.apr22Leavers_Drug_All	 =0></cfif>
<cfif form.apr22Leavers_ChronicHealth_All	 EQ "">	
    <cfset form.apr22Leavers_ChronicHealth_All	 =0></cfif>
<cfif form.apr22Leavers_Drug_Adult	 EQ "">	
    <cfset form.apr22Leavers_Drug_Adult	 =0></cfif>
<cfif form.apr22Leavers_Drug_Child	 EQ "">	
    <cfset form.apr22Leavers_Drug_Child	 =0></cfif>
<cfif form.apr22Leavers_Drug_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_Drug_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Drug_Child	 EQ "">	
    <cfset form.apr22Stayers_Drug_Child	 =0></cfif>
<cfif form.apr22Leavers_ChronicHealth_Adult	 EQ "">	
    <cfset form.apr22Leavers_ChronicHealth_Adult	 =0></cfif>
<cfif form.apr22Leavers_ChronicHealth_Child	 EQ "">	
    <cfset form.apr22Leavers_ChronicHealth_Child	 =0></cfif>
<cfif form.apr22Leavers_ChronicHealth_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_ChronicHealth_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_HIV_All	 EQ "">	
    <cfset form.apr22Leavers_HIV_All	 =0></cfif>
<cfif form.apr22Leavers_HIV_Adult	 EQ "">	
    <cfset form.apr22Leavers_HIV_Adult	 =0></cfif>
<cfif form.apr22Leavers_HIV_Child	 EQ "">	
    <cfset form.apr22Leavers_HIV_Child	 =0></cfif>
<cfif form.apr22Leavers_HIV_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_HIV_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_DevDisability_All	 EQ "">	
    <cfset form.apr22Leavers_DevDisability_All	 =0></cfif>
<cfif form.apr22Leavers_DevDisability_Adult	 EQ "">	
    <cfset form.apr22Leavers_DevDisability_Adult	 =0></cfif>
<cfif form.apr22Leavers_DevDisability_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_DevDisability_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_PhysDisability_All	 EQ "">	
    <cfset form.apr22Leavers_PhysDisability_All	 =0></cfif>
<cfif form.apr22Leavers_PhysDisability_Adult	 EQ "">	
    <cfset form.apr22Leavers_PhysDisability_Adult	 =0></cfif>
<cfif form.apr22Leavers_PhysDisability_Child	 EQ "">	
    <cfset form.apr22Leavers_PhysDisability_Child	 =0></cfif>
<cfif form.apr22Leavers_PhysDisability_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_PhysDisability_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_None_All	 EQ "">	
    <cfset form.apr22Leavers_None_All	 =0></cfif>
<cfif form.apr22Leavers_None_Adult	 EQ "">	
    <cfset form.apr22Leavers_None_Adult	 =0></cfif>
<cfif form.apr22Leavers_None_Child	 EQ "">	
    <cfset form.apr22Leavers_None_Child	 =0></cfif>
<cfif form.apr22Leavers_None_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_None_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_1_All	 EQ "">	
    <cfset form.apr22Leavers_1_All	 =0></cfif>
<cfif form.apr22Leavers_1_Adult	 EQ "">	
    <cfset form.apr22Leavers_1_Adult	 =0></cfif>
<cfif form.apr22Leavers_1_Child	 EQ "">	
    <cfset form.apr22Leavers_1_Child	 =0></cfif>
<cfif form.apr22Leavers_1_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_1_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_2_All	 EQ "">	
    <cfset form.apr22Leavers_2_All	 =0></cfif>
<cfif form.apr22Leavers_2_Adult	 EQ "">	
    <cfset form.apr22Leavers_2_Adult	 =0></cfif>
<cfif form.apr22Leavers_2_Child	 EQ "">	
    <cfset form.apr22Leavers_2_Child	 =0></cfif>
<cfif form.apr22Leavers_2_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_2_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_3_All	 EQ "">	
    <cfset form.apr22Leavers_3_All	 =0></cfif>
<cfif form.apr22Leavers_3_Adult	 EQ "">	
    <cfset form.apr22Leavers_3_Adult	 =0></cfif>
<cfif form.apr22Leavers_3_Child	 EQ "">	
    <cfset form.apr22Leavers_3_Child	 =0></cfif>
<cfif form.apr22Leavers_3_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_3_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_Unknown_All	 EQ "">	
    <cfset form.apr22Leavers_Unknown_All	 =0></cfif>
<cfif form.apr22Leavers_Unknown_Adult	 EQ "">	
    <cfset form.apr22Leavers_Unknown_Adult	 =0></cfif>
<cfif form.apr22Leavers_Unknown_Child	 EQ "">	
    <cfset form.apr22Leavers_Unknown_Child	 =0></cfif>
<cfif form.apr22Leavers_Unknown_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_Unknown_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_DKR_All	 EQ "">	
    <cfset form.apr22Leavers_DKR_All	 =0></cfif>
<cfif form.apr22Leavers_DKR_Adult	 EQ "">	
    <cfset form.apr22Leavers_DKR_Adult	 =0></cfif>
<cfif form.apr22Leavers_DKR_Child	 EQ "">	
    <cfset form.apr22Leavers_DKR_Child	 =0></cfif>
<cfif form.apr22Leavers_DKR_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_DKR_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_Missing_All	 EQ "">	
    <cfset form.apr22Leavers_Missing_All	 =0></cfif>
<cfif form.apr22Leavers_Missing_Adult	 EQ "">	
    <cfset form.apr22Leavers_Missing_Adult	 =0></cfif>
<cfif form.apr22Leavers_Missing_Child	 EQ "">	
    <cfset form.apr22Leavers_Missing_Child	 =0></cfif>
<cfif form.apr22Leavers_Missing_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_Missing_AgeUnknown	 =0></cfif>
<cfif form.apr22Leavers_Total_All	 EQ "">	
    <cfset form.apr22Leavers_Total_All	 =0></cfif>
<cfif form.apr22Leavers_Total_Adult	 EQ "">	
    <cfset form.apr22Leavers_Total_Adult	 =0></cfif>
<cfif form.apr22Leavers_Total_Child	 EQ "">	
    <cfset form.apr22Leavers_Total_Child	 =0></cfif>
<cfif form.apr22Leavers_Total_AgeUnknown	 EQ "">	
    <cfset form.apr22Leavers_Total_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Mental_All	 EQ "">	
    <cfset form.apr22Stayers_Mental_All	 =0></cfif>
<cfif form.apr22Stayers_Mental_Adult	 EQ "">	
    <cfset form.apr22Stayers_Mental_Adult	 =0></cfif>
<cfif form.apr22Stayers_Mental_Child	 EQ "">	
    <cfset form.apr22Stayers_Mental_Child	 =0></cfif>
<cfif form.apr22Stayers_Mental_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_Mental_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Alcohol_All	 EQ "">	
    <cfset form.apr22Stayers_Alcohol_All	 =0></cfif>
<cfif form.apr22Stayers_Alcohol_Adult	 EQ "">	
    <cfset form.apr22Stayers_Alcohol_Adult	 =0></cfif>
<cfif form.apr22Stayers_Alcohol_Child	 EQ "">	
    <cfset form.apr22Stayers_Alcohol_Child	 =0></cfif>
<cfif form.apr22Stayers_Alcohol_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_Alcohol_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Drug_All	 EQ "">	
    <cfset form.apr22Stayers_Drug_All	 =0></cfif>
<cfif form.apr22Stayers_Drug_Adult	 EQ "">	
    <cfset form.apr22Stayers_Drug_Adult	 =0></cfif>
<cfif form.apr22Stayers_Drug_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_Drug_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_ChronicHealth_All	 EQ "">	
    <cfset form.apr22Stayers_ChronicHealth_All	 =0></cfif>
<cfif form.apr22Stayers_ChronicHealth_Adult	 EQ "">	
    <cfset form.apr22Stayers_ChronicHealth_Adult	 =0></cfif>
<cfif form.apr22Stayers_ChronicHealth_Child	 EQ "">	
    <cfset form.apr22Stayers_ChronicHealth_Child	 =0></cfif>
<cfif form.apr22Stayers_ChronicHealth_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_ChronicHealth_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_HIV_All	 EQ "">	
    <cfset form.apr22Stayers_HIV_All	 =0></cfif>
<cfif form.apr22Stayers_HIV_Adult	 EQ "">	
    <cfset form.apr22Stayers_HIV_Adult	 =0></cfif>
<cfif form.apr22Stayers_HIV_Child	 EQ "">	
    <cfset form.apr22Stayers_HIV_Child	 =0></cfif>
<cfif form.apr22Stayers_HIV_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_HIV_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_DevDisability_All	 EQ "">	
    <cfset form.apr22Stayers_DevDisability_All	 =0></cfif>
<cfif form.apr22Stayers_DevDisability_Adult	 EQ "">	
    <cfset form.apr22Stayers_DevDisability_Adult	 =0></cfif>
<cfif form.apr22Stayers_DevDisability_Child	 EQ "">	
    <cfset form.apr22Stayers_DevDisability_Child	 =0></cfif>
<cfif form.apr22Stayers_DevDisability_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_DevDisability_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_PhysDisability_All	 EQ "">	
    <cfset form.apr22Stayers_PhysDisability_All	 =0></cfif>
<cfif form.apr22Stayers_PhysDisability_Adult	 EQ "">	
    <cfset form.apr22Stayers_PhysDisability_Adult	 =0></cfif>
<cfif form.apr22Stayers_PhysDisability_Child	 EQ "">	
    <cfset form.apr22Stayers_PhysDisability_Child	 =0></cfif>
<cfif form.apr22Stayers_PhysDisability_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_PhysDisability_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_None_All	 EQ "">	
    <cfset form.apr22Stayers_None_All	 =0></cfif>
<cfif form.apr22Stayers_None_Adult	 EQ "">	
    <cfset form.apr22Stayers_None_Adult	 =0></cfif>
<cfif form.apr22Stayers_None_Child	 EQ "">	
    <cfset form.apr22Stayers_None_Child	 =0></cfif>
<cfif form.apr22Stayers_None_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_None_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_1_All	 EQ "">	
    <cfset form.apr22Stayers_1_All	 =0></cfif>
<cfif form.apr22Stayers_1_Adult	 EQ "">	
    <cfset form.apr22Stayers_1_Adult	 =0></cfif>
<cfif form.apr22Stayers_1_Child	 EQ "">	
    <cfset form.apr22Stayers_1_Child	 =0></cfif>
<cfif form.apr22Stayers_1_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_1_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_2_All	 EQ "">	
    <cfset form.apr22Stayers_2_All	 =0></cfif>
<cfif form.apr22Stayers_2_Adult	 EQ "">	
    <cfset form.apr22Stayers_2_Adult	 =0></cfif>
<cfif form.apr22Stayers_2_Child	 EQ "">	
    <cfset form.apr22Stayers_2_Child	 =0></cfif>
<cfif form.apr22Stayers_2_AgeUnknown	 EQ "">	<cfset form.apr22Stayers_2_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_3_All	 EQ "">	
    <cfset form.apr22Stayers_3_All	 =0></cfif>
<cfif form.apr22Stayers_3_Adult	 EQ "">	
    <cfset form.apr22Stayers_3_Adult	 =0></cfif>
<cfif form.apr22Stayers_3_Child	 EQ "">	
    <cfset form.apr22Stayers_3_Child	 =0></cfif>
<cfif form.apr22Stayers_3_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_3_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Unknown_All	 EQ "">	
    <cfset form.apr22Stayers_Unknown_All	 =0></cfif>
<cfif form.apr22Stayers_Unknown_Adult	 EQ "">	
    <cfset form.apr22Stayers_Unknown_Adult	 =0></cfif>
<cfif form.apr22Stayers_Unknown_Child	 EQ "">	
    <cfset form.apr22Stayers_Unknown_Child	 =0></cfif>
<cfif form.apr22Stayers_Unknown_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_Unknown_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_DKR_All	 EQ "">	
    <cfset form.apr22Stayers_DKR_All	 =0></cfif>
<cfif form.apr22Stayers_DKR_Adult	 EQ "">	
    <cfset form.apr22Stayers_DKR_Adult	 =0></cfif>
<cfif form.apr22Stayers_DKR_Child	 EQ "">	
    <cfset form.apr22Stayers_DKR_Child	 =0></cfif>
<cfif form.apr22Stayers_DKR_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_DKR_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Missing_All	 EQ "">	
    <cfset form.apr22Stayers_Missing_All	 =0></cfif>
<cfif form.apr22Stayers_Missing_Adult	 EQ "">	
    <cfset form.apr22Stayers_Missing_Adult	 =0></cfif>
<cfif form.apr22Stayers_Missing_Child	 EQ "">	
    <cfset form.apr22Stayers_Missing_Child	 =0></cfif>
<cfif form.apr22Stayers_Missing_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_Missing_AgeUnknown	 =0></cfif>
<cfif form.apr22Stayers_Total_All	 EQ "">	
    <cfset form.apr22Stayers_Total_All	 =0></cfif>
<cfif form.apr22Stayers_Total_Adult	 EQ "">	
    <cfset form.apr22Stayers_Total_Adult	 =0></cfif>
<cfif form.apr22Stayers_Total_Child	 EQ "">	
    <cfset form.apr22Stayers_Total_Child	 =0></cfif>
<cfif form.apr22Stayers_Total_AgeUnknown	 EQ "">	
    <cfset form.apr22Stayers_Total_AgeUnknown	 =0></cfif>
<!---/ Set Defaults --->        
        
    <cfupdate datasource="#DataSource#" tablename="dataapr22" formfields="DataAPR22ID, aprID, inputUserID, projectID, reviewUserID, apr22Leavers_DevDisability_Child, apr22Leavers_Mental_All, apr22Leavers_Mental_Adult, apr22Leavers_Mental_Child, apr22Leavers_Mental_AgeUnknown, apr22Leavers_Alcohol_All, apr22Leavers_Alcohol_Adult, apr22Leavers_Alcohol_Child, apr22Leavers_Alcohol_AgeUnknown, apr22Leavers_Drug_All, apr22Leavers_ChronicHealth_All, apr22Leavers_Drug_Adult, apr22Leavers_Drug_Child, apr22Leavers_Drug_AgeUnknown, apr22Stayers_Drug_Child, apr22Leavers_ChronicHealth_Adult, apr22Leavers_ChronicHealth_Child, apr22Leavers_ChronicHealth_AgeUnknown, apr22Leavers_HIV_All, apr22Leavers_HIV_Adult, apr22Leavers_HIV_Child, apr22Leavers_HIV_AgeUnknown, apr22Leavers_DevDisability_All, apr22Leavers_DevDisability_Adult, apr22Leavers_DevDisability_AgeUnknown, apr22Leavers_PhysDisability_All, apr22Leavers_PhysDisability_Adult, apr22Leavers_PhysDisability_Child, apr22Leavers_PhysDisability_AgeUnknown, apr22Leavers_None_All, apr22Leavers_None_Adult, apr22Leavers_None_Child, apr22Leavers_None_AgeUnknown, apr22Leavers_1_All, apr22Leavers_1_Adult, apr22Leavers_1_Child, apr22Leavers_1_AgeUnknown, apr22Leavers_2_All, apr22Leavers_2_Adult, apr22Leavers_2_Child, apr22Leavers_2_AgeUnknown, apr22Leavers_3_All, apr22Leavers_3_Adult, apr22Leavers_3_Child, apr22Leavers_3_AgeUnknown, apr22Leavers_Unknown_All, apr22Leavers_Unknown_Adult, apr22Leavers_Unknown_Child, apr22Leavers_Unknown_AgeUnknown, apr22Leavers_DKR_All, apr22Leavers_DKR_Adult, apr22Leavers_DKR_Child, apr22Leavers_DKR_AgeUnknown, apr22Leavers_Missing_All, apr22Leavers_Missing_Adult, apr22Leavers_Missing_Child, apr22Leavers_Missing_AgeUnknown, apr22Leavers_Total_All, apr22Leavers_Total_Adult, apr22Leavers_Total_Child, apr22Leavers_Total_AgeUnknown, apr22Stayers_Mental_All, apr22Stayers_Mental_Adult, apr22Stayers_Mental_Child, apr22Stayers_Mental_AgeUnknown, apr22Stayers_Alcohol_All, apr22Stayers_Alcohol_Adult, apr22Stayers_Alcohol_Child, apr22Stayers_Alcohol_AgeUnknown, apr22Stayers_Drug_All, apr22Stayers_Drug_Adult, apr22Stayers_Drug_AgeUnknown, apr22Stayers_ChronicHealth_All, apr22Stayers_ChronicHealth_Adult, apr22Stayers_ChronicHealth_Child, apr22Stayers_ChronicHealth_AgeUnknown, apr22Stayers_HIV_All, apr22Stayers_HIV_Adult, apr22Stayers_HIV_Child, apr22Stayers_HIV_AgeUnknown, apr22Stayers_DevDisability_All, apr22Stayers_DevDisability_Adult, apr22Stayers_DevDisability_Child, apr22Stayers_DevDisability_AgeUnknown, apr22Stayers_PhysDisability_All, apr22Stayers_PhysDisability_Adult, apr22Stayers_PhysDisability_Child, apr22Stayers_PhysDisability_AgeUnknown, apr22Stayers_None_All, apr22Stayers_None_Adult, apr22Stayers_None_Child, apr22Stayers_None_AgeUnknown, apr22Stayers_1_All, apr22Stayers_1_Adult, apr22Stayers_1_Child, apr22Stayers_1_AgeUnknown, apr22Stayers_2_All, apr22Stayers_2_Adult, apr22Stayers_2_Child, apr22Stayers_2_AgeUnknown, apr22Stayers_3_All, apr22Stayers_3_Adult, apr22Stayers_3_Child, apr22Stayers_3_AgeUnknown, apr22Stayers_Unknown_All, apr22Stayers_Unknown_Adult, apr22Stayers_Unknown_Child, apr22Stayers_Unknown_AgeUnknown, apr22Stayers_DKR_All, apr22Stayers_DKR_Adult, apr22Stayers_DKR_Child, apr22Stayers_DKR_AgeUnknown, apr22Stayers_Missing_All, apr22Stayers_Missing_Adult, apr22Stayers_Missing_Child, apr22Stayers_Missing_AgeUnknown, apr22Stayers_Total_All, apr22Stayers_Total_Adult, apr22Stayers_Total_Child, apr22Stayers_Total_AgeUnknown">
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
        Form = "dataapr22"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="8">
<cfset mathRows="28">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Known Physical and Mental Health Conditions</h3>
    <h4>Number of Leavers </h4>
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th></th>
        <th>All Persons</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>Mental Illness</td>
          <td>
              <input type="number"
                     name="apr22Leavers_Mental_All"
                     value="#getDataAPR.apr22Leavers_Mental_All#"
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
                     name="apr22Leavers_Mental_Adult"
                     value="#getDataAPR.apr22Leavers_Mental_Adult#"
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
                     name="apr22Leavers_Mental_Child"
                     value="#getDataAPR.apr22Leavers_Mental_Child#"
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
                     name="apr22Leavers_Mental_AgeUnknown"
                     value="#getDataAPR.apr22Leavers_Mental_AgeUnknown#"
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
          <td>Alcohol Abuse</td>
          <td>
              <input type="number"
                     name="apr22Leavers_Alcohol_All"
                     value="#getDataAPR.apr22Leavers_Alcohol_All#"
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
                     name="apr22Leavers_Alcohol_Adult"
                     value="#getDataAPR.apr22Leavers_Alcohol_Adult#"
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
                     name="apr22Leavers_Alcohol_Child"
                     value="#getDataAPR.apr22Leavers_Alcohol_Child#"
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
                     name="apr22Leavers_Alcohol_AgeUnknown"
                     value="#getDataAPR.apr22Leavers_Alcohol_AgeUnknown#"
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
          <td>Drug Abuse</td>
          <td>
            <input type="number"
                   name="apr22Leavers_Drug_All"
                   value="#getDataAPR.apr22Leavers_Drug_All#"
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
                   name="apr22Leavers_Drug_Adult"
                   value="#getDataAPR.apr22Leavers_Drug_Adult#"
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
                   name="apr22Leavers_Drug_Child"
                   value="#getDataAPR.apr22Leavers_Drug_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row3">
            <small class="form-error">Must be a whole number</small>
<!---/ apr22Leavers_Drug_Child --->
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_Drug_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_Drug_AgeUnknown#"
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
          <td>Chronic Health Condition</td>
          <td>
            <input type="number"
                   name="apr22Leavers_ChronicHealth_All"
                   value="#getDataAPR.apr22Leavers_ChronicHealth_All#"
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
                   name="apr22Leavers_ChronicHealth_Adult"
                   value="#getDataAPR.apr22Leavers_ChronicHealth_Adult#"
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
                   name="apr22Leavers_ChronicHealth_Child"
                   value="#getDataAPR.apr22Leavers_ChronicHealth_Child#"
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
                   name="apr22Leavers_ChronicHealth_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_ChronicHealth_AgeUnknown#"
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
          <td>HIV/AIDS and Related Diseases</td>
          <td>
            <input type="number"
                   name="apr22Leavers_HIV_All"
                   value="#getDataAPR.apr22Leavers_HIV_All#"
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
                   name="apr22Leavers_HIV_Adult"
                   value="#getDataAPR.apr22Leavers_HIV_Adult#"
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
                   name="apr22Leavers_HIV_Child"
                   value="#getDataAPR.apr22Leavers_HIV_Child#"
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
                   name="apr22Leavers_HIV_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_HIV_AgeUnknown#"
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
          <td>Developmental Disability</td>
          <td>
            <input type="number"
                   name="apr22Leavers_DevDisability_All"
                   value="#getDataAPR.apr22Leavers_DevDisability_All#"
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
                   name="apr22Leavers_DevDisability_Adult"
                   value="#getDataAPR.apr22Leavers_DevDisability_Adult#"
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
                   name="apr22Leavers_DevDisability_Child"
                   value="#getDataAPR.apr22Leavers_DevDisability_Child#"
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
                   name="apr22Leavers_DevDisability_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_DevDisability_AgeUnknown#"
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
          <td>Physical Disability</td>
          <td>
            <input type="number"
                   name="apr22Leavers_PhysDisability_All"
                   value="#getDataAPR.apr22Leavers_PhysDisability_All#"
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
                   name="apr22Leavers_PhysDisability_Adult"
                   value="#getDataAPR.apr22Leavers_PhysDisability_Adult#"
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
                   name="apr22Leavers_PhysDisability_Child"
                   value="#getDataAPR.apr22Leavers_PhysDisability_Child#"
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
                   name="apr22Leavers_PhysDisability_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_PhysDisability_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="row">
  <div class="large-12 columns">
    <h3>Number of Known Conditions</h3>
    <h4>Number of Leavers</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>All Persons</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>None</td>
         <td>
            <input type="number"
                   name="apr22Leavers_None_All"
                   value="#getDataAPR.apr22Leavers_None_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_None_Adult"
                   value="#getDataAPR.apr22Leavers_None_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row8 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_None_Child"
                   value="#getDataAPR.apr22Leavers_None_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row8 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_None_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_None_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row8 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>1 Condition</td>
          <td>
            <input type="number"
                   name="apr22Leavers_1_All"
                   value="#getDataAPR.apr22Leavers_1_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_1_Adult"
                   value="#getDataAPR.apr22Leavers_1_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row9 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_1_Child"
                   value="#getDataAPR.apr22Leavers_1_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row9 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_1_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_1_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row9 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>2 Conditions</td>
         <td>
            <input type="number"
                   name="apr22Leavers_2_All"
                   value="#getDataAPR.apr22Leavers_2_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_2_Adult"
                   value="#getDataAPR.apr22Leavers_2_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row10 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_2_Child"
                   value="#getDataAPR.apr22Leavers_2_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row10 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_2_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_2_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row10 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>3+ Conditions</td>
         <td>
            <input type="number"
                   name="apr22Leavers_3_All"
                   value="#getDataAPR.apr22Leavers_3_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR11">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_3_Adult"
                   value="#getDataAPR.apr22Leavers_3_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row11 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_3_Child"
                   value="#getDataAPR.apr22Leavers_3_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row11 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_3_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_3_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row11 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Condition Unknown</td>
          <td>
            <input type="number"
                   name="apr22Leavers_Unknown_All"
                   value="#getDataAPR.apr22Leavers_Unknown_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR12">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_Unknown_Adult"
                   value="#getDataAPR.apr22Leavers_Unknown_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row12 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_Unknown_Child"
                   value="#getDataAPR.apr22Leavers_Unknown_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row12 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_Unknown_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_Unknown_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row12 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
        <td>
            <input type="number"
                   name="apr22Leavers_DKR_All"
                   value="#getDataAPR.apr22Leavers_DKR_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR13">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_DKR_Adult"
                   value="#getDataAPR.apr22Leavers_DKR_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row13 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_DKR_Child"
                   value="#getDataAPR.apr22Leavers_DKR_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row13 col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_DKR_AgeUnknown"
                   value="#getDataAPR.apr22Leavers_DKR_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row13 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
         <td>
            <input type="number"
                   name="apr22Leavers_Missing_All"
                   value="#getDataAPR.apr22Leavers_Missing_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col1"
                  id="sumR14">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Leavers_Missing_Adult"
                   value="#getDataAPR.apr22Leavers_Missing_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class ="row14 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr22Leavers_Missing_Child"
                 value="#getDataAPR.apr22Leavers_Missing_Child#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class ="row14 col3">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr22Leavers_Missing_AgeUnknown"
                 value="#getDataAPR.apr22Leavers_Missing_AgeUnknown#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class ="row14 col4">
          <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
          <td>
          <input type="number"
                 name="apr22Leavers_Total_All"
                 value="#getDataAPR.apr22Leavers_Total_All#"
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
                 name="apr22Leavers_Total_Adult"
                 value="#getDataAPR.apr22Leavers_Total_Adult#"
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
                 name="apr22Leavers_Total_Child"
                 value="#getDataAPR.apr22Leavers_Total_Child#"
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
                 name="apr22Leavers_Total_AgeUnknown"
                 value="#getDataAPR.apr22Leavers_Total_AgeUnknown#"
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
    <h3>Known Physical and Mental Health Conditions</h3>
    <h4>Number of Stayers</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>All Persons</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>Mental Illness</td>
          <td>
            <input type="number"
                   name="apr22Stayers_Mental_All"
                   value="#getDataAPR.apr22Stayers_Mental_All#"
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
                   name="apr22Stayers_Mental_Adult"
                   value="#getDataAPR.apr22Stayers_Mental_Adult#"
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
                   name="apr22Stayers_Mental_Child"
                   value="#getDataAPR.apr22Stayers_Mental_Child#"
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
                   name="apr22Stayers_Mental_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_Mental_AgeUnknown#"
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
          <td>Alcohol Abuse</td>
          <td>
            <input type="number"
                   name="apr22Stayers_Alcohol_All"
                   value="#getDataAPR.apr22Stayers_Alcohol_All#"
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
                   name="apr22Stayers_Alcohol_Adult"
                   value="#getDataAPR.apr22Stayers_Alcohol_Adult#"
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
                   name="apr22Stayers_Alcohol_Child"
                   value="#getDataAPR.apr22Stayers_Alcohol_Child#"
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
                   name="apr22Stayers_Alcohol_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_Alcohol_AgeUnknown#"
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
          <td>Drug Abuse</td>
          <td>
            <input type="number"
                   name="apr22Stayers_Drug_All"
                   value="#getDataAPR.apr22Stayers_Drug_All#"
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
                   name="apr22Stayers_Drug_Adult"
                   value="#getDataAPR.apr22Stayers_Drug_Adult#"
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
                   name="apr22Stayers_Drug_Child"
                   value="#getDataAPR.apr22Stayers_Drug_Child#"
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
                   name="apr22Stayers_Drug_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_Drug_AgeUnknown#"
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
          <td>Chronic Health Condition</td>
          <td>
            <input type="number"
                   name="apr22Stayers_ChronicHealth_All"
                   value="#getDataAPR.apr22Stayers_ChronicHealth_All#"
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
                   name="apr22Stayers_ChronicHealth_Adult"
                   value="#getDataAPR.apr22Stayers_ChronicHealth_Adult#"
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
                   name="apr22Stayers_ChronicHealth_Child"
                   value="#getDataAPR.apr22Stayers_ChronicHealth_Child#"
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
                   name="apr22Stayers_ChronicHealth_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_ChronicHealth_AgeUnknown#"
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
          <td>HIV/AIDS and Related Diseases</td>
          <td>
            <input type="number"
                   name="apr22Stayers_HIV_All"
                   value="#getDataAPR.apr22Stayers_HIV_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR19">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_HIV_Adult"
                   value="#getDataAPR.apr22Stayers_HIV_Adult#"
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
                   name="apr22Stayers_HIV_Child"
                   value="#getDataAPR.apr22Stayers_HIV_Child#"
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
                   name="apr22Stayers_HIV_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_HIV_AgeUnknown#"
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
          <td>Developmental Disability</td>
          <td>
            <input type="number"
                   name="apr22Stayers_DevDisability_All"
                   value="#getDataAPR.apr22Stayers_DevDisability_All#"
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
                   name="apr22Stayers_DevDisability_Adult"
                   value="#getDataAPR.apr22Stayers_DevDisability_Adult#"
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
                   name="apr22Stayers_DevDisability_Child"
                   value="#getDataAPR.apr22Stayers_DevDisability_Child#"
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
                   name="apr22Stayers_DevDisability_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_DevDisability_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row20">
          </td>
        </tr>
        <tr>
          <td>Physical Disability</td>
          <td>
            <input type="number"
                   name="apr22Stayers_PhysDisability_All"
                   value="#getDataAPR.apr22Stayers_PhysDisability_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumR21">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_PhysDisability_Adult"
                   value="#getDataAPR.apr22Stayers_PhysDisability_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_PhysDisability_Child"
                   value="#getDataAPR.apr22Stayers_PhysDisability_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_PhysDisability_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_PhysDisability_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21">
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
<div class="row">
  <div class="large-12 columns">
    <h3>Number of Known Conditions</h3>
    <h4>Number of Stayers</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>All Persons</th>
        <th>Adults</th>
        <th>Children</th>
        <th>Age Unknown</th>
      </thead>
      <tbody>
        <tr>
          <td>None</td>
          <td>
            <input type="number"
                   name="apr22Stayers_None_All"
                   value="#getDataAPR.apr22Stayers_None_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col5"
                  id="sumR22">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_None_Adult"
                   value="#getDataAPR.apr22Stayers_None_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col6">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_None_Child"
                   value="#getDataAPR.apr22Stayers_None_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col7">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_None_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_None_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col8">
          </td>
        </tr>
        <tr>
          <td>1 Condition</td>
          <td>
            <input type="number"
                   name="apr22Stayers_1_All"
                   value="#getDataAPR.apr22Stayers_1_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col5"
                  id="sumR23">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_1_Adult"
                   value="#getDataAPR.apr22Stayers_1_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row23 col6">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_1_Child"
                   value="#getDataAPR.apr22Stayers_1_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row23 col7">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_1_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_1_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row23 col8">
          </td>
        </tr>
        <tr>
          <td>2 Conditions</td>
          <td>
            <input type="number"
                   name="apr22Stayers_2_All"
                   value="#getDataAPR.apr22Stayers_2_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray col5"
                  id="sumR24">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_2_Adult"
                   value="#getDataAPR.apr22Stayers_2_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col6">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_2_Child"
                   value="#getDataAPR.apr22Stayers_2_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col7">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_2_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_2_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col8">
          </td>
        </tr>
        <tr>
          <td>3+ Conditions</td>
         <td>
            <input type="number"
                   name="apr22Stayers_3_All"
                   value="#getDataAPR.apr22Stayers_3_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   readonly
                  class="BGLightGray col5"
                  id="sumR25">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_3_Adult"
                   value="#getDataAPR.apr22Stayers_3_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_3_Child"
                   value="#getDataAPR.apr22Stayers_3_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_3_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_3_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Condition Unknown</td>
          <td>
            <input type="number"
                   name="apr22Stayers_Unknown_All"
                   value="#getDataAPR.apr22Stayers_Unknown_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   readonly
                  class="BGLightGray col5"
                  id="sumR26">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_Unknown_Adult"
                   value="#getDataAPR.apr22Stayers_Unknown_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col6">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_Unknown_Child"
                   value="#getDataAPR.apr22Stayers_Unknown_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col7">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_Unknown_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_Unknown_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col8">
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
        <td>
            <input type="number"
                   name="apr22Stayers_DKR_All"
                   value="#getDataAPR.apr22Stayers_DKR_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   readonly
                  class="BGLightGray col5"
                  id="sumR27">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_DKR_Adult"
                   value="#getDataAPR.apr22Stayers_DKR_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col6">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_DKR_Child"
                   value="#getDataAPR.apr22Stayers_DKR_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col7">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_DKR_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_DKR_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col8">
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
         <td>
            <input type="number"
                   name="apr22Stayers_Missing_All"
                   value="#getDataAPR.apr22Stayers_Missing_All#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   readonly
                  class="BGLightGray col5"
                  id="sumR28">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_Missing_Adult"
                   value="#getDataAPR.apr22Stayers_Missing_Adult#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row28 col6">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_Missing_Child"
                   value="#getDataAPR.apr22Stayers_Missing_Child#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row28 col7">
          </td>
          <td>
            <input type="number"
                   name="apr22Stayers_Missing_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_Missing_AgeUnknown#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row28 col8">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total</b></td>
         <td>
            <input type="number"
                   name="apr22Stayers_Total_All"
                   value="#getDataAPR.apr22Stayers_Total_All#"
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
                   name="apr22Stayers_Total_Adult"
                   value="#getDataAPR.apr22Stayers_Total_Adult#"
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
                   name="apr22Stayers_Total_Child"
                   value="#getDataAPR.apr22Stayers_Total_Child#"
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
                   name="apr22Stayers_Total_AgeUnknown"
                   value="#getDataAPR.apr22Stayers_Total_AgeUnknown#"
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