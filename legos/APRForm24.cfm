<!--- Set Variables --->
<cfset TargetTable = "DataAPR24">
<cfset UniqueID = "DataAPR24ID">
<!---/ Set Variables --->

<!--- New Check --->
<!--- Get ID --->
<cfinvoke component="knex.aprData" 
        method="newCheck"
        DataSource = "#DataSource#"
        returnVariable = "newCheck"
        FormID = "DataAPR24ID"
        Form = "dataapr24">
<!---/ Get ID --->

<cfif newCheck.RecordCount EQ 0>
  <cfset newRecord = 1>
<cfelse>
  <cfset newRecord = 0>
</cfif>
<!---/ New Check --->

<!--- Process Forms --->
<cfif FORM.action EQ "process" AND FORM.goldenTicket EQ SESSION.goldenTicket>
	<cfset FORM.apr24Stayers_AvgChangeEarned_Lost = NumberFormat(FORM.apr24Stayers_AvgChangeEarned_Lost,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeEarned_Less = NumberFormat(FORM.apr24Stayers_AvgChangeEarned_Less,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeEarned_More = NumberFormat(FORM.apr24Stayers_AvgChangeEarned_More,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeEarned_Gained = NumberFormat(FORM.apr24Stayers_AvgChangeEarned_Gained,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeEarned_AvgGain = NumberFormat(FORM.apr24Stayers_AvgChangeEarned_AvgGain,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOther_Gained = NumberFormat(FORM.apr24Stayers_AvgChangeOther_Gained,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOther_AvgGain = NumberFormat(FORM.apr24Stayers_AvgChangeOther_AvgGain,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOverall_Lost = NumberFormat(FORM.apr24Stayers_AvgChangeOverall_Lost,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOverall_Less = NumberFormat(FORM.apr24Stayers_AvgChangeOverall_Less,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOverall_More = NumberFormat(FORM.apr24Stayers_AvgChangeOverall_More,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOverall_Gained = NumberFormat(FORM.apr24Stayers_AvgChangeOverall_Gained,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOverall_AvgGain = NumberFormat(FORM.apr24Stayers_AvgChangeOverall_AvgGain,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeEarned_Lost = NumberFormat(FORM.apr24Leavers_AvgChangeEarned_Lost,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeEarned_Less = NumberFormat(FORM.apr24Leavers_AvgChangeEarned_Less,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeEarned_More = NumberFormat(FORM.apr24Leavers_AvgChangeEarned_More,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeEarned_Gained = NumberFormat(FORM.apr24Leavers_AvgChangeEarned_Gained,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeEarned_AvgGain = NumberFormat(FORM.apr24Leavers_AvgChangeEarned_AvgGain,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOther_Lost = NumberFormat(FORM.apr24Leavers_AvgChangeOther_Lost,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOther_Less = NumberFormat(FORM.apr24Leavers_AvgChangeOther_Less,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOther_More = NumberFormat(FORM.apr24Leavers_AvgChangeOther_More,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOther_Gained = NumberFormat(FORM.apr24Leavers_AvgChangeOther_Gained,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOther_AvgGain = NumberFormat(FORM.apr24Leavers_AvgChangeOther_AvgGain,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOverall_Lost = NumberFormat(FORM.apr24Leavers_AvgChangeOverall_Lost,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOverall_Less = NumberFormat(FORM.apr24Leavers_AvgChangeOverall_Less,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOverall_More = NumberFormat(FORM.apr24Leavers_AvgChangeOverall_More,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOverall_Gained = NumberFormat(FORM.apr24Leavers_AvgChangeOverall_Gained,"0.00")>
<cfset FORM.apr24Leavers_AvgChangeOverall_AvgGain = NumberFormat(FORM.apr24Leavers_AvgChangeOverall_AvgGain,"0.00")>
<cfset FORM.apr24Both_AvgChangeEarned_Lost = NumberFormat(FORM.apr24Both_AvgChangeEarned_Lost,"0.00")>
<cfset FORM.apr24Both_AvgChangeEarned_Less = NumberFormat(FORM.apr24Both_AvgChangeEarned_Less,"0.00")>
<cfset FORM.apr24Both_AvgChangeEarned_More = NumberFormat(FORM.apr24Both_AvgChangeEarned_More,"0.00")>
<cfset FORM.apr24Both_AvgChangeEarned_Gained = NumberFormat(FORM.apr24Both_AvgChangeEarned_Gained,"0.00")>
<cfset FORM.apr24Both_AvgChangeEarned_AvgGain = NumberFormat(FORM.apr24Both_AvgChangeEarned_AvgGain,"0.00")>
<cfset FORM.apr24Both_AvgChangeOther_Lost = NumberFormat(FORM.apr24Both_AvgChangeOther_Lost,"0.00")>
<cfset FORM.apr24Both_AvgChangeOther_Less = NumberFormat(FORM.apr24Both_AvgChangeOther_Less,"0.00")>
<cfset FORM.apr24Stayers_AvgChangeOther_Less = NumberFormat(FORM.apr24Stayers_AvgChangeOther_Less,"0.00")>
<cfset FORM.apr24Both_AvgChangeOther_AvgGain = NumberFormat(FORM.apr24Both_AvgChangeOther_AvgGain,"0.00")>
<cfset FORM.apr24Both_AvgChangeOverall_Lost = NumberFormat(FORM.apr24Both_AvgChangeOverall_Lost,"0.00")>
<cfset FORM.apr24Both_AvgChangeOverall_Less = NumberFormat(FORM.apr24Both_AvgChangeOverall_Less,"0.00")>
<cfset FORM.apr24Both_AvgChangeOverall_More = NumberFormat(FORM.apr24Both_AvgChangeOverall_More,"0.00")>
<cfset FORM.apr24Both_AvgChangeOverall_Gained = NumberFormat(FORM.apr24Both_AvgChangeOverall_Gained,"0.00")>
<cfset FORM.apr24Both_AvgChangeOverall_AvgGain = NumberFormat(FORM.apr24Both_AvgChangeOverall_AvgGain,"0.00")>
  <cfif newRecord EQ 1>
<cfset FORM.apr24Stayers_AvgChangeEarned_Lost = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_Lost)> <cfset FORM.apr24Stayers_AvgChangeEarned_Less = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_Less)> <cfset FORM.apr24Stayers_AvgChangeEarned_More = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_More)> <cfset FORM.apr24Stayers_AvgChangeEarned_Gained = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_Gained)> <cfset FORM.apr24Stayers_AvgChangeOther_Lost = LSParseCurrency(FORM.apr24Stayers_AvgChangeOther_Lost)> <cfset FORM.apr24Stayers_NumOverall_Total = LSParseCurrency(FORM.apr24Stayers_NumOverall_Total)> <cfset FORM.apr24Stayers_AvgChangeOverall_Lost = LSParseCurrency(FORM.apr24Stayers_AvgChangeOverall_Lost)> <cfset FORM.apr24Stayers_AvgChangeOverall_Less = LSParseCurrency(FORM.apr24Stayers_AvgChangeOverall_Less)> <cfset FORM.apr24Leavers_AvgChangeEarned_Lost = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_Lost)> <cfset FORM.apr24Leavers_AvgChangeEarned_Less = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_Less)> <cfset FORM.apr24Leavers_AvgChangeEarned_More = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_More)> <cfset FORM.apr24Leavers_AvgChangeEarned_Gained = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_Gained)> <cfset FORM.apr24Leavers_AvgChangeOther_Lost = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_Lost)> <cfset FORM.apr24Leavers_AvgChangeOther_Less = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_Less)> <cfset FORM.apr24Leavers_AvgChangeOther_More = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_More)> <cfset FORM.apr24Leavers_AvgChangeOther_Gained = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_Gained)> <cfset FORM.apr24Leavers_AvgChangeOverall_Lost = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_Lost)> <cfset FORM.apr24Leavers_AvgChangeOverall_Less = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_Less)> <cfset FORM.apr24Leavers_AvgChangeOverall_More = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_More)> <cfset FORM.apr24Leavers_AvgChangeOverall_Gained = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_Gained)> <cfset FORM.apr24Both_AvgChangeEarned_Lost = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_Lost)> <cfset FORM.apr24Both_AvgChangeEarned_Less = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_Less)> <cfset FORM.apr24Both_AvgChangeEarned_More = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_More)> <cfset FORM.apr24Both_AvgChangeEarned_Gained = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_Gained)> <cfset FORM.apr24Both_AvgChangeOther_Lost = LSParseCurrency(FORM.apr24Both_AvgChangeOther_Lost)> <cfset FORM.apr24Both_AvgChangeOther_Less = LSParseCurrency(FORM.apr24Both_AvgChangeOther_Less)> <cfset FORM.apr24Stayers_AvgChangeOther_Less = LSParseCurrency(FORM.apr24Stayers_AvgChangeOther_Less)> <cfset FORM.apr24Both_AvgChangeOverall_Lost = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_Lost)> <cfset FORM.apr24Both_AvgChangeOverall_Less = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_Less)> <cfset FORM.apr24Both_AvgChangeOverall_More = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_More)> <cfset FORM.apr24Both_AvgChangeOverall_Gained = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_Gained)>

<cfinsert datasource="#DataSource#" tablename="dataapr24" formfields="aprID, inputUserID, projectID, reviewUserID, apr24_Earned_Entry, apr24_Earned_FollowUp, apr24_Earned_Exit, apr24_Other_Entry, apr24_Other_FollowUp, apr24_Other_Exit, apr24_Both_Entry, apr24_Both_FollowUp, apr24_Both_Exit, apr24_NoInc_Entry, apr24_NoInc_FollowUp, apr24_NoInc_Exit, apr24_DKR_Entry, apr24_DKR_FollowUp, apr24_DKR_Exit, apr24_Missing_Entry, apr24_Missing_FollowUp, apr24_Missing_Exit, apr24_Total_Entry, apr24_Total_FollowUp, apr24_Total_Exit, apr24_Total_Stayers, apr24_Total_Leavers, apr24Stayers_NumEarned_Lost, apr24Stayers_NumEarned_Less, apr24Stayers_NumEarned_Same, apr24Stayers_NumEarned_More, apr24Stayers_NumEarned_Gained, apr24Stayers_NumEarned_Never, apr24Stayers_NumEarned_Total, apr24Stayers_NumEarned_AvgGain, apr24Stayers_AvgChangeEarned_Lost, apr24Stayers_AvgChangeEarned_Less, apr24Stayers_AvgChangeEarned_More, apr24Stayers_AvgChangeEarned_Gained, apr24Stayers_AvgChangeEarned_AvgGain, apr24Stayers_NumOther_Lost, apr24Stayers_NumOther_Less, apr24Stayers_NumOther_Same, apr24Stayers_NumOther_More, apr24Stayers_NumOther_Gained, apr24Stayers_NumOther_Never, apr24Stayers_NumOther_Total, apr24Stayers_NumOther_AvgGain, apr24Stayers_AvgChangeOther_Gained, apr24Stayers_AvgChangeOther_AvgGain, apr24Stayers_NumOverall_Lost, apr24Stayers_NumOverall_Same, apr24Stayers_NumOverall_More, apr24Stayers_NumOverall_Gained, apr24Stayers_NumOverall_Never, apr24Stayers_NumOverall_Total, apr24Stayers_NumOverall_AvgGain, apr24Stayers_AvgChangeOverall_Lost, apr24Stayers_AvgChangeOverall_Less, apr24Stayers_AvgChangeOverall_More, apr24Stayers_AvgChangeOverall_Gained, apr24Stayers_AvgChangeOverall_AvgGain, apr24Leavers_NumEarned_Lost, apr24Leavers_NumEarned_Less, apr24Leavers_NumEarned_Same, apr24Leavers_NumEarned_More, apr24Leavers_NumEarned_Gained, apr24Leavers_NumEarned_Never, apr24Leavers_NumEarned_Total, apr24Leavers_AvgChangeEarned_Lost, apr24Leavers_AvgChangeEarned_Less, apr24Leavers_AvgChangeEarned_More, apr24Leavers_AvgChangeEarned_Gained, apr24Leavers_AvgChangeEarned_AvgGain, apr24Leavers_NumOther_Lost, apr24Leavers_NumOther_Less, apr24Leavers_NumOther_Same, apr24Leavers_NumOther_More, apr24Leavers_NumOther_Gained, apr24Leavers_NumOther_Never, apr24Leavers_NumOther_Total, apr24Leavers_NumOther_AvgGain, apr24Leavers_AvgChangeOther_Lost, apr24Leavers_AvgChangeOther_Less, apr24Leavers_AvgChangeOther_More, apr24Leavers_AvgChangeOther_Gained, apr24Leavers_AvgChangeOther_AvgGain, apr24Leavers_NumOverall_Lost, apr24Leavers_NumOverall_Less, apr24Leavers_NumOverall_Same, apr24Leavers_NumOverall_More, apr24Leavers_NumOverall_Gained, apr24Leavers_NumOverall_Never, apr24Leavers_NumOverall_Total, apr24Leavers_NumOverall_AvgGain, apr24Leavers_AvgChangeOverall_Lost, apr24Leavers_AvgChangeOverall_Less, apr24Leavers_AvgChangeOverall_More, apr24Leavers_AvgChangeOverall_Gained, apr24Leavers_AvgChangeOverall_AvgGain, apr24Both_NumEarned_Lost, apr24Both_NumEarned_Less, apr24Both_NumEarned_Same, apr24Both_NumEarned_More, apr24Both_NumEarned_Gained, apr24Both_NumEarned_Never, apr24Both_NumEarned_Total, apr24Both_NumEarned_AvgGain, apr24Both_AvgChangeEarned_Lost, apr24Both_AvgChangeEarned_Less, apr24Both_AvgChangeEarned_More, apr24Both_AvgChangeEarned_Gained, apr24Both_AvgChangeEarned_AvgGain, apr24Both_NumOther_Lost, apr24Both_NumOther_Less, apr24Both_NumOther_Same, apr24Both_NumOther_More, apr24Both_NumOther_Gained, apr24Both_NumOther_Never, apr24Both_NumOther_Total, apr24Both_NumOther_AvgGain, apr24Both_AvgChangeOther_Lost, apr24Both_AvgChangeOther_Less, apr24Stayers_AvgChangeOther_Less, apr24Both_AvgChangeOther_AvgGain, apr24Both_NumOverall_Lost, apr24Both_NumOverall_Less, apr24Both_NumOverall_Same, apr24Both_NumOverall_More, apr24Both_NumOverall_Gained, apr24Both_NumOverall_Never, apr24Both_NumOverall_Total, apr24Both_NumOverall_AvgGain, apr24Both_AvgChangeOverall_Lost, apr24Both_AvgChangeOverall_Less, apr24Both_AvgChangeOverall_More, apr24Both_AvgChangeOverall_Gained, apr24Both_AvgChangeOverall_AvgGain, apr24Stayers_NumOverall_Less, apr24Leavers_NumEarned_AvgGain, apr24Both_AvgChangeOther_More, apr24Both_AvgChangeOther_Gained, apr24Stayers_AvgChangeOther_Lost, apr24Stayers_AvgChangeOther_More">
  <cfelse>
    <cfset FORM.DataAPR24ID = newCheck.DataAPR24ID>
<cfset FORM.apr24Stayers_AvgChangeEarned_Lost = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_Lost)> <cfset FORM.apr24Stayers_AvgChangeEarned_Less = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_Less)> <cfset FORM.apr24Stayers_AvgChangeEarned_More = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_More)> <cfset FORM.apr24Stayers_AvgChangeEarned_Gained = LSParseCurrency(FORM.apr24Stayers_AvgChangeEarned_Gained)> <cfset FORM.apr24Stayers_AvgChangeOther_Lost = LSParseCurrency(FORM.apr24Stayers_AvgChangeOther_Lost)> <cfset FORM.apr24Stayers_NumOverall_Total = LSParseCurrency(FORM.apr24Stayers_NumOverall_Total)> <cfset FORM.apr24Stayers_AvgChangeOverall_Lost = LSParseCurrency(FORM.apr24Stayers_AvgChangeOverall_Lost)> <cfset FORM.apr24Stayers_AvgChangeOverall_Less = LSParseCurrency(FORM.apr24Stayers_AvgChangeOverall_Less)> <cfset FORM.apr24Leavers_AvgChangeEarned_Lost = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_Lost)> <cfset FORM.apr24Leavers_AvgChangeEarned_Less = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_Less)> <cfset FORM.apr24Leavers_AvgChangeEarned_More = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_More)> <cfset FORM.apr24Leavers_AvgChangeEarned_Gained = LSParseCurrency(FORM.apr24Leavers_AvgChangeEarned_Gained)> <cfset FORM.apr24Leavers_AvgChangeOther_Lost = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_Lost)> <cfset FORM.apr24Leavers_AvgChangeOther_Less = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_Less)> <cfset FORM.apr24Leavers_AvgChangeOther_More = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_More)> <cfset FORM.apr24Leavers_AvgChangeOther_Gained = LSParseCurrency(FORM.apr24Leavers_AvgChangeOther_Gained)> <cfset FORM.apr24Leavers_AvgChangeOverall_Lost = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_Lost)> <cfset FORM.apr24Leavers_AvgChangeOverall_Less = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_Less)> <cfset FORM.apr24Leavers_AvgChangeOverall_More = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_More)> <cfset FORM.apr24Leavers_AvgChangeOverall_Gained = LSParseCurrency(FORM.apr24Leavers_AvgChangeOverall_Gained)> <cfset FORM.apr24Both_AvgChangeEarned_Lost = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_Lost)> <cfset FORM.apr24Both_AvgChangeEarned_Less = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_Less)> <cfset FORM.apr24Both_AvgChangeEarned_More = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_More)> <cfset FORM.apr24Both_AvgChangeEarned_Gained = LSParseCurrency(FORM.apr24Both_AvgChangeEarned_Gained)> <cfset FORM.apr24Both_AvgChangeOther_Lost = LSParseCurrency(FORM.apr24Both_AvgChangeOther_Lost)> <cfset FORM.apr24Both_AvgChangeOther_Less = LSParseCurrency(FORM.apr24Both_AvgChangeOther_Less)> <cfset FORM.apr24Stayers_AvgChangeOther_Less = LSParseCurrency(FORM.apr24Stayers_AvgChangeOther_Less)> <cfset FORM.apr24Both_AvgChangeOverall_Lost = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_Lost)> <cfset FORM.apr24Both_AvgChangeOverall_Less = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_Less)> <cfset FORM.apr24Both_AvgChangeOverall_More = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_More)> <cfset FORM.apr24Both_AvgChangeOverall_Gained = LSParseCurrency(FORM.apr24Both_AvgChangeOverall_Gained)>

