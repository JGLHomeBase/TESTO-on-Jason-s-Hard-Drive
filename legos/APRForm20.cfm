<!--- Set Variables --->
<cfset TargetTable = "DataAPR20">
<cfset UniqueID = "DataAPR20ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR20ID"
        Form = "dataapr20">
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
    <cfinsert datasource="#DataSource#" tablename="dataapr20" formfields="aprID, inputUserID, projectID, reviewUserID, apr20Homeless_ES_Total, apr20Homeless_ES_HHNC, apr20Homeless_ES_HHWC, apr20Homeless_ES_HHOC, apr20Homeless_ES_HHU, apr20Homeless_TH_Total, apr20Homeless_TH_HHNC, apr20Homeless_TH_HHWC, apr20Homeless_TH_HHOC, apr20Homeless_TH_HHU, apr20Homeless_NMHH_Total, apr20Homeless_NMHH_HHNC, apr20Homeless_NMHH_HHWC, apr20Homeless_NMHH_HHOC, apr20Homeless_NMHH_HHU, apr20Homeless_SH_Total, apr20Homeless_SH_HHNC, apr20Homeless_SH_HHWC, apr20Homeless_SH_HHOC, apr20Homeless_SH_HHU, apr20Homeless_Subtotal, apr20Homeless_Subtotal_HHNC, apr20Homeless_Subtotal_HHWC, apr20Homeless_Subtotal_HHOC, apr20Homeless_Subtotal_HHU, apr20Institutional_PsychFacility_Total, apr20Institutional_PsychFacility_HHNC, apr20Institutional_PsychFacility_HHWC, apr20Institutional_PsychFacility_HHOC, apr20Institutional_PsychFacility_HHU, apr20Institutional_SA_Total, apr20Institutional_SA_HHNC, apr20Institutional_SA_HHWC, apr20Institutional_SA_HHOC, apr20Institutional_SA_HHU, apr20Institutional_Hospital_Total, apr20Institutional_Hospital_HHNC, apr20Institutional_Hospital_HHWC, apr20Institutional_Hospital_HHOC, apr20Institutional_Hospital_HHU, apr20Institutional_Jail_Total, apr20Institutional_Jail_HHNC, apr20Institutional_Jail_HHWC, apr20Institutional_Jail_HHOC, apr20Institutional_Jail_HHU, apr20Institutional_Foster_Total, apr20Institutional_Foster_HHNC, apr20Institutional_Foster_HHWC, apr20Institutional_Foster_HHOC, apr20Institutional_Foster_HHU, apr20Institutional_Subtotal, apr20Institutional_Subtotal_HHNC, apr20Institutional_Subtotal_HHWC, apr20Institutional_Subtotal_HHOC, apr20Institutional_Subtotal_HHU, apr20Other_PSH_Total, apr20Other_PSH_HHNC, apr20Other_PSH_HHWC, apr20Other_PSH_HHOC, apr20Other_PSH_HHU, apr20Other_OwnNoSub_Total, apr20Other_OwnNoSub_HHNC, apr20Other_OwnNoSub_HHWC, apr20Other_OwnNoSub_HHOC, apr20Other_OwnNoSub_HHU, apr20Other_OwnWithSub_Total, apr20Other_OwnWithSub_HHNC, apr20Other_OwnWithSub_HHWC, apr20Other_OwnWithSub_HHOC, apr20Other_OwnWithSub_HHU, apr20Other_RentNoSub_Total, apr20Other_RentNoSub_HHNC, apr20Other_RentNoSub_HHWC, apr20Other_RentNoSub_HHOC, apr20Other_RentNoSub_HHU, apr20Other_RentVetSub_Total, apr20Other_RentVetSub_HHNC, apr20Other_RentVetSub_HHWC, apr20Other_RentVetSub_HHOC, apr20Other_RentVetSub_HHU, apr20Other_RentOtherSub_Total, apr20Other_RentOtherSub_HHNC, apr20Other_RentOtherSub_HHWC, apr20Other_RentOtherSub_HHOC, apr20Other_RentOtherSub_HHU, apr20Other_Hotel_Total, apr20Other_Hotel_HHNC, apr20Other_Hotel_HHWC, apr20Other_Hotel_HHOC, apr20Other_Hotel_HHU, apr20Other_Family_Total, apr20Other_Family_HHNC, apr20Other_Family_HHWC, apr20Other_Family_HHOC, apr20Other_Family_HHU, apr20Other_Friend_Total, apr20Other_Friend_HHNC, apr20Other_Friend_HHWC, apr20Other_Friend_HHOC, apr20Other_Friend_HHU, apr20Other_Other_Total, apr20Other_Other_HHNC, apr20Other_Other_HHWC, apr20Other_Other_HHOC, apr20Other_Other_HHU, apr20Other_DKR_Total, apr20Other_DKR_HHNC, apr20Other_DKR_HHWC, apr20Other_DKR_HHOC, apr20Other_DKR_HHU, apr20Other_Missing_Total, apr20Other_Missing_HHNC, apr20Other_Missing_HHWC, apr20Other_Missing_HHOC, apr20Other_Missing_HHU, apr20Other_Subtotal, apr20Other_Subtotal_HHNC, apr20Other_Subtotal_HHWC, apr20Other_Subtotal_HHOC, apr20Other_Subtotal_HHU, apr20_Total, apr20_Total_HHNC, apr20_Total_HHWC, apr20_Total_HHOC, apr20_Total_HHU">
  <cfelse>
    <cfset FORM.DataAPR20ID = newCheck.DataAPR20ID>
        
<!--- Set defaults --->
<cfif form.apr20Homeless_ES_Total	 EQ "">	
    <cfset form.apr20Homeless_ES_Total	 =0></cfif>
<cfif form.apr20Homeless_ES_HHNC	 EQ "">	
    <cfset form.apr20Homeless_ES_HHNC	 =0></cfif>
<cfif form.apr20Homeless_ES_HHWC	 EQ "">	
    <cfset form.apr20Homeless_ES_HHWC	 =0></cfif>
<cfif form.apr20Homeless_ES_HHOC	 EQ "">	
    <cfset form.apr20Homeless_ES_HHOC	 =0></cfif>
