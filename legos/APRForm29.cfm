<!--- Set Variables --->
<cfset TargetTable = "DataAPR29">
<cfset UniqueID = "DataAPR29ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR29ID"
        Form = "dataapr29">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr29" formfields="aprID, inputUserID, projectID, reviewUserID, apr29Less90_EmergShelter_Total, apr29More90_OwnedNoSubsidy_Total, apr29More90_OwnedSubsidy_Total, apr29More90_RentalNoSubsidy_Total, apr29More90_RentalVASHSubsidy_Total, apr29More90_PSH_Total, apr29More90_RentalOtherSubsidy_Total, apr29More90_PermFamily_Total, apr29More90_PermFriend_Total, apr29More90_PermTotal_Total, apr29More90_OwnedNoSubsidy_HHNC, apr29More90_OwnedNoSubsidy_HHWC, apr29More90_OwnedNoSubsidy_HHOC, apr29More90_OwnedNoSubsidy_HHU, apr29More90_OwnedSubsidy_HHNC, apr29More90_OwnedSubsidy_HHWC, apr29More90_OwnedSubsidy_HHOC, apr29More90_OwnedSubsidy_HHU, apr29More90_RentalNoSubsidy_HHNC, apr29More90_RentalNoSubsidy_HHWC, apr29More90_RentalNoSubsidy_HHOC, apr29More90_RentalNoSubsidy_HHU, apr29More90_RentalVASHSubsidy_HHNC, apr29More90_RentalVASHSubsidy_HHWC, apr29More90_RentalVASHSubsidy_HHOC, apr29More90_RentalVASHSubsidy_HHU, apr29More90_RentalOtherSubsidy_HHNC, apr29More90_RentalOtherSubsidy_HHWC, apr29More90_RentalOtherSubsidy_HHOC, apr29More90_RentalOtherSubsidy_HHU, apr29More90_PSH_HHU, apr29More90_PSH_HHNC, apr29More90_PSH_HHWC, apr29More90_PSH_HHOC, apr29More90_PermFamily_HHNC, apr29More90_PermFamily_HHWC, apr29More90_PermFamily_HHOC, apr29More90_PermFamily_HHU, apr29More90_PermFriend_HHNC, apr29More90_PermFriend_HHWC, apr29More90_PermFriend_HHOC, apr29More90_PermFriend_HHU, apr29More90_PermTotal_HHNC, apr29More90_PermTotal_HHWC, apr29More90_PermTotal_HHOC, apr29More90_PermTotal_HHU, apr29More90_EShelter_Total, apr29More90_TH_Total, apr29More90_TempFamily_Total, apr29More90_TempFriends_Total, apr29More90_NoHumanHabitation_Total, apr29More90_SH_Total, apr29More90_Hotel_Total, apr29More90_TempTotal_Total, apr29More90_EShelter_HHNC, apr29More90_EShelter_HHWC, apr29More90_EShelter_HHOC, apr29More90_EShelter_HHU, apr29More90_TH_HHNC, apr29More90_TH_HHWC, apr29More90_TH_HHOC, apr29More90_TH_HHU, apr29More90_TempFamily_HHWC, apr29More90_TempFamily_HHNC, apr29More90_TempFamily_HHOC, apr29More90_TempFamily_HHU, apr29More90_TempFriends_HHWC, apr29More90_TempFriends_HHNC, apr29More90_TempFriends_HHOC, apr29More90_TempFriends_HHU, apr29More90_NoHumanHabitation_HHNC, apr29More90_NoHumanHabitation_HHWC, apr29More90_NoHumanHabitation_HHOC, apr29More90_NoHumanHabitation_HHU, apr29More90_SH_HHNC, apr29More90_SH_HHWC, apr29More90_SH_HHOC, apr29More90_SH_HHU, apr29More90_Hotel_HHNC, apr29More90_Hotel_HHWC, apr29More90_Hotel_HHOC, apr29More90_Hotel_HHU, apr29More90_TempTotal_HHWC, apr29More90_TempTotal_HHNC, apr29More90_TempTotal_HHOC, apr29More90_TempTotal_HHU, apr29More90_Foster_Total, apr29More90_Foster_HHNC, apr29More90_Foster_HHWC, apr29More90_Foster_HHOC, apr29More90_Foster_HHU, apr29More90_Psych_Total, apr29More90_Psych_HHNC, apr29More90_Psych_HHWC, apr29More90_Psych_HHOC, apr29More90_Psych_HHU, apr29More90_Detox_Total, apr29More90_Detox_HHNC, apr29More90_Detox_HHWC, apr29More90_Detox_HHOC, apr29More90_Detox_HHU, apr29More90_Hospital_Total, apr29More90_Hospital_HHNC, apr29More90_Hospital_HHWC, apr29More90_Hospital_HHOC, apr29More90_Hospital_HHU, apr29More90_Jail_Total, apr29More90_Jail_HHNC, apr29More90_Jail_HHWC, apr29More90_Jail_HHOC, apr29More90_Jail_HHU, apr29More90_InstTotal_HHNC, apr29More90_InstTotal_HHWC, apr29More90_InstTotal_HHOC, apr29More90_InstTotal_Total, apr29More90_InstTotal_HHU, apr29More90_Dead_Total, apr29More90_Dead_HHNC, apr29More90_Dead_HHWC, apr29More90_Dead_HHOC, apr29More90_Dead_HHU, apr29More90_Other_Total, apr29More90_Other_HHNC, apr29More90_Other_HHWC, apr29More90_Other_HHOC, apr29More90_Other_HHU, apr29More90_DKR_Total, apr29More90_DKR_HHNC, apr29More90_DKR_HHWC, apr29More90_DKR_HHOC, apr29More90_DKR_HHU, apr29More90_Missing_Total, apr29More90_Missing_HHNC, apr29More90_Missing_HHWC, apr29More90_Missing_HHOC, apr29More90_Missing_HHU, apr29More90_OtherTotal_Total, apr29More90_OtherTotal_HHNC, apr29More90_OtherTotal_HHWC, apr29More90_OtherTotal_HHOC, apr29More90_OtherTotal_HHU, apr29More90_Total_Total, apr29More90_Total_HHNC, apr29More90_Total_HHWC, apr29More90_Total_HHOC, apr29More90_Total_HHU, apr29Less90_OwnedNoSubsidy_Total, apr29Less90_OwnedSubsidy_Total, apr29Less90_OwnedNoSubsidy_HHNC, apr29Less90_OwnedNoSubsidy_HHWC, apr29Less90_OwnedNoSubsidy_HHOC, apr29Less90_OwnedNoSubsidy_HHU, apr29Less90_OwnedSubsidy_HHNC, apr29Less90_OwnedSubsidy_HHWC, apr29Less90_OwnedSubsidy_HHOC, apr29Less90_OwnedSubsidy_HHU, apr29Less90_RentalNoSubsidy_Total, apr29Less90_RentalNoSubsidy_HHNC, apr29Less90_RentalNoSubsidy_HHWC, apr29Less90_RentalNoSubsidy_HHOC, apr29Less90_RentalNoSubsidy_HHU, apr29Less90_RentalVASHSubsidy_Total, apr29Less90_RentalVASHSubsidy_HHNC, apr29Less90_RentalVASHSubsidy_HHWC, apr29Less90_RentalVASHSubsidy_HHOC, apr29Less90_RentalVASHSubsidy_HHU, apr29Less90_RentalOtherSubsidy_Total, apr29Less90_RentalOtherSubsidy_HHNC, apr29Less90_RentalOtherSubsidy_HHWC, apr29Less90_RentalOtherSubsidy_HHOC, apr29Less90_RentalOtherSubsidy_HHU, apr29Less90_PSH_Total, apr29Less90_PSH_HHNC, apr29Less90_PSH_HHWC, apr29Less90_PSH_HHOC, apr29Less90_PSH_HHU, apr29Less90_PermFamily_Total, apr29Less90_PermFamily_HHNC, apr29Less90_PermFamily_HHWC, apr29Less90_PermFamily_HHOC, apr29Less90_PermFamily_HHU, apr29Less90_PermFriend_HHWC, apr29Less90_PermFriend_Total, apr29Less90_PermFriend_HHNC, apr29Less90_PermFriend_HHOC, apr29Less90_PermFriend_HHU, apr29Less90_PermTotal_Total, apr29Less90_PermTotal_HHWC, apr29Less90_PermTotal_HHNC, apr29Less90_PermTotal_HHOC, apr29Less90_PermTotal_HHU, apr29Less90_EShelter_HHNC, apr29Less90_EShelter_HHWC, apr29Less90_EShelter_HHOC, apr29Less90_EShelter_HHU, apr29Less90_TH_Total, apr29Less90_TH_HHNC, apr29Less90_TH_HHWC, apr29Less90_TH_HHOC, apr29Less90_TH_HHU, apr29Less90_TempFamily_Total, apr29Less90_TempFamily_HHNC, apr29Less90_TempFamily_HHWC, apr29Less90_TempFamily_HHOC, apr29Less90_TempFamily_HHU, apr29Less90_TempFriend_Total, apr29Less90_TempFriend_HHNC, apr29Less90_TempFriend_HHWC, apr29Less90_TempFriend_HHOC, apr29Less90_TempFriend_HHU, apr29Less90_NoHumanHabitation_Total, apr29Less90_NoHumanHabitation_HHNC, apr29Less90_NoHumanHabitation_HHWC, apr29Less90_NoHumanHabitation_HHOC, apr29Less90_NoHumanHabitation_HHU, apr29Less90_SH_Total, apr29Less90_SH_HHNC, apr29Less90_SH_HHWC, apr29Less90_SH_HHOC, apr29Less90_SH_HHU, apr29Less90_Hotel_Total, apr29Less90_Hotel_HHNC, apr29Less90_Hotel_HHWC, apr29Less90_Hotel_HHOC, apr29Less90_Hotel_HHU, apr29Less90_TempTotal_Total, apr29Less90_TempTotal_HHNC, apr29Less90_TempTotal_HHWC, apr29Less90_TempTotal_HHOC, apr29Less90_TempTotal_HHU, apr29Less90_Foster_Total, apr29Less90_Foster_HHNC, apr29Less90_Foster_HHWC, apr29Less90_Foster_HHOC, apr29Less90_Foster_HHU, apr29Less90_Psych_Total, apr29Less90_Psych_HHNC, apr29Less90_Psych_HHWC, apr29Less90_Psych_HHOC, apr29Less90_Psych_HHU, apr29Less90_Detox_Total, apr29Less90_Detox_HHNC, apr29Less90_Detox_HHWC, apr29Less90_Detox_HHOC, apr29Less90_Detox_HHU, apr29Less90_Hospital_Total, apr29Less90_Hospital_HHNC, apr29Less90_Hospital_HHWC, apr29Less90_Hospital_HHOC, apr29Less90_Hospital_HHU, apr29Less90_Jail_Total, apr29Less90_Jail_HHNC, apr29Less90_Jail_HHWC, apr29Less90_Jail_HHOC, apr29Less90_Jail_HHU, apr29Less90_InstTotal_Total, apr29Less90_InstTotal_HHNC, apr29Less90_InstTotal_HHWC, apr29Less90_InstTotal_HHOC, apr29Less90_InstTotal_HHU, apr29Less90_Dead_Total, apr29Less90_Dead_HHNC, apr29Less90_Dead_HHWC, apr29Less90_Dead_HHOC, apr29Less90_Dead_HHU, apr29Less90_Other_Total, apr29Less90_Other_HHNC, apr29Less90_Other_HHWC, apr29Less90_Other_HHOC, apr29Less90_Other_HHU, apr29Less90_DKR_Total, apr29Less90_DKR_HHNC, apr29Less90_DKR_HHWC, apr29Less90_DKR_HHOC, apr29Less90_DKR_HHU, apr29Less90_Missing_Total, apr29Less90_Missing_HHNC, apr29Less90_Missing_HHWC, apr29Less90_Missing_HHOC, apr29Less90_Missing_HHU, apr29Less90_OtherTotal_Total, apr29Less90_OtherTotal_HHNC, apr29Less90_OtherTotal_HHWC, apr29Less90_OtherTotal_HHOC, apr29Less90_OtherTotal_HHU, apr29Less90_Total_Total, apr29Less90_Total_HHNC, apr29Less90_Total_HHWC, apr29Less90_Total_HHOC, apr29Less90_Total_HHU">
  <cfelse>
    <cfset FORM.DataAPR29ID = newCheck.DataAPR29ID>

    <!--- Set Defaults --->    
    <cfif form.apr29Less90_EmergShelter_Total	 EQ "">	<cfset form.apr29Less90_EmergShelter_Total	 =0></cfif>
    <cfif form.apr29More90_OwnedNoSubsidy_Total	 EQ "">	<cfset form.apr29More90_OwnedNoSubsidy_Total	 =0></cfif>
    <cfif form.apr29More90_OwnedSubsidy_Total	 EQ "">	<cfset form.apr29More90_OwnedSubsidy_Total	 =0></cfif>
    <cfif form.apr29More90_RentalNoSubsidy_Total	 EQ "">	<cfset form.apr29More90_RentalNoSubsidy_Total	 =0></cfif>
    <cfif form.apr29More90_RentalVASHSubsidy_Total	 EQ "">	<cfset form.apr29More90_RentalVASHSubsidy_Total	 =0></cfif>
    <cfif form.apr29More90_PSH_Total	 EQ "">	<cfset form.apr29More90_PSH_Total	 =0></cfif>
    <cfif form.apr29More90_RentalOtherSubsidy_Total	 EQ "">	<cfset form.apr29More90_RentalOtherSubsidy_Total	 =0></cfif>
    <cfif form.apr29More90_PermFamily_Total	 EQ "">	<cfset form.apr29More90_PermFamily_Total	 =0></cfif>
    <cfif form.apr29More90_PermFriend_Total	 EQ "">	<cfset form.apr29More90_PermFriend_Total	 =0></cfif>
    <cfif form.apr29More90_PermTotal_Total	 EQ "">	<cfset form.apr29More90_PermTotal_Total	 =0></cfif>
    <cfif form.apr29More90_OwnedNoSubsidy_HHNC	 EQ "">	<cfset form.apr29More90_OwnedNoSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29More90_OwnedNoSubsidy_HHWC	 EQ "">	<cfset form.apr29More90_OwnedNoSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29More90_OwnedNoSubsidy_HHOC	 EQ "">	<cfset form.apr29More90_OwnedNoSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29More90_OwnedNoSubsidy_HHU	 EQ "">	<cfset form.apr29More90_OwnedNoSubsidy_HHU	 =0></cfif>
    <cfif form.apr29More90_OwnedSubsidy_HHNC	 EQ "">	<cfset form.apr29More90_OwnedSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29More90_OwnedSubsidy_HHWC	 EQ "">	<cfset form.apr29More90_OwnedSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29More90_OwnedSubsidy_HHOC	 EQ "">	<cfset form.apr29More90_OwnedSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29More90_OwnedSubsidy_HHU	 EQ "">	<cfset form.apr29More90_OwnedSubsidy_HHU	 =0></cfif>
    <cfif form.apr29More90_RentalNoSubsidy_HHNC	 EQ "">	<cfset form.apr29More90_RentalNoSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29More90_RentalNoSubsidy_HHWC	 EQ "">	<cfset form.apr29More90_RentalNoSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29More90_RentalNoSubsidy_HHOC	 EQ "">	<cfset form.apr29More90_RentalNoSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29More90_RentalNoSubsidy_HHU	 EQ "">	<cfset form.apr29More90_RentalNoSubsidy_HHU	 =0></cfif>
    <cfif form.apr29More90_RentalVASHSubsidy_HHNC	 EQ "">	<cfset form.apr29More90_RentalVASHSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29More90_RentalVASHSubsidy_HHWC	 EQ "">	<cfset form.apr29More90_RentalVASHSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29More90_RentalVASHSubsidy_HHOC	 EQ "">	<cfset form.apr29More90_RentalVASHSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29More90_RentalVASHSubsidy_HHU	 EQ "">	<cfset form.apr29More90_RentalVASHSubsidy_HHU	 =0></cfif>
    <cfif form.apr29More90_RentalOtherSubsidy_HHNC	 EQ "">	<cfset form.apr29More90_RentalOtherSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29More90_RentalOtherSubsidy_HHWC	 EQ "">	<cfset form.apr29More90_RentalOtherSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29More90_RentalOtherSubsidy_HHOC	 EQ "">	<cfset form.apr29More90_RentalOtherSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29More90_RentalOtherSubsidy_HHU	 EQ "">	<cfset form.apr29More90_RentalOtherSubsidy_HHU	 =0></cfif>
    <cfif form.apr29More90_PSH_HHU	 EQ "">	<cfset form.apr29More90_PSH_HHU	 =0></cfif>
    <cfif form.apr29More90_PSH_HHNC	 EQ "">	<cfset form.apr29More90_PSH_HHNC	 =0></cfif>
    <cfif form.apr29More90_PSH_HHWC	 EQ "">	<cfset form.apr29More90_PSH_HHWC	 =0></cfif>
    <cfif form.apr29More90_PSH_HHOC	 EQ "">	<cfset form.apr29More90_PSH_HHOC	 =0></cfif>
    <cfif form.apr29More90_PermFamily_HHNC	 EQ "">	<cfset form.apr29More90_PermFamily_HHNC	 =0></cfif>
    <cfif form.apr29More90_PermFamily_HHWC	 EQ "">	<cfset form.apr29More90_PermFamily_HHWC	 =0></cfif>
    <cfif form.apr29More90_PermFamily_HHOC	 EQ "">	<cfset form.apr29More90_PermFamily_HHOC	 =0></cfif>
    <cfif form.apr29More90_PermFamily_HHU	 EQ "">	<cfset form.apr29More90_PermFamily_HHU	 =0></cfif>
    <cfif form.apr29More90_PermFriend_HHNC	 EQ "">	<cfset form.apr29More90_PermFriend_HHNC	 =0></cfif>
    <cfif form.apr29More90_PermFriend_HHWC	 EQ "">	<cfset form.apr29More90_PermFriend_HHWC	 =0></cfif>
    <cfif form.apr29More90_PermFriend_HHOC	 EQ "">	<cfset form.apr29More90_PermFriend_HHOC	 =0></cfif>
    <cfif form.apr29More90_PermFriend_HHU	 EQ "">	<cfset form.apr29More90_PermFriend_HHU	 =0></cfif>
    <cfif form.apr29More90_PermTotal_HHNC	 EQ "">	<cfset form.apr29More90_PermTotal_HHNC	 =0></cfif>
    <cfif form.apr29More90_PermTotal_HHWC	 EQ "">	<cfset form.apr29More90_PermTotal_HHWC	 =0></cfif>
    <cfif form.apr29More90_PermTotal_HHOC	 EQ "">	<cfset form.apr29More90_PermTotal_HHOC	 =0></cfif>
    <cfif form.apr29More90_PermTotal_HHU	 EQ "">	<cfset form.apr29More90_PermTotal_HHU	 =0></cfif>
    <cfif form.apr29More90_EShelter_Total	 EQ "">	<cfset form.apr29More90_EShelter_Total	 =0></cfif>
    <cfif form.apr29More90_TH_Total	 EQ "">	<cfset form.apr29More90_TH_Total	 =0></cfif>
    <cfif form.apr29More90_TempFamily_Total	 EQ "">	<cfset form.apr29More90_TempFamily_Total	 =0></cfif>
    <cfif form.apr29More90_TempFriends_Total	 EQ "">	<cfset form.apr29More90_TempFriends_Total	 =0></cfif>
    <cfif form.apr29More90_NoHumanHabitation_Total	 EQ "">	<cfset form.apr29More90_NoHumanHabitation_Total	 =0></cfif>
    <cfif form.apr29More90_SH_Total	 EQ "">	<cfset form.apr29More90_SH_Total	 =0></cfif>
    <cfif form.apr29More90_Hotel_Total	 EQ "">	<cfset form.apr29More90_Hotel_Total	 =0></cfif>
    <cfif form.apr29More90_TempTotal_Total	 EQ "">	<cfset form.apr29More90_TempTotal_Total	 =0></cfif>
    <cfif form.apr29More90_EShelter_HHNC	 EQ "">	<cfset form.apr29More90_EShelter_HHNC	 =0></cfif>
    <cfif form.apr29More90_EShelter_HHWC	 EQ "">	<cfset form.apr29More90_EShelter_HHWC	 =0></cfif>
    <cfif form.apr29More90_EShelter_HHOC	 EQ "">	<cfset form.apr29More90_EShelter_HHOC	 =0></cfif>
    <cfif form.apr29More90_EShelter_HHU	 EQ "">	<cfset form.apr29More90_EShelter_HHU	 =0></cfif>
    <cfif form.apr29More90_TH_HHNC	 EQ "">	<cfset form.apr29More90_TH_HHNC	 =0></cfif>
    <cfif form.apr29More90_TH_HHWC	 EQ "">	<cfset form.apr29More90_TH_HHWC	 =0></cfif>
    <cfif form.apr29More90_TH_HHOC	 EQ "">	<cfset form.apr29More90_TH_HHOC	 =0></cfif>
    <cfif form.apr29More90_TH_HHU	 EQ "">	<cfset form.apr29More90_TH_HHU	 =0></cfif>
    <cfif form.apr29More90_TempFamily_HHWC	 EQ "">	<cfset form.apr29More90_TempFamily_HHWC	 =0></cfif>
    <cfif form.apr29More90_TempFamily_HHNC	 EQ "">	<cfset form.apr29More90_TempFamily_HHNC	 =0></cfif>
    <cfif form.apr29More90_TempFamily_HHOC	 EQ "">	<cfset form.apr29More90_TempFamily_HHOC	 =0></cfif>
    <cfif form.apr29More90_TempFamily_HHU	 EQ "">	<cfset form.apr29More90_TempFamily_HHU	 =0></cfif>
    <cfif form.apr29More90_TempFriends_HHWC	 EQ "">	<cfset form.apr29More90_TempFriends_HHWC	 =0></cfif>
    <cfif form.apr29More90_TempFriends_HHNC	 EQ "">	<cfset form.apr29More90_TempFriends_HHNC	 =0></cfif>
    <cfif form.apr29More90_TempFriends_HHOC	 EQ "">	<cfset form.apr29More90_TempFriends_HHOC	 =0></cfif>
    <cfif form.apr29More90_TempFriends_HHU	 EQ "">	<cfset form.apr29More90_TempFriends_HHU	 =0></cfif>
    <cfif form.apr29More90_NoHumanHabitation_HHNC	 EQ "">	<cfset form.apr29More90_NoHmanHabitation_HHNC	 =0></cfif>
    <cfif form.apr29More90_NoHumanHabitation_HHWC	 EQ "">	<cfset form.apr29More90_NoHumanHabitation_HHWC	 =0></cfif>
    <cfif form.apr29More90_NoHumanHabitation_HHOC	 EQ "">	<cfset form.apr29More90_NoHumanHabitation_HHOC	 =0></cfif>
    <cfif form.apr29More90_NoHumanHabitation_HHU	 EQ "">	<cfset form.apr29More90_NoHumanHabitation_HHU	 =0></cfif>
    <cfif form.apr29More90_SH_HHNC	 EQ "">	<cfset form.apr29More90_SH_HHNC	 =0></cfif>
    <cfif form.apr29More90_SH_HHWC	 EQ "">	<cfset form.apr29More90_SH_HHWC	 =0></cfif>
    <cfif form.apr29More90_SH_HHOC	 EQ "">	<cfset form.apr29More90_SH_HHOC	 =0></cfif>
    <cfif form.apr29More90_SH_HHU	 EQ "">	<cfset form.apr29More90_SH_HHU	 =0></cfif>
    <cfif form.apr29More90_Hotel_HHNC	 EQ "">	<cfset form.apr29More90_Hotel_HHNC	 =0></cfif>
    <cfif form.apr29More90_Hotel_HHWC	 EQ "">	<cfset form.apr29More90_Hotel_HHWC	 =0></cfif>
    <cfif form.apr29More90_Hotel_HHOC	 EQ "">	<cfset form.apr29More90_Hotel_HHOC	 =0></cfif>
    <cfif form.apr29More90_Hotel_HHU	 EQ "">	<cfset form.apr29More90_Hotel_HHU	 =0></cfif>
    <cfif form.apr29More90_TempTotal_HHWC	 EQ "">	<cfset form.apr29More90_TempTotal_HHWC	 =0></cfif>
    <cfif form.apr29More90_TempTotal_HHNC	 EQ "">	<cfset form.apr29More90_TempTotal_HHNC	 =0></cfif>
    <cfif form.apr29More90_TempTotal_HHOC	 EQ "">	<cfset form.apr29More90_TempTotal_HHOC	 =0></cfif>
    <cfif form.apr29More90_TempTotal_HHU	 EQ "">	<cfset form.apr29More90_TempTotal_HHU	 =0></cfif>
    <cfif form.apr29More90_Foster_Total	 EQ "">	<cfset form.apr29More90_Foster_Total	 =0></cfif>
    <cfif form.apr29More90_Foster_HHNC	 EQ "">	<cfset form.apr29More90_Foster_HHNC	 =0></cfif>
    <cfif form.apr29More90_Foster_HHWC	 EQ "">	<cfset form.apr29More90_Foster_HHWC	 =0></cfif>
    <cfif form.apr29More90_Foster_HHOC	 EQ "">	<cfset form.apr29More90_Foster_HHOC	 =0></cfif>
    <cfif form.apr29More90_Foster_HHU	 EQ "">	<cfset form.apr29More90_Foster_HHU	 =0></cfif>
    <cfif form.apr29More90_Psych_Total	 EQ "">	<cfset form.apr29More90_Psych_Total	 =0></cfif>
    <cfif form.apr29More90_Psych_HHNC	 EQ "">	<cfset form.apr29More90_Psych_HHNC	 =0></cfif>
    <cfif form.apr29More90_Psych_HHWC	 EQ "">	<cfset form.apr29More90_Psych_HHWC	 =0></cfif>
    <cfif form.apr29More90_Psych_HHOC	 EQ "">	<cfset form.apr29More90_Psych_HHOC	 =0></cfif>
    <cfif form.apr29More90_Psych_HHU	 EQ "">	<cfset form.apr29More90_Psych_HHU	 =0></cfif>
    <cfif form.apr29More90_Detox_Total	 EQ "">	<cfset form.apr29More90_Detox_Total	 =0></cfif>
    <cfif form.apr29More90_Detox_HHNC	 EQ "">	<cfset form.apr29More90_Detox_HHNC	 =0></cfif>
    <cfif form.apr29More90_Detox_HHWC	 EQ "">	<cfset form.apr29More90_Detox_HHWC	 =0></cfif>
    <cfif form.apr29More90_Detox_HHOC	 EQ "">	<cfset form.apr29More90_Detox_HHOC	 =0></cfif>
    <cfif form.apr29More90_Detox_HHU	 EQ "">	<cfset form.apr29More90_Detox_HHU	 =0></cfif>
    <cfif form.apr29More90_Hospital_Total	 EQ "">	<cfset form.apr29More90_Hospital_Total	 =0></cfif>
    <cfif form.apr29More90_Hospital_HHNC	 EQ "">	<cfset form.apr29More90_Hospital_HHNC	 =0></cfif>
    <cfif form.apr29More90_Hospital_HHWC	 EQ "">	<cfset form.apr29More90_Hospital_HHWC	 =0></cfif>
    <cfif form.apr29More90_Hospital_HHOC	 EQ "">	<cfset form.apr29More90_Hospital_HHOC	 =0></cfif>
    <cfif form.apr29More90_Hospital_HHU	 EQ "">	<cfset form.apr29More90_Hospital_HHU	 =0></cfif>
    <cfif form.apr29More90_Jail_Total	 EQ "">	<cfset form.apr29More90_Jail_Total	 =0></cfif>
    <cfif form.apr29More90_Jail_HHNC	 EQ "">	<cfset form.apr29More90_Jail_HHNC	 =0></cfif>
    <cfif form.apr29More90_Jail_HHWC	 EQ "">	<cfset form.apr29More90_Jail_HHWC	 =0></cfif>
    <cfif form.apr29More90_Jail_HHOC	 EQ "">	<cfset form.apr29More90_Jail_HHOC	 =0></cfif>
    <cfif form.apr29More90_Jail_HHU	 EQ "">	<cfset form.apr29More90_Jail_HHU	 =0></cfif>
    <cfif form.apr29More90_InstTotal_HHNC	 EQ "">	<cfset form.apr29More90_InstTotal_HHNC	 =0></cfif>
    <cfif form.apr29More90_InstTotal_HHWC	 EQ "">	<cfset form.apr29More90_InstTotal_HHWC	 =0></cfif>
    <cfif form.apr29More90_InstTotal_HHOC	 EQ "">	<cfset form.apr29More90_InstTotal_HHOC	 =0></cfif>
    <cfif form.apr29More90_InstTotal_Total	 EQ "">	<cfset form.apr29More90_InstTotal_Total	 =0></cfif>
    <cfif form.apr29More90_InstTotal_HHU	 EQ "">	<cfset form.apr29More90_InstTotal_HHU	 =0></cfif>
    <cfif form.apr29More90_Dead_Total	 EQ "">	<cfset form.apr29More90_Dead_Total	 =0></cfif>
    <cfif form.apr29More90_Dead_HHNC	 EQ "">	<cfset form.apr29More90_Dead_HHNC	 =0></cfif>
    <cfif form.apr29More90_Dead_HHWC	 EQ "">	<cfset form.apr29More90_Dead_HHWC	 =0></cfif>
    <cfif form.apr29More90_Dead_HHOC	 EQ "">	<cfset form.apr29More90_Dead_HHOC	 =0></cfif>
    <cfif form.apr29More90_Dead_HHU	 EQ "">	<cfset form.apr29More90_Dead_HHU	 =0></cfif>
    <cfif form.apr29More90_Other_Total	 EQ "">	<cfset form.apr29More90_Other_Total	 =0></cfif>
    <cfif form.apr29More90_Other_HHNC	 EQ "">	<cfset form.apr29More90_Other_HHNC	 =0></cfif>
    <cfif form.apr29More90_Other_HHWC	 EQ "">	<cfset form.apr29More90_Other_HHWC	 =0></cfif>
    <cfif form.apr29More90_Other_HHOC	 EQ "">	<cfset form.apr29More90_Other_HHOC	 =0></cfif>
    <cfif form.apr29More90_Other_HHU	 EQ "">	<cfset form.apr29More90_Other_HHU	 =0></cfif>
    <cfif form.apr29More90_DKR_Total	 EQ "">	<cfset form.apr29More90_DKR_Total	 =0></cfif>
    <cfif form.apr29More90_DKR_HHNC	 EQ "">	<cfset form.apr29More90_DKR_HHNC	 =0></cfif>
    <cfif form.apr29More90_DKR_HHWC	 EQ "">	<cfset form.apr29More90_DKR_HHWC	 =0></cfif>
    <cfif form.apr29More90_DKR_HHOC	 EQ "">	<cfset form.apr29More90_DKR_HHOC	 =0></cfif>
    <cfif form.apr29More90_DKR_HHU	 EQ "">	<cfset form.apr29More90_DKR_HHU	 =0></cfif>
    <cfif form.apr29More90_Missing_Total	 EQ "">	<cfset form.apr29More90_Missing_Total	 =0></cfif>
    <cfif form.apr29More90_Missing_HHNC	 EQ "">	<cfset form.apr29More90_Missing_HHNC	 =0></cfif>
    <cfif form.apr29More90_Missing_HHWC	 EQ "">	<cfset form.apr29More90_Missing_HHWC	 =0></cfif>
    <cfif form.apr29More90_Missing_HHOC	 EQ "">	<cfset form.apr29More90_Missing_HHOC	 =0></cfif>
    <cfif form.apr29More90_Missing_HHU	 EQ "">	<cfset form.apr29More90_Missing_HHU	 =0></cfif>
    <cfif form.apr29More90_OtherTotal_Total	 EQ "">	<cfset form.apr29More90_OtherTotal_Total	 =0></cfif>
    <cfif form.apr29More90_OtherTotal_HHNC	 EQ "">	<cfset form.apr29More90_OtherTotal_HHNC	 =0></cfif>
    <cfif form.apr29More90_OtherTotal_HHWC	 EQ "">	<cfset form.apr29More90_OtherTotal_HHWC	 =0></cfif>
    <cfif form.apr29More90_OtherTotal_HHOC	 EQ "">	<cfset form.apr29More90_OtherTotal_HHOC	 =0></cfif>
    <cfif form.apr29More90_OtherTotal_HHU	 EQ "">	<cfset form.apr29More90_OtherTotal_HHU	 =0></cfif>
    <cfif form.apr29More90_Total_Total	 EQ "">	<cfset form.apr29More90_Total_Total	 =0></cfif>
    <cfif form.apr29More90_Total_HHNC	 EQ "">	<cfset form.apr29More90_Total_HHNC	 =0></cfif>
    <cfif form.apr29More90_Total_HHWC	 EQ "">	<cfset form.apr29More90_Total_HHWC	 =0></cfif>
    <cfif form.apr29More90_Total_HHOC	 EQ "">	<cfset form.apr29More90_Total_HHOC	 =0></cfif>
    <cfif form.apr29More90_Total_HHU	 EQ "">	<cfset form.apr29More90_Total_HHU	 =0></cfif>
    <cfif form.apr29Less90_OwnedNoSubsidy_Total	 EQ "">	<cfset form.apr29Less90_OwnedNoSubsidy_Total	 =0></cfif>
    <cfif form.apr29Less90_OwnedSubsidy_Total	 EQ "">	<cfset form.apr29Less90_OwnedSubsidy_Total	 =0></cfif>
    <cfif form.apr29Less90_OwnedNoSubsidy_HHNC	 EQ "">	<cfset form.apr29Less90_OwnedNoSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29Less90_OwnedNoSubsidy_HHWC	 EQ "">	<cfset form.apr29Less90_OwnedNoSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29Less90_OwnedNoSubsidy_HHOC	 EQ "">	<cfset form.apr29Less90_OwnedNoSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29Less90_OwnedNoSubsidy_HHU	 EQ "">	<cfset form.apr29Less90_OwnedNoSubsidy_HHU	 =0></cfif>
    <cfif form.apr29Less90_OwnedSubsidy_HHNC	 EQ "">	<cfset form.apr29Less90_OwnedSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29Less90_OwnedSubsidy_HHWC	 EQ "">	<cfset form.apr29Less90_OwnedSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29Less90_OwnedSubsidy_HHOC	 EQ "">	<cfset form.apr29Less90_OwnedSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29Less90_OwnedSubsidy_HHU	 EQ "">	<cfset form.apr29Less90_OwnedSubsidy_HHU	 =0></cfif>
    <cfif form.apr29Less90_RentalNoSubsidy_Total	 EQ "">	<cfset form.apr29Less90_RentalNoSubsidy_Total	 =0></cfif>
    <cfif form.apr29Less90_RentalNoSubsidy_HHNC	 EQ "">	<cfset form.apr29Less90_RentalNoSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29Less90_RentalNoSubsidy_HHWC	 EQ "">	<cfset form.apr29Less90_RentalNoSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29Less90_RentalNoSubsidy_HHOC	 EQ "">	<cfset form.apr29Less90_RentalNoSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29Less90_RentalNoSubsidy_HHU	 EQ "">	<cfset form.apr29Less90_RentalNoSubsidy_HHU	 =0></cfif>
    <cfif form.apr29Less90_RentalVASHSubsidy_Total	 EQ "">	<cfset form.apr29Less90_RentalVASHSubsidy_Total	 =0></cfif>
    <cfif form.apr29Less90_RentalVASHSubsidy_HHNC	 EQ "">	<cfset form.apr29Less90_RentalVASHSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29Less90_RentalVASHSubsidy_HHWC	 EQ "">	<cfset form.apr29Less90_RentalVASHSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29Less90_RentalVASHSubsidy_HHOC	 EQ "">	<cfset form.apr29Less90_RentalVASHSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29Less90_RentalVASHSubsidy_HHU	 EQ "">	<cfset form.apr29Less90_RentalVASHSubsidy_HHU	 =0></cfif>
    <cfif form.apr29Less90_RentalOtherSubsidy_Total	 EQ "">	<cfset form.apr29Less90_RentalOtherSubsidy_Total	 =0></cfif>
    <cfif form.apr29Less90_RentalOtherSubsidy_HHNC	 EQ "">	<cfset form.apr29Less90_RentalOtherSubsidy_HHNC	 =0></cfif>
    <cfif form.apr29Less90_RentalOtherSubsidy_HHWC	 EQ "">	<cfset form.apr29Less90_RentalOtherSubsidy_HHWC	 =0></cfif>
    <cfif form.apr29Less90_RentalOtherSubsidy_HHOC	 EQ "">	<cfset form.apr29Less90_RentalOtherSubsidy_HHOC	 =0></cfif>
    <cfif form.apr29Less90_RentalOtherSubsidy_HHU	 EQ "">	<cfset form.apr29Less90_RentalOtherSubsidy_HHU	 =0></cfif>
    <cfif form.apr29Less90_PSH_Total	 EQ "">	<cfset form.apr29Less90_PSH_Total	 =0></cfif>
    <cfif form.apr29Less90_PSH_HHNC	 EQ "">	<cfset form.apr29Less90_PSH_HHNC	 =0></cfif>
    <cfif form.apr29Less90_PSH_HHWC	 EQ "">	<cfset form.apr29Less90_PSH_HHWC	 =0></cfif>
    <cfif form.apr29Less90_PSH_HHOC	 EQ "">	<cfset form.apr29Less90_PSH_HHOC	 =0></cfif>
    <cfif form.apr29Less90_PSH_HHU	 EQ "">	<cfset form.apr29Less90_PSH_HHU	 =0></cfif>
    <cfif form.apr29Less90_PermFamily_Total	 EQ "">	<cfset form.apr29Less90_PermFamily_Total	 =0></cfif>
    <cfif form.apr29Less90_PermFamily_HHNC	 EQ "">	<cfset form.apr29Less90_PermFamily_HHNC	 =0></cfif>
    <cfif form.apr29Less90_PermFamily_HHWC	 EQ "">	<cfset form.apr29Less90_PermFamily_HHWC	 =0></cfif>
    <cfif form.apr29Less90_PermFamily_HHOC	 EQ "">	<cfset form.apr29Less90_PermFamily_HHOC	 =0></cfif>
    <cfif form.apr29Less90_PermFamily_HHU	 EQ "">	<cfset form.apr29Less90_PermFamily_HHU	 =0></cfif>
    <cfif form.apr29Less90_PermFriend_HHWC	 EQ "">	<cfset form.apr29Less90_PermFriend_HHWC	 =0></cfif>
    <cfif form.apr29Less90_PermFriend_Total	 EQ "">	<cfset form.apr29Less90_PermFriend_Total	 =0></cfif>
    <cfif form.apr29Less90_PermFriend_HHNC	 EQ "">	<cfset form.apr29Less90_PermFriend_HHNC	 =0></cfif>
    <cfif form.apr29Less90_PermFriend_HHOC	 EQ "">	<cfset form.apr29Less90_PermFriend_HHOC	 =0></cfif>
    <cfif form.apr29Less90_PermFriend_HHU	 EQ "">	<cfset form.apr29Less90_PermFriend_HHU	 =0></cfif>
    <cfif form.apr29Less90_PermTotal_Total	 EQ "">	<cfset form.apr29Less90_PermTotal_Total	 =0></cfif>
    <cfif form.apr29Less90_PermTotal_HHWC	 EQ "">	<cfset form.apr29Less90_PermTotal_HHWC	 =0></cfif>
    <cfif form.apr29Less90_PermTotal_HHNC	 EQ "">	<cfset form.apr29Less90_PermTotal_HHNC	 =0></cfif>
    <cfif form.apr29Less90_PermTotal_HHOC	 EQ "">	<cfset form.apr29Less90_PermTotal_HHOC	 =0></cfif>
    <cfif form.apr29Less90_PermTotal_HHU	 EQ "">	<cfset form.apr29Less90_PermTotal_HHU	 =0></cfif>
    <cfif form.apr29Less90_EShelter_HHNC	 EQ "">	<cfset form.apr29Less90_EShelter_HHNC	 =0></cfif>
    <cfif form.apr29Less90_EShelter_HHWC	 EQ "">	<cfset form.apr29Less90_EShelter_HHWC	 =0></cfif>
    <cfif form.apr29Less90_EShelter_HHOC	 EQ "">	<cfset form.apr29Less90_EShelter_HHOC	 =0></cfif>
    <cfif form.apr29Less90_EShelter_HHU	 EQ "">	<cfset form.apr29Less90_EShelter_HHU	 =0></cfif>
    <cfif form.apr29Less90_TH_Total	 EQ "">	<cfset form.apr29Less90_TH_Total	 =0></cfif>
    <cfif form.apr29Less90_TH_HHNC	 EQ "">	<cfset form.apr29Less90_TH_HHNC	 =0></cfif>
    <cfif form.apr29Less90_TH_HHWC	 EQ "">	<cfset form.apr29Less90_TH_HHWC	 =0></cfif>
    <cfif form.apr29Less90_TH_HHOC	 EQ "">	<cfset form.apr29Less90_TH_HHOC	 =0></cfif>
    <cfif form.apr29Less90_TH_HHU	 EQ "">	<cfset form.apr29Less90_TH_HHU	 =0></cfif>
    <cfif form.apr29Less90_TempFamily_Total	 EQ "">	<cfset form.apr29Less90_TempFamily_Total	 =0></cfif>
    <cfif form.apr29Less90_TempFamily_HHNC	 EQ "">	<cfset form.apr29Less90_TempFamily_HHNC	 =0></cfif>
    <cfif form.apr29Less90_TempFamily_HHWC	 EQ "">	<cfset form.apr29Less90_TempFamily_HHWC	 =0></cfif>
    <cfif form.apr29Less90_TempFamily_HHOC	 EQ "">	<cfset form.apr29Less90_TempFamily_HHOC	 =0></cfif>
    <cfif form.apr29Less90_TempFamily_HHU	 EQ "">	<cfset form.apr29Less90_TempFamily_HHU	 =0></cfif>
    <cfif form.apr29Less90_TempFriend_Total	 EQ "">	<cfset form.apr29Less90_TempFriend_Total	 =0></cfif>
    <cfif form.apr29Less90_TempFriend_HHNC	 EQ "">	<cfset form.apr29Less90_TempFriend_HHNC	 =0></cfif>
    <cfif form.apr29Less90_TempFriend_HHWC	 EQ "">	<cfset form.apr29Less90_TempFriend_HHWC	 =0></cfif>
    <cfif form.apr29Less90_TempFriend_HHOC	 EQ "">	<cfset form.apr29Less90_TempFriend_HHOC	 =0></cfif>
    <cfif form.apr29Less90_TempFriend_HHU	 EQ "">	<cfset form.apr29Less90_TempFriend_HHU	 =0></cfif>
    <cfif form.apr29Less90_NoHumanHabitation_Total	 EQ "">	<cfset form.apr29Less90_NoHumanHabitation_Total	 =0></cfif>
    <cfif form.apr29Less90_NoHumanHabitation_HHNC	 EQ "">	<cfset form.apr29Less90_NoHumanHabitation_HHNC	 =0></cfif>
    <cfif form.apr29Less90_NoHumanHabitation_HHWC	 EQ "">	<cfset form.apr29Less90_NoHumanHabitation_HHWC	 =0></cfif>
    <cfif form.apr29Less90_NoHumanHabitation_HHOC	 EQ "">	<cfset form.apr29Less90_NoHumanHabitation_HHOC	 =0></cfif>
    <cfif form.apr29Less90_NoHumanHabitation_HHU	 EQ "">	<cfset form.apr29Less90_NoHumanHabitation_HHU	 =0></cfif>
    <cfif form.apr29Less90_SH_Total	 EQ "">	<cfset form.apr29Less90_SH_Total	 =0></cfif>
    <cfif form.apr29Less90_SH_HHNC	 EQ "">	<cfset form.apr29Less90_SH_HHNC	 =0></cfif>
    <cfif form.apr29Less90_SH_HHWC	 EQ "">	<cfset form.apr29Less90_SH_HHWC	 =0></cfif>
    <cfif form.apr29Less90_SH_HHOC	 EQ "">	<cfset form.apr29Less90_SH_HHOC	 =0></cfif>
    <cfif form.apr29Less90_SH_HHU	 EQ "">	<cfset form.apr29Less90_SH_HHU	 =0></cfif>
    <cfif form.apr29Less90_Hotel_Total	 EQ "">	<cfset form.apr29Less90_Hotel_Total	 =0></cfif>
    <cfif form.apr29Less90_Hotel_HHNC	 EQ "">	<cfset form.apr29Less90_Hotel_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Hotel_HHWC	 EQ "">	<cfset form.apr29Less90_Hotel_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Hotel_HHOC	 EQ "">	<cfset form.apr29Less90_Hotel_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Hotel_HHU	 EQ "">	<cfset form.apr29Less90_Hotel_HHU	 =0></cfif>
    <cfif form.apr29Less90_TempTotal_Total	 EQ "">	<cfset form.apr29Less90_TempTotal_Total	 =0></cfif>
    <cfif form.apr29Less90_TempTotal_HHNC	 EQ "">	<cfset form.apr29Less90_TempTotal_HHNC	 =0></cfif>
    <cfif form.apr29Less90_TempTotal_HHWC	 EQ "">	<cfset form.apr29Less90_TempTotal_HHWC	 =0></cfif>
    <cfif form.apr29Less90_TempTotal_HHOC	 EQ "">	<cfset form.apr29Less90_TempTotal_HHOC	 =0></cfif>
    <cfif form.apr29Less90_TempTotal_HHU	 EQ "">	<cfset form.apr29Less90_TempTotal_HHU	 =0></cfif>
    <cfif form.apr29Less90_Foster_Total	 EQ "">	<cfset form.apr29Less90_Foster_Total	 =0></cfif>
    <cfif form.apr29Less90_Foster_HHNC	 EQ "">	<cfset form.apr29Less90_Foster_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Foster_HHWC	 EQ "">	<cfset form.apr29Less90_Foster_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Foster_HHOC	 EQ "">	<cfset form.apr29Less90_Foster_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Foster_HHU	 EQ "">	<cfset form.apr29Less90_Foster_HHU	 =0></cfif>
    <cfif form.apr29Less90_Psych_Total	 EQ "">	<cfset form.apr29Less90_Psych_Total	 =0></cfif>
    <cfif form.apr29Less90_Psych_HHNC	 EQ "">	<cfset form.apr29Less90_Psych_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Psych_HHWC	 EQ "">	<cfset form.apr29Less90_Psych_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Psych_HHOC	 EQ "">	<cfset form.apr29Less90_Psych_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Psych_HHU	 EQ "">	<cfset form.apr29Less90_Psych_HHU	 =0></cfif>
    <cfif form.apr29Less90_Detox_Total	 EQ "">	<cfset form.apr29Less90_Detox_Total	 =0></cfif>
    <cfif form.apr29Less90_Detox_HHNC	 EQ "">	<cfset form.apr29Less90_Detox_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Detox_HHWC	 EQ "">	<cfset form.apr29Less90_Detox_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Detox_HHOC	 EQ "">	<cfset form.apr29Less90_Detox_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Detox_HHU	 EQ "">	<cfset form.apr29Less90_Detox_HHU	 =0></cfif>
    <cfif form.apr29Less90_Hospital_Total	 EQ "">	<cfset form.apr29Less90_Hospital_Total	 =0></cfif>
    <cfif form.apr29Less90_Hospital_HHNC	 EQ "">	<cfset form.apr29Less90_Hospital_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Hospital_HHWC	 EQ "">	<cfset form.apr29Less90_Hospital_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Hospital_HHOC	 EQ "">	<cfset form.apr29Less90_Hospital_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Hospital_HHU	 EQ "">	<cfset form.apr29Less90_Hospital_HHU	 =0></cfif>
    <cfif form.apr29Less90_Jail_Total	 EQ "">	<cfset form.apr29Less90_Jail_Total	 =0></cfif>
    <cfif form.apr29Less90_Jail_HHNC	 EQ "">	<cfset form.apr29Less90_Jail_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Jail_HHWC	 EQ "">	<cfset form.apr29Less90_Jail_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Jail_HHOC	 EQ "">	<cfset form.apr29Less90_Jail_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Jail_HHU	 EQ "">	<cfset form.apr29Less90_Jail_HHU	 =0></cfif>
    <cfif form.apr29Less90_InstTotal_Total	 EQ "">	<cfset form.apr29Less90_InstTotal_Total	 =0></cfif>
    <cfif form.apr29Less90_InstTotal_HHNC	 EQ "">	<cfset form.apr29Less90_InstTotal_HHNC	 =0></cfif>
    <cfif form.apr29Less90_InstTotal_HHWC	 EQ "">	<cfset form.apr29Less90_InstTotal_HHWC	 =0></cfif>
    <cfif form.apr29Less90_InstTotal_HHOC	 EQ "">	<cfset form.apr29Less90_InstTotal_HHOC	 =0></cfif>
    <cfif form.apr29Less90_InstTotal_HHU	 EQ "">	<cfset form.apr29Less90_InstTotal_HHU	 =0></cfif>
    <cfif form.apr29Less90_Dead_Total	 EQ "">	<cfset form.apr29Less90_Dead_Total	 =0></cfif>
    <cfif form.apr29Less90_Dead_HHNC	 EQ "">	<cfset form.apr29Less90_Dead_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Dead_HHWC	 EQ "">	<cfset form.apr29Less90_Dead_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Dead_HHOC	 EQ "">	<cfset form.apr29Less90_Dead_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Dead_HHU	 EQ "">	<cfset form.apr29Less90_Dead_HHU	 =0></cfif>
    <cfif form.apr29Less90_Other_Total	 EQ "">	<cfset form.apr29Less90_Other_Total	 =0></cfif>
    <cfif form.apr29Less90_Other_HHNC	 EQ "">	<cfset form.apr29Less90_Other_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Other_HHWC	 EQ "">	<cfset form.apr29Less90_Other_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Other_HHOC	 EQ "">	<cfset form.apr29Less90_Other_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Other_HHU	 EQ "">	<cfset form.apr29Less90_Other_HHU	 =0></cfif>
    <cfif form.apr29Less90_DKR_Total	 EQ "">	<cfset form.apr29Less90_DKR_Total	 =0></cfif>
    <cfif form.apr29Less90_DKR_HHNC	 EQ "">	<cfset form.apr29Less90_DKR_HHNC	 =0></cfif>
    <cfif form.apr29Less90_DKR_HHWC	 EQ "">	<cfset form.apr29Less90_DKR_HHWC	 =0></cfif>
    <cfif form.apr29Less90_DKR_HHOC	 EQ "">	<cfset form.apr29Less90_DKR_HHOC	 =0></cfif>
    <cfif form.apr29Less90_DKR_HHU	 EQ "">	<cfset form.apr29Less90_DKR_HHU	 =0></cfif>
    <cfif form.apr29Less90_Missing_Total	 EQ "">	<cfset form.apr29Less90_Missing_Total	 =0></cfif>
    <cfif form.apr29Less90_Missing_HHNC	 EQ "">	<cfset form.apr29Less90_Missing_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Missing_HHWC	 EQ "">	<cfset form.apr29Less90_Missing_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Missing_HHOC	 EQ "">	<cfset form.apr29Less90_Missing_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Missing_HHU	 EQ "">	<cfset form.apr29Less90_Missing_HHU	 =0></cfif>
    <cfif form.apr29Less90_OtherTotal_Total	 EQ "">	<cfset form.apr29Less90_OtherTotal_Total	 =0></cfif>
    <cfif form.apr29Less90_OtherTotal_HHNC	 EQ "">	<cfset form.apr29Less90_OtherTotal_HHNC	 =0></cfif>
    <cfif form.apr29Less90_OtherTotal_HHWC	 EQ "">	<cfset form.apr29Less90_OtherTotal_HHWC	 =0></cfif>
    <cfif form.apr29Less90_OtherTotal_HHOC	 EQ "">	<cfset form.apr29Less90_OtherTotal_HHOC	 =0></cfif>
    <cfif form.apr29Less90_OtherTotal_HHU	 EQ "">	<cfset form.apr29Less90_OtherTotal_HHU	 =0></cfif>
    <cfif form.apr29Less90_Total_Total	 EQ "">	<cfset form.apr29Less90_Total_Total	 =0></cfif>
    <cfif form.apr29Less90_Total_HHNC	 EQ "">	<cfset form.apr29Less90_Total_HHNC	 =0></cfif>
    <cfif form.apr29Less90_Total_HHWC	 EQ "">	<cfset form.apr29Less90_Total_HHWC	 =0></cfif>
    <cfif form.apr29Less90_Total_HHOC	 EQ "">	<cfset form.apr29Less90_Total_HHOC	 =0></cfif>
    <cfif form.apr29Less90_Total_HHU	 EQ "">	<cfset form.apr29Less90_Total_HHU	 =0></cfif>        
    <!---/ Set Defaults --->
        
    <cfupdate datasource="#DataSource#" tablename="dataapr29" formfields="DataAPR29ID, aprID, inputUserID, projectID, reviewUserID, apr29Less90_EmergShelter_Total, apr29More90_OwnedNoSubsidy_Total, apr29More90_OwnedSubsidy_Total, apr29More90_RentalNoSubsidy_Total, apr29More90_RentalVASHSubsidy_Total, apr29More90_PSH_Total, apr29More90_RentalOtherSubsidy_Total, apr29More90_PermFamily_Total, apr29More90_PermFriend_Total, apr29More90_PermTotal_Total, apr29More90_OwnedNoSubsidy_HHNC, apr29More90_OwnedNoSubsidy_HHWC, apr29More90_OwnedNoSubsidy_HHOC, apr29More90_OwnedNoSubsidy_HHU, apr29More90_OwnedSubsidy_HHNC, apr29More90_OwnedSubsidy_HHWC, apr29More90_OwnedSubsidy_HHOC, apr29More90_OwnedSubsidy_HHU, apr29More90_RentalNoSubsidy_HHNC, apr29More90_RentalNoSubsidy_HHWC, apr29More90_RentalNoSubsidy_HHOC, apr29More90_RentalNoSubsidy_HHU, apr29More90_RentalVASHSubsidy_HHNC, apr29More90_RentalVASHSubsidy_HHWC, apr29More90_RentalVASHSubsidy_HHOC, apr29More90_RentalVASHSubsidy_HHU, apr29More90_RentalOtherSubsidy_HHNC, apr29More90_RentalOtherSubsidy_HHWC, apr29More90_RentalOtherSubsidy_HHOC, apr29More90_RentalOtherSubsidy_HHU, apr29More90_PSH_HHU, apr29More90_PSH_HHNC, apr29More90_PSH_HHWC, apr29More90_PSH_HHOC, apr29More90_PermFamily_HHNC, apr29More90_PermFamily_HHWC, apr29More90_PermFamily_HHOC, apr29More90_PermFamily_HHU, apr29More90_PermFriend_HHNC, apr29More90_PermFriend_HHWC, apr29More90_PermFriend_HHOC, apr29More90_PermFriend_HHU, apr29More90_PermTotal_HHNC, apr29More90_PermTotal_HHWC, apr29More90_PermTotal_HHOC, apr29More90_PermTotal_HHU, apr29More90_EShelter_Total, apr29More90_TH_Total, apr29More90_TempFamily_Total, apr29More90_TempFriends_Total, apr29More90_NoHumanHabitation_Total, apr29More90_SH_Total, apr29More90_Hotel_Total, apr29More90_TempTotal_Total, apr29More90_EShelter_HHNC, apr29More90_EShelter_HHWC, apr29More90_EShelter_HHOC, apr29More90_EShelter_HHU, apr29More90_TH_HHNC, apr29More90_TH_HHWC, apr29More90_TH_HHOC, apr29More90_TH_HHU, apr29More90_TempFamily_HHWC, apr29More90_TempFamily_HHNC, apr29More90_TempFamily_HHOC, apr29More90_TempFamily_HHU, apr29More90_TempFriends_HHWC, apr29More90_TempFriends_HHNC, apr29More90_TempFriends_HHOC, apr29More90_TempFriends_HHU, apr29More90_NoHumanHabitation_HHNC, apr29More90_NoHumanHabitation_HHWC, apr29More90_NoHumanHabitation_HHOC, apr29More90_NoHumanHabitation_HHU, apr29More90_SH_HHNC, apr29More90_SH_HHWC, apr29More90_SH_HHOC, apr29More90_SH_HHU, apr29More90_Hotel_HHNC, apr29More90_Hotel_HHWC, apr29More90_Hotel_HHOC, apr29More90_Hotel_HHU, apr29More90_TempTotal_HHWC, apr29More90_TempTotal_HHNC, apr29More90_TempTotal_HHOC, apr29More90_TempTotal_HHU, apr29More90_Foster_Total, apr29More90_Foster_HHNC, apr29More90_Foster_HHWC, apr29More90_Foster_HHOC, apr29More90_Foster_HHU, apr29More90_Psych_Total, apr29More90_Psych_HHNC, apr29More90_Psych_HHWC, apr29More90_Psych_HHOC, apr29More90_Psych_HHU, apr29More90_Detox_Total, apr29More90_Detox_HHNC, apr29More90_Detox_HHWC, apr29More90_Detox_HHOC, apr29More90_Detox_HHU, apr29More90_Hospital_Total, apr29More90_Hospital_HHNC, apr29More90_Hospital_HHWC, apr29More90_Hospital_HHOC, apr29More90_Hospital_HHU, apr29More90_Jail_Total, apr29More90_Jail_HHNC, apr29More90_Jail_HHWC, apr29More90_Jail_HHOC, apr29More90_Jail_HHU, apr29More90_InstTotal_HHNC, apr29More90_InstTotal_HHWC, apr29More90_InstTotal_HHOC, apr29More90_InstTotal_Total, apr29More90_InstTotal_HHU, apr29More90_Dead_Total, apr29More90_Dead_HHNC, apr29More90_Dead_HHWC, apr29More90_Dead_HHOC, apr29More90_Dead_HHU, apr29More90_Other_Total, apr29More90_Other_HHNC, apr29More90_Other_HHWC, apr29More90_Other_HHOC, apr29More90_Other_HHU, apr29More90_DKR_Total, apr29More90_DKR_HHNC, apr29More90_DKR_HHWC, apr29More90_DKR_HHOC, apr29More90_DKR_HHU, apr29More90_Missing_Total, apr29More90_Missing_HHNC, apr29More90_Missing_HHWC, apr29More90_Missing_HHOC, apr29More90_Missing_HHU, apr29More90_OtherTotal_Total, apr29More90_OtherTotal_HHNC, apr29More90_OtherTotal_HHWC, apr29More90_OtherTotal_HHOC, apr29More90_OtherTotal_HHU, apr29More90_Total_Total, apr29More90_Total_HHNC, apr29More90_Total_HHWC, apr29More90_Total_HHOC, apr29More90_Total_HHU, apr29Less90_OwnedNoSubsidy_Total, apr29Less90_OwnedSubsidy_Total, apr29Less90_OwnedNoSubsidy_HHNC, apr29Less90_OwnedNoSubsidy_HHWC, apr29Less90_OwnedNoSubsidy_HHOC, apr29Less90_OwnedNoSubsidy_HHU, apr29Less90_OwnedSubsidy_HHNC, apr29Less90_OwnedSubsidy_HHWC, apr29Less90_OwnedSubsidy_HHOC, apr29Less90_OwnedSubsidy_HHU, apr29Less90_RentalNoSubsidy_Total, apr29Less90_RentalNoSubsidy_HHNC, apr29Less90_RentalNoSubsidy_HHWC, apr29Less90_RentalNoSubsidy_HHOC, apr29Less90_RentalNoSubsidy_HHU, apr29Less90_RentalVASHSubsidy_Total, apr29Less90_RentalVASHSubsidy_HHNC, apr29Less90_RentalVASHSubsidy_HHWC, apr29Less90_RentalVASHSubsidy_HHOC, apr29Less90_RentalVASHSubsidy_HHU, apr29Less90_RentalOtherSubsidy_Total, apr29Less90_RentalOtherSubsidy_HHNC, apr29Less90_RentalOtherSubsidy_HHWC, apr29Less90_RentalOtherSubsidy_HHOC, apr29Less90_RentalOtherSubsidy_HHU, apr29Less90_PSH_Total, apr29Less90_PSH_HHNC, apr29Less90_PSH_HHWC, apr29Less90_PSH_HHOC, apr29Less90_PSH_HHU, apr29Less90_PermFamily_Total, apr29Less90_PermFamily_HHNC, apr29Less90_PermFamily_HHWC, apr29Less90_PermFamily_HHOC, apr29Less90_PermFamily_HHU, apr29Less90_PermFriend_HHWC, apr29Less90_PermFriend_Total, apr29Less90_PermFriend_HHNC, apr29Less90_PermFriend_HHOC, apr29Less90_PermFriend_HHU, apr29Less90_PermTotal_Total, apr29Less90_PermTotal_HHWC, apr29Less90_PermTotal_HHNC, apr29Less90_PermTotal_HHOC, apr29Less90_PermTotal_HHU, apr29Less90_EShelter_HHNC, apr29Less90_EShelter_HHWC, apr29Less90_EShelter_HHOC, apr29Less90_EShelter_HHU, apr29Less90_TH_Total, apr29Less90_TH_HHNC, apr29Less90_TH_HHWC, apr29Less90_TH_HHOC, apr29Less90_TH_HHU, apr29Less90_TempFamily_Total, apr29Less90_TempFamily_HHNC, apr29Less90_TempFamily_HHWC, apr29Less90_TempFamily_HHOC, apr29Less90_TempFamily_HHU, apr29Less90_TempFriend_Total, apr29Less90_TempFriend_HHNC, apr29Less90_TempFriend_HHWC, apr29Less90_TempFriend_HHOC, apr29Less90_TempFriend_HHU, apr29Less90_NoHumanHabitation_Total, apr29Less90_NoHumanHabitation_HHNC, apr29Less90_NoHumanHabitation_HHWC, apr29Less90_NoHumanHabitation_HHOC, apr29Less90_NoHumanHabitation_HHU, apr29Less90_SH_Total, apr29Less90_SH_HHNC, apr29Less90_SH_HHWC, apr29Less90_SH_HHOC, apr29Less90_SH_HHU, apr29Less90_Hotel_Total, apr29Less90_Hotel_HHNC, apr29Less90_Hotel_HHWC, apr29Less90_Hotel_HHOC, apr29Less90_Hotel_HHU, apr29Less90_TempTotal_Total, apr29Less90_TempTotal_HHNC, apr29Less90_TempTotal_HHWC, apr29Less90_TempTotal_HHOC, apr29Less90_TempTotal_HHU, apr29Less90_Foster_Total, apr29Less90_Foster_HHNC, apr29Less90_Foster_HHWC, apr29Less90_Foster_HHOC, apr29Less90_Foster_HHU, apr29Less90_Psych_Total, apr29Less90_Psych_HHNC, apr29Less90_Psych_HHWC, apr29Less90_Psych_HHOC, apr29Less90_Psych_HHU, apr29Less90_Detox_Total, apr29Less90_Detox_HHNC, apr29Less90_Detox_HHWC, apr29Less90_Detox_HHOC, apr29Less90_Detox_HHU, apr29Less90_Hospital_Total, apr29Less90_Hospital_HHNC, apr29Less90_Hospital_HHWC, apr29Less90_Hospital_HHOC, apr29Less90_Hospital_HHU, apr29Less90_Jail_Total, apr29Less90_Jail_HHNC, apr29Less90_Jail_HHWC, apr29Less90_Jail_HHOC, apr29Less90_Jail_HHU, apr29Less90_InstTotal_Total, apr29Less90_InstTotal_HHNC, apr29Less90_InstTotal_HHWC, apr29Less90_InstTotal_HHOC, apr29Less90_InstTotal_HHU, apr29Less90_Dead_Total, apr29Less90_Dead_HHNC, apr29Less90_Dead_HHWC, apr29Less90_Dead_HHOC, apr29Less90_Dead_HHU, apr29Less90_Other_Total, apr29Less90_Other_HHNC, apr29Less90_Other_HHWC, apr29Less90_Other_HHOC, apr29Less90_Other_HHU, apr29Less90_DKR_Total, apr29Less90_DKR_HHNC, apr29Less90_DKR_HHWC, apr29Less90_DKR_HHOC, apr29Less90_DKR_HHU, apr29Less90_Missing_Total, apr29Less90_Missing_HHNC, apr29Less90_Missing_HHWC, apr29Less90_Missing_HHOC, apr29Less90_Missing_HHU, apr29Less90_OtherTotal_Total, apr29Less90_OtherTotal_HHNC, apr29Less90_OtherTotal_HHWC, apr29Less90_OtherTotal_HHOC, apr29Less90_OtherTotal_HHU, apr29Less90_Total_Total, apr29Less90_Total_HHNC, apr29Less90_Total_HHWC, apr29Less90_Total_HHOC, apr29Less90_Total_HHU">
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
        Form = "dataapr29"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="50">