<!--- Set Defaults --->    
<cfif form.apr24_Earned_Entry	 EQ "">	
    <cfset form.apr24_Earned_Entry	 =0></cfif>
<cfif form.apr24_Earned_FollowUp	 EQ "">	
    <cfset form.apr24_Earned_FollowUp	 =0></cfif>
<cfif form.apr24_Earned_Exit	 EQ "">	
    <cfset form.apr24_Earned_Exit	 =0></cfif>
<cfif form.apr24_Other_Entry	 EQ "">	
    <cfset form.apr24_Other_Entry	 =0></cfif>
<cfif form.apr24_Other_FollowUp	 EQ "">	
    <cfset form.apr24_Other_FollowUp	 =0></cfif>
<cfif form.apr24_Other_Exit	 EQ "">	
    <cfset form.apr24_Other_Exit	 =0></cfif>
<cfif form.apr24_Both_Entry	 EQ "">	
    <cfset form.apr24_Both_Entry	 =0></cfif>
<cfif form.apr24_Both_FollowUp	 EQ "">	
    <cfset form.apr24_Both_FollowUp	 =0></cfif>
<cfif form.apr24_Both_Exit	 EQ "">	
    <cfset form.apr24_Both_Exit	 =0></cfif>
<cfif form.apr24_NoInc_Entry	 EQ "">	
    <cfset form.apr24_NoInc_Entry	 =0></cfif>