<cfif form.apr20Homeless_ES_HHU	 EQ "">	<cfset form.apr20Homeless_ES_HHU	 =0></cfif>
<cfif form.apr20Homeless_TH_Total	 EQ "">	
    <cfset form.apr20Homeless_TH_Total	 =0></cfif>
<cfif form.apr20Homeless_TH_HHNC	 EQ "">	
    <cfset form.apr20Homeless_TH_HHNC	 =0></cfif>
<cfif form.apr20Homeless_TH_HHWC	 EQ "">	
    <cfset form.apr20Homeless_TH_HHWC	 =0></cfif>
<cfif form.apr20Homeless_TH_HHOC	 EQ "">	
    <cfset form.apr20Homeless_TH_HHOC	 =0></cfif>
<cfif form.apr20Homeless_TH_HHU	 EQ "">	
    <cfset form.apr20Homeless_TH_HHU	 =0></cfif>
<cfif form.apr20Homeless_NMHH_Total	 EQ "">	
    <cfset form.apr20Homeless_NMHH_Total	 =0></cfif>
<cfif form.apr20Homeless_NMHH_HHNC	 EQ "">	
    <cfset form.apr20Homeless_NMHH_HHNC	 =0></cfif>
<cfif form.apr20Homeless_NMHH_HHWC	 EQ "">	
    <cfset form.apr20Homeless_NMHH_HHWC	 =0></cfif>
<cfif form.apr20Homeless_NMHH_HHOC	 EQ "">	
    <cfset form.apr20Homeless_NMHH_HHOC	 =0></cfif>
<cfif form.apr20Homeless_NMHH_HHU	 EQ "">	
    <cfset form.apr20Homeless_NMHH_HHU	 =0></cfif>
<cfif form.apr20Homeless_SH_Total	 EQ "">	
    <cfset form.apr20Homeless_SH_Total	 =0></cfif>
<cfif form.apr20Homeless_SH_HHNC	 EQ "">	
    <cfset form.apr20Homeless_SH_HHNC	 =0></cfif>
<cfif form.apr20Homeless_SH_HHWC	 EQ "">	
    <cfset form.apr20Homeless_SH_HHWC	 =0></cfif>
<cfif form.apr20Homeless_SH_HHOC	 EQ "">	
    <cfset form.apr20Homeless_SH_HHOC	 =0></cfif>
<cfif form.apr20Homeless_SH_HHU	 EQ "">	
    <cfset form.apr20Homeless_SH_HHU	 =0></cfif>
<cfif form.apr20Homeless_Subtotal	 EQ "">	
    <cfset form.apr20Homeless_Subtotal	 =0></cfif>
<cfif form.apr20Homeless_Subtotal_HHNC	 EQ "">	
    <cfset form.apr20Homeless_Subtotal_HHNC	 =0></cfif>
<cfif form.apr20Homeless_Subtotal_HHWC	 EQ "">	
    <cfset form.apr20Homeless_Subtotal_HHWC	 =0></cfif>
<cfif form.apr20Homeless_Subtotal_HHOC	 EQ "">	
    <cfset form.apr20Homeless_Subtotal_HHOC	 =0></cfif>
<cfif form.apr20Homeless_Subtotal_HHU	 EQ "">	
    <cfset form.apr20Homeless_Subtotal_HHU	 =0></cfif>
<cfif form.apr20Institutional_PsychFacility_Total	 EQ "">	
    <cfset form.apr20Institutional_PsychFacility_Total	 =0></cfif>
<cfif form.apr20Institutional_PsychFacility_HHNC	 EQ "">	
    <cfset form.apr20Institutional_PsychFacility_HHNC	 =0></cfif>
<cfif form.apr20Institutional_PsychFacility_HHWC	 EQ "">	
    <cfset form.apr20Institutional_PsychFacility_HHWC	 =0></cfif>
<cfif form.apr20Institutional_PsychFacility_HHOC	 EQ "">	
    <cfset form.apr20Institutional_PsychFacility_HHOC	 =0></cfif>
<cfif form.apr20Institutional_PsychFacility_HHU	 EQ "">	
    <cfset form.apr20Institutional_PsychFacility_HHU	 =0></cfif>
<cfif form.apr20Institutional_SA_Total	 EQ "">	
    <cfset form.apr20Institutional_SA_Total	 =0></cfif>
<cfif form.apr20Institutional_SA_HHNC	 EQ "">	
    <cfset form.apr20Institutional_SA_HHNC	 =0></cfif>
<cfif form.apr20Institutional_SA_HHWC	 EQ "">	
    <cfset form.apr20Institutional_SA_HHWC	 =0></cfif>
<cfif form.apr20Institutional_SA_HHOC	 EQ "">	
    <cfset form.apr20Institutional_SA_HHOC	 =0></cfif>
<cfif form.apr20Institutional_SA_HHU	 EQ "">	
    <cfset form.apr20Institutional_SA_HHU	 =0></cfif>
<cfif form.apr20Institutional_Hospital_Total	 EQ "">	
    <cfset form.apr20Institutional_Hospital_Total	 =0></cfif>
<cfif form.apr20Institutional_Hospital_HHNC	 EQ "">	
    <cfset form.apr20Institutional_Hospital_HHNC	 =0></cfif>
<cfif form.apr20Institutional_Hospital_HHWC	 EQ "">	
    <cfset form.apr20Institutional_Hospital_HHWC	 =0></cfif>
<cfif form.apr20Institutional_Hospital_HHOC	 EQ "">	
    <cfset form.apr20Institutional_Hospital_HHOC	 =0></cfif>
<cfif form.apr20Institutional_Hospital_HHU	 EQ "">	
    <cfset form.apr20Institutional_Hospital_HHU	 =0></cfif>
<cfif form.apr20Institutional_Jail_Total	 EQ "">	
    <cfset form.apr20Institutional_Jail_Total	 =0></cfif>
<cfif form.apr20Institutional_Jail_HHNC	 EQ "">	
    <cfset form.apr20Institutional_Jail_HHNC	 =0></cfif>
<cfif form.apr20Institutional_Jail_HHWC	 EQ "">	
    <cfset form.apr20Institutional_Jail_HHWC	 =0></cfif>