<cfset mathRows="54">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>

        
      <div class="row">
        <div class="large-12 columns">
        <h3>Exit Destination - Persons Participating More than 90 Days: Number of Leavers in Household</h3>
        <h4>Permanent Destination</h4>
          <cfset nexttab="1">
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Owned by client, no ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29More90_OwnedNoSubsidy_Total"
                   value="#getDataAPR.apr29More90_OwnedNoSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR1"
                  readonly
                  class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_OwnedNoSubsidy_HHNC"
                   value="#getDataAPR.apr29More90_OwnedNoSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col2"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_OwnedNoSubsidy_HHWC"
                   value="#getDataAPR.apr29More90_OwnedNoSubsidy_HHWC#"
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
                   name="apr29More90_OwnedNoSubsidy_HHOC"
                   value="#getDataAPR.apr29More90_OwnedNoSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row1 col4">
            <small class="form-error">Must be a whole number</small>
            </td> 
                <td>
                <input type="number"
                 name="apr29More90_OwnedNoSubsidy_HHU"
                 value="#getDataAPR.apr29More90_OwnedNoSubsidy_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11"
                 tabindex="#nexttab++#"
                 class="row1 col5">
          <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Owned by client, with ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29More90_OwnedSubsidy_Total"
                   value="#getDataAPR.apr29More90_OwnedSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR2"
                  readonly
                  class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_OwnedSubsidy_HHNC"
                   value="#getDataAPR.apr29More90_OwnedSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col2">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                <input type="number"
                   name="apr29More90_OwnedSubsidy_HHWC"
                   value="#getDataAPR.apr29More90_OwnedSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col3">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_OwnedSubsidy_HHOC"
                   value="#getDataAPR.apr29More90_OwnedSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col4">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td> 
                <input type="number"
                   name="apr29More90_OwnedSubsidy_HHU"
                   value="#getDataAPR.apr29More90_OwnedSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row2 col5">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Rental by client, no ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29More90_RentalNoSubsidy_Total"
                   value="#getDataAPR.apr29More90_RentalNoSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR3"
                  readonly
                  class="BGLightGray col1">
               <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_RentalNoSubsidy_HHNC"
                   value="#getDataAPR.apr29More90_RentalNoSubsidy_HHNC#"
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
                   name="apr29More90_RentalNoSubsidy_HHWC"
                   value="#getDataAPR.apr29More90_RentalNoSubsidy_HHWC#"
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
                   name="apr29More90_RentalNoSubsidy_HHOC"
                   value="#getDataAPR.apr29More90_RentalNoSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row3 col4">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_RentalNoSubsidy_HHU"
                   value="#getDataAPR.apr29More90_RentalNoSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row3 col5">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              

              <tr>
                <td>
                  Rental by client, VASH subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29More90_RentalVASHSubsidy_Total"
                   value="#getDataAPR.apr29More90_RentalVASHSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   ID="sumR4"
                   readonly
                   class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_RentalVASHSubsidy_HHNC"
                   value="#getDataAPR.apr29More90_RentalVASHSubsidy_HHNC#"
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
                   name="apr29More90_RentalVASHSubsidy_HHWC"
                   value="#getDataAPR.apr29More90_RentalVASHSubsidy_HHWC#"
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
                   name="apr29More90_RentalVASHSubsidy_HHOC"
                   value="#getDataAPR.apr29More90_RentalVASHSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row4 col4">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td> 
                  <input type="number"
                   name="apr29More90_RentalVASHSubsidy_HHU"
                   value="#getDataAPR.apr29More90_RentalVASHSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row4 col5">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Rental by client, other ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29More90_RentalOtherSubsidy_Total"
                   value="#getDataAPR.apr29More90_RentalOtherSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   ID="sumR5"
                   readonly
                   class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_RentalOtherSubsidy_HHNC"
                   value="#getDataAPR.apr29More90_RentalOtherSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col2">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_RentalOtherSubsidy_HHWC"
                   value="#getDataAPR.apr29More90_RentalOtherSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"  
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col3">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_RentalOtherSubsidy_HHOC"
                   value="#getDataAPR.apr29More90_RentalOtherSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col4">
            <small class="form-error">Must be a whole number</small> 
                </td>
                <td>
                <input type="number"
                   name="apr29More90_RentalOtherSubsidy_HHU"
                   value="#getDataAPR.apr29More90_RentalOtherSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row5 col5">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  PSH for homeless persons
                </td>
                <td>
            <input type="number"
                   name="apr29More90_PSH_Total"
                   value="#getDataAPR.apr29More90_PSH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   ID="sumR6"
                   readonly
                   class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PSH_HHNC"
                   value="#getDataAPR.apr29More90_PSH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col2">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PSH_HHWC"
                   value="#getDataAPR.apr29More90_PSH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col3">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_PSH_HHOC"
                   value="#getDataAPR.apr29More90_PSH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col4">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>          
                <input type="number"
                   name="apr29More90_PSH_HHU"
                   value="#getDataAPR.apr29More90_PSH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row6 col5">
            <small class="form-error">Must be a whole number</small>
                </td>

              </tr>
              <tr>
                <td>
                  Living with family, permanent tenure 
                </td>
                <td>
            <input type="number"
                   name="apr29More90_PermFamily_Total"
                   value="#getDataAPR.apr29More90_PermFamily_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumR7"
                   readonly
                   class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermFamily_HHNC"
                   value="#getDataAPR.apr29More90_PermFamily_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col2">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermFamily_HHWC"
                   value="#getDataAPR.apr29More90_PermFamily_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col3">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_PermFamily_HHOC"
                   value="#getDataAPR.apr29More90_PermFamily_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col4">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermFamily_HHU"
                   value="#getDataAPR.apr29More90_PermFamily_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row7 col5">
            <small class="form-error">Must be a whole number</small>
          </td>
              </tr>

              <tr>
                <td>
                  Living with friends, permanent tenure
                </td>
                <td>
            <input type="number"
                   name="apr29More90_PermFriend_Total"
                   value="#getDataAPR.apr29More90_PermFriend_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR8"
                   readonly
                   class="BGLightGray col1">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_PermFriend_HHNC"
                   value="#getDataAPR.apr29More90_PermFriend_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col2">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermFriend_HHWC"
                   value="#getDataAPR.apr29More90_PermFriend_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col3">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermFriend_HHOC"
                   value="#getDataAPR.apr29More90_PermFriend_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col4">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermFriend_HHU"
                   value="#getDataAPR.apr29More90_PermFriend_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row8 col5">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  <strong>Subtotal</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29More90_PermTotal_Total"
                   value="#getDataAPR.apr29More90_PermTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC1"
                   readonly
                   class="BGLightGray col21">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_PermTotal_HHNC"
                   value="#getDataAPR.apr29More90_PermTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC2"
                   readonly
                   class="BGLightGray col22">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermTotal_HHWC"
                   value="#getDataAPR.apr29More90_PermTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC3"
                   readonly
                   class="BGLightGray col23">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermTotal_HHOC"
                   value="#getDataAPR.apr29More90_PermTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC4"
                   readonly
                   class="BGLightGray col24">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_PermTotal_HHU"
                   value="#getDataAPR.apr29More90_PermTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC5"
                   readonly
                   class="BGLightGray col25">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

            </tbody>
       </table>
    </div>
  </div>

  <div class="row">
        <div class="large-12 columns">
        <h4>Temporary Destination</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Emergency shelter
                </td>
                <td>
            <input type="number"
                   name="apr29More90_EShelter_Total"
                   value="#getDataAPR.apr29More90_EShelter_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR10"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_EShelter_HHNC"
                   value="#getDataAPR.apr29More90_EShelter_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row10 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                  <td>
                <input type="number"
                   name="apr29More90_EShelter_HHWC"
                   value="#getDataAPR.apr29More90_EShelter_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row10 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_EShelter_HHOC"
                   value="#getDataAPR.apr29More90_EShelter_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row10 col9">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_EShelter_HHU"
                   value="#getDataAPR.apr29More90_EShelter_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row10 col10">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Transitional housing for homeless persons
                </td>
                <td>
            <input type="number"
                   name="apr29More90_TH_Total"
                   value="#getDataAPR.apr29More90_TH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR11"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TH_HHNC"
                   value="#getDataAPR.apr29More90_TH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row11 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TH_HHWC"
                   value="#getDataAPR.apr29More90_TH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row11 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TH_HHOC"
                   value="#getDataAPR.apr29More90_TH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row11 col9">
            <small class="form-error">Must be a whole number</small>
                </td> 
                <td>
                <input type="number"
                   name="apr29More90_TH_HHU"
                   value="#getDataAPR.apr29More90_TH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row11 col10">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Staying with family, temporary tenure
                </td>
                <td>
            <input type="number"
                   name="apr29More90_TempFamily_Total"
                   value="#getDataAPR.apr29More90_TempFamily_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR12"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TempFamily_HHNC"
                   value="#getDataAPR.apr29More90_TempFamily_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row12 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_TempFamily_HHWC"
                   value="#getDataAPR.apr29More90_TempFamily_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row12 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TempFamily_HHOC"
                   value="#getDataAPR.apr29More90_TempFamily_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row12 col9">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_TempFamily_HHU"
                   value="#getDataAPR.apr29More90_TempFamily_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row12 col10">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              

              <tr>
                <td>
                  Staying with friends, temporary tenure
                </td>
                <td>
            <input type="number"
                   name="apr29More90_TempFriends_Total"
                   value="#getDataAPR.apr29More90_TempFriends_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR13"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TempFriends_HHNC"
                   value="#getDataAPR.apr29More90_TempFriends_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row13 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_TempFriends_HHWC"
                   value="#getDataAPR.apr29More90_TempFriends_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row13 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
               <input type="number"
                   name="apr29More90_TempFriends_HHOC"
                   value="#getDataAPR.apr29More90_TempFriends_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row13 col9">
            <small class="form-error">Must be a whole number</small>
                </td> 
                <td>
                  <input type="number"
                   name="apr29More90_TempFriends_HHU"
                   value="#getDataAPR.apr29More90_TempFriends_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row13 col10">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Place not meant for human habitation
                </td>
                <td>
            <input type="number"
                   name="apr29More90_NoHumanHabitation_Total"
                   value="#getDataAPR.apr29More90_NoHumanHabitation_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR14"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_NoHumanHabitation_HHNC"
                   value="#getDataAPR.apr29More90_NoHumanHabitation_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row14 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_NoHumanHabitation_HHWC"
                   value="#getDataAPR.apr29More90_NoHumanHabitation_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row14 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_NoHumanHabitation_HHOC"
                   value="#getDataAPR.apr29More90_NoHumanHabitation_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row14 col9">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_NoHumanHabitation_HHU"
                   value="#getDataAPR.apr29More90_NoHumanHabitation_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row14 col10">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                 Safe Haven
                </td>
                <td>
            <input type="number"
                   name="apr29More90_SH_Total"
                   value="#getDataAPR.apr29More90_SH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR15"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_SH_HHNC"
                   value="#getDataAPR.apr29More90_SH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row15 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
            <td>
            <input type="number"
                   name="apr29More90_SH_HHWC"
                   value="#getDataAPR.apr29More90_SH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row15 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
               <input type="number"
                 name="apr29More90_SH_HHOC"
                 value="#getDataAPR.apr29More90_SH_HHOC#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class="row15 col9">
          <small class="form-error">Must be a whole number</small>
                </td>
                <td>          
               <input type="number"
                 name="apr29More90_SH_HHU"
                 value="#getDataAPR.apr29More90_SH_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class="row15 col10">
           <small class="form-error">Must be a whole number</small>
              </td>
            </tr>
            <tr>
                <td>
                  Hotel or motel, paid by client
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Hotel_Total"
                   value="#getDataAPR.apr29More90_Hotel_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR16"
                   readonly
                   class="BGLightGray col6">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_Hotel_HHNC"
                   value="#getDataAPR.apr29More90_Hotel_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row16 col7">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_Hotel_HHWC"
                   value="#getDataAPR.apr29More90_Hotel_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row16 col8">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_Hotel_HHOC"
                   value="#getDataAPR.apr29More90_Hotel_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row16 col9">
            <small class="form-error">Must be a whole number</small> 
                </td>
                <td>
                <input type="number"
                   name="apr29More90_Hotel_HHU"
                   value="#getDataAPR.apr29More90_Hotel_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row16 col10">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong> Subtotal</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29More90_TempTotal_Total"
                   value="#getDataAPR.apr29More90_TempTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC6"
                   readonly
                   class="BGLightGray col21">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29More90_TempTotal_HHNC"
                   value="#getDataAPR.apr29More90_TempTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC7"
                   readonly
                   class="BGLightGray col22">
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_TempTotal_HHWC"
                   value="#getDataAPR.apr29More90_TempTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC8"
                   readonly
                   class="BGLightGray col23">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_TempTotal_HHOC"
                   value="#getDataAPR.apr29More90_TempTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC9"
                   readonly
                   class="BGLightGray col24">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29More90_TempTotal_HHU"
                   value="#getDataAPR.apr29More90_TempTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC10"
                   readonly
                   class="BGLightGray col25">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


            </tbody>
       </table>
    </div>
  </div>
