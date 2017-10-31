<!--- Math --->
<cfset mathCols="6">
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
	<table width="100%">
		<thead>
			<th width="25">3</th>
			<th>Program Performance and Client Outcomes</th>
			<th width="200">Maximum Available Score:<br>
			</th>
			<th width="75">Points Awarded</th>
		</thead>
		<tbody>
			<cfif projectComponentID EQ "2" OR projectComponentID EQ "5" OR projectComponentID EQ "10">
				<tr>
					<td>3a1</td>
					<td>
						The percentage of formerly homeless individuals who remain housed in the HUD permanent housing project for at least six months is at least 80%.
					</td>
					
					<td>
							<b>Up to 10 points:</b><br>
							10 pts. = 100% of HUD goal<br>
							9 pts. = 90&mdash;99.9%<br>
							8 pts. = 80&mdash;89.9%<br>
							7 pts. = 70&mdash;79.9%<br>
							6 pts. = 60&mdash;69.9%<br>
							5 pts. = 50&mdash;59.9%<br>
							4 pts. = 40&mdash;49.9%<br>
							0 pts. = Under 40%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score1"
						       value="#getScore.score1#"
						       placeholder="0"
						       pattern="number"
						       maxlength="5"
						       class="col1 col6"
						       required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
			<cfelse>
				<tr>
					<td>3a2</td>
					<td>
						The percentage of homeless persons who have moved from the HUD transitional housing project to a form of permanent housing is at least 80%  (HUD's goal).
					</td>
					<td>
							<b>Up to 10 points:</b><br>
							10 pts. = 100% of HUD goal<br>
							9 pts. = 90&mdash;99.9%<br>
							8 pts. = 80&mdash;89.9%<br>
							7 pts. = 70&mdash;79.9%<br>
							6 pts. = 60&mdash;69.9%<br>
							5 pts. = 50&mdash;59.9%<br>
							4 pts. = 40&mdash;49.9%<br>
							0 pts. = Under 40%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score1"
						       value="#getScore.score1#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col1 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
			</cfif>
				<tr>
					<td>3b</td>
					<td>
						Income: Program demonstrates success in increasing client income.  
					</td>
					<td>
							<b>Up to 10 points:</b><br>
							10pts. = 50&mdash;100%   of clients increase income<br>
							9pts. = 40&mdash;49.9%<br>
							8pts. = 30&mdash;39.9%<br>
							7pts. = 20&mdash;29.9%<br>
							6pts. = 15&mdash;19.9%<br>
							4pts. =   5&mdash;14.9%<br>
							2pts. =     0&mdash;4.9%<br>
							0 pts. = Under 40%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score2"
						       value="#getScore.score2#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col1 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>3c</td>
					<td>
						Mainstream Services:  Program demonstrates success in connecting clients with mainstream resources.<br><Br>

NOTE: Mainstream resources are publicly&mdash;funded programs that provide services, housing and income supports to poor persons whether they arehomeless or not. They include programs providing welfare, health care, mental health care, substance abuse treatment, and veterans' assistance. 
					</td>
					<td>
							<b>Up to 10 points:</b><br>
							10 pts. = 90&mdash;100% of clients receive benefits<br>
							9 pts. = 80&mdash;89.9%<br>
							8 pts. = 70&mdash;79.9%<br>
							7 pts. = 60&mdash;69.9%<br>
							6 pts. = 50&mdash;59.9%<br>
							0 pts. = Under 40%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score3"
						       value="#getScore.score3#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col1 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>3d</td>
					<td>
						Program Occupancy: Program demonstrates consistently high unit occupancy rates.
					</td>
					<td>
							<b>Up to 5 points:</b><br>
							5 pts. = 90&mdash;100%+ avg. occupancy rate<br>
							4 pts. = 80&mdash;89.9%<br>
							3 pts. = 70&mdash;79.9%<br>
							2 pts. = 60&mdash;69.9% <br>
							1 pts. = 50&mdash;59.9%<br>
							0 pts. = Under 40%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score4"
						       value="#getScore.score4#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col1 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>3e</td>
					<td>
						Length of Stay: Program demonstrates progress on their plan, as submitted with the 2013 application, to transition people to permanent housing as quickly as possible given the population it serves. Program also demonstrates a continued commitment to reducing the length of time people are considered homeless by HUD's definition.
					</td>
					<td>
							<b>Up to 10 points:</b>
						
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score5"
						       value="#getScore.score5#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col1 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>3f</td>
					<td>
						Recidivism: Program demonstrates low rates of recidivism.<br><Br> 

NOTES: Recidivism refers to the number of households who have obtainedpermanent housing but then return to homelessness at the same time or within 3 months of exiting a program. Effectively measuring recidivism will require follow up with participants and/or reviewing HMIS records 3 months after program exit to determine housing status.<br><Br> 

Data will be collected, but not scored, to set a baseline and gauge how programs are doing on this factor. The scoring criteria may be adjusted after analysis of information collected in 2014 and will take into account the unique characteristics of populations served as much as possible. Once the new HMIS system is more fully developed, we will look at this measure more quantitatively.
					</td>
					<td>
							<b>Reported, but not scored</b>
						
					</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>Section Total</b></td>
					<td><b>45 Points</b></td>
					<td>
						<label>Score</label>
						<input type="text"
						       name=""
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="BGLightGray"
						      required
						      readonly
						      id="sumC1">
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
		</tbody>
	</table>
	<table width="100%">
		<thead>
			<th width="25">4</th>
			<th>Budget and Administrative Efficiency</th>
			<th width="200">Maximum Available Score:<br>
			</th>
			<th width="75">Points Awarded</th>
		</thead>
		<tbody>
				<tr>
					<td>4a</td>
					<td>
						Program provides the required match and leverages additional resources as part of overall program budget.
					</td>
					<td>
							<b>Up to 7 points:</b><br>
							<i>Leverage</i><br>
							5pts. = More than 150%<br>
							4 pts. = 125&mdash;149.9% <br>
							3 pts. = 100&mdash;124.9%<br>
							2 pts. = 75&mdash;99.9% <br>
							1 pt. = 50&mdash;74.9%<br>
							<i>Match</i><br>
							2pts. =   More than 25%<br>
							0 pts. = Under 40%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score6"
						       value="#getScore.score6#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col2 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>4b</td>
					<td>
						Program has used all grant funds (legacy SHP only), maintained full program units (legacy S+C only), drawn down at least quarterly, and spent grant funds in a timely fashion.<br><br> Note: Quarterly draw&mdash;down requirements only applies once the grant has been executed. 
					</td>
					<td>
							<b>Up to 3 points:</b><br>
							3 pts. = 95&mdash;100% <br>
							2 pts. = 8&mdash;94%<br>
							1 pts. = 75%&mdash;84% <br>
							0 pts. = Less than 75%
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score7"
						       value="#getScore.score7#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col2 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
			
				<tr>
					<td colspan="2"><b>Section Total</b></td>
					<td><b>10 Points</b></td>
					<td>
						<label>Score</label>
						<input type="text"
						       name=""
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="BGLightGray"
						      required
						      readonly
						      id="sumC2">
					</td>
				</tr>
		</tbody>
	</table>
	<table width="100%">
		<thead>
			<th width="25">5</th>
			<th>Service Improvement Efforts</th>
			<th width="200">Maximum Available Score:<br>
			</th>
			<th width="75">Points Awarded</th>
		</thead>
		<tbody>
				<tr>
					<td>5a</td>
					<td>
						Program regularly solicits and incorporates client feedback into program design and management.
					</td>
					<td>
							<b>5 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score8"
						       value="#getScore.score8#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col3 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>5b</td>
					<td>
						Program has been responsive to outstanding or pending HUD program monitoring findings, financial audit findings, and has no other indication of major capacity issues. If there are currently unresolved monitoring issues, program fully describes and explains the agency's plans to resolve them
					</td>
					<td>
							<b>5 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score9"
						       value="#getScore.score9#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col3 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>5c</td>
					<td>
						Program intake and screening practices prioritize placement of the most vulnerable clients, including the chronically homeless and families with children.
					</td>
					<td>
							<b>5 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score10"
						       value="#getScore.score10#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col3 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>Section Total</b></td>
					<td><b>15 Points</b></td>
					<td>
						<label>Score</label>
						<input type="text"
						       name=""
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="BGLightGray"
						      required
						      readonly
						      id="sumC3">
					</td>
				</tr>
		</tbody>
	</table>
	<table width="100%">
		<thead>
			<th width="25">6</th>
			<th>HMIS &amp; Data Collection Capacity</th>
			<th width="200">Maximum Available Score:<br>
			</th>
			<th width="75">Points Awarded</th>
		</thead>
		<tbody>
				<tr>
					<td>6a</td>
					<td>
					Program runs data quality checks at least monthly
					</td>
					<td>
							<b>1 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score11"
						       value="#getScore.score11#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col4 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>6b</td>
					<td>
					Program demonstrates that it has an effective data quality assurance plan.  
					</td>
					<td>
							<b>1 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score12"
						       value="#getScore.score12#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col4 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>6c</td>
					<td>
					Program has less than 5% NULL or Missing Values for required HUD Universal and Program---Specific data elements.   
					</td>
					<td>
							<b>5 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score13"
						       value="#getScore.score13#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col4 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>6d</td>
					<td>
					Program has demonstrated that it uses data for program planning and evaluation purposes.  
					</td>
					<td>
							<b>3 points</b><br>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score14"
						       value="#getScore.score14#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col4 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>

				<tr>
					<td colspan="2"><b>Section Total</b></td>
					<td><b>10 Points</b></td>
					<td>
						<label>Score</label>
						<input type="text"
						       name=""
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="BGLightGray"
						      required
						      readonly
						      id="sumC4">
					</td>
				</tr>
		</tbody>
	</table>
	<table width="100%">
		<thead>
			<th width="25">7</th>
			<th>Community Vision &amp; Coordination</th>
			<th width="200">Maximum Available Score:<br>
			</th>
			<th width="75">Points Awarded</th>
		</thead>
		<tbody>
				<tr>
					<td>7a</td>
					<td>
					Program demonstrates that it has taken specific action steps in the past 12 months to help implement the CoC's 10 Year Plan to Prevent and End Homelessness. 
					</td>
					<td>
							<b>3 points</b><br>
							3 pts. = attendance at 10 Year Plan meetings & making significant contributions towards 10 Year Plan goals & leading 10 Year Plan initiatives
							<br>2 pts. = attendance at 10 Year Plan meetings & making significant contributions towards 10 Year Plan goals
							<br>1 pt. = attendance at 10 Year Plan meetings
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score15"
						       value="#getScore.score15#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col5 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>

				<tr>
					<td>7b</td>
					<td>
					Program demonstrates progress towards accomplishing the 10 Year Plan implementation action steps to which it committed itself in the 2013 application.
					</td>
					<td>
							<b>5 points</b>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score16"
						       value="#getScore.score16#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col5 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>7c</td>
					<td>
					Program identifies specific action steps that it will take in the next 12 monthsto help implement the CoC's 10 Year Plan to Prevent and End Homelessness.
					</td>
					<td>
							<b>5 points</b>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score17"
						       value="#getScore.score17#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col5 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>7d</td>
					<td>
					Program demonstrates that it employs successful strategies to assist persons to obtain and maintain permanent housing.
					</td>
					<td>
							<b>2 points</b>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score18"
						       value="#getScore.score18#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col5 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td>7e</td>
					<td>
					Program identifies emerging trends among the population it serves and has identified specific action steps to address those needs.
					</td>
					<td>
							<b>5 points</b>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score19"
						       value="#getScore.score19#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col5 col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>Section Total</b></td>
					<td><b>20 Points</b></td>
					<td>
						<label>Score</label>
						<input type="text"
						       name=""
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="BGLightGray"
						      required
						      readonly
						      id="sumC5">
					</td>
				</tr>
		</tbody>
	</table>
	<table width="100%">
		<thead>
			<th width="25">8</th>
			<th>Bonus and Total</th>
			<th width="200">Maximum Available Score:<br>
			</th>
			<th width="75">Points Awarded</th>
		</thead>
		<tbody>
				<tr>
					<td>8</td>
					<td>
					Agency increased the number of Permanent Housing beds in the communitywith either HUD funds or other sources. 
					</td>
					<td>
							<b>5 bonus points</b>
					</td>
					<td>
						<label>Score</label>
						<input type="text"
						       name="score20"
						       value="#getScore.score20#"
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="col6"
						      required>
						<small class="form-error">Must be a number</small>
					</td>
				</tr>
				<tr>
					<td colspan="2"><b>TOTAL</b></td>
					<td><b>100 Points</b></td>
					<td>
						<label>TOTAL</label>
						<input type="text"
						       name=""
						       placeholder="0"
						       pattern="number"
						      maxlength="5"
						      class="BGLightGray"
						      required
						      readonly
						      id="sumC6">
					</td>
				</tr>
		</tbody>
	</table>
	 <input type="submit" value="submit" name="submit" class="small button secondary">
	</form>
</cfoutput>