<cfif form.apr20Institutional_Jail_HHOC	 EQ "">	
    <cfset form.apr20Institutional_Jail_HHOC	 =0></cfif>
<cfif form.apr20Institutional_Jail_HHU	 EQ "">	
    <cfset form.apr20Institutional_Jail_HHU	 =0></cfif>
<cfif form.apr20Institutional_Foster_Total	 EQ "">	
    <cfset form.apr20Institutional_Foster_Total	 =0></cfif>
<cfif form.apr20Institutional_Foster_HHNC	 EQ "">	
    <cfset form.apr20Institutional_Foster_HHNC	 =0></cfif>
<cfif form.apr20Institutional_Foster_HHWC	 EQ "">	
    <cfset form.apr20Institutional_Foster_HHWC	 =0></cfif>
<cfif form.apr20Institutional_Foster_HHOC	 EQ "">	
    <cfset form.apr20Institutional_Foster_HHOC	 =0></cfif>
<cfif form.apr20Institutional_Foster_HHU	 EQ "">	
    <cfset form.apr20Institutional_Foster_HHU	 =0></cfif>
<cfif form.apr20Institutional_Subtotal	 EQ "">	
    <cfset form.apr20Institutional_Subtotal	 =0></cfif>
<cfif form.apr20Institutional_Subtotal_HHNC	 EQ "">	
    <cfset form.apr20Institutional_Subtotal_HHNC	 =0></cfif>
<cfif form.apr20Institutional_Subtotal_HHWC	 EQ "">	
    <cfset form.apr20Institutional_Subtotal_HHWC	 =0></cfif>
<cfif form.apr20Institutional_Subtotal_HHOC	 EQ "">	
    <cfset form.apr20Institutional_Subtotal_HHOC	 =0></cfif>
<cfif form.apr20Institutional_Subtotal_HHU	 EQ "">	
    <cfset form.apr20Institutional_Subtotal_HHU	 =0></cfif>
<cfif form.apr20Other_PSH_Total	 EQ "">	
    <cfset form.apr20Other_PSH_Total	 =0></cfif>
<cfif form.apr20Other_PSH_HHNC	 EQ "">	
    <cfset form.apr20Other_PSH_HHNC	 =0></cfif>
<cfif form.apr20Other_PSH_HHWC	 EQ "">	
    <cfset form.apr20Other_PSH_HHWC	 =0></cfif>
<cfif form.apr20Other_PSH_HHOC	 EQ "">	
    <cfset form.apr20Other_PSH_HHOC	 =0></cfif>
<cfif form.apr20Other_PSH_HHU	 EQ "">	
    <cfset form.apr20Other_PSH_HHU	 =0></cfif>
<cfif form.apr20Other_OwnNoSub_Total	 EQ "">	
    <cfset form.apr20Other_OwnNoSub_Total	 =0></cfif>
<cfif form.apr20Other_OwnNoSub_HHNC	 EQ "">	
    <cfset form.apr20Other_OwnNoSub_HHNC	 =0></cfif>
<cfif form.apr20Other_OwnNoSub_HHWC	 EQ "">	
    <cfset form.apr20Other_OwnNoSub_HHWC	 =0></cfif>
<cfif form.apr20Other_OwnNoSub_HHOC	 EQ "">	
    <cfset form.apr20Other_OwnNoSub_HHOC	 =0></cfif>
<cfif form.apr20Other_OwnNoSub_HHU	 EQ "">	
    <cfset form.apr20Other_OwnNoSub_HHU	 =0></cfif>
<cfif form.apr20Other_OwnWithSub_Total	 EQ "">	
    <cfset form.apr20Other_OwnWithSub_Total	 =0></cfif>
<cfif form.apr20Other_OwnWithSub_HHNC	 EQ "">	
    <cfset form.apr20Other_OwnWithSub_HHNC	 =0></cfif>
<cfif form.apr20Other_OwnWithSub_HHWC	 EQ "">
    <cfset form.apr20Other_OwnWithSub_HHWC	 =0></cfif>
<cfif form.apr20Other_OwnWithSub_HHOC	 EQ "">	
    <cfset form.apr20Other_OwnWithSub_HHOC	 =0></cfif>
<cfif form.apr20Other_OwnWithSub_HHU	 EQ "">	
    <cfset form.apr20Other_OwnWithSub_HHU	 =0></cfif>
<cfif form.apr20Other_RentNoSub_Total	 EQ "">	
    <cfset form.apr20Other_RentNoSub_Total	 =0></cfif>
<cfif form.apr20Other_RentNoSub_HHNC	 EQ "">	
    <cfset form.apr20Other_RentNoSub_HHNC	 =0></cfif>
<cfif form.apr20Other_RentNoSub_HHWC	 EQ "">	
    <cfset form.apr20Other_RentNoSub_HHWC	 =0></cfif>
<cfif form.apr20Other_RentNoSub_HHOC	 EQ "">	
    <cfset form.apr20Other_RentNoSub_HHOC	 =0></cfif>
<cfif form.apr20Other_RentNoSub_HHU	 EQ "">	
    <cfset form.apr20Other_RentNoSub_HHU	 =0></cfif>
<cfif form.apr20Other_RentVetSub_Total	 EQ "">	
    <cfset form.apr20Other_RentVetSub_Total	 =0></cfif>
<cfif form.apr20Other_RentVetSub_HHNC	 EQ "">	
    <cfset form.apr20Other_RentVetSub_HHNC	 =0></cfif>
<cfif form.apr20Other_RentVetSub_HHWC	 EQ "">	
    <cfset form.apr20Other_RentVetSub_HHWC	 =0></cfif>
<cfif form.apr20Other_RentVetSub_HHOC	 EQ "">	
    <cfset form.apr20Other_RentVetSub_HHOC	 =0></cfif>
<cfif form.apr20Other_RentVetSub_HHU	 EQ "">	
    <cfset form.apr20Other_RentVetSub_HHU	 =0></cfif>
<cfif form.apr20Other_RentOtherSub_Total	 EQ "">	
    <cfset form.apr20Other_RentOtherSub_Total	 =0></cfif>
<cfif form.apr20Other_RentOtherSub_HHNC	 EQ "">	
    <cfset form.apr20Other_RentOtherSub_HHNC	 =0></cfif>