<cfif form.apr24_NoInc_FollowUp	 EQ "">	
    <cfset form.apr24_NoInc_FollowUp	 =0></cfif>
<cfif form.apr24_NoInc_Exit	 EQ "">	
    <cfset form.apr24_NoInc_Exit	 =0></cfif>
<cfif form.apr24_DKR_Entry	 EQ "">	
    <cfset form.apr24_DKR_Entry	 =0></cfif>
<cfif form.apr24_DKR_FollowUp	 EQ "">	
    <cfset form.apr24_DKR_FollowUp	 =0></cfif>
<cfif form.apr24_DKR_Exit	 EQ "">	
    <cfset form.apr24_DKR_Exit	 =0></cfif>
<cfif form.apr24_Missing_Entry	 EQ "">	
    <cfset form.apr24_Missing_Entry	 =0></cfif>
<cfif form.apr24_Missing_FollowUp	 EQ "">	
    <cfset form.apr24_Missing_FollowUp	 =0></cfif>
<cfif form.apr24_Missing_Exit	 EQ "">	
    <cfset form.apr24_Missing_Exit	 =0></cfif>
<cfif form.apr24_Total_Entry	 EQ "">	
    <cfset form.apr24_Total_Entry	 =0></cfif>
<cfif form.apr24_Total_FollowUp	 EQ "">	
    <cfset form.apr24_Total_FollowUp	 =0></cfif>
<cfif form.apr24_Total_Exit	 EQ "">	
    <cfset form.apr24_Total_Exit	 =0></cfif>
<cfif form.apr24_Total_Stayers	 EQ "">	
    <cfset form.apr24_Total_Stayers	 =0></cfif>
<cfif form.apr24_Total_Leavers	 EQ "">	
    <cfset form.apr24_Total_Leavers	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_Lost	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_Lost	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_Less	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_Less	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_Same	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_Same	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_More	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_More	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_Gained	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_Gained	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_Never	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_Never	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_Total	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_Total	 =0></cfif>
<cfif form.apr24Stayers_NumEarned_AvgGain	 EQ "">	
    <cfset form.apr24Stayers_NumEarned_AvgGain	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeEarned_Lost	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeEarned_Lost	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeEarned_Less	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeEarned_Less	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeEarned_More	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeEarned_More	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeEarned_Gained	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeEarned_Gained	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeEarned_AvgGain	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeEarned_AvgGain	 =0></cfif>
<cfif form.apr24Stayers_NumOther_Lost	 EQ "">	
    <cfset form.apr24Stayers_NumOther_Lost	 =0></cfif>
<cfif form.apr24Stayers_NumOther_Less	 EQ "">	
    <cfset form.apr24Stayers_NumOther_Less	 =0></cfif>
<cfif form.apr24Stayers_NumOther_Same	 EQ "">	
    <cfset form.apr24Stayers_NumOther_Same	 =0></cfif>
<cfif form.apr24Stayers_NumOther_More	 EQ "">	
    <cfset form.apr24Stayers_NumOther_More	 =0></cfif>
<cfif form.apr24Stayers_NumOther_Gained	 EQ "">	
    <cfset form.apr24Stayers_NumOther_Gained	 =0></cfif>
<cfif form.apr24Stayers_NumOther_Never	 EQ "">	
    <cfset form.apr24Stayers_NumOther_Never	 =0></cfif>
<cfif form.apr24Stayers_NumOther_Total	 EQ "">	
    <cfset form.apr24Stayers_NumOther_Total	 =0></cfif>
<cfif form.apr24Stayers_NumOther_AvgGain	 EQ "">	
    <cfset form.apr24Stayers_NumOther_AvgGain	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOther_Lost	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOther_Lost	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOther_Gained	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOther_Gained	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOther_AvgGain	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOther_AvgGain	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_Lost	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_Lost	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_Same	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_Same	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_More	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_More	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_Gained	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_Gained	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_Never	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_Never	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_Total	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_Total	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_AvgGain	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_AvgGain	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOverall_Lost	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOverall_Lost	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOverall_Less	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOverall_Less	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOverall_More	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOverall_More	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOverall_Gained	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOverall_Gained	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOverall_AvgGain	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOverall_AvgGain	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_Lost	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_Lost	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_Less	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_Less	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_Same	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_Same	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_More	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_More	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_Gained	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_Gained	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_Never	 EQ "">	
<cfset form.apr24Leavers_NumEarned_Never	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_Total	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_Total	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeEarned_Lost	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeEarned_Lost	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeEarned_Less	 EQ "">	
<cfset form.apr24Leavers_AvgChangeEarned_Less	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeEarned_More	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeEarned_More	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeEarned_Gained	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeEarned_Gained	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeEarned_AvgGain	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeEarned_AvgGain	 =0></cfif>
<cfif form.apr24Leavers_NumOther_Lost	 EQ "">	
    <cfset form.apr24Leavers_NumOther_Lost	 =0></cfif>
<cfif form.apr24Leavers_NumOther_Less	 EQ "">	
    <cfset form.apr24Leavers_NumOther_Less	 =0></cfif>
<cfif form.apr24Leavers_NumOther_Same	 EQ "">	
    <cfset form.apr24Leavers_NumOther_Same	 =0></cfif>
<cfif form.apr24Leavers_NumOther_More	 EQ "">	
    <cfset form.apr24Leavers_NumOther_More	 =0></cfif>
