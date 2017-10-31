<!--- Math --->
<cfset mathCols="20">
<cfset mathRows="1">
<cfinclude template="#absoluteurl#legos/mathCheck.cfm">
<!---/ Math --->

<cfquery datasource="#datasource#" name="getScore">
	SELECT * FROM scores 
	WHERE projectID = <cfqueryparam value="#URL.project#">
	AND userID = <cfqueryparam value="#SESSION.userID#">
</cfquery>
<cfoutput>
	<div class="panel BGLightGray text-center">
	Important: Your scores are not saved until you click <i>submit</i>
	</div>
	<form action="#CurrentPageVar#" method="post" data-abide>
	<input type="hidden" name="projectID" value="#URL.project#">
	<input type="hidden" name="scoreID" value="#getScore.scoreID#">
	<input type="hidden" name="userID" value="#SESSION.userID#">
	<input type="hidden" name="compID" value="#SESSION.compID#">
	<input type="hidden" name="action" value="process">
	<h1>Scoresheet &mdash; #ProjectLongName#</h1>


	<cfset fieldCount = 0>
	<cfset catCount = 0>
	<cfset TotalTotal=0>
	<cfset CatTotal=0>
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
			<th width="200">
				Performance
			</th>
			<th width="150" colspan="2">Points Awarded</th>
		</thead>
		<tbody>
			<cfif getCats.catDesc NEQ "">
				<tr>
					<td colspan="3">
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
					<tr>
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
						<td width="75">
							<label>Score</label>
							<cfset CurrentScore = getScore["score"&FieldCount]>
							<cfif CurrentScore NEQ "" AND getFactors.forced NEQ "1">
					       	<cfset DefaultScore = CurrentScore>
					       </cfif>
					       <cfif getFactors.forced EQ "1">
					       	<cfset forceScoreReq = " readonly">
					       	<cfset forceScoreClass = " BGLightGray">
					       <cfelse>
					       	<cfset forceScoreReq = "">
					       	<cfset forceScoreClass = "">
					       </cfif>
							<input type="text"
							       name="score#fieldCount#"
							       
							       value="#DefaultScore#"
							       placeholder="0"
							       pattern="number"
							       maxlength="5"
							       class="col#CatCount# row1#forceScoreClass#"
							       required#forceScoreReq#>
							<small class="form-error">Must be a number</small>
						</td>
						<td width="75">
							of #maxPoints#
							<cfif maxPoints NEQ "">
								<cfset catTotal=catTotal+maxPoints>
							</cfif>
						</td>
					</tr>
				</cfif>
			</cfloop>
			<tr>
				<td colspan="2" class="text-right">
					Section Total
				</td>

				<td width="75">
					<input type="text"
					       name="score"
					       value=""
					       placeholder="0"
					       pattern="number"
					       maxlength="5"
					       readonly
					       id="sumC#CatCount#"
					       class="BGLightGray">
					<small class="form-error">Must be a number</small>
				</td>
				<td width="75">
					of #catTotal#
					<cfset TotalTotal = TotalTotal+catTotal>
					<cfset catTotal = 0>
						</td>
			</tr>
		</tbody>
	</table>
	</cfif>
	</cfloop>
<table width="100%">
		<thead>
			<th>
				Total Score
			</th>
			<th width="200"><br>
			</th>
			<th width="150" colspan="2">Points Awarded</th>
		</thead>
		<tbody>
			
			<tr>
				<td colspan="2" class="text-right">
						<b>Total Project Score</b>
				</td>
				
				<td width="75">
					<input type="text"
					       name="scoreTotal"
					       placeholder="0"
					       pattern="number"
					       maxlength="5"
					       readonly
					       id="sumR1"
					       class="BGLightGray">
					<small class="form-error">Must be a number</small>
				</td>
				<td width="75">
					of #TotalTotal#
				</td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" value="#FieldCount#" name="FieldCount">
	 <input type="submit" value="submit" name="submit" class="small button secondary">
	</form>
</cfoutput>