<cfif form.apr20Other_RentOtherSub_HHWC	 EQ "">	
    <cfset form.apr20Other_RentOtherSub_HHWC	 =0></cfif>
<cfif form.apr20Other_RentOtherSub_HHOC	 EQ "">	
    <cfset form.apr20Other_RentOtherSub_HHOC	 =0></cfif>
<cfif form.apr20Other_RentOtherSub_HHU	 EQ "">	
    <cfset form.apr20Other_RentOtherSub_HHU	 =0></cfif>
<cfif form.apr20Other_Hotel_Total	 EQ "">	
    <cfset form.apr20Other_Hotel_Total	 =0></cfif>
<cfif form.apr20Other_Hotel_HHNC	 EQ "">	
    <cfset form.apr20Other_Hotel_HHNC	 =0></cfif>
<cfif form.apr20Other_Hotel_HHWC	 EQ "">	
    <cfset form.apr20Other_Hotel_HHWC	 =0></cfif>
<cfif form.apr20Other_Hotel_HHOC	 EQ "">	
    <cfset form.apr20Other_Hotel_HHOC	 =0></cfif>
<cfif form.apr20Other_Hotel_HHU	 EQ "">	
    <cfset form.apr20Other_Hotel_HHU	 =0></cfif>
<cfif form.apr20Other_Family_Total	 EQ "">	
    <cfset form.apr20Other_Family_Total	 =0></cfif>
<cfif form.apr20Other_Family_HHNC	 EQ "">	
    <cfset form.apr20Other_Family_HHNC	 =0></cfif>
<cfif form.apr20Other_Family_HHWC	 EQ "">	
    <cfset form.apr20Other_Family_HHWC	 =0></cfif>
<cfif form.apr20Other_Family_HHOC	 EQ "">	
    <cfset form.apr20Other_Family_HHOC	 =0></cfif>
<cfif form.apr20Other_Family_HHU	 EQ "">	
    <cfset form.apr20Other_Family_HHU	 =0></cfif>
<cfif form.apr20Other_Friend_Total	 EQ "">	
    <cfset form.apr20Other_Friend_Total	 =0></cfif>
<cfif form.apr20Other_Friend_HHNC	 EQ "">	
    <cfset form.apr20Other_Friend_HHNC	 =0></cfif>
<cfif form.apr20Other_Friend_HHWC	 EQ "">	
    <cfset form.apr20Other_Friend_HHWC	 =0></cfif>
<cfif form.apr20Other_Friend_HHOC	 EQ "">	
    <cfset form.apr20Other_Friend_HHOC	 =0></cfif>
<cfif form.apr20Other_Friend_HHU	 EQ "">	
    <cfset form.apr20Other_Friend_HHU	 =0></cfif>
<cfif form.apr20Other_Other_Total	 EQ "">	
    <cfset form.apr20Other_Other_Total	 =0></cfif>
<cfif form.apr20Other_Other_HHNC	 EQ "">	
    <cfset form.apr20Other_Other_HHNC	 =0></cfif>
<cfif form.apr20Other_Other_HHWC	 EQ "">	
    <cfset form.apr20Other_Other_HHWC	 =0></cfif>
<cfif form.apr20Other_Other_HHOC	 EQ "">	
    <cfset form.apr20Other_Other_HHOC	 =0></cfif>
<cfif form.apr20Other_Other_HHU	 EQ "">	
    <cfset form.apr20Other_Other_HHU	 =0></cfif>
<cfif form.apr20Other_DKR_Total	 EQ "">	
    <cfset form.apr20Other_DKR_Total	 =0></cfif>
<cfif form.apr20Other_DKR_HHNC	 EQ "">	
    <cfset form.apr20Other_DKR_HHNC	 =0></cfif>
<cfif form.apr20Other_DKR_HHWC	 EQ "">	
    <cfset form.apr20Other_DKR_HHWC	 =0></cfif>
<cfif form.apr20Other_DKR_HHOC	 EQ "">	
    <cfset form.apr20Other_DKR_HHOC	 =0></cfif>
<cfif form.apr20Other_DKR_HHU	 EQ "">	
    <cfset form.apr20Other_DKR_HHU	 =0></cfif>
<cfif form.apr20Other_Missing_Total	 EQ "">	
    <cfset form.apr20Other_Missing_Total	 =0></cfif>
<cfif form.apr20Other_Missing_HHNC	 EQ "">	
    <cfset form.apr20Other_Missing_HHNC	 =0></cfif>
<cfif form.apr20Other_Missing_HHWC	 EQ "">	
    <cfset form.apr20Other_Missing_HHWC	 =0></cfif>
<cfif form.apr20Other_Missing_HHOC	 EQ "">	
    <cfset form.apr20Other_Missing_HHOC	 =0></cfif>
<cfif form.apr20Other_Missing_HHU	 EQ "">	
    <cfset form.apr20Other_Missing_HHU	 =0></cfif>
<cfif form.apr20Other_Subtotal	 EQ "">	
    <cfset form.apr20Other_Subtotal	 =0></cfif>
<cfif form.apr20Other_Subtotal_HHNC	 EQ "">	
    <cfset form.apr20Other_Subtotal_HHNC	 =0></cfif>
<cfif form.apr20Other_Subtotal_HHWC	 EQ "">	
    <cfset form.apr20Other_Subtotal_HHWC	 =0></cfif>
<cfif form.apr20Other_Subtotal_HHOC	 EQ "">	
    <cfset form.apr20Other_Subtotal_HHOC	 =0></cfif>
<cfif form.apr20Other_Subtotal_HHU	 EQ "">	
    <cfset form.apr20Other_Subtotal_HHU	 =0></cfif>
<cfif form.apr20_Total	 EQ "">	
    <cfset form.apr20_Total	 =0></cfif>
<cfif form.apr20_Total_HHNC	 EQ "">	
    <cfset form.apr20_Total_HHNC	 =0></cfif>
<cfif form.apr20_Total_HHWC	 EQ "">	
    <cfset form.apr20_Total_HHWC	 =0></cfif>
<cfif form.apr20_Total_HHOC	 EQ "">	
    <cfset form.apr20_Total_HHOC	 =0></cfif>
<cfif form.apr20_Total_HHU	 EQ "">	
    <cfset form.apr20_Total_HHU	 =0></cfif>