<cfif form.apr24Leavers_NumOther_Gained	 EQ "">	
    <cfset form.apr24Leavers_NumOther_Gained	 =0></cfif>
<cfif form.apr24Leavers_NumOther_Never	 EQ "">	
    <cfset form.apr24Leavers_NumOther_Never	 =0></cfif>
<cfif form.apr24Leavers_NumOther_Total	 EQ "">	
    <cfset form.apr24Leavers_NumOther_Total	 =0></cfif>
<cfif form.apr24Leavers_NumOther_AvgGain	 EQ "">	
    <cfset form.apr24Leavers_NumOther_AvgGain	 =0></cfif>
<cfif form.apr24Leavers_NumEarned_AvgGain	 EQ "">	
    <cfset form.apr24Leavers_NumEarned_AvgGain	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOther_Lost	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOther_Lost	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOther_Less	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOther_Less	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOther_More	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOther_More	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOther_Gained	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOther_Gained	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOther_AvgGain	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOther_AvgGain	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_Lost	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_Lost	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_Less	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_Less	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_Same	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_Same	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_More	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_More	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_Gained	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_Gained	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_Never	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_Never	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_Total	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_Total	 =0></cfif>
<cfif form.apr24Leavers_NumOverall_AvgGain	 EQ "">	
    <cfset form.apr24Leavers_NumOverall_AvgGain	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOverall_Lost	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOverall_Lost	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOverall_Less	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOverall_Less	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOverall_More	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOverall_More	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOverall_Gained	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOverall_Gained	 =0></cfif>
<cfif form.apr24Leavers_AvgChangeOverall_AvgGain	 EQ "">	
    <cfset form.apr24Leavers_AvgChangeOverall_AvgGain	 =0></cfif>
<cfif form.apr24Both_NumEarned_Lost	 EQ "">	
    <cfset form.apr24Both_NumEarned_Lost	 =0></cfif>
<cfif form.apr24Both_NumEarned_Less	 EQ "">	
    <cfset form.apr24Both_NumEarned_Less	 =0></cfif>
<cfif form.apr24Both_NumEarned_Same	 EQ "">	
    <cfset form.apr24Both_NumEarned_Same	 =0></cfif>
<cfif form.apr24Both_NumEarned_More	 EQ "">	
    <cfset form.apr24Both_NumEarned_More	 =0></cfif>
<cfif form.apr24Both_NumEarned_Gained	 EQ "">	
    <cfset form.apr24Both_NumEarned_Gained	 =0></cfif>
<cfif form.apr24Both_NumEarned_Never	 EQ "">	
    <cfset form.apr24Both_NumEarned_Never	 =0></cfif>
<cfif form.apr24Both_NumEarned_Total	 EQ "">	
    <cfset form.apr24Both_NumEarned_Total	 =0></cfif>
<cfif form.apr24Both_NumEarned_AvgGain	 EQ "">	
    <cfset form.apr24Both_NumEarned_AvgGain	 =0></cfif>
<cfif form.apr24Both_AvgChangeEarned_Lost	 EQ "">	
    <cfset form.apr24Both_AvgChangeEarned_Lost	 =0></cfif>
<cfif form.apr24Both_AvgChangeEarned_Less	 EQ "">	
    <cfset form.apr24Both_AvgChangeEarned_Less	 =0></cfif>
<cfif form.apr24Both_AvgChangeEarned_More	 EQ "">	
    <cfset form.apr24Both_AvgChangeEarned_More	 =0></cfif>
<cfif form.apr24Both_AvgChangeEarned_Gained	 EQ "">	
    <cfset form.apr24Both_AvgChangeEarned_Gained	 =0></cfif>
<cfif form.apr24Both_AvgChangeEarned_AvgGain	 EQ "">	
    <cfset form.apr24Both_AvgChangeEarned_AvgGain	 =0></cfif>
<cfif form.apr24Both_NumOther_Lost	 EQ "">	
    <cfset form.apr24Both_NumOther_Lost	 =0></cfif>
<cfif form.apr24Both_NumOther_Less	 EQ "">	
    <cfset form.apr24Both_NumOther_Less	 =0></cfif>
<cfif form.apr24Both_NumOther_Same	 EQ "">	
    <cfset form.apr24Both_NumOther_Same	 =0></cfif>
<cfif form.apr24Both_NumOther_More	 EQ "">	
    <cfset form.apr24Both_NumOther_More	 =0></cfif>
<cfif form.apr24Both_NumOther_Gained	 EQ "">	
    <cfset form.apr24Both_NumOther_Gained	 =0></cfif>
<cfif form.apr24Both_NumOther_Never	 EQ "">	
    <cfset form.apr24Both_NumOther_Never	 =0></cfif>
<cfif form.apr24Both_NumOther_Total	 EQ "">	
    <cfset form.apr24Both_NumOther_Total	 =0></cfif>
<cfif form.apr24Both_NumOther_AvgGain	 EQ "">	
    <cfset form.apr24Both_NumOther_AvgGain	 =0></cfif>
<cfif form.apr24Both_AvgChangeOther_Lost	 EQ "">	
    <cfset form.apr24Both_AvgChangeOther_Lost	 =0></cfif>
<cfif form.apr24Both_AvgChangeOther_Less	 EQ "">	
    <cfset form.apr24Both_AvgChangeOther_Less	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOther_Less	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOther_Less	 =0></cfif>
<cfif form.apr24Both_AvgChangeOther_AvgGain	 EQ "">	
    <cfset form.apr24Both_AvgChangeOther_AvgGain	 =0></cfif>
<cfif form.apr24Both_NumOverall_Lost	 EQ "">	
    <cfset form.apr24Both_NumOverall_Lost	 =0></cfif>
<cfif form.apr24Both_NumOverall_Less	 EQ "">	
    <cfset form.apr24Both_NumOverall_Less	 =0></cfif>
<cfif form.apr24Both_NumOverall_Same	 EQ "">	
    <cfset form.apr24Both_NumOverall_Same	 =0></cfif>
<cfif form.apr24Both_NumOverall_More	 EQ "">	
    <cfset form.apr24Both_NumOverall_More	 =0></cfif>
<cfif form.apr24Both_NumOverall_Gained	 EQ "">	
    <cfset form.apr24Both_NumOverall_Gained	 =0></cfif>
<cfif form.apr24Both_NumOverall_Never	 EQ "">	
    <cfset form.apr24Both_NumOverall_Never	 =0></cfif>
<cfif form.apr24Both_NumOverall_Total	 EQ "">	
    <cfset form.apr24Both_NumOverall_Total	 =0></cfif>
<cfif form.apr24Both_NumOverall_AvgGain	 EQ "">	
    <cfset form.apr24Both_NumOverall_AvgGain	 =0></cfif>
<cfif form.apr24Both_AvgChangeOverall_Lost	 EQ "">	
    <cfset form.apr24Both_AvgChangeOverall_Lost	 =0></cfif>
<cfif form.apr24Both_AvgChangeOverall_Less	 EQ "">	
    <cfset form.apr24Both_AvgChangeOverall_Less	 =0></cfif>
<cfif form.apr24Both_AvgChangeOverall_More	 EQ "">	
    <cfset form.apr24Both_AvgChangeOverall_More	 =0></cfif>
<cfif form.apr24Both_AvgChangeOverall_Gained	 EQ "">	
    <cfset form.apr24Both_AvgChangeOverall_Gained	 =0></cfif>
<cfif form.apr24Both_AvgChangeOverall_AvgGain	 EQ "">	
    <cfset form.apr24Both_AvgChangeOverall_AvgGain	 =0></cfif>
<cfif form.apr24Stayers_NumOverall_Less	 EQ "">	
    <cfset form.apr24Stayers_NumOverall_Less	 =0></cfif>
<cfif form.apr24Both_AvgChangeOther_More	 EQ "">	
    <cfset form.apr24Both_AvgChangeOther_More	 =0></cfif>
<cfif form.apr24Both_AvgChangeOther_Gained	 EQ "">	
    <cfset form.apr24Both_AvgChangeOther_Gained	 =0></cfif>
<cfif form.apr24Stayers_AvgChangeOther_More	 EQ "">	
    <cfset form.apr24Stayers_AvgChangeOther_More	 =0></cfif>    
<!---/ Set Defaults --->    
    