</tr>

  <div class="row">
        <div class="large-12 columns">
        <h4>Institutional Settings</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Foster care home or group foster care home
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Foster_Total"
                   value="#getDataAPR.apr29More90_Foster_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR18"
                   readonly
                   class="BGLightGray col11">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Foster_HHNC"
                   value="#getDataAPR.apr29More90_Foster_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row18 col12">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Foster_HHWC"
                   value="#getDataAPR.apr29More90_Foster_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row18 col13">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Foster_HHOC"
                   value="#getDataAPR.apr29More90_Foster_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row18 col14">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Foster_HHU"
                   value="#getDataAPR.apr29More90_Foster_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row18 col15">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Psychicatric facility
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Psych_Total"
                   value="#getDataAPR.apr29More90_Psych_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR19"
                   readonly
                   class="BGLightGray col11">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Psych_HHNC"
                   value="#getDataAPR.apr29More90_Psych_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row19 col12">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Psych_HHWC"
                   value="#getDataAPR.apr29More90_Psych_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row19 col13">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Psych_HHOC"
                   value="#getDataAPR.apr29More90_Psych_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row19 col14">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Psych_HHU"
                   value="#getDataAPR.apr29More90_Psych_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row19 col15">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Substance abuse or detox facility
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Detox_Total"
                   value="#getDataAPR.apr29More90_Detox_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumR20"
                   readonly
                   class="BGLightGray col11">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Detox_HHNC"
                   value="#getDataAPR.apr29More90_Detox_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row20 col12">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Detox_HHWC"
                   value="#getDataAPR.apr29More90_Detox_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row20 col13">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Detox_HHOC"
                   value="#getDataAPR.apr29More90_Detox_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row20 col14">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Detox_HHU"
                   value="#getDataAPR.apr29More90_Detox_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row20 col15">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Hospital (non-psychiatric)
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Hospital_Total"
                   value="#getDataAPR.apr29More90_Hospital_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR21"
                   readonly
                   class="BGLightGray col11">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Hospital_HHNC"
                   value="#getDataAPR.apr29More90_Hospital_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21 col12">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Hospital_HHWC"
                   value="#getDataAPR.apr29More90_Hospital_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21 col13">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Hospital_HHOC"
                   value="#getDataAPR.apr29More90_Hospital_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21 col14">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Hospital_HHU"
                   value="#getDataAPR.apr29More90_Hospital_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row21 col15">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Jail, prison, or juvenile detention facility
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Jail_Total"
                   value="#getDataAPR.apr29More90_Jail_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR22"
                   readonly
                   class="BGLightGray col11">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Jail_HHNC"
                   value="#getDataAPR.apr29More90_Jail_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col12">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Jail_HHWC"
                   value="#getDataAPR.apr29More90_Jail_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col13">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Jail_HHOC"
                   value="#getDataAPR.apr29More90_Jail_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col14">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Jail_HHU"
                   value="#getDataAPR.apr29More90_Jail_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row22 col15">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong>Subtotal</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29More90_InstTotal_Total"
                   value="#getDataAPR.apr29More90_InstTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC11"
                   readonly
                   class="BGLightGray col21">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_InstTotal_HHNC"
                   value="#getDataAPR.apr29More90_InstTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC12"
                   readonly
                   class="BGLightGray col22">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_InstTotal_HHWC"
                   value="#getDataAPR.apr29More90_InstTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC13"
                   readonly
                   class="BGLightGray col23">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_InstTotal_HHOC"
                   value="#getDataAPR.apr29More90_InstTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC14"
                   readonly
                   class="BGLightGray col24">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_InstTotal_HHU"
                   value="#getDataAPR.apr29More90_InstTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC15"
                   readonly
                   class="BGLightGray col25">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
        </tbody>
       </table>
    </div>
  </div>