<!---/ Set defaults --->        
        
   <cfupdate datasource="#DataSource#" tablename="dataapr20" formfields="DataAPR20ID, aprID, inputUserID, projectID, reviewUserID, apr20Homeless_ES_Total, apr20Homeless_ES_HHNC, apr20Homeless_ES_HHWC, apr20Homeless_ES_HHOC, apr20Homeless_ES_HHU, apr20Homeless_TH_Total, apr20Homeless_TH_HHNC, apr20Homeless_TH_HHWC, apr20Homeless_TH_HHOC, apr20Homeless_TH_HHU, apr20Homeless_NMHH_Total, apr20Homeless_NMHH_HHNC, apr20Homeless_NMHH_HHWC, apr20Homeless_NMHH_HHOC, apr20Homeless_NMHH_HHU, apr20Homeless_SH_Total, apr20Homeless_SH_HHNC, apr20Homeless_SH_HHWC, apr20Homeless_SH_HHOC, apr20Homeless_SH_HHU, apr20Homeless_Subtotal, apr20Homeless_Subtotal_HHNC, apr20Homeless_Subtotal_HHWC, apr20Homeless_Subtotal_HHOC, apr20Homeless_Subtotal_HHU, apr20Institutional_PsychFacility_Total, apr20Institutional_PsychFacility_HHNC, apr20Institutional_PsychFacility_HHWC, apr20Institutional_PsychFacility_HHOC, apr20Institutional_PsychFacility_HHU, apr20Institutional_SA_Total, apr20Institutional_SA_HHNC, apr20Institutional_SA_HHWC, apr20Institutional_SA_HHOC, apr20Institutional_SA_HHU, apr20Institutional_Hospital_Total, apr20Institutional_Hospital_HHNC, apr20Institutional_Hospital_HHWC, apr20Institutional_Hospital_HHOC, apr20Institutional_Hospital_HHU, apr20Institutional_Jail_Total, apr20Institutional_Jail_HHNC, apr20Institutional_Jail_HHWC, apr20Institutional_Jail_HHOC, apr20Institutional_Jail_HHU, apr20Institutional_Foster_Total, apr20Institutional_Foster_HHNC, apr20Institutional_Foster_HHWC, apr20Institutional_Foster_HHOC, apr20Institutional_Foster_HHU, apr20Institutional_Subtotal, apr20Institutional_Subtotal_HHNC, apr20Institutional_Subtotal_HHWC, apr20Institutional_Subtotal_HHOC, apr20Institutional_Subtotal_HHU, apr20Other_PSH_Total, apr20Other_PSH_HHNC, apr20Other_PSH_HHWC, apr20Other_PSH_HHOC, apr20Other_PSH_HHU, apr20Other_OwnNoSub_Total, apr20Other_OwnNoSub_HHNC, apr20Other_OwnNoSub_HHWC, apr20Other_OwnNoSub_HHOC, apr20Other_OwnNoSub_HHU, apr20Other_OwnWithSub_Total, apr20Other_OwnWithSub_HHNC, apr20Other_OwnWithSub_HHWC, apr20Other_OwnWithSub_HHOC, apr20Other_OwnWithSub_HHU, apr20Other_RentNoSub_Total, apr20Other_RentNoSub_HHNC, apr20Other_RentNoSub_HHWC, apr20Other_RentNoSub_HHOC, apr20Other_RentNoSub_HHU, apr20Other_RentVetSub_Total, apr20Other_RentVetSub_HHNC, apr20Other_RentVetSub_HHWC, apr20Other_RentVetSub_HHOC, apr20Other_RentVetSub_HHU, apr20Other_RentOtherSub_Total, apr20Other_RentOtherSub_HHNC, apr20Other_RentOtherSub_HHWC, apr20Other_RentOtherSub_HHOC, apr20Other_RentOtherSub_HHU, apr20Other_Hotel_Total, apr20Other_Hotel_HHNC, apr20Other_Hotel_HHWC, apr20Other_Hotel_HHOC, apr20Other_Hotel_HHU, apr20Other_Family_Total, apr20Other_Family_HHNC, apr20Other_Family_HHWC, apr20Other_Family_HHOC, apr20Other_Family_HHU, apr20Other_Friend_Total, apr20Other_Friend_HHNC, apr20Other_Friend_HHWC, apr20Other_Friend_HHOC, apr20Other_Friend_HHU, apr20Other_Other_Total, apr20Other_Other_HHNC, apr20Other_Other_HHWC, apr20Other_Other_HHOC, apr20Other_Other_HHU, apr20Other_DKR_Total, apr20Other_DKR_HHNC, apr20Other_DKR_HHWC, apr20Other_DKR_HHOC, apr20Other_DKR_HHU, apr20Other_Missing_Total, apr20Other_Missing_HHNC, apr20Other_Missing_HHWC, apr20Other_Missing_HHOC, apr20Other_Missing_HHU, apr20Other_Subtotal, apr20Other_Subtotal_HHNC, apr20Other_Subtotal_HHWC, apr20Other_Subtotal_HHOC, apr20Other_Subtotal_HHU, apr20_Total, apr20_Total_HHNC, apr20_Total_HHWC, apr20_Total_HHOC, apr20_Total_HHU">
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
        Form = "dataapr20"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="20">
