<!--- Math --->
<cfset mathCols="20">
<cfset mathRows="1">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfquery datasource="#datasource#" name="getScores">
	SELECT scoreID, score1, score2, score3, score4, score5, score6, score7, score8, score9, score10, score11, score12, score13, score14, score15, score16, score17, score18, score19, score20, score21, score22, score23, score24, score25, scores.userID, userFirst, userLast, scores.projectID FROM scores
	INNER JOIN users ON scores.userID = users.userID 
	WHERE scores.projectID = <cfqueryparam value="#URL.project#"> 
	AND scores.compID = <cfqueryparam value="#SESSION.compID#">
	AND users.authLevel = '7'
			AND users.compID = <cfqueryparam value="#SESSION.compID#">
	ORDER BY userFirst ASC
</cfquery>

<cfoutput>
	<input type="hidden" name="projectID" value="#URL.project#">
	<input type="hidden" name="userID" value="#SESSION.userID#">
	<input type="hidden" name="compID" value="#SESSION.compID#">
	<input type="hidden" name="action" value="process">
	<h1>Score Summary &mdash; #ProjectLongName#</h1>


	<cfset fieldCount = 0>
	<cfset catCount = 0>
	<cfset TotalTotal=0>
	<cfset CatTotal=0>
	<cfset RunningTotal=0>
	<cfset RunningTotalPCount=0>
	<cfset RunningTotalSec=0>
	<cfset CatValueTotal=0>
	<cfquery datasource="#datasource#" name="getCats">
		SELECT * FROM scorecat
		WHERE compID = <cfqueryparam value="#SESSION.compID#">
		ORDER BY catLongName
	</cfquery>
	
	<cfloop query="getCats">
			
	<cfif getCats.newProjects EQ 1 AND projectNew EQ 1 >
		<cfset applies = 1>
	<cfelseif listFindNoCase("#getCats.componentList#", "#projectComponentID#") AND projectNew NEQ 1>
		<cfset applies = 1>
	<cfelse>
		<cfset applies = 0>
	</cfif>
	<cfif applies EQ 1>
		<cfset catCount = catCount+1>
		<table width="100%">
		<thead>
			<th>
				#getCats.catLongName#
			</th>
			<th>
				Performance
			</th>
			<th>
				<cfif URL.avg EQ "show">
				#projectComponentName# Average
				</cfif>
			</th>
			<th colspan="2">Points Awarded</th>
		</thead>
		<tbody>
			<cfif getCats.catDesc NEQ "">
				<tr>
					<td colspan="4">
						<p>#getCats.catDesc#</p>
					</td>
				</tr>
			</cfif>
			<cfquery datasource="#datasource#" name="getFactors">
				SELECT * FROM scorefactor
				WHERE catID = <cfqueryparam value="#getCats.catID#">
				ORDER BY factorLongName
			</cfquery>
			<cfloop query="getFactors">
				<cfset DefaultScore = 0>
				<cfif getFactors.newProjects EQ 1 AND projectNew EQ 1 >
					<cfset applies = 1>
				<cfelseif listFindNoCase("#getFactors.componentList#", "#projectComponentID#") AND projectNew NEQ 1>
					<cfset applies = 1>
				<cfelse>
					<cfset applies = 0>
				</cfif>
				<cfif applies EQ 1 AND FieldCount LT 25>
					<cfset FieldCount = FieldCount+1>
					<tr class="PrintModule">
						<td>
							<b>#getFactors.factorLongName#</b>
							<cfif factorDesc NEQ "">
								<br>#getFactors.factorDesc#
							</cfif>
						</td>
						
						<td>
							<cfif getFactors.fieldName NEQ 0>
								<cfset Performance = Evaluate(getFactors.fieldName)>
								<cfif getFactors.adjustField EQ "Perc100">
									<cfset Performance = Performance*100>
								</cfif>
								<cfif getFactors.adjustField EQ "Perc" OR getFactors.adjustField EQ "Perc100">
									#NumberFormat(Performance, "0.00")#%
								<cfelseif getFactors.adjustField EQ "YesNo">
									<cfif Left(Performance,1) EQ "Y" OR Left(Performance,1) EQ "y">
										<cfset performance = 1>
										Yes
									<cfelse>
										<cfset performance = 0>
										No
									</cfif>
								<cfelse>
									#Performance#
								</cfif>
							<cfelse>
								<cfset Performance = 0>
							</cfif>

							<cfif getFactors.scaled EQ 1>
								<cfquery datasource="#datasource#" name="getScales">
									SELECT * FROM scorescale
									WHERE factorID = <cfqueryparam value="#getFactors.factorID#">
									ORDER BY minValue
								</cfquery>
								<cfif getScales.RecordCount GT 0>
									<cfloop query="getScales">
										<cfif Performance GTE getScales.minValue>
											<cfset DefaultScore = getScales.ptScore>
										</cfif>
									</cfloop>
									<br>
									
									<b>(#DefaultScore# Pts.)</b>
								</cfif>
							</cfif>
						</td>
						<td>
							<cfif URL.avg EQ "show">
							<cfquery datasource="#DataSource#" name="avScore">
								SELECT AVG(score#FieldCount#) typeAvg
								FROM scores
								INNER JOIN projects ON scores.projectID = projects.projectID
								INNER JOIN users ON scores.userID = users.userID
								WHERE scores.compID = <cfqueryparam value="#SESSION.compID#">
								AND users.authLevel = '7'
								AND users.compID = <cfqueryparam value="#SESSION.compID#">
								AND projects.projectComponentID = <cfqueryparam value="#projectComponentID#">
								ORDER BY userFirst ASC
							</cfquery>
							#NumberFormat(avScore.typeAvg,0.00)#
							</cfif>
						</td>
						<a name="#FieldCount#">
							<cfset average = 0>
							<cfloop query="getScores">
								<cfset CurrentScore = getScores["score"&FieldCount]>
								<cfset average = average+CurrentScore>
								<cfset RunningTotal = RunningTotal+CurrentScore>
								<cfset RunningTotalSec = RunningTotalSec+CurrentScore>
								<cfset RunningTotalPCount = getScores.RecordCount>
							</cfloop>
							<cfif getScores.RecordCount GT 0>
								<cfset average = average/getScores.RecordCount>
							<cfelse>
								<cfset average = 0>
								<cfset RunningTotalPCount = 1>
							</cfif>
						<cfif URL.trees EQ "kill">
									
							<td width="300" colspan="2" class="text-right">
								<b>#NumberFormat(average,0.00)#</b> of #maxPoints#
								<cfif maxPoints NEQ "">
									<cfset catTotal=catTotal+maxPoints>
									<cfset catValueTotal=catValueTotal+CurrentScore>
								</cfif>
							</td>
						<cfelse>
						<td width="75">

							
					    	<form action="#CurrentPage#?report=#URL.report#&project=#URL.project#&game=on&sort=#URL.sort####FieldCount#" method="post" data-abide>
					    		
									<input type="text"
								       name="score#fieldCount#"
								       value="#NumberFormat(average,0.00)#" 
								       placeholder="0"
								       pattern="number"
								       class="col#CatCount# row1"
								       maxlength="5"
									   onchange="this.form.submit()">
								<cfif maxPoints NEQ "">
									<cfparam name="CurrentScore" default="0">
									<cfset catTotal=catTotal+maxPoints>
									<cfset catValueTotal=catValueTotal+CurrentScore>
								</cfif>
								<cfset scoreIDList = "">
								<cfset userIDList = "">
								<cfloop query="getScores">
									<cfset scoreIDList = ListAppend(scoreIDList, "#getScores.scoreID#")>
								</cfloop>
								<input type="hidden" name="scoreIDList" value="#scoreIDList#">
								<input type="hidden" name="projectID" value="#getScores.projectID#">
								<input type="hidden" name="compID" value="#SESSION.compID#">
								<input type="hidden" name="targetField" value="#FieldCount#">
								<input type="hidden" name="action" value="bulkUpdate">
							</form>
						</td></a>
						<td width="75">
							of #maxPoints#
							
						</td>
						</cfif>
					</tr>
					<tr>
						<td colspan="5">
							
							<table width="100%">
								<cfif URL.charts NEQ "hide">
								<tr>
									<td colspan="#getScores.RecordCount#">
										<cfchart chartwidth="910" chartheight="250" font="Lato" format="html" fontSize="11" yAxisTitle="Panelist Score">
											<cfchartseries type="Bar" seriesLabel="Individual Scores">
												<cfloop query="getScores">
													<cfset CurrentScore = getScores["score"&FieldCount]>
													<cfif URL.witsec EQ "true">
														<cfchartdata item="Panelist #getScores.CurrentRow#" value="#CurrentScore#">
													<cfelse>
														<cfchartdata item="#getScores.userFirst#" value="#CurrentScore#">
													</cfif>
												</cfloop>
											</cfchartseries>
											<cfchartseries type="Line" seriesLabel="Average">
												<cfloop query="getScores">
													<cfchartdata item="Average" value=#average#>
												</cfloop>
											</cfchartseries>
										</cfchart>
									</td>
								</tr>
								</cfif>
								<tr>
									<cfloop query="getScores">
										<cfset CurrentScore = getScores["score"&FieldCount]>
										<td class="text-center">

											<form action="#CurrentPage#?report=#URL.report#&project=#URL.project#&game=on&sort=#URL.sort####FieldCount#" method="post" data-abide>
												<input type="hidden" name="userID" value="#getScores.userID#">
												<input type="hidden" name="scoreID" value="#getScores.scoreID#">
												<input type="hidden" name="projectID" value="#getScores.projectID#">
												<input type="hidden" name="compID" value="#SESSION.compID#">
												<input type="hidden" name="targetField" value="#FieldCount#">
												<input type="hidden" name="action" value="targetedUpdate">
												<cfif URL.witsec EQ "true">
													<label>Panelist #getScores.CurrentRow#</label>
												<cfelse>
													<label>#getScores.userFirst#</label>
												</cfif>
												<cfif URL.trees EQ "kill">
													<br><b>#CurrentScore#</b>
												<cfelse>
													<input type="text"
													       name="score#fieldCount#"
													       value="#CurrentScore#"
													       placeholder="0"
													       pattern="number"
													       maxlength="5"
													       onchange="this.form.submit()">
												</cfif>
											</form>
										</td>
									</cfloop>
								</tr>
							</table>
						</td>
					</tr>
				</cfif>
			</cfloop>
			<tr>
					<td colspan="3" class="text-right">
					Section Total
					</td>
					<td width="200" colspan="2" class="text-right">
						<cfif RunningTotalPCount NEQ 0>
							<b>#NumberFormat((RunningTotalSec/RunningTotalPCount),0.00)#</b> of #catTotal#
						</cfif>
						
						<cfset TotalTotal = TotalTotal+catTotal>
						<cfset catTotal = 0>
						<cfset RunningTotalSec = 0>
					</td>
				
			</tr>
		</tbody>
	</table>
	</cfif>
	</cfloop>
<table width="100%">

		<tbody>
			
			<tr>
					<td class="text-right">
					
					</td>
					<td width="200" colspan="2" class="text-right">
						<cfif RunningTotalPCount EQ 0>
							<cfset RunningTotalPCount = 1>
						</cfif>
						Total Project Score: <b>#NumberFormat((RunningTotal/RunningTotalPCount),0.00)#</b> of #TotalTotal#
					</td>
				
				
				
			</tr>
		</tbody>
	</table>
	<input type="hidden" value="#FieldCount#" name="FieldCount">
</cfoutput>