<cfupdate datasource="#DataSource#" tablename="dataapr24" formfields="DataAPR24ID, aprID, inputUserID, projectID, reviewUserID, apr24_Earned_Entry, apr24_Earned_FollowUp, apr24_Earned_Exit, apr24_Other_Entry, apr24_Other_FollowUp, apr24_Other_Exit, apr24_Both_Entry, apr24_Both_FollowUp, apr24_Both_Exit, apr24_NoInc_Entry, apr24_NoInc_FollowUp, apr24_NoInc_Exit, apr24_DKR_Entry, apr24_DKR_FollowUp, apr24_DKR_Exit, apr24_Missing_Entry, apr24_Missing_FollowUp, apr24_Missing_Exit, apr24_Total_Entry, apr24_Total_FollowUp, apr24_Total_Exit, apr24_Total_Stayers, apr24_Total_Leavers, apr24Stayers_NumEarned_Lost, apr24Stayers_NumEarned_Less, apr24Stayers_NumEarned_Same, apr24Stayers_NumEarned_More, apr24Stayers_NumEarned_Gained, apr24Stayers_NumEarned_Never, apr24Stayers_NumEarned_Total, apr24Stayers_NumEarned_AvgGain, apr24Stayers_AvgChangeEarned_Lost, apr24Stayers_AvgChangeEarned_Less, apr24Stayers_AvgChangeEarned_More, apr24Stayers_AvgChangeEarned_Gained, apr24Stayers_AvgChangeEarned_AvgGain, apr24Stayers_NumOther_Lost, apr24Stayers_NumOther_Less, apr24Stayers_NumOther_Same, apr24Stayers_NumOther_More, apr24Stayers_NumOther_Gained, apr24Stayers_NumOther_Never, apr24Stayers_NumOther_Total, apr24Stayers_NumOther_AvgGain, apr24Stayers_AvgChangeOther_Gained, apr24Stayers_AvgChangeOther_AvgGain, apr24Stayers_NumOverall_Lost, apr24Stayers_NumOverall_Same, apr24Stayers_NumOverall_More, apr24Stayers_NumOverall_Gained, apr24Stayers_NumOverall_Never, apr24Stayers_NumOverall_Total, apr24Stayers_NumOverall_AvgGain, apr24Stayers_AvgChangeOverall_Lost, apr24Stayers_AvgChangeOverall_Less, apr24Stayers_AvgChangeOverall_More, apr24Stayers_AvgChangeOverall_Gained, apr24Stayers_AvgChangeOverall_AvgGain, apr24Leavers_NumEarned_Lost, apr24Leavers_NumEarned_Less, apr24Leavers_NumEarned_Same, apr24Leavers_NumEarned_More, apr24Leavers_NumEarned_Gained, apr24Leavers_NumEarned_Never, apr24Leavers_NumEarned_Total, apr24Leavers_AvgChangeEarned_Lost, apr24Leavers_AvgChangeEarned_Less, apr24Leavers_AvgChangeEarned_More, apr24Leavers_AvgChangeEarned_Gained, apr24Leavers_AvgChangeEarned_AvgGain, apr24Leavers_NumOther_Lost, apr24Leavers_NumOther_Less, apr24Leavers_NumOther_Same, apr24Leavers_NumOther_More, apr24Leavers_NumOther_Gained, apr24Leavers_NumOther_Never, apr24Leavers_NumOther_Total, apr24Leavers_NumOther_AvgGain, apr24Leavers_AvgChangeOther_Lost, apr24Leavers_AvgChangeOther_Less, apr24Leavers_AvgChangeOther_More, apr24Leavers_AvgChangeOther_Gained, apr24Leavers_AvgChangeOther_AvgGain, apr24Leavers_NumOverall_Lost, apr24Leavers_NumOverall_Less, apr24Leavers_NumOverall_Same, apr24Leavers_NumOverall_More, apr24Leavers_NumOverall_Gained, apr24Leavers_NumOverall_Never, apr24Leavers_NumOverall_Total, apr24Leavers_NumOverall_AvgGain, apr24Leavers_AvgChangeOverall_Lost, apr24Leavers_AvgChangeOverall_Less, apr24Leavers_AvgChangeOverall_More, apr24Leavers_AvgChangeOverall_Gained, apr24Leavers_AvgChangeOverall_AvgGain, apr24Both_NumEarned_Lost, apr24Both_NumEarned_Less, apr24Both_NumEarned_Same, apr24Both_NumEarned_More, apr24Both_NumEarned_Gained, apr24Both_NumEarned_Never, apr24Both_NumEarned_Total, apr24Both_NumEarned_AvgGain, apr24Both_AvgChangeEarned_Lost, apr24Both_AvgChangeEarned_Less, apr24Both_AvgChangeEarned_More, apr24Both_AvgChangeEarned_Gained, apr24Both_AvgChangeEarned_AvgGain, apr24Both_NumOther_Lost, apr24Both_NumOther_Less, apr24Both_NumOther_Same, apr24Both_NumOther_More, apr24Both_NumOther_Gained, apr24Both_NumOther_Never, apr24Both_NumOther_Total, apr24Both_NumOther_AvgGain, apr24Both_AvgChangeOther_Lost, apr24Both_AvgChangeOther_Less, apr24Stayers_AvgChangeOther_Less, apr24Both_AvgChangeOther_AvgGain, apr24Both_NumOverall_Lost, apr24Both_NumOverall_Less, apr24Both_NumOverall_Same, apr24Both_NumOverall_More, apr24Both_NumOverall_Gained, apr24Both_NumOverall_Never, apr24Both_NumOverall_Total, apr24Both_NumOverall_AvgGain, apr24Both_AvgChangeOverall_Lost, apr24Both_AvgChangeOverall_Less, apr24Both_AvgChangeOverall_More, apr24Both_AvgChangeOverall_Gained, apr24Both_AvgChangeOverall_AvgGain, apr24Stayers_NumOverall_Less, apr24Leavers_NumEarned_AvgGain, apr24Both_AvgChangeOther_More, apr24Both_AvgChangeOther_Gained, apr24Stayers_AvgChangeOther_Lost, apr24Stayers_AvgChangeOther_More">
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
        Form = "dataapr24"
        Where = "thisProject">
<!---/ Get DataAPR --->
<!--- Queires --->