<cfset mathRows="25">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
    <h3>Q20a1. Residence Prior to Program Entry - Homeless Situations</h3>
    <h4>Number of Adults and Unaccompanied Children in Households</h4>
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>Emergency shelter</td>
          <td>
            <input type="number"
                   name="apr20Homeless_ES_Total"
                   value="#getDataAPR.apr20Homeless_ES_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col1 col16 BGLightGray"
                  id="sumR1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_ES_HHNC"
                   value="#getDataAPR.apr20Homeless_ES_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row1 col2 col17"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_ES_HHWC"
                   value="#getDataAPR.apr20Homeless_ES_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row1 col3 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_ES_HHOC"
                   value="#getDataAPR.apr20Homeless_ES_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row1 col4 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_ES_HHU"
                   value="#getDataAPR.apr20Homeless_ES_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row1 col5 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Transitional housing for homeless persons</td>
          <td>
            <input type="number"
                   name="apr20Homeless_TH_Total"
                   value="#getDataAPR.apr20Homeless_TH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col1 col16 BGLightGray"
                  id="sumR2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_TH_HHNC"
                   value="#getDataAPR.apr20Homeless_TH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row2 col2 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_TH_HHWC"
                   value="#getDataAPR.apr20Homeless_TH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row2 col3 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_TH_HHOC"
                   value="#getDataAPR.apr20Homeless_TH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row2 col4 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_TH_HHU"
                   value="#getDataAPR.apr20Homeless_TH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row2 col5 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Place not meant for human habitation</td>
          <td>
            <input type="number"
                   name="apr20Homeless_NMHH_Total"
                   value="#getDataAPR.apr20Homeless_NMHH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col1 col16 BGLightGray"
                  id="sumR3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_NMHH_HHNC"
                   value="#getDataAPR.apr20Homeless_NMHH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row3 col2 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_NMHH_HHWC"
                   value="#getDataAPR.apr20Homeless_NMHH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row3 col3 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_NMHH_HHOC"
                   value="#getDataAPR.apr20Homeless_NMHH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row3 col4 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_NMHH_HHU"
                   value="#getDataAPR.apr20Homeless_NMHH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row3 col5 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Safe Haven</td>
          <td>
            <input type="number"
                   name="apr20Homeless_SH_Total"
                   value="#getDataAPR.apr20Homeless_SH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col1 col16 BGLightGray"
                  id="sumR4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_SH_HHNC"
                   value="#getDataAPR.apr20Homeless_SH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row4 col2 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_SH_HHWC"
                   value="#getDataAPR.apr20Homeless_SH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row4 col3 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_SH_HHOC"
                   value="#getDataAPR.apr20Homeless_SH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row4 col4 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_SH_HHU"
                   value="#getDataAPR.apr20Homeless_SH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row4 col5 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Subtotal</b></td>
          <td>
            <input type="number"
                   name="apr20Homeless_Subtotal"
                   value="#getDataAPR.apr20Homeless_Subtotal#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="BGLightGray"
                  id="sumC1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_Subtotal_HHNC"
                   value="#getDataAPR.apr20Homeless_Subtotal_HHNC#"
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
                   name="apr20Homeless_Subtotal_HHWC"
                   value="#getDataAPR.apr20Homeless_Subtotal_HHWC#"
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
                   name="apr20Homeless_Subtotal_HHOC"
                   value="#getDataAPR.apr20Homeless_Subtotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="BGLightGray"
                  id="sumC4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Homeless_Subtotal_HHU"
                   value="#getDataAPR.apr20Homeless_Subtotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="BGLightGray"
                  id="sumC5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>