</tr>

<div class="row">
        <div class="large-12 columns">
        <h4>Other Destinations</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Deceased
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Dead_Total"
                   value="#getDataAPR.apr29More90_Dead_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR24"
                   readonly
                   class="BGLightGray col16">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Dead_HHNC"
                   value="#getDataAPR.apr29More90_Dead_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col17">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Dead_HHWC"
                   value="#getDataAPR.apr29More90_Dead_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col18">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Dead_HHOC"
                   value="#getDataAPR.apr29More90_Dead_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col19">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Dead_HHU"
                   value="#getDataAPR.apr29More90_Dead_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row24 col20">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Other
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Other_Total"
                   value="#getDataAPR.apr29More90_Other_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR25"
                   readonly
                   class="BGLightGray col16">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Other_HHNC"
                   value="#getDataAPR.apr29More90_Other_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col17">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Other_HHWC"
                   value="#getDataAPR.apr29More90_Other_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col18">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Other_HHOC"
                   value="#getDataAPR.apr29More90_Other_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col19">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Other_HHU"
                   value="#getDataAPR.apr29More90_Other_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row25 col20">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Don't Know/Refused
                </td>
                <td>
            <input type="number"
                   name="apr29More90_DKR_Total"
                   value="#getDataAPR.apr29More90_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR26"
                   readonly
                   class="BGLightGray col16">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_DKR_HHNC"
                   value="#getDataAPR.apr29More90_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col17">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_DKR_HHWC"
                   value="#getDataAPR.apr29More90_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col18">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_DKR_HHOC"
                   value="#getDataAPR.apr29More90_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col19">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_DKR_HHU"
                   value="#getDataAPR.apr29More90_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row26 col20">
                <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Information Missing
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Missing_Total"
                   value="#getDataAPR.apr29More90_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR27"
                   readonly
                   class="BGLightGray col16">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Missing_HHNC"
                   value="#getDataAPR.apr29More90_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col17">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Missing_HHWC"
                   value="#getDataAPR.apr29More90_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col18">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Missing_HHOC"
                   value="#getDataAPR.apr29More90_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col19">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Missing_HHU"
                   value="#getDataAPR.apr29More90_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row27 col20">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong> Subtotal </strong>
                </td>
                <td>
            <input type="number"
                   name="apr29More90_OtherTotal_Total"
                   value="#getDataAPR.apr29More90_OtherTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC16"
                   readonly
                   class="BGLightGray col21">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_OtherTotal_HHNC"
                   value="#getDataAPR.apr29More90_OtherTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC17"
                   readonly
                   class="BGLightGray col22">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_OtherTotal_HHWC"
                   value="#getDataAPR.apr29More90_OtherTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC18"
                   readonly
                   class="BGLightGray col23">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_OtherTotal_HHOC"
                   value="#getDataAPR.apr29More90_OtherTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC19"
                   readonly
                   class="BGLightGray col24">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_OtherTotal_HHU"
                   value="#getDataAPR.apr29More90_OtherTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC20"
                   readonly
                   class="BGLightGray col25">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong>Total</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29More90_Total_Total"
                   value="#getDataAPR.apr29More90_Total_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC21"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Total_HHNC"
                   value="#getDataAPR.apr29More90_Total_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC22"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Total_HHWC"
                   value="#getDataAPR.apr29More90_Total_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC23"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29More90_Total_HHOC"
                   value="#getDataAPR.apr29More90_Total_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC24"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29More90_Total_HHU"
                   value="#getDataAPR.apr29More90_Total_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC25"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
        </tbody>
       </table>
    </div>
  </div>





