<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

 <!--- Get Competition Info --->
 <cfinvoke component="knex.comp" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getCompList"
            whatFields = "*"
            Where = "SessionComp">
 <!---/ Get Competition Info --->

<!--- Variables --->
<cfparam name=URL.project default ="0">
<cfparam name=URL.report default ="0">
<cfparam name=URL.MyersBrigg default ="ENTP">
<cfparam name=URL.Ridin default ="0">
<cfparam name=URL.game default ="off">
<cfparam name=URL.sort default ="type">
<cfparam name=URL.trees default ="burn">
<cfparam name=URL.witsec default ="soprano">
<cfparam name=URL.charts default ="show">
<cfparam name=URL.avg default ="show">
<!---/ Variables --->

<!--- Get Data --->
<cfinclude template="#absoluteURL#legos/dump.cfm">
<!---/ Get Data --->

<!--- Update Scores --->
<cfif FORM.action EQ "process">
	<cfset formfields = "compID, projectID, userID">
	<cfloop index="fieldNum" from="1" to="#FORM.fieldCount#">
		<cfset formfields = listAppend("#formfields#", "score#fieldNum#")>
	</cfloop>
      <!--- Get User --->
      <cfinvoke component="knex.users" 
          method="getUser"
          DataSource = "#DataSource#"
          returnVariable = "userCheck">
      <!---/ Get User --->
	<cfif userCheck.RecordCount LT 1>
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
	<cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Scores updated successfully">
<cfelseif FORM.action EQ "targetedUpdate" AND SESSION.authLevel LTE 5>
	<cfset formfields = "compID, projectID, userID">
	<cfset formfields = listAppend("#formfields#", "score#targetField#")>
	<cfupdate datasource="#datasource#" tablename="scores" formfields="scoreID, #formfields#">
<cfelseif FORM.action EQ "bulkUpdate" AND SESSION.authLevel LTE 5>
	<cfset formfields = "compID, projectID">
	<cfset formfields = listAppend("#formfields#", "score#targetField#")>
	<cfloop list="#FORM.scoreIDList#" index="scoreID">
		<cfset FORM.scoreID = scoreID>
		<cfupdate datasource="#datasource#" tablename="scores" formfields="scoreID, #formfields#">
	</cfloop>
</cfif>


<cfif FORM.action EQ "process" OR FORM.action EQ "targetedUpdate" OR FORM.action EQ "bulkUpdate">
      <!--- Get Scores --->
      <cfinvoke component="knex.score" 
          method="get"
          DataSource = "#DataSource#"
          returnVariable = "setTotal">
      <!---/ Get Scores --->
	<cfset RunningTotal = 0>
	<cfloop query="setTotal">
			<cfset RunningTotal = RunningTotal+setTotal.score1+setTotal.score2+setTotal.score3+setTotal.score4+setTotal.score5+setTotal.score6+setTotal.score7+setTotal.score8+setTotal.score9+setTotal.score10+setTotal.score11+setTotal.score12+setTotal.score13+setTotal.score14+setTotal.score15+setTotal.score16+setTotal.score17+setTotal.score18+setTotal.score19+setTotal.score20+setTotal.score21+setTotal.score22+setTotal.score23+setTotal.score24+setTotal.score25>
	</cfloop>
	<cfif setTotal.RecordCount GT 0>
		<cfset RunningTotal = NumberFormat(RunningTotal/setTotal.RecordCount,0.00)>
	<cfelse>
		<cfset RunningTotal = 0>
	</cfif>
	
	<cfset FORM.projectID = URL.project>
	<cfset FORM.projectScore = RunningTotal>
	<cfupdate datasource="#DataSource#" tablename="projects" formfields="projectID, projectScore">
</cfif>
<!---/ Update Scores --->
   

<!--- Get Report Template --->
 <cfinvoke component="knex.reports" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getReport"
            whatFields = "reportPayload, reportID, joyride"
            Where = "ThisReport">
<cfif getReport.joyRide EQ "1">
	<cfset URL.ridin = "dirty">
</cfif>
<!---/ Get Report Template --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
               <cfif URL.game EQ "ON">
               	#ProjecTLongName#
               <cfelseif URL.MyersBrigg EQ "ENTP">
               	HomeBase Program Evaluation
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