<!--- Math --->
<cfset mathCols="6">
<cfset mathRows="18">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfoutput>
<div class="row">
  <div class="large-12 columns">
  	<h3>24.a Number of Adults by Income Category - Income Category by Entry and Follow-up/Exit Status</h3>
    <cfset nexttab="1">
    <table width="100%">
      <thead>
        <th></th>
        <th>Number of Adults at Entry</th>
        <th>Number of Adults at Follow-up (Stayers)</th>
        <th>Number of Adults at Exit (Leavers)</th>
      </thead>
      <tbody>
        <tr>
          <td>
            Adults with Only Earned Income
          </td>
          <td>
            <input type="number"
                   name="apr24_Earned_Entry"
                   value="#getDataAPR.apr24_Earned_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 col2"
                   autofocus>
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Earned_FollowUp"
                   value="#getDataAPR.apr24_Earned_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Earned_Exit"
                   value="#getDataAPR.apr24_Earned_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col5 col6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>
            Adults with Only Other Income
          </td>
          <td>
            <input type="number"
                   name="apr24_Other_Entry"
                   value="#getDataAPR.apr24_Other_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Other_FollowUp"
                   value="#getDataAPR.apr24_Other_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Other_Exit"
                   value="#getDataAPR.apr24_Other_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col5 col6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>
            Adults with Both Earned Income and Other Income
          </td>
          <td>
            <input type="number"
                   name="apr24_Both_Entry"
                   value="#getDataAPR.apr24_Both_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Both_FollowUp"
                   value="#getDataAPR.apr24_Both_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Both_Exit"
                   value="#getDataAPR.apr24_Both_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col5 col6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>
            Adults with No Income
          </td>
          <td>
            <input type="number"
                   name="apr24_NoInc_Entry"
                   value="#getDataAPR.apr24_NoInc_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1 col2">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_NoInc_FollowUp"
                   value="#getDataAPR.apr24_NoInc_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3 col4">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_NoInc_Exit"
                   value="#getDataAPR.apr24_NoInc_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col5 col6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
         <tr>
          <td>
           Adults with Don't Know / Refused Income Information
          </td>
          <td>
            <input type="number"
                   name="apr24_DKR_Entry"
                   value="#getDataAPR.apr24_DKR_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_DKR_FollowUp"
                   value="#getDataAPR.apr24_DKR_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_DKR_Exit"
                   value="#getDataAPR.apr24_DKR_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        
        </tr>
        <tr>
          <td>
           Adults with Missing Income Information
          </td>
          <td>
            <input type="number"
                   name="apr24_Missing_Entry"
                   value="#getDataAPR.apr24_Missing_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col1">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Missing_FollowUp"
                   value="#getDataAPR.apr24_Missing_FollowUp#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col3">
            <small class="form-error">Must be a whole number</small>
          </td>
          <td>
            <input type="number"
                   name="apr24_Missing_Exit"
                   value="#getDataAPR.apr24_Missing_Exit#"
                   placeholder="0"
                   min="0"
                   step="1"
                   maxlength="11"
                   tabindex="#nexttab++#"
                   class="col5">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
        <tr>
          <td>
           <b>Total Adults</b>
          </td>
          <td>
            <input type="number"
                   name="apr24_Total_Entry"
                   value="#getDataAPR.apr24_Total_Entry#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  
                  readonly
                  class="subtotal_adults BGLightGray"
                  id="sumC1">
            
          </td>
          <td>
            <input type="number"
                   name="apr24_Total_FollowUp"
                   value="#getDataAPR.apr24_Total_FollowUp#"
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
                   name="apr24_Total_Exit"
                   value="#getDataAPR.apr24_Total_Exit#"
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
                <tr>
          <td>
           Adults with Income Information at Entry and Follow-up/Exit
          </td>
          <td>
          </td>
          <td>
            <input type="number"
                   name="apr24_Total_Stayers"
                   value="#getDataAPR.apr24_Total_Stayers#"
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
                   name="apr24_Total_Leavers"
                   value="#getDataAPR.apr24_Total_Leavers#"
                   placeholder="0"
                   min="0"
                   step="1"
                  maxlength="11"
                  readonly
                  class="BGLightGray"
                  id="sumC6">
            <small class="form-error">Must be a whole number</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Q24b.1 Client Cash Income Change - Income Source - by Entry and Latest Status</h3>
    <h4>Adult Stayers with Income Information at Entry and Follow-up</h4>
    <table width="100%">
      <thead>
        <th><small>Income Change by Income Category</small></th>
        <th><small>Had Income Category at Entry and Did Not Have It at Follow-up</small></th>
        <th><small>Retained Income Cateogry But Had Less $ at Follow-up as at Entry</small></th>
        <th><small>Retained Income Category and Same $ at Follow-up</small></th>
        <th><small>Retained Income Category and Increased $ at Follow-up</small></th>
        <th><small>Did Not Have the Income Category at Entry and Gained the Income Cateogory at Follow-up</small></th>
        <th><small>Did Not Have the Income Cateogry at Entry or Exit</small></th>
        <th><small>Total Adults Including those with no Income</small></th>
        <th><small>Performance Measures: Adults who gained or increased income from entry to follow-up</small></th>
        <th><small>Performance Measures: Adults who gained or increased income from entry to follow-up, Average Gain</small></th>
      </thead>
      <tbody>
        <tr>
          <td>Number of Adults with Earned Income</td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_Lost"
       value="#getDataAPR.apr24Stayers_NumEarned_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_Less"
       value="#getDataAPR.apr24Stayers_NumEarned_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_Same"
       value="#getDataAPR.apr24Stayers_NumEarned_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_More"
       value="#getDataAPR.apr24Stayers_NumEarned_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1 row2">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_Gained"
       value="#getDataAPR.apr24Stayers_NumEarned_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1 row2">
          </td>
           <td>
<input type="number"
       name="apr24Stayers_NumEarned_Never"
       value="#getDataAPR.apr24Stayers_NumEarned_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row1">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_Total"
       value="#getDataAPR.apr24Stayers_NumEarned_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR1">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumEarned_AvgGain"
       value="#getDataAPR.apr24Stayers_NumEarned_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR2">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
      class="BGLightGray"
       class="row1">
          </td>
          </tr>
        <tr>
          <td>Average change in Earned Income</td>
		<td>
              <input type="number"
                       name="apr24Stayers_AvgChangeEarned_Lost"
                       value="#getDataAPR.apr24Stayers_AvgChangeEarned_Lost#"
                       placeholder="0"
                       required
                       maxlength="9" 
                        tabindex="#nexttab++#">
              <small class="form-error">Must be a whole number</small>
          </td>
        <td>
              <input type="number"
                       name="apr24Stayers_AvgChangeEarned_Less"
                       value="#getDataAPR.apr24Stayers_AvgChangeEarned_Less#"
                       placeholder="0"
                        required
                       maxlength="9" 
             tabindex="#nexttab++#">
              <small class="form-error">Must be a whole number</small>  
          </td>
          <td>

          </td>

          <td>
              <input type="number"
                       name="apr24Stayers_AvgChangeEarned_More"
                       value="#getDataAPR.apr24Stayers_AvgChangeEarned_More#"
                       placeholder="0"
                        required
                       maxlength="9" 
             tabindex="#nexttab++#">
              <small class="form-error">Must be a whole number</small>
          </td>
          <td>
              <input type="number"
                       name="apr24Stayers_AvgChangeEarned_Gained"
                       value="#getDataAPR.apr24Stayers_AvgChangeEarned_Gained#"
                       placeholder="0"
                        required
                       maxlength="9" 
             tabindex="#nexttab++#">
              <small class="form-error">Must be a whole number</small>
          </td>
       	  <td>
          </td>
       	  <td>
          </td>
          <td>
          </td>
		<td>
              <input type="number"
                       name="apr24Stayers_AvgChangeEarned_AvgGain"
                       value="#getDataAPR.apr24Stayers_AvgChangeEarned_AvgGain#"
                       placeholder="0"
                        required
                      maxlength="11"
            tabindex="#nexttab++#">
              <small class="form-error">Must be a whole number</small>
          </td>

        </tr>
        <tr>
          <td>Number of Adults with Other Income</td>
          <td>
<input type="number"
       name="apr24Stayers_NumOther_Lost"
       value="#getDataAPR.apr24Stayers_NumOther_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOther_Less"
       value="#getDataAPR.apr24Stayers_NumOther_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOther_Same"
       value="#getDataAPR.apr24Stayers_NumOther_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOther_More"
       value="#getDataAPR.apr24Stayers_NumOther_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3 row4">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOther_Gained"
       value="#getDataAPR.apr24Stayers_NumOther_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3 row4">
          </td>
           <td>
<input type="number"
       name="apr24Stayers_NumOther_Never"
       value="#getDataAPR.apr24Stayers_NumOther_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row3">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOther_Total"
       value="#getDataAPR.apr24Stayers_NumOther_Total#"
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
       name="apr24Stayers_NumOther_AvgGain"
       value="#getDataAPR.apr24Stayers_NumOther_AvgGain#"
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
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
          </tr>
        <tr>
          <td>Average change in Other Income</td>
          <td width="20%">
                  <input type="number"
					       name="apr24Stayers_AvgChangeOther_Lost"
					       value="#getDataAPR.apr24Stayers_AvgChangeOther_Lost#"
					       placeholder="0"
					        required
					       maxlength="9" 
                 tabindex="#nexttab++#">
					<small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                  <input type="number"
					       name="apr24Stayers_AvgChangeOther_Less"
					       value="#getDataAPR.apr24Stayers_AvgChangeOther_Less#"
					       placeholder="0"
					        required
					       maxlength="9" 
                 tabindex="#nexttab++#">
					<small class="form-error">This field is requried</small>
          </td>
          <td>

          </td>
          <td width="20%">
                 <input type="number"
				       name="apr24Stayers_AvgChangeOther_More"
				       value="#getDataAPR.apr24Stayers_AvgChangeOther_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                 <input type="number"
				       name="apr24Stayers_AvgChangeOther_Gained"
				       value="#getDataAPR.apr24Stayers_AvgChangeOther_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>

           <td>

          </td>
       	  <td>
          </td>
            <td>

          </td>
           <td width="20%">
          
                 <input type="number"
					       name="apr24Stayers_AvgChangeOther_AvgGain"
					       value="#getDataAPR.apr24Stayers_AvgChangeOther_AvgGain#"
					       placeholder="0"
					        required
					      maxlength="11"
                tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
              
          </td>
        </tr>
        <tr>
          <td>Number of Adults Any Income</td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_Lost"
       value="#getDataAPR.apr24Stayers_NumOverall_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_Less"
       value="#getDataAPR.apr24Stayers_NumOverall_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_Same"
       value="#getDataAPR.apr24Stayers_NumOverall_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_More"
       value="#getDataAPR.apr24Stayers_NumOverall_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5 row6">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_Gained"
       value="#getDataAPR.apr24Stayers_NumOverall_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5 row6">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_Never"
       value="#getDataAPR.apr24Stayers_NumOverall_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row5">
          </td>
           <td>
