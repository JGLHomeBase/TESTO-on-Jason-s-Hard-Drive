<cfset surveyCat = "Reliability">

<cfquery datasource="#datasource#" name="getSurvey">
SELECT * FROM surveyq
RIGHT JOIN survey ON surveyq.surveyQID = survey.surveyQID 
WHERE surveyCat = <cfqueryparam value="#surveyCat#"> 
AND projectID = <cfqueryparam value="#URL.project#">
</cfquery>

<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<table widht="100%">
				<thead>
					<th width="30%"></th>
					<th>No, Not at All</th>
					<th>Not Very Much</th>
					<th>Sometimes</th>
					<th>Most of the Time</th>
					<th>Yes, All the Time</th>
					<th>N/A</th>
					<th>I Don't Know</th>
					<th>No Response</th>
					<th>Total</th>
				</thead>
				<tbody>
				<cfset displayQList = 0>
				<cfloop query="getSurvey">
					<cfif listContains("#displayQList#", "#getSurvey.surveyQID#") IS FALSE>
						<cfset displayQList = listAppend("#displayQList#","#getSurvey.surveyQID#")>
						<tr>
							<cfset responseTotal = NumberFormat(getSurvey.NotAtAll+getSurvey.NotVeryMuch+getSurvey.sometimes+getSurvey.MostOfTheTime+getSurvey.AllOfTheTime+getSurvey.na+getSurvey.dontknow+getSurvey.none,0)>
							<td>#getSurvey.surveyQText#</td>
							<td class="text-center">
								<cfset response = getSurvey.NotAtAll>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.NotVeryMuch>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.sometimes>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.MostOfTheTime>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.AllOfTheTime>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.na>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.dontknow>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center">
								<cfset response = getSurvey.none>
								<cfif response GTE getSurvey.NotAtAll
								  AND response GTE getSurvey.NotVeryMuch
								  AND response GTE getSurvey.sometimes
								  AND response GTE getSurvey.MostOfTheTime
								  AND response GTE getSurvey.AllOfTheTime
								  AND response GTE getSurvey.na
								  AND response GTE getSurvey.dontknow
								  AND response GTE getSurvey.none>
								  	<b>#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</cfif></span></b>
								  <cfelse>
								  	#response# <cfif responseTotal NEQ 0><br><span class="MakeGray">(#NumberFormat(response/responseTotal*100,"0.0")#%)</span></cfif>
								  </cfif>
							</td>
							<td class="text-center MakeGray"><b>#responseTotal# Total</b></td>

						</tr>
						<cfif getSurvey.surveyNotes NEQ "">
						<tr>
							<td></td>
							<td colspan="8">#getSurvey.surveyNotes#</td>
						</tr>
						</cfif>
					</cfif>
				</cfloop>
				<cfif getSurvey.RecordCount EQ 0>
					<tr>
						<td colspan="10" class="text-center">
							<i>No client survey responses received</i>
						</td>
					</tr>
				</cfif>
				</tbody>
			</table>
		</div>
	</div>
</cfoutput>