<div class="row">
  <div class="large-12 columns">
    <h3>Q20a2. Residence Prior to Program Entry - Institutional Settings</h3>
    <h4>Number of Adults and Unaccompanied Children in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>Psychiatric facility</td>
          <td>
            <input type="number"
                   name="apr20Institutional_PsychFacility_Total"
                   value="#getDataAPR.apr20Institutional_PsychFacility_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col6 col16 BGLightGray"
                  id="sumR5">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_PsychFacility_HHNC"
                   value="#getDataAPR.apr20Institutional_PsychFacility_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row5 col7 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_PsychFacility_HHWC"
                   value="#getDataAPR.apr20Institutional_PsychFacility_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row5 col8 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_PsychFacility_HHOC"
                   value="#getDataAPR.apr20Institutional_PsychFacility_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row5 col9 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_PsychFacility_HHU"
                   value="#getDataAPR.apr20Institutional_PsychFacility_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row5 col10 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Substance abuse or detox center</td>
          <td>
            <input type="number"
                   name="apr20Institutional_SA_Total"
                   value="#getDataAPR.apr20Institutional_SA_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col6 col16 BGLightGray"
                  id="sumR6">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_SA_HHNC"
                   value="#getDataAPR.apr20Institutional_SA_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row6 col7 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_SA_HHWC"
                   value="#getDataAPR.apr20Institutional_SA_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row6 col8 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_SA_HHOC"
                   value="#getDataAPR.apr20Institutional_SA_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row6 col9 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_SA_HHU"
                   value="#getDataAPR.apr20Institutional_SA_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row6 col10 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Hospital (non-psychiatric)</td>
          <td>
            <input type="number"
                   name="apr20Institutional_Hospital_Total"
                   value="#getDataAPR.apr20Institutional_Hospital_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col6 col16 BGLightGray"
                  id="sumR7">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Hospital_HHNC"
                   value="#getDataAPR.apr20Institutional_Hospital_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row7 col7 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Hospital_HHWC"
                   value="#getDataAPR.apr20Institutional_Hospital_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row7 col8 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Hospital_HHOC"
                   value="#getDataAPR.apr20Institutional_Hospital_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row7 col9 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Hospital_HHU"
                   value="#getDataAPR.apr20Institutional_Hospital_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row7 col10 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Jail, prison, or juvenile detention</td>
          <td>
            <input type="number"
                   name="apr20Institutional_Jail_Total"
                   value="#getDataAPR.apr20Institutional_Jail_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col6 col16 BGLightGray"
                  id="sumR8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Jail_HHNC"
                   value="#getDataAPR.apr20Institutional_Jail_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row8 col7 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Jail_HHWC"
                   value="#getDataAPR.apr20Institutional_Jail_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row8 col8 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Jail_HHOC"
                   value="#getDataAPR.apr20Institutional_Jail_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row8 col9 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Jail_HHU"
                   value="#getDataAPR.apr20Institutional_Jail_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row8 col10 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Foster care home or foster care group home</td>
          <td>
            <input type="number"
                   name="apr20Institutional_Foster_Total"
                   value="#getDataAPR.apr20Institutional_Foster_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                   readonly
                    class="col6 col16 BGLightGray"
                    id="sumR9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Foster_HHNC"
                   value="#getDataAPR.apr20Institutional_Foster_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row9 col7 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Foster_HHWC"
                   value="#getDataAPR.apr20Institutional_Foster_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row9 col8 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Foster_HHOC"
                   value="#getDataAPR.apr20Institutional_Foster_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row9 col9 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Foster_HHU"
                   value="#getDataAPR.apr20Institutional_Foster_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row9 col10  col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Subtotal</b></td>
          <td>
            <input type="number"
                   name="apr20Institutional_Subtotal"
                   value="#getDataAPR.apr20Institutional_Subtotal#"
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
                   name="apr20Institutional_Subtotal_HHNC"
                   value="#getDataAPR.apr20Institutional_Subtotal_HHNC#"
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
                   name="apr20Institutional_Subtotal_HHWC"
                   value="#getDataAPR.apr20Institutional_Subtotal_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                   readonly
                  class="BGLightGray"
                  id="sumC8">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Subtotal_HHOC"
                   value="#getDataAPR.apr20Institutional_Subtotal_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                   readonly
                  class="BGLightGray"
                  id="sumC9">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Institutional_Subtotal_HHU"
                   value="#getDataAPR.apr20Institutional_Subtotal_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="BGLightGray"
                  id="sumC10">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Q20a3. Residence Prior to Program Entry - Other Locations</h3>
    <h4>Number of Adults and Unaccompanied Children in Households</h4>
    <table width="100%">
      <thead>
        <th></th>
        <th>Total Persons</th>
        <th>Without Children</th>
        <th>With Children and Adults</th>
        <th>With Only Children</th>
        <th>Unknown Household Type</th>
      </thead>
      <tbody>
        <tr>
          <td>PSH for homeless persons</td>
          <td>
            <input type="number"
                   name="apr20Other_PSH_Total"
                   value="#getDataAPR.apr20Other_PSH_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col11 col16 BGLightGray"
                  id="sumR10">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_PSH_HHNC"
                   value="#getDataAPR.apr20Other_PSH_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row10 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_PSH_HHWC"
                   value="#getDataAPR.apr20Other_PSH_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row10 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_PSH_HHOC"
                   value="#getDataAPR.apr20Other_PSH_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row10 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_PSH_HHU"
                   value="#getDataAPR.apr20Other_PSH_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row10 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Owned by client, no subsidy</td>
         <td>
            <input type="number"
                   name="apr20Other_OwnNoSub_Total"
                   value="#getDataAPR.apr20Other_OwnNoSub_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col11 col16 BGLightGray"
                  id="sumR11">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnNoSub_HHNC"
                   value="#getDataAPR.apr20Other_OwnNoSub_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row11 col12 col17">
            <small class="form-error">Must be a whole number</small>
                      </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnNoSub_HHWC"
                   value="#getDataAPR.apr20Other_OwnNoSub_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row11 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnNoSub_HHOC"
                   value="#getDataAPR.apr20Other_OwnNoSub_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row11 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnNoSub_HHU"
                   value="#getDataAPR.apr20Other_OwnNoSub_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row11 col15 col20">
            <small class="form-error">Must be a whole number</small>
           </td>
        </tr>
        <tr>
          <td>Owned by client, with subsidy</td>
         <td>
            <input type="number"
                   name="apr20Other_OwnWithSub_Total"
                   value="#getDataAPR.apr20Other_OwnWithSub_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   readonly
                   class="col11 col16 BGLightGray"
                   id="sumR12">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnWithSub_HHNC"
                   value="#getDataAPR.apr20Other_OwnWithSub_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row12 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnWithSub_HHWC"
                   value="#getDataAPR.apr20Other_OwnWithSub_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row12 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnWithSub_HHOC"
                   value="#getDataAPR.apr20Other_OwnWithSub_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row12 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_OwnWithSub_HHU"
                   value="#getDataAPR.apr20Other_OwnWithSub_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row12 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Rental by client, no subsidy</td>
         <td>
            <input type="number"
                   name="apr20Other_RentNoSub_Total"
                   value="#getDataAPR.apr20Other_RentNoSub_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                   readonly
                  class="col11 col16 BGLightGray"
                  id="sumR13">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentNoSub_HHNC"
                   value="#getDataAPR.apr20Other_RentNoSub_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row13 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentNoSub_HHWC"
                   value="#getDataAPR.apr20Other_RentNoSub_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row13 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentNoSub_HHOC"
                   value="#getDataAPR.apr20Other_RentNoSub_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row13 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentNoSub_HHU"
                   value="#getDataAPR.apr20Other_RentNoSub_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row13 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Rental by client, with VASH subsidy</td>
          <td>
              <input type="number"
                     name="apr20Other_RentVetSub_Total"
                     value="#getDataAPR.apr20Other_RentVetSub_Total#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11" 
                    readonly
                    class="col11 col16 BGLightGray"
                    id="sumR14">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_RentVetSub_HHNC"
                     value="#getDataAPR.apr20Other_RentVetSub_HHNC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row14 col12 col17">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_RentVetSub_HHWC"
                     value="#getDataAPR.apr20Other_RentVetSub_HHWC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row14 col13 col18">
              <small class="form-error">Must be a whole number</small>
                        </td>
          <td>
              <input type="number"
                     name="apr20Other_RentVetSub_HHOC"
                     value="#getDataAPR.apr20Other_RentVetSub_HHOC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row14 col14 col19">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_RentVetSub_HHU"
                     value="#getDataAPR.apr20Other_RentVetSub_HHU#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row14 col15 col20">
              <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Rental by client with other subsidy</td>
         <td>
            <input type="number"
                   name="apr20Other_RentOtherSub_Total"
                   value="#getDataAPR.apr20Other_RentOtherSub_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col11 col16 BGLightGray"
                  id="sumR15">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentOtherSub_HHNC"
                   value="#getDataAPR.apr20Other_RentOtherSub_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row15 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentOtherSub_HHWC"
                   value="#getDataAPR.apr20Other_RentOtherSub_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row15 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentOtherSub_HHOC"
                   value="#getDataAPR.apr20Other_RentOtherSub_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row15 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_RentOtherSub_HHU"
                   value="#getDataAPR.apr20Other_RentOtherSub_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row15 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Hotel/Motel, paid by client</td>
          <td>
              <input type="number"
                     name="apr20Other_Hotel_Total"
                     value="#getDataAPR.apr20Other_Hotel_Total#"
                     placeholder="0"
                     min="0"
                   step="1"
                    maxlength="11" 
                    readonly
                    class="col11 col16 BGLightGray"
                    id="sumR16">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Hotel_HHNC"
                     value="#getDataAPR.apr20Other_Hotel_HHNC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row16 col12 col17">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Hotel_HHWC"
                     value="#getDataAPR.apr20Other_Hotel_HHWC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row16 col13 col18">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Hotel_HHOC"
                     value="#getDataAPR.apr20Other_Hotel_HHOC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row16 col14 col19">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Hotel_HHU"
                     value="#getDataAPR.apr20Other_Hotel_HHU#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row16 col15 col20">
              <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Staying or living with family</td>
          <td>
            <input type="number"
                   name="apr20Other_Family_Total"
                   value="#getDataAPR.apr20Other_Family_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   readonly
                   class="col11 col16 BGLightGray"
                   id="sumR17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Family_HHNC"
                   value="#getDataAPR.apr20Other_Family_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row17 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Family_HHWC"
                   value="#getDataAPR.apr20Other_Family_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row17 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Family_HHOC"
                   value="#getDataAPR.apr20Other_Family_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row17 col14 col19">
            <small class="form-error">This field is requried</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Family_HHU"
                   value="#getDataAPR.apr20Other_Family_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row17 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Staying or living with friend(s)</td>
         <td>
              <input type="number"
                     name="apr20Other_Friend_Total"
                     value="#getDataAPR.apr20Other_Friend_Total#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     readonly
                     class="col11 col16 BGLightGray"
                     id="sumR18">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Friend_HHNC"
                     value="#getDataAPR.apr20Other_Friend_HHNC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row18 col12 col17">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Friend_HHWC"
                     value="#getDataAPR.apr20Other_Friend_HHWC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row18 col13 col18">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Friend_HHOC"
                     value="#getDataAPR.apr20Other_Friend_HHOC#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row18 col14 col19">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                     name="apr20Other_Friend_HHU"
                     value="#getDataAPR.apr20Other_Friend_HHU#"
                     placeholder="0"
                     min="0"
                   step="1"
                     maxlength="11" 
                     tabindex="#nexttab++#"
                     class="row18 col15 col20">
              <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Other</td>
          <td>
            <input type="number"
                   name="apr20Other_Other_Total"
                   value="#getDataAPR.apr20Other_Other_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11" 
                  readonly
                  class="col11 col16 BGLightGray"
                  id="sumR19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Other_HHNC"
                   value="#getDataAPR.apr20Other_Other_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row19 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Other_HHWC"
                   value="#getDataAPR.apr20Other_Other_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row19 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Other_HHOC"
                   value="#getDataAPR.apr20Other_Other_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row19 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Other_HHU"
                   value="#getDataAPR.apr20Other_Other_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row19 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Don't Know/Refused</td>
        <td>
            <input type="number"
                   name="apr20Other_DKR_Total"
                   value="#getDataAPR.apr20Other_DKR_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   readonly
                   class="col11 col16 BGLightGray"
                   id="sumR20">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_DKR_HHNC"
                   value="#getDataAPR.apr20Other_DKR_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row20 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_DKR_HHWC"
                   value="#getDataAPR.apr20Other_DKR_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row20 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_DKR_HHOC"
                   value="#getDataAPR.apr20Other_DKR_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row20 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_DKR_HHU"
                   value="#getDataAPR.apr20Other_DKR_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row20 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>Information Missing</td>
          <td>
            <input type="number"
                   name="apr20Other_Missing_Total"
                   value="#getDataAPR.apr20Other_Missing_Total#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   readonly
                   class="col11 col16 BGLightGray"
                   id="sumR21">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Missing_HHNC"
                   value="#getDataAPR.apr20Other_Missing_HHNC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row21 col12 col17">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Missing_HHWC"
                   value="#getDataAPR.apr20Other_Missing_HHWC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row21 col13 col18">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Missing_HHOC"
                   value="#getDataAPR.apr20Other_Missing_HHOC#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row21 col14 col19">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr20Other_Missing_HHU"
                   value="#getDataAPR.apr20Other_Missing_HHU#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11" 
                   tabindex="#nexttab++#"
                   class="row21 col15 col20">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Subtotal</b></td>
         <td>
          <input type="number"
                 name="apr20Other_Subtotal"
                 value="#getDataAPR.apr20Other_Subtotal#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11" 
                 readonly
                 class="BGLightGray"
                 id="sumC11">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20Other_Subtotal_HHNC"
                 value="#getDataAPR.apr20Other_Subtotal_HHNC#"
                 placeholder="0"
                 min="0"
                   step="1"
                 maxlength="11" 
                 readonly
                 class="BGLightGray"
                 id="sumC12">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20Other_Subtotal_HHWC"
                 value="#getDataAPR.apr20Other_Subtotal_HHWC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="BGLightGray"
                id="sumC13">
          <small class="form-error">Must be a whole number</small>
          <td>
          <input type="number"
                 name="apr20Other_Subtotal_HHOC"
                 value="#getDataAPR.apr20Other_Subtotal_HHOC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="BGLightGray"
                id="sumC14">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20Other_Subtotal_HHU"
                 value="#getDataAPR.apr20Other_Subtotal_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                 readonly
                class="BGLightGray"
                id="sumC15">
          <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td><b>Total - 20a1, 20a2 and 20a3</b></td>
         <td>
          <input type="number"
                 name="apr20_Total"
                 value="#getDataAPR.apr20_Total#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="subtotal_persons BGLightGray"
                id="sumC16">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20_Total_HHNC"
                 value="#getDataAPR.apr20_Total_HHNC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="BGLightGray"
                id="sumC17">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20_Total_HHWC"
                 value="#getDataAPR.apr20_Total_HHWC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="BGLightGray"
                id="sumC18">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20_Total_HHOC"
                 value="#getDataAPR.apr20_Total_HHOC#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="subtotal_children BGLightGray"
                id="sumC19">
          <small class="form-error">Must be a whole number</small>
          </td>
          <td>
          <input type="number"
                 name="apr20_Total_HHU"
                 value="#getDataAPR.apr20_Total_HHU#"
                 placeholder="0"
                 min="0"
                   step="1"
                maxlength="11" 
                readonly
                class="BGLightGray"
                id="sumC20">
          <small class="form-error">Must be a whole number</small>
                    </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
</cfoutput>