<input type="number"
       name="apr24Stayers_NumOverall_Total"
       value="#getDataAPR.apr24Stayers_NumOverall_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR5">
          </td>
          <td>
<input type="number"
       name="apr24Stayers_NumOverall_AvgGain"
       value="#getDataAPR.apr24Stayers_NumOverall_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR6">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
          </tr>
        <tr>
          <td>Average Change in Overall Income</td>
          <td width="20%">
                 <input type="number"
				       name="apr24Stayers_AvgChangeOverall_Lost"
				       value="#getDataAPR.apr24Stayers_AvgChangeOverall_Lost#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
           
                 <input type="number"
				       name="apr24Stayers_AvgChangeOverall_Less"
				       value="#getDataAPR.apr24Stayers_AvgChangeOverall_Less#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
             
          </td>
          <td></td>
          <td width="20%">
                 <input type="number"
					       name="apr24Stayers_AvgChangeOverall_More"
					       value="#getDataAPR.apr24Stayers_AvgChangeOverall_More#"
					       placeholder="0"
					        required
					       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Stayers_AvgChangeOverall_Gained"
				       value="#getDataAPR.apr24Stayers_AvgChangeOverall_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td></td>
          <td width="20%">
                <input type="number"
				       placeholder="Not Collected"
				      readonly
				      maxlength="11"
                      class="BGLightGray"
              tabindex="#nexttab++#">
          </td>            
          <td></td>
          <td width="20%">
                <input type="number"
				       name="apr24Stayers_AvgChangeOverall_AvgGain"
				       value="#getDataAPR.apr24Stayers_AvgChangeOverall_AvgGain#"
				       placeholder="0"
				        required
				      maxlength="11"
              tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Q24b.2 Client Cash Income Change - Income Source - by Entry and Latest Status</h3>
    <h4>Adult Leavers with Income Information at Entry and Follow-up</h4>
    <table width="100%">
      <thead>
       <th><small>Income Change by Income Category</small></th>
        <th><small>Had Income Category at Entry and Did Not Have It at exit</small></th>
        <th><small>Retained Income Cateogry But Had Less $ at Follow-up as at Entry</small></th>
        <th><small>Retained Income Category and Same $ at exit</small></th>
        <th><small>Retained Income Category and Increased $ at exit</small></th>
        <th><small>Did Not Have the Income Category at Entry and Gained the Income Cateogory at exit</small></th>
        <th><small>Did Not Have the Income Cateogry at Entry or exit</small></th>
        <th><small>Total Adults Including those with no Income</small></th>
        <th><small>Performance Measures: Adults who gained or increased income from entry to follow-up</small></th>
        <th><small>Performance Measures: Adults who gained or increased income from entry to follow-up, Average Gain</small></th>
      </thead>
      <tbody>
        <tr>
          <td>Number of Adults with Earned Income</td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_Lost"
       value="#getDataAPR.apr24Leavers_NumEarned_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_Less"
       value="#getDataAPR.apr24Leavers_NumEarned_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_Same"
       value="#getDataAPR.apr24Leavers_NumEarned_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_More"
       value="#getDataAPR.apr24Leavers_NumEarned_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7 row8">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_Gained"
       value="#getDataAPR.apr24Leavers_NumEarned_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7 row8">
          </td>
           <td>
<input type="number"
       name="apr24Leavers_NumEarned_Never"
       value="#getDataAPR.apr24Leavers_NumEarned_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row7">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_Total"
       value="#getDataAPR.apr24Leavers_NumEarned_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR7">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumEarned_AvgGain"
       value="#getDataAPR.apr24Leavers_NumEarned_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR8">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
        </tr>
        <tr>
          <td>Average change in Earned Income</td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeEarned_Lost"
				       value="#getDataAPR.apr24Leavers_AvgChangeEarned_Lost#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeEarned_Less"
				       value="#getDataAPR.apr24Leavers_AvgChangeEarned_Less#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td>

          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeEarned_More"
				       value="#getDataAPR.apr24Leavers_AvgChangeEarned_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeEarned_Gained"
				       value="#getDataAPR.apr24Leavers_AvgChangeEarned_Gained#"
				       placeholder="0"
				        required
				        maxlength="9" 
                 tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>

           <td>

          </td>
           <td></td>
            <td>

          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeEarned_AvgGain"
				       value="#getDataAPR.apr24Leavers_AvgChangeEarned_AvgGain#"
				       placeholder="0"
				        required
				       maxlength="11"
               tabindex="#nexttab++#">
				<small class="form-error">This field is requried</small>
          </td>
        </tr>
        <tr>
          <td>Number of Adults with Other Income</td>
          <td>
<input type="number"
       name="apr24Leavers_NumOther_Lost"
       value="#getDataAPR.apr24Leavers_NumOther_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOther_Less"
       value="#getDataAPR.apr24Leavers_NumOther_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOther_Same"
       value="#getDataAPR.apr24Leavers_NumOther_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOther_More"
       value="#getDataAPR.apr24Leavers_NumOther_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9 row10">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOther_Gained"
       value="#getDataAPR.apr24Leavers_NumOther_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9 row10">
          </td>
           <td>
<input type="number"
       name="apr24Leavers_NumOther_Never"
       value="#getDataAPR.apr24Leavers_NumOther_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row9">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOther_Total"
       value="#getDataAPR.apr24Leavers_NumOther_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR9">
          </td>
          <td>
            <input type="number"
       name="apr24Leavers_NumOther_AvgGain"
       value="#getDataAPR.apr24Leavers_NumOther_AvgGain#"
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
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
          </tr>
        <tr>
          <td>Average change in Other Income</td>
          <td width="20%">
          
                <input type="number"
				       name="apr24Leavers_AvgChangeOther_Lost"
				       value="#getDataAPR.apr24Leavers_AvgChangeOther_Lost#"
				       placeholder="0"
				       
				       maxlength="9" 
               tabindex="#nexttab++#"
               required>
               <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeOther_Less"
				       value="#getDataAPR.apr24Leavers_AvgChangeOther_Less#"
				       placeholder="0"
				        required
				        maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>

          <td>

          </td>
         <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeOther_More"
				       value="#getDataAPR.apr24Leavers_AvgChangeOther_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeOther_Gained"
				       value="#getDataAPR.apr24Leavers_AvgChangeOther_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
           <td>

          </td>
           <td></td>
            <td>

          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeOther_AvgGain"
				       value="#getDataAPR.apr24Leavers_AvgChangeOther_AvgGain#"
				       placeholder="0"
				        required
				       maxlength="11"
               tabindex="#nexttab++#">
               <small class="form-error">This field is requried</small>
          </td>
        </tr>
        <tr>
          <td>Number of Adults with Any Income</td>
          <td>
<input type="number"
       name="apr24Leavers_NumOverall_Lost"
       value="#getDataAPR.apr24Leavers_NumOverall_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOverall_Less"
       value="#getDataAPR.apr24Leavers_NumOverall_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOverall_Same"
       value="#getDataAPR.apr24Leavers_NumOverall_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOverall_More"
       value="#getDataAPR.apr24Leavers_NumOverall_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11 row12">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOverall_Gained"
       value="#getDataAPR.apr24Leavers_NumOverall_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11 row12">
          </td>
           <td>
<input type="number"
       name="apr24Leavers_NumOverall_Never"
       value="#getDataAPR.apr24Leavers_NumOverall_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row11">
          </td>
          <td>
<input type="number"
       name="apr24Leavers_NumOverall_Total"
       value="#getDataAPR.apr24Leavers_NumOverall_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR11">
          </td>
          <td>
            <input type="number"
       name="apr24Leavers_NumOverall_AvgGain"
       value="#getDataAPR.apr24Leavers_NumOverall_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR12">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>        
          </tr>
        <tr>
          <td>Average Change in Overall Income</td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeOverall_Lost"
				       value="#getDataAPR.apr24Leavers_AvgChangeOverall_Lost#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
                <input type="number"
				       name="apr24Leavers_AvgChangeOverall_Less"
				       value="#getDataAPR.apr24Leavers_AvgChangeOverall_Less#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td>

          </td>
          <td width="20%">
               <input type="number"
				       name="apr24Leavers_AvgChangeOverall_More"
				       value="#getDataAPR.apr24Leavers_AvgChangeOverall_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
               <input type="number"
				       name="apr24Leavers_AvgChangeOverall_Gained"
				       value="#getDataAPR.apr24Leavers_AvgChangeOverall_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
           <td>

          </td>
          <td width="20%">
                <input type="number"
				       placeholder="Not Collected"
				        readonly
				      maxlength="11"
                       class="BGLightGray"
              tabindex="#nexttab++#">
          </td>
            <td>
          </td>
          <td width="20%">
               <input type="number"
				       name="apr24Leavers_AvgChangeOverall_AvgGain"
				       value="#getDataAPR.apr24Leavers_AvgChangeOverall_AvgGain#"
				       placeholder="0"
				        required
				       maxlength="11"
               tabindex="#nexttab++#">
               <small class="form-error">This field is requried</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

