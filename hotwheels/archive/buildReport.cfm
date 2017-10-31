<!--- Variables --->
<cfparam name=URL.project default ="0">
<cfparam name=URL.report default ="0">
<cfparam name=URL.MyersBriggs default ="ISFP">
<cfparam name=URL.Ridin default ="0">
<!---/ Variables --->

<!--- Get Data --->
<cfinclude template="#absoluteURL#legos/dump.cfm">
<!---/ Get Data --->

<!--- Get Report Template --->
<!--- Get Report --->
<cfinvoke component="knex.reports" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getReport"
        whatFields = "reportPayload, reportID, joyRide"
        Where = "ThisReport">
<!---/ Get Report --->

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
               <cfif URL.MyersBriggs EQ "ENTP">
               	HomeBase  Program Evaluation
               <cfelseif  URL.MyersBriggs EQ "INFJ">
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

<div class="row">
	<div class="large-6 columns">

<!--- Get Docs --->
<cfinvoke component="knex.docs" 
        method="get"
        DataSource = "#DataSource#"
        returnVariable = "getdoc"
        whatFields = "*"
        Where = "NotHidden"
        Order = "docName">
<!---/ Get Docs --->
	<cfif getDocs.RecordCount GT 0>
		<button href="##" data-dropdown="drop1" aria-controls="drop1" aria-expanded="false" class="button dropdown left BGGreen">Local Application Materials</button><br>
		<ul id="drop1" data-dropdown-content class="f-dropdown" aria-hidden="true" tabindex="-1">
		  <cfloop query="getDocs">
		  	<cfoutput>
		  		<li><a href="#getDocs.docBox#" target="_blank">#getDocs.docName#</a></li>
		  	</cfoutput>
		  </cfloop>
		</ul>
	</cfif>
	</div>
	<div class="large-6 columns">
	

    </div>
   </div> 	
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
                    Where = "NamedModule">
            <!---/ Get Module --->
			<div class="PrintModule">
				<!--- Header --->
				<cfif getModule.header NEQ "" OR URL.ridin EQ "dirty">
					<div class="row">
						<div class="large-12 columns" id="#module#">
							<a id="#getModule.reportModID#" name="getModule.modShortName">#getModule.header#</a>
						</div>
					</div>
				<cfelse>
					<a id="#module#"></a>
				</cfif>
				<!---/ Header --->

				<!--- Contnet --->
				<cfif getModule.modType EQ "file">
					<cfinclude template="#absoluteURL#hotwheels/#getModule.modShortName#.cfm">
				<cfelseif getModule.modType EQ "HTML">
					<div class="row">
						<div class="large-12 columns">
							#getModule.Content#
						</div>
					</div>
				</cfif>
				<!---/ Content --->

				<!--- Footer --->
				<cfif getModule.footer NEQ "">
					<div class="row">
						<div class="large-12 columns">
							#getModule.footer#
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
                    Where = "NamedModule">
            <!---/ Get Module --->
					<cfif getModule.RideTitle NEQ "" OR getModule.RideText NEQ "">
							<li data-id="#getModule.ReportModID#"
								data-button="Next"
								data-options="tip_location: top; prev_button: true">
								<h3>#getModule.RideTitle#</h3>
								<p>#getModule.RideText#</p>
							</li>
						
					</cfif>
				</cfloop>
			</ol>
		</cfif>
	</cfif>
</cfoutput>
<!---/ Build Report --->