<!--- 
  LESS
    THAN
      NINETY
        DAYS
---->





        
        <div class="row">
        <div class="large-12 columns">
        <h3>Exit Destination - Persons Participating Less than 90 Days: Number of Leavers in Household</h3>
        <h4>Permanent Destination</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Owned by client, no ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_OwnedNoSubsidy_Total"
                   value="#getDataAPR.apr29Less90_OwnedNoSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR28"
                  readonly
                  class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_OwnedNoSubsidy_HHNC"
                   value="#getDataAPR.apr29Less90_OwnedNoSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row28 col27">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_OwnedNoSubsidy_HHWC"
                   value="#getDataAPR.apr29Less90_OwnedNoSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row28 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_OwnedNoSubsidy_HHOC"
                   value="#getDataAPR.apr29Less90_OwnedNoSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row28 col29">
            <small class="form-error">Must be a whole number</small>
            </td> 
                <td>
                <input type="number"
                 name="apr29Less90_OwnedNoSubsidy_HHU"
                 value="#getDataAPR.apr29Less90_OwnedNoSubsidy_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class="row28 col30">
          <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Owned by client, with ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_OwnedSubsidy_Total"
                   value="#getDataAPR.apr29Less90_OwnedSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR29"
                  readonly
                  class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_OwnedSubsidy_HHNC"
                   value="#getDataAPR.apr29Less90_OwnedSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row29 col27">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                <input type="number"
                   name="apr29Less90_OwnedSubsidy_HHWC"
                   value="#getDataAPR.apr29Less90_OwnedSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row29 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_OwnedSubsidy_HHOC"
                   value="#getDataAPR.apr29Less90_OwnedSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row29 col29">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td> 
                <input type="number"
                   name="apr29Less90_OwnedSubsidy_HHU"
                   value="#getDataAPR.apr29Less90_OwnedSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row29 col30">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Rental by client, no ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_RentalNoSubsidy_Total"
                   value="#getDataAPR.apr29Less90_RentalNoSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR30"
                  readonly
                  class="BGLightGray col26">
               <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalNoSubsidy_HHNC"
                   value="#getDataAPR.apr29Less90_RentalNoSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row30 col27">
              <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_RentalNoSubsidy_HHWC"
                   value="#getDataAPR.apr29Less90_RentalNoSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row30 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalNoSubsidy_HHOC"
                   value="#getDataAPR.apr29Less90_RentalNoSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row30 col29">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_RentalNoSubsidy_HHU"
                   value="#getDataAPR.apr29Less90_RentalNoSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row30 col30">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              

              <tr>
                <td>
                  Rental by client, VASH subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_RentalVASHSubsidy_Total"
                   value="#getDataAPR.apr29Less90_RentalVASHSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   ID="sumR31"
                   readonly
                   class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalVASHSubsidy_HHNC"
                   value="#getDataAPR.apr29Less90_RentalVASHSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row31 col27">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_RentalVASHSubsidy_HHWC"
                   value="#getDataAPR.apr29Less90_RentalVASHSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row31 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalVASHSubsidy_HHOC"
                   value="#getDataAPR.apr29Less90_RentalVASHSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row31 col29">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td> 
                  <input type="number"
                   name="apr29Less90_RentalVASHSubsidy_HHU"
                   value="#getDataAPR.apr29Less90_RentalVASHSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row31 col30">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Rental by client, other ongoing subsidy
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_RentalOtherSubsidy_Total"
                   value="#getDataAPR.apr29Less90_RentalOtherSubsidy_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   ID="sumR32"
                   readonly
                   class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalOtherSubsidy_HHNC"
                   value="#getDataAPR.apr29Less90_RentalOtherSubsidy_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row32 col27">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_RentalOtherSubsidy_HHWC"
                   value="#getDataAPR.apr29Less90_RentalOtherSubsidy_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"  
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row32 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalOtherSubsidy_HHOC"
                   value="#getDataAPR.apr29Less90_RentalOtherSubsidy_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row32 col29">
            <small class="form-error">Must be a whole number</small> 
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_RentalOtherSubsidy_HHU"
                   value="#getDataAPR.apr29Less90_RentalOtherSubsidy_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row32 col30">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  PSH for homeless persons
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_PSH_Total"
                   value="#getDataAPR.apr29Less90_PSH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   ID="sumR33"
                   readonly
                   class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PSH_HHNC"
                   value="#getDataAPR.apr29Less90_PSH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row33 col27">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PSH_HHWC"
                   value="#getDataAPR.apr29Less90_PSH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row33 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_PSH_HHOC"
                   value="#getDataAPR.apr29Less90_PSH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row33 col29">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>          
                <input type="number"
                   name="apr29Less90_PSH_HHU"
                   value="#getDataAPR.apr29Less90_PSH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row33 col30">
            <small class="form-error">Must be a whole number</small>
                </td>

              </tr>
              <tr>
                <td>
                  Living with family, permanent tenure 
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_PermFamily_Total"
                   value="#getDataAPR.apr29Less90_PermFamily_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumR34"
                   readonly
                   class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermFamily_HHNC"
                   value="#getDataAPR.apr29Less90_PermFamily_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row34 col27">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermFamily_HHWC"
                   value="#getDataAPR.apr29Less90_PermFamily_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row34 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_PermFamily_HHOC"
                   value="#getDataAPR.apr29Less90_PermFamily_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row34 col29">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermFamily_HHU"
                   value="#getDataAPR.apr29Less90_PermFamily_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row34 col30">
            <small class="form-error">Must be a whole number</small>
          </td>
              </tr>

              <tr>
                <td>
                  Living with friends, permanent tenure
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_PermFriend_Total"
                   value="#getDataAPR.apr29Less90_PermFriend_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR35"
                   readonly
                   class="BGLightGray col26">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_PermFriend_HHNC"
                   value="#getDataAPR.apr29Less90_PermFriend_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row35 col27">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermFriend_HHWC"
                   value="#getDataAPR.apr29Less90_PermFriend_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row35 col28">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermFriend_HHOC"
                   value="#getDataAPR.apr29Less90_PermFriend_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row35 col29">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermFriend_HHU"
                   value="#getDataAPR.apr29Less90_PermFriend_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row35 col30">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  <strong>Subtotal</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_PermTotal_Total"
                   value="#getDataAPR.apr29Less90_PermTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC26"
                   readonly
                   class="BGLightGray col46">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_PermTotal_HHNC"
                   value="#getDataAPR.apr29Less90_PermTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC27"
                   readonly
                   class="BGLightGray col47">
            <small class="form-error">Must be a whole number</small>
            </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermTotal_HHWC"
                   value="#getDataAPR.apr29Less90_PermTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC28"
                   readonly
                   class="BGLightGray col48">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermTotal_HHOC"
                   value="#getDataAPR.apr29Less90_PermTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC29"
                   readonly
                   class="BGLightGray col49">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_PermTotal_HHU"
                   value="#getDataAPR.apr29Less90_PermTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC30"
                   readonly
                   class="BGLightGray col50">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

            </tbody>
       </table>
    </div>
  </div>

  <div class="row">
        <div class="large-12 columns">
        <h4>Temporary Destination</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Emergency shelter
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_EmergShelter_Total"
                   value="#getDataAPR.apr29Less90_EmergShelter_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR37"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_EShelter_HHNC"
                   value="#getDataAPR.apr29Less90_EShelter_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row37 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
                  <td>
                <input type="number"
                   name="apr29Less90_EShelter_HHWC"
                   value="#getDataAPR.apr29Less90_EShelter_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row37 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_EShelter_HHOC"
                   value="#getDataAPR.apr29Less90_EShelter_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row37 col34">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_EShelter_HHU"
                   value="#getDataAPR.apr29Less90_EShelter_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row37 col35">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Transitional housing for homeless persons
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_TH_Total"
                   value="#getDataAPR.apr29Less90_TH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR38"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TH_HHNC"
                   value="#getDataAPR.apr29Less90_TH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row38 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TH_HHWC"
                   value="#getDataAPR.apr29Less90_TH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row38 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TH_HHOC"
                   value="#getDataAPR.apr29Less90_TH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row38 col34">
            <small class="form-error">Must be a whole number</small>
                </td> 
                <td>
                <input type="number"
                   name="apr29Less90_TH_HHU"
                   value="#getDataAPR.apr29Less90_TH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row38 col35">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Staying with family, temporary tenure
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_TempFamily_Total"
                   value="#getDataAPR.apr29Less90_TempFamily_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR39"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TempFamily_HHNC"
                   value="#getDataAPR.apr29Less90_TempFamily_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row39 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_TempFamily_HHWC"
                   value="#getDataAPR.apr29Less90_TempFamily_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row39 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TempFamily_HHOC"
                   value="#getDataAPR.apr29Less90_TempFamily_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row39 col34">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_TempFamily_HHU"
                   value="#getDataAPR.apr29Less90_TempFamily_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row39 col35">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
              

              <tr>
                <td>
                  Staying with friends, temporary tenure
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_TempFriend_Total"
                   value="#getDataAPR.apr29Less90_TempFriend_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR40"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TempFriend_HHNC"
                   value="#getDataAPR.apr29Less90_TempFriend_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row40 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_TempFriend_HHWC"
                   value="#getDataAPR.apr29Less90_TempFriend_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row40 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
               <input type="number"
                   name="apr29Less90_TempFriend_HHOC"
                   value="#getDataAPR.apr29Less90_TempFriend_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row40 col34">
            <small class="form-error">Must be a whole number</small>
                </td> 
                <td>
                  <input type="number"
                   name="apr29Less90_TempFriend_HHU"
                   value="#getDataAPR.apr29Less90_TempFriend_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row40 col35">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


              <tr>
                <td>
                  Place not meant for human habitation
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_NoHumanHabitation_Total"
                   value="#getDataAPR.apr29Less90_NoHumanHabitation_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR41"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_NoHumanHabitation_HHNC"
                   value="#getDataAPR.apr29Less90_NoHumanHabitation_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row41 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_NoHumanHabitation_HHWC"
                   value="#getDataAPR.apr29Less90_NoHumanHabitation_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row41 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_NoHumanHabitation_HHOC"
                   value="#getDataAPR.apr29Less90_NoHumanHabitation_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row41 col34">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_NoHumanHabitation_HHU"
                   value="#getDataAPR.apr29Less90_NoHumanHabitation_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row41 col35">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                 Safe Haven
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_SH_Total"
                   value="#getDataAPR.apr29Less90_SH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR42"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_SH_HHNC"
                   value="#getDataAPR.apr29Less90_SH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row42 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
            <td>
            <input type="number"
                   name="apr29Less90_SH_HHWC"
                   value="#getDataAPR.apr29Less90_SH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row42 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
               <input type="number"
                 name="apr29Less90_SH_HHOC"
                 value="#getDataAPR.apr29Less90_SH_HHOC#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class="row42 col34">
          <small class="form-error">Must be a whole number</small>
                </td>
                <td>          
               <input type="number"
                 name="apr29Less90_SH_HHU"
                 value="#getDataAPR.apr29Less90_SH_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11"
                 tabindex="#nexttab++#"
                 class="row42 col35">
           <small class="form-error">Must be a whole number</small>
              </td>
            </tr>
            <tr>
                <td>
                  Hotel or motel, paid by client
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Hotel_Total"
                   value="#getDataAPR.apr29Less90_Hotel_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR43"
                   readonly
                   class="BGLightGray col31">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_Hotel_HHNC"
                   value="#getDataAPR.apr29Less90_Hotel_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row43 col32">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_Hotel_HHWC"
                   value="#getDataAPR.apr29Less90_Hotel_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row43 col33">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_Hotel_HHOC"
                   value="#getDataAPR.apr29Less90_Hotel_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row43 col34">
            <small class="form-error">Must be a whole number</small> 
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_Hotel_HHU"
                   value="#getDataAPR.apr29Less90_Hotel_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row43 col35">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong> Subtotal</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_TempTotal_Total"
                   value="#getDataAPR.apr29Less90_TempTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC31"
                   readonly
                   class="BGLightGray col46">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                <input type="number"
                   name="apr29Less90_TempTotal_HHNC"
                   value="#getDataAPR.apr29Less90_TempTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC32"
                   readonly
                   class="BGLightGray col47">
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_TempTotal_HHWC"
                   value="#getDataAPR.apr29Less90_TempTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC33"
                   readonly
                   class="BGLightGray col48">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_TempTotal_HHOC"
                   value="#getDataAPR.apr29Less90_TempTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC34"
                   readonly
                   class="BGLightGray col49">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
                  <input type="number"
                   name="apr29Less90_TempTotal_HHU"
                   value="#getDataAPR.apr29Less90_TempTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC35"
                   readonly
                   class="BGLightGray col50">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>


            </tbody>
       </table>
    </div>
  </div>
