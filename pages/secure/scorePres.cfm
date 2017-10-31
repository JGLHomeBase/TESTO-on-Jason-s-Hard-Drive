

<!--- Get Records --->
<cfinvoke component="knex.comp" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getCompList"
        whatFields = "*"
        Where = "SessionComp">
<!---/ Get Records --->


<!--- Variables --->
<cfparam name=URL.project default ="0">
<cfparam name=URL.report default ="0">
<cfparam name=URL.MyersBrigg default ="INSP">
<!---/ Variables --->

<!--- Get Data --->
<cfinclude template="#absoluteURL#legos/dump.cfm">
<!---/ Get Data --->

<!--- Update Scores --->
<cfif FORM.action EQ "process">

	<cfset formfields = "compID, projectID, userID, score1, score2, score3, score4, score5, score6, score7, score8, score9, score10, score11, score12, score13, score14, score15, score16, score18, score19, score20">
	<cfif FORM.scoreID EQ "" OR FORM.scoreID EQ 0>
		  <!--- Insert Scores --->
          <cfinvoke component="knex.score" 
            method="insert"
            DataSource = "#DataSource#"
            formFields = "#formfields#">
          <!---/ Insert Scores --->
	<cfelse>
		  <!--- Update Scores --->
          <cfinvoke component="knex.score" 
            method="update"
            DataSource = "#DataSource#"
            formFields = "#formfields#">
          <!---/ Update Scores --->
	</cfif>




	<cfquery datasource="#datasource#" name="setTotal">
		SELECT score1, score2, score3, score4, score5, score6, score7, score8, score9, score10, score11, score12, score13, score14, score15, score16, score18, score19, score20 FROM scores WHERE projectID = <cfqueryparam value="#URL.project#"> AND compID = <cfqueryparam value="#SESSION.compID#">
	</cfquery>
	<cfset RunningTotal = 0>
	<cfloop query="setTotal">
		<cfset RunningTotal = RunningTotal+setTotal.score1+setTotal.score2+setTotal.score3+setTotal.score4+setTotal.score5+setTotal.score6+setTotal.score7+setTotal.score8+setTotal.score9+setTotal.score10+setTotal.score11+setTotal.score12+setTotal.score13+setTotal.score14+setTotal.score15+setTotal.score16+setTotal.score18+setTotal.score19+setTotal.score20>
	</cfloop>
	<cfset RunningTotal = NumberFormat(RunningTotal/setTotal.RecordCount,0.00)>
	<cfset FORM.projectID = URL.project>
	<cfset FORM.projectScore = RunningTotal>
	<cfupdate datasource="#DataSource#" tablename="projects" formfields="projectID, projectScore">


	<cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Scores updated successfully">
</cfif>
<!---/ Update Scores --->
   

<!--- Get Report Template --->
<!--- Get Records --->
<cfinvoke component="knex.reports" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getReport"
        whatFields = "reportPayload, reportID"
        Where = "thisReport">
<!---/ Get Records --->

<!---/ Get Report Template --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
               <cfif URL.MyersBrigg EQ "ENTP">
               	HomeBase  Program Evaluation
               <cfelseif  URL.MyersBrigg EQ "INFJ">
               	Erroneous Program Evaluation
               	<cfelse>
                Draft Program Evaluation
               </cfif>
               
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<cfif GetCompInfo.ScoringOpen EQ 0>
  <div class="panel text-center">
    <h2 class="MakeRed">Scoring Closed</h2>
  </div>

 <cfelse>
 	<div class="row">
		<div class="large-12 columns">
	    <a href="##" class="button right"  data-open="scorecard">Project Scorecard</a>
	    </div>
	   </div> 	
</cfif>


<!--- Build Report --->
<cfoutput>
	<cfif getReport.reportPayload NEQ "">
		<cfloop list="#getReport.reportPayload#" index="module">
      <!--- Get Module --->
      <cfinvoke component="knex.modules" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getReportMod"
            whatFields = "*"
            Where = "namedModule"
            modID = "#module#">
      <!---/ Get Module --->
			<div class="PrintModule">
				<!--- Header --->
				<cfif getReportMod.header NEQ "" OR URL.ridin EQ "dirty">
					<div class="row">
						<div class="large-12 columns" id="#module#">
							<a id="#getReportMod.reportModID#" name="getReportMod.modShortName">#getReportMod.header#</a>
						</div>
					</div>
				<cfelse>
					<a id="#module#"></a>
				</cfif>
				<!---/ Header --->

				<!--- Contnet --->
				<cfif getReportMod.modType EQ "file">
					<cfinclude template="#absoluteURL#hotwheels/#getReportMod.modShortName#.cfm">
				<cfelseif getReportMod.modType EQ "HTML">
					<div class="row">
						<div class="large-12 columns">
							#getReportMod.Content#
						</div>
					</div>
				</cfif>
				<!---/ Content --->

				<!--- Footer --->
				<cfif getReportMod.footer NEQ "">
					<div class="row">
						<div class="large-12 columns">
							#getReportMod.footer#
						</div>
					</div>
				</cfif>
				<!---/ Footer --->
			</div>
		</cfloop>
		<cfif URL.ridin EQ "dirty">
			<ol class="joyride-list" data-joyride>
				<cfloop list="#getReport.reportPayload#" index="module">
                      <!--- Get Module --->
                      <cfinvoke component="knex.modules" 
                            method="get"
                            DataSource = "#DataSource#"
                            returnVariable = "getReportMod"
                            whatFields = "*"
                            Where = "namedModule"
                            modID = "#module#">
                      <!---/ Get Module --->
					<cfif getReportMod.RideTitle NEQ "" OR getReportMod.RideText NEQ "">
							<li data-id="#getReportMod.ReportModID#"
								data-button="Next"
								data-options="tip_location: top; prev_button: true">
								<h3>#getReportMod.RideTitle#</h3>
								<p>#getReportMod.RideText#</p>
							</li>
						
					</cfif>
				</cfloop>
			</ol>
		</cfif>
	</cfif>
</cfoutput>
<!---/ Build Report --->




<div id="scorecard" class="reveal" data-reveal>
  <cfinclude template="#absoluteURL#/legos/scorecard2.cfm">
</div>