<cfif URL.game EQ "on" AND URL.trees NEQ "kill">
	<div class="panel hide-for-print">
		<div class="row">
			<div class="medium-6 columns">
				<h3 class="">Project Navigation</h3>
			</div>
			<div class="medium-6 columns text-right">
				<cfoutput><a href="#CurrentPage#?project=#URL.project#&report=#URL.report#&game=#URL.game#&sort=#URL.sort#&witsec=#URL.witsec#&avg=#URL.avg#&charts=#URL.charts#&trees=kill" target="_blank"><i class="fi-print"></i> Print</a> | </cfoutput>
				<a href="scoreHome.cfm">back</a>
			
			</div>
			<div class="large-12 columns">
			<cfoutput>
				<form action="#CurrentPage#">
					<input type="hidden" name="report" value="#URL.report#">
					<input type="hidden" name="game" value="#URL.game#">
                      <!--- Get Projects --->
                      <cfinvoke component="knex.projects" 
                            method="scoreGetProjects"
                            DataSource = "#DataSource#"
                            cocID = "#getCompList.cocID#"
                            returnVariable = "scoreGetProjects">
                      <!---/ Get Projects --->
				    <div class="row">
						<div class="small-12 columns">
							<label>Project</label>
						    <select name="project" onchange="this.form.submit()">
						    	<cfloop query="scoreGetProjects">
						    		<option value="#scoreGetProjects.projectID#"<cfif scoreGetProjects.projectID EQ URL.project> SELECTED</cfif>>
						    			<cfif URL.sort EQ "type">
						    			  #scoreGetProjects.projectComponentName# &mdash; #scoreGetProjects.ProjectLongName# &mdash; #agencyLongName#  
									      <cfelseif URL.sort EQ "agency">
									      #agencyLongName# &mdash;  #scoreGetProjects.ProjectLongName# (#scoreGetProjects.projectComponentName#)
									      <cfelseif URL.sort EQ "name">
									     	#scoreGetProjects.ProjectLongName# &mdash; #agencyLongName#  (#scoreGetProjects.projectComponentName#)
								    	</cfif>
						    		
						    		</option>
						    	</cfloop>
						    </select>
				   		 </div>
				   	</div>
				  <div class="row">
				    <div class="small-3 columns">
						<label>Sort</label>
					    <select name="sort" onchange="this.form.submit()">
					    	<option value="type"<cfif URL.sort EQ "type"> SELECTED</cfif>>Type</option>
					    	<option value="agency"<cfif URL.sort EQ "agency"> SELECTED</cfif>>Agency</option>
					    	<option value="name"<cfif URL.sort EQ "name"> SELECTED</cfif>>Name</option>
					    </select>
				    </div>
				    <div class="small-3 columns">
						<label>Anonymous Scoring</label>
					    <select name="witsec" onchange="this.form.submit()">
					    	<option value="soprano"<cfif URL.witsec EQ "soprano"> SELECTED</cfif>>Off</option>
					    	<option value="true"<cfif URL.witsec EQ "true"> SELECTED</cfif>>On</option>
					    </select>
				    </div>
				    <div class="small-3 columns">
						<label>Charts</label>
					    <select name="charts" onchange="this.form.submit()">
					    	<option value="hide"<cfif URL.charts EQ "hide"> SELECTED</cfif>>Hide</option>
					    	<option value="show"<cfif URL.charts EQ "show"> SELECTED</cfif>>Display</option>
					    </select>
				    </div>
				    <div class="small-3 columns">
						<label>Averages</label>
					    <select name="avg" onchange="this.form.submit()">
					    	<option value="hide"<cfif URL.avg EQ "hide"> SELECTED</cfif>>Hide</option>
					    	<option value="show"<cfif URL.avg EQ "show"> SELECTED</cfif>>Display</option>
					    </select>
				    </div>
				</div>
				</form>
			</cfoutput>
		</div>
		</div>
	</div>
</cfif>

<cfif getCompList.ScoringOpen EQ 0 AND SESSION.authLevel EQ 7>
  <div class="panel text-center">
    <h2 class="MakeRed">Scoring Closed</h2>
  </div>

 <cfelse>
 	<div class="row">
		<div class="large-6 columns">
          <!--- Get Documents --->
          <cfinvoke component="knex.docs" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getdoc"
                whatFields = "*"
                Where = "NotHidden"
                Order = "docName ASC">
          <!---/ Get Documents --->
		<cfif getdoc.RecordCount GT 0>
			<button href="##" data-dropdown="drop1" aria-controls="drop1" aria-expanded="false" class="button dropdown left BGGreen hide-for-print">Supplemental Materials</button><br>
			<ul id="drop1" data-dropdown-content class="f-dropdown" aria-hidden="true" tabindex="-1">
			  <cfloop query="getdoc">
			  	<cfoutput>
			  		<li><a href="#getdoc.docBox#" target="_blank">#getdoc.docName#</a></li>
			  	</cfoutput>
			  </cfloop>
			</ul>
		</cfif>
		</div>
		<div class="large-6 columns">
		<cfif SESSION.authLevel EQ 7 AND getCompList.ScoringOpen EQ 1 >
			  <a href="##" class="button right hide-for-print"  data-open="scorecard">Project Scorecard</a>
		 <cfelseif SESSION.authLevel LTE 5 AND URL.game NEQ "on">
	    	<cfoutput>
	   		 <a href="#CurrentPage#?project=#URL.project#&report=#URL.report#&game=on" class="button right success hide-for-print" target="_blank">Summary</a>
	   		</cfoutput>
	   	<cfelseif SESSION.authLevel LTE 5 AND URL.game EQ "on">
	   		<cfoutput>
	   		 <a href="#CurrentPage#?project=#URL.project#&report=#URL.report#" target="_blank" class="button right success hide-for-print" >Program Evaluation</a>
	   		</cfoutput>
		</cfif>


	    </div>
	   </div> 	
</cfif>

<cfif URL.game NEQ "ON">
	<!--- Build Report --->
	<cfoutput>
		<cfif getReport.reportPayload NEQ "">
			<cfloop list="#getReport.reportPayload#" index="module">
                  <!--- Get Module --->
                  <cfinvoke component="knex.modules" 
                        method="get"
                        DataSource = "#DataSource#"
                        modID = "#module#"
                        returnVariable = "getReportMod"
                        whatFields = "*"
                        Where = "NamedModule">
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
                                modID = "#module#"
                                returnVariable = "getReportMod"
                                whatFields = "*"
                                Where = "NamedModule">
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
	  <cfinclude template="#absoluteURL#/legos/scorecard.cfm">
	</div>

<cfelseif URL.trees EQ "kill">
	
	<div class="row">
		<div class="large-12 columns">
			<cfinclude template="#absoluteURL#/legos/scorecard2.cfm">
		</div>
	</div>
	
<cfelse>
	
	<div class="row">
		<div class="large-12 columns">
			<cfinclude template="#absoluteURL#/legos/scorecard2.cfm">
		</div>
	</div>
	
</cfif>