</tr>

  <div class="row">
        <div class="large-12 columns">
        <h4>Institutional Settings</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Foster care home or group foster care home
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Foster_Total"
                   value="#getDataAPR.apr29Less90_Foster_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR45"
                   readonly
                   class="BGLightGray col36">
            <small class="form-error">Must be a whole number</small>
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Foster_HHNC"
                   value="#getDataAPR.apr29Less90_Foster_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row45 col37">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Foster_HHWC"
                   value="#getDataAPR.apr29Less90_Foster_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row45 col38">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Foster_HHOC"
                   value="#getDataAPR.apr29Less90_Foster_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row45 col39">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Foster_HHU"
                   value="#getDataAPR.apr29Less90_Foster_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row45 col40">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Psychicatric facility
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Psych_Total"
                   value="#getDataAPR.apr29Less90_Psych_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR46"
                   readonly
                   class="BGLightGray col36">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Psych_HHNC"
                   value="#getDataAPR.apr29Less90_Psych_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row46 col37">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Psych_HHWC"
                   value="#getDataAPR.apr29Less90_Psych_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row46 col38">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Psych_HHOC"
                   value="#getDataAPR.apr29Less90_Psych_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row46 col39">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Psych_HHU"
                   value="#getDataAPR.apr29Less90_Psych_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row46 col40">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Substance abuse or detox facility
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Detox_Total"
                   value="#getDataAPR.apr29Less90_Detox_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumR47"
                   readonly
                   class="BGLightGray col36">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Detox_HHNC"
                   value="#getDataAPR.apr29Less90_Detox_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row47 col37">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Detox_HHWC"
                   value="#getDataAPR.apr29Less90_Detox_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row47 col38">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Detox_HHOC"
                   value="#getDataAPR.apr29Less90_Detox_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row47 col39">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Detox_HHU"
                   value="#getDataAPR.apr29Less90_Detox_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row47 col40">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Hospital (non-psychiatric)
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Hospital_Total"
                   value="#getDataAPR.apr29Less90_Hospital_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR48"
                   readonly
                   class="BGLightGray col36">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Hospital_HHNC"
                   value="#getDataAPR.apr29Less90_Hospital_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row48 col37">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Hospital_HHWC"
                   value="#getDataAPR.apr29Less90_Hospital_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row48 col38">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Hospital_HHOC"
                   value="#getDataAPR.apr29Less90_Hospital_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row48 col39">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Hospital_HHU"
                   value="#getDataAPR.apr29Less90_Hospital_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row48 col40">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Jail, prison, or juvenile detention facility
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Jail_Total"
                   value="#getDataAPR.apr29Less90_Jail_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR49"
                   readonly
                   class="BGLightGray col36">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Jail_HHNC"
                   value="#getDataAPR.apr29Less90_Jail_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row49 col37">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Jail_HHWC"
                   value="#getDataAPR.apr29Less90_Jail_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row49 col38">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Jail_HHOC"
                   value="#getDataAPR.apr29Less90_Jail_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row49 col39">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Jail_HHU"
                   value="#getDataAPR.apr29Less90_Jail_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row49 col40">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong>Subtotal</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_InstTotal_Total"
                   value="#getDataAPR.apr29Less90_InstTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC36"
                   readonly
                   class="BGLightGray col46">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_InstTotal_HHNC"
                   value="#getDataAPR.apr29Less90_InstTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC37"
                   readonly
                   class="BGLightGray col47">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_InstTotal_HHWC"
                   value="#getDataAPR.apr29Less90_InstTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC38"
                   readonly
                   class="BGLightGray col48">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_InstTotal_HHOC"
                   value="#getDataAPR.apr29Less90_InstTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC39"
                   readonly
                   class="BGLightGray col49">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_InstTotal_HHU"
                   value="#getDataAPR.apr29Less90_InstTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                   ID="sumC40"
                   readonly
                   class="BGLightGray col50">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
        </tbody>
       </table>
    </div>
  </div>