<div class="row">
  <div class="large-12 columns">
    <h3>Q24b.3 Client Cash Income Change - Income Source - by Entry and Latest Status</h3>
    <h4>Adults with Income Information at Entry and either Follow-up or Exit</h4>
    <table width="100%">
      <thead>
        <th><small>Income Change by Income Category</small></th>
        <th><small>Had Income Category at Entry and Did Not Have It at follow-up/exit</small></th>
        <th><small>Retained Income Cateogry But Had Less $ at follow-up/exit than at entry</small></th>
        <th><small>Retained Income Category and Same $ at follow-up/exit</small></th>
        <th><small>Retained Income Category and Increased $ at follow-up/exit</small></th>
        <th><small>Did Not Have the Income Category at Entry and Gained the Income Category at follow-up/exit</small></th>
        <th><small>Did Not Have the Income Cateogry at Entry or Exit</small></th>
        <th><small>Total Adults Including those with no Income</small></th>
        <th><small>Performance Measures: Adults who gained or increased income from entry to follow-up</small></th>
        <th><small>Performance Measures: Adults who gained or increased income from entry to follow-up, Average Gain</small></th>
      </thead>
      <tbody>
        <tr>
          <td>Number of Adults with Earned Income</td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_Lost"
       value="#getDataAPR.apr24Both_NumEarned_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
        tabindex="#nexttab++#"
        class="row13">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_Less"
       value="#getDataAPR.apr24Both_NumEarned_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row13">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_Same"
       value="#getDataAPR.apr24Both_NumEarned_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row13">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_More"
       value="#getDataAPR.apr24Both_NumEarned_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row13 row14">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_Gained"
       value="#getDataAPR.apr24Both_NumEarned_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row13 row14">
          </td>
           <td>
<input type="number"
       name="apr24Both_NumEarned_Never"
       value="#getDataAPR.apr24Both_NumEarned_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row13">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_Total"
       value="#getDataAPR.apr24Both_NumEarned_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
       readonly
      class="BGLightGray"
      id="sumR13">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumEarned_AvgGain"
       value="#getDataAPR.apr24Both_NumEarned_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
       readonly
      class="BGLightGray"
      id="sumR14">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
          </tr>
        <tr>
          <td>Average change in Earned Income</td>
          <td width="20%">
               <input type="number"
				       name="apr24Both_AvgChangeEarned_Lost"
				       value="#getDataAPR.apr24Both_AvgChangeEarned_Lost#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
         <td width="20%">
               <input type="number"
				       name="apr24Both_AvgChangeEarned_Less"
				       value="#getDataAPR.apr24Both_AvgChangeEarned_Less#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td>

          </td>
           <td width="20%">
               <input type="number"
				       name="apr24Both_AvgChangeEarned_More"
				       value="#getDataAPR.apr24Both_AvgChangeEarned_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
              <input type="number"
				       name="apr24Both_AvgChangeEarned_Gained"
				       value="#getDataAPR.apr24Both_AvgChangeEarned_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
           <td>

          </td>
           <td></td>
            <td>

          </td>
           <td width="20%">
             <input type="number"
			       name="apr24Both_AvgChangeEarned_AvgGain"
			       value="#getDataAPR.apr24Both_AvgChangeEarned_AvgGain#"
			       placeholder="0"
			        required
			       maxlength="11"
             tabindex="#nexttab++#">
             <small class="form-error">This field is requried</small>
        </tr>
        <tr>
          <td>Number of Adults with Other Income</td>
          <td>
<input type="number"
       name="apr24Both_NumOther_Lost"
       value="#getDataAPR.apr24Both_NumOther_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOther_Less"
       value="#getDataAPR.apr24Both_NumOther_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOther_Same"
       value="#getDataAPR.apr24Both_NumOther_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
          </td>


          <td>
<input type="number"
       name="apr24Both_NumOther_More"
       value="#getDataAPR.apr24Both_NumOther_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15 row16">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOther_Gained"
       value="#getDataAPR.apr24Both_NumOther_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15 row16">
          </td>
           <td>
<input type="number"
       name="apr24Both_NumOther_Never"
       value="#getDataAPR.apr24Both_NumOther_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row15">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOther_Total"
       value="#getDataAPR.apr24Both_NumOther_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR15">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOther_AvgGain"
       value="#getDataAPR.apr24Both_NumOther_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR16">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
          </tr>
        <tr>
          <td>Average change in Other Income</td>
          <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOther_Lost"
				       value="#getDataAPR.apr24Both_AvgChangeOther_Lost#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
          </td>
           <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOther_Less"
				       value="#getDataAPR.apr24Both_AvgChangeOther_Less#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td>

          </td>
         <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOther_More"
				       value="#getDataAPR.apr24Both_AvgChangeOther_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOther_Gained"
				       value="#getDataAPR.apr24Both_AvgChangeOther_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
           <td>

          </td>
           <td></td>
            <td>

          </td>
          <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOther_AvgGain"
				       value="#getDataAPR.apr24Both_AvgChangeOther_AvgGain#"
				       placeholder="0"
				        required
				       maxlength="11"
               tabindex="#nexttab++#">
               <small class="form-error">This field is requried</small>
          </td>
        </tr>
        <tr>
          <td>Number of Adults with Any Income</td>
          <td>
<input type="number"
       name="apr24Both_NumOverall_Lost"
       value="#getDataAPR.apr24Both_NumOverall_Lost#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOverall_Less"
       value="#getDataAPR.apr24Both_NumOverall_Less#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOverall_Same"
       value="#getDataAPR.apr24Both_NumOverall_Same#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOverall_More"
       value="#getDataAPR.apr24Both_NumOverall_More#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17 row18">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOverall_Gained"
       value="#getDataAPR.apr24Both_NumOverall_Gained#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17 row18">
          </td>
           <td>
<input type="number"
       name="apr24Both_NumOverall_Never"
       value="#getDataAPR.apr24Both_NumOverall_Never#"
       placeholder="0"
       min="0"
       step="1"
       maxlength="11"
       tabindex="#nexttab++#"
       class="row17">
          </td>
          <td>
<input type="number"
       name="apr24Both_NumOverall_Total"
       value="#getDataAPR.apr24Both_NumOverall_Total#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR17">
          </td>
          <td>
            <input type="number"
       name="apr24Both_NumOverall_AvgGain"
       value="#getDataAPR.apr24Both_NumOverall_AvgGain#"
       placeholder="0"
       min="0"
       step="1"
      maxlength="11"
      readonly
      class="BGLightGray"
      id="sumR18">
          </td>
          <td>
<input type="number"
       placeholder="Not Collected"
       maxlength="11"
       readonly
       class="BGLightGray">
          </td>
          </tr>
        <tr>
          <td>Average Change in Overall Income</td>
          <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOverall_Lost"
				       value="#getDataAPR.apr24Both_AvgChangeOverall_Lost#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOverall_Less"
				       value="#getDataAPR.apr24Both_AvgChangeOverall_Less#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
          <td>

          </td>
          <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOverall_More"
				       value="#getDataAPR.apr24Both_AvgChangeOverall_More#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
         <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOverall_Gained"
				       value="#getDataAPR.apr24Both_AvgChangeOverall_Gained#"
				       placeholder="0"
				        required
				       maxlength="9" 
                 tabindex="#nexttab++#">
                 <small class="form-error">This field is requried</small>
          </td>
           <td>

          </td>
          <td width="20%">
                <input type="number"
				       placeholder="Not Collected"
				        readonly
				      maxlength="11"
                       class="BGLightGray"
              tabindex="#nexttab++#">
          </td>
            <td>

          </td>
           <td width="20%">
	            <input type="number"
				       name="apr24Both_AvgChangeOverall_AvgGain"
				       value="#getDataAPR.apr24Both_AvgChangeOverall_AvgGain#"
				       placeholder="0"
				        required
				       maxlength="11"
               tabindex="#nexttab++#">
               <small class="form-error">This field is requried</small>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

</cfoutput>