</tr>

<div class="row">
        <div class="large-12 columns">
        <h4>Other Destinations</h4>
          <table width="100%">
            <thead>
              <th></th>
              <th>Total</th>
              <th>Without Children</th>
              <th>With Children and Adults</th>
              <th>With Only Children</th>
              <th>Unknown Household Type</th>
            </thead>
            <tbody>

              <tr>
                <td>
                  Deceased
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Dead_Total"
                   value="#getDataAPR.apr29Less90_Dead_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR50"
                   readonly
                   class="BGLightGray col41">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Dead_HHNC"
                   value="#getDataAPR.apr29Less90_Dead_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row50 col42">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Dead_HHWC"
                   value="#getDataAPR.apr29Less90_Dead_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row50 col43">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Dead_HHOC"
                   value="#getDataAPR.apr29Less90_Dead_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row50 col44">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Dead_HHU"
                   value="#getDataAPR.apr29Less90_Dead_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row50 col45">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Other
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Other_Total"
                   value="#getDataAPR.apr29Less90_Other_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR51"
                   readonly
                   class="BGLightGray col41">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Other_HHNC"
                   value="#getDataAPR.apr29Less90_Other_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row51 col42">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Other_HHWC"
                   value="#getDataAPR.apr29Less90_Other_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row51 col43">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Other_HHOC"
                   value="#getDataAPR.apr29Less90_Other_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row51 col44">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Other_HHU"
                   value="#getDataAPR.apr29Less90_Other_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row51 col45">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Don't Know/Refused
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_DKR_Total"
                   value="#getDataAPR.apr29Less90_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR52"
                   readonly
                   class="BGLightGray col41">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_DKR_HHNC"
                   value="#getDataAPR.apr29Less90_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row52 col42">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_DKR_HHWC"
                   value="#getDataAPR.apr29Less90_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row52 col43">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_DKR_HHOC"
                   value="#getDataAPR.apr29Less90_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row52 col44">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_DKR_HHU"
                   value="#getDataAPR.apr29Less90_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row52 col45">
                <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  Information Missing
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Missing_Total"
                   value="#getDataAPR.apr29Less90_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumR53"
                   readonly
                   class="BGLightGray col41">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Missing_HHNC"
                   value="#getDataAPR.apr29Less90_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row53 col42">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Missing_HHWC"
                   value="#getDataAPR.apr29Less90_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row53 col43">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Missing_HHOC"
                   value="#getDataAPR.apr29Less90_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row53 col44">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Missing_HHU"
                   value="#getDataAPR.apr29Less90_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="row53 col45">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong> Subtotal </strong>
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_OtherTotal_Total"
                   value="#getDataAPR.apr29Less90_OtherTotal_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC41"
                   readonly
                   class="BGLightGray col46">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_OtherTotal_HHNC"
                   value="#getDataAPR.apr29Less90_OtherTotal_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC42"
                   readonly
                   class="BGLightGray col47">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_OtherTotal_HHWC"
                   value="#getDataAPR.apr29Less90_OtherTotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC43"
                   readonly
                   class="BGLightGray col48">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_OtherTotal_HHOC"
                   value="#getDataAPR.apr29Less90_OtherTotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC44"
                   readonly
                   class="BGLightGray col49">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_OtherTotal_HHU"
                   value="#getDataAPR.apr29Less90_OtherTotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC45"
                   readonly
                   class="BGLightGray col50">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>

              <tr>
                <td>
                  <strong>Total</strong>
                </td>
                <td>
            <input type="number"
                   name="apr29Less90_Total_Total"
                   value="#getDataAPR.apr29Less90_Total_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC46"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Total_HHNC"
                   value="#getDataAPR.apr29Less90_Total_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC47"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Total_HHWC"
                   value="#getDataAPR.apr29Less90_Total_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC48"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                <td>
            <input type="number"
                   name="apr29Less90_Total_HHOC"
                   value="#getDataAPR.apr29Less90_Total_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC49"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>

                 <td>
            <input type="number"
                   name="apr29Less90_Total_HHU"
                   value="#getDataAPR.apr29Less90_Total_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  ID="sumC50"
                   readonly
                   class="BGLightGray">
            <small class="form-error">Must be a whole number</small>
                </td>
              </tr>
        </tbody>
       </table>
    </div>
  </div>






</cfoutput>