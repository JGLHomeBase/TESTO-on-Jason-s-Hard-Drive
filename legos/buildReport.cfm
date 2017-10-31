<!--- Variables --->
<cfparam name=URL.project default ="0">
<cfparam name=URL.report default ="0">
<cfparam name=URL.Ridin default ="0">
<!---/ Variables --->


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

<cfsavecontent variable="report">
    <!--- Build Report --->
    <cfoutput>
        <cfif getReport.reportPayload NEQ "">
            <cfquery name="getApps">
              SELECT compapp.appName, compapp.scoreDisable
              FROM compapp
              WHERE compapp.compappID = <cfqueryparam value="#URL.app#">
              </cfquery>
            <cfif  URL.score EQ "card">
                <div class="row">
                    <div class="large-12 columns">
                        
                        <h1>#getApps.appName#</h1>
                        <hr>
                    </div>
                </div>
            </cfif>
            <cfif URL.score NEQ "off" AND SESSION.compID NEQ 0 AND getApps.scoreDisable EQ 0>
               <div class="row">
                  <div class="small-12 columns">
                    <br>
                    <div class="panel">
                        <h4>NOTE: This applicant is not scored.</h4>  
                    </div>
                  </div>
                </div>
            </cfif>
            <cfloop list="#getReport.reportPayload#" index="module">
                <!--- Get Module --->
                <cfinvoke component="knex.modules" 
                        method="get"
                        DataSource = "#DataSource#"
                        returnVariable = "getReportMod"
                        whatFields = "*"
                        Where = "NamedModule"
                        modID="#module#">
                <!---/ Get Module --->
                <cfif getReportMod.factorID EQ 0>
                    <cfif getReportMod.panel EQ 1>
                        <cfset panel = " panel">
                    <cfelseif getReportMod.panel EQ 2>
                        <cfset panel = " panel BGLightGray">
                    <cfelseif getReportMod.panel EQ 3>
                        <cfset panel = " panel BGDarkGray">
                    <cfelseif getReportMod.panel EQ 4>
                        <cfset panel = " panel BGOrange">
                    <cfelseif getReportMod.panel EQ 5>
                        <cfset panel = " panel BGGreen">
                    <cfelse>
                        <cfset panel = "">
                    </cfif>
                    <div class="PrintModule">
                        <!--- Contnet --->
                        <cfif URL.action NEQ "PDF">
                        <div class="row">
                            <div class="medium-12 columns#panel#">
                        </cfif>
                                <cfif getReportMod.modType EQ "file" AND URL.score NEQ "card">
                                    <cfinclude template="#absoluteURL#hotwheels/#getReportMod.modShortName#.cfm">
                                <cfelseif getReportMod.modType EQ "merge" AND URL.score NEQ "card">
                                    <cfset ModContent = getReportMod.Content>
                                    <cfif getReportMod.MergeFields NEQ "" AND getReportMod.MergeFields NEQ 0>		
                                        <cfloop list="#getReportMod.MergeFields#" index="field">
                                            <!--- Get Data  --->
                                            <cfinvoke component="knex.pm"
                                                      method="getProject"
                                                      apr="#URL.apr#"
                                                      project="#URL.project#"
                                                      pm="#field#"
                                                      returnvariable="pm">
                                            <!---/ Get Data  --->
                                            <!---/ Get Results --->
                                            <cfset ModContent = REReplace(ModContent, "!#pm.pmName#!", pm.modalLink, "all")>
                                            #pm.modal#
                                        </cfloop>
                                    </cfif>
                                    #ModContent#
                                <cfelseif getReportMod.modType EQ "chart" AND URL.score NEQ "card">
                                    <cfif listContainsNoCase("print,pdf,share", url.action)>
                                        <cfset defaultWidth = 600>
                                    <cfelse>
                                        <cfset defaultWidth = 1000>
                                    </cfif>
                                    <cfif (not listContainsNoCase("print,pdf,share", url.action))>
                                        <cfif getReportMod.chartID5 NEQ 0>
                                            <div class="row">
                                                <div class="medium-2 columns">
                                                    <cfset chart.chartID = getReportMod.chartID1>
                                                    <cfset chart.width = defaultWidth/6>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-2 columns">
                                                    <cfset chart.chartID = getReportMod.chartID2>
                                                    <cfset chart.width = defaultWidth/6>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-4 columns">
                                                    <cfset chart.chartID = getReportMod.chartID3>
                                                    <cfset chart.width = defaultWidth/3>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-2 columns">
                                                    <cfset chart.chartID = getReportMod.chartID4>
                                                    <cfset chart.width = defaultWidth/6>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-2 columns">
                                                    <cfset chart.chartID = getReportMod.chartID5>
                                                    <cfset chart.width = defaultWidth/6>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                            </div>
                                        <cfelseif getReportMod.chartID4 NEQ 0>
                                            <cfset chart.width = defaultWidth/4>
                                            <div class="row">
                                                <div class="medium-3 columns">
                                                    <cfset chart.chartID = getReportMod.chartID1>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-3 columns">
                                                    <cfset chart.chartID = getReportMod.chartID2>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-3 columns">
                                                    <cfset chart.chartID = getReportMod.chartID3>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-3 columns">
                                                    <cfset chart.chartID = getReportMod.chartID4>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                            </div>
                                        <cfelseif getReportMod.chartID3 NEQ 0>
                                            <cfset chart.width = defaultWidth/3>
                                            <div class="row">
                                                <div class="medium-4 columns">
                                                    <cfset chart.chartID = getReportMod.chartID1>

                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-4 columns">
                                                    <cfset chart.chartID = getReportMod.chartID2>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-4 columns">
                                                    <cfset chart.chartID = getReportMod.chartID3>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                            </div>
                                        <cfelseif getReportMod.chartID2 NEQ 0>
                                            <cfset chart.width = defaultWidth/2>
                                            <div class="row">
                                                <div class="medium-6 columns">
                                                    <cfset chart.chartID = getReportMod.chartID1>

                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                                <div class="medium-6 columns">
                                                    <cfset chart.chartID = getReportMod.chartID2>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                            </div>
                                        <cfelseif getReportMod.chartID1 NEQ 0>
                                            <cfset chart.width = defaultWidth>
                                            <div class="row">
                                                <div class="medium-12 columns">
                                                    <cfset chart.chartID = getReportMod.chartID1>

                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </div>
                                            </div>
                                        </cfif>
                                        <div class="row">
                                            <div class="medium-12 columns">
                                                <br>
                                            </div>
                                        </div>
                                    <cfelse>
                                        <!--- Table Version for Print --->
                                        <div class="row">
                                            <div class="large-12 columns">
                                                <table width="100%">
                                                    <tr align="center">
                                                        <cfif getReportMod.chartID5 NEQ 0>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID1>
                                                                <cfset chart.width = defaultWidth/6>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID2>
                                                                <cfset chart.width = defaultWidth/6>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID3>
                                                                <cfset chart.width = defaultWidth/3>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID4>
                                                                <cfset chart.width = defaultWidth/6>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID5>
                                                                <cfset chart.width = defaultWidth/6>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                        <cfelseif getReportMod.chartID4 NEQ 0>
                                                            <cfset chart.width = defaultWidth/4>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID1>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID2>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID3>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID4>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                        <cfelseif getReportMod.chartID3 NEQ 0>
                                                            <cfset chart.width = defaultWidth/3>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID1>

                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID2>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID3>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                        <cfelseif getReportMod.chartID2 NEQ 0>
                                                            <cfset chart.width = defaultWidth/2>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID1>

                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                            <td class="text-center">
                                                                <cfset chart.chartID = getReportMod.chartID2>
                                                                <cfset chart.height = getReportMod.height>
                                                                <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                            </td>
                                                        <cfelseif getReportMod.chartID1 NEQ 0>
                                                            <cfset chart.width = defaultWidth>
                                                                <td class="text-center">
                                                                    <cfset chart.chartID = getReportMod.chartID1>

                                                                    <cfset chart.height = getReportMod.height>
                                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                                </td>
                                                        </cfif>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <!--- Table Version for Print --->
                                    </cfif>
                                <cfelseif getReportMod.modType EQ "chartMerge" AND URL.score NEQ "card">
                                    <cfif listContainsNoCase("print,pdf,share", url.action)>
                                        <cfset defaultWidth = 600>
                                    <cfelse>
                                        <cfset defaultWidth = 1000>
                                    </cfif>
                                    <div class="row">
                                            <div class="medium-6 columns">
                                                <cfif getReportMod.chartID1 NEQ 0>
                                                    <cfset chart.width = defaultWidth/2>
                                                    <cfset chart.chartID = getReportMod.chartID1>
                                                    <cfset chart.height = getReportMod.height>
                                                    <cfinclude template="#AbsoluteURL#legos/buildChart.cfm">
                                                </cfif>
                                            </div>
                                            <div class="medium-6 columns">
                                                <cfset ModContent = getReportMod.Content>
                                                <cfif getReportMod.MergeFields NEQ "" AND getReportMod.MergeFields NEQ 0>		
                                                    <cfloop list="#getReportMod.MergeFields#" index="field">
                                                        <!--- Get Data  --->
                                                        <cfinvoke component="knex.pm"
                                                                  method="getProject"
                                                                  apr="#URL.apr#"
                                                                  project="#URL.project#"
                                                                  pm="#field#"
                                                                  returnvariable="pm">
                                                        <!---/ Get Data  --->
                                                        <!---/ Get Results --->
                                                        <cfset ModContent = REReplace(ModContent, "!#pm.pmName#!", pm.modalLink, "all")>
                                                        #pm.modal#
                                                    </cfloop>  
                                                </cfif>
                                                #ModContent#
                                            </div>
                                        </div>
                                <cfelseif URL.score NEQ "card">
                                    #getReportMod.Content#
                                </cfif>
                        <cfif URL.action NEQ "PDF">
                            </div>
                        </div>
                        </cfif>
                        <!---/ Content --->
                    </div>
                <cfelseif URL.score NEQ "off" AND SESSION.compID NEQ 0 AND getApps.scoreDisable EQ 1>
                   <!--- Score Factor --->
                   <cfinclude template="#AbsoluteURL#legos/ScorePanel.cfm">
                   <!--- Score Factor --->
                </cfif>
            </cfloop>
            <cfif URL.ridin EQ "dirty">
                <ol class="joyride-list" data-joyride>
                    <cfloop list="#getReportMod.reportPayload#" index="module">
                        <!--- Get Module --->
                        <cfinvoke component="knex.modules" 
                                method="get"
                                DataSource = "#DataSource#"
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
</cfsavecontent>

<cfif URL.action EQ "PDF">
    <cfoutput>
        <cfsavecontent variable="printReport">
            <cfinclude template="#AbsoluteURL#legos/head.cfm">
            #report#
            <cfinclude template="#AbsoluteURL#legos/foot.cfm">    
        </cfsavecontent>
    </cfoutput>
    <cfhtmltopdf marginBottom=".75"
                 marginTop=".75"
                 marginLeft=".5"
                 marginRight=".5"><cfoutput>#printReport#</cfoutput>
        <cfhtmltopdfitem type="header"
                         align="left"
                         marginLeft=".5"
                         marginTop=".5"
                         image="#FullURL#img/icons/hbprint.jpg"
                         showonprint="yes"></cfhtmltopdfitem>
        <cfhtmltopdfitem type="footer"
                         align="left"
                         marginLeft=".5"
                         showonprint="yes">
               <span style="font-family:'Lato'; font-size:8;">Page _PAGENUMBER of _LASTPAGENUMBER</span>   
        </cfhtmltopdfitem>
    </cfhtmltopdf>
<cfelse>
    <cfoutput>
        <cfif (not listContainsNoCase("print,share", url.action))>
        <!--- Header Row --->
        <div class="CFSmallBox">
            <div class="row">
              <div class="medium-12 columns">
                <cfoutput>
                    <h1 class="CFHeader"><br>
                        HomeBase Program Evaluation
                    </h1>
                </cfoutput>
              </div>
            </div>
        </div>
        <!---/ Header Row --->
        
        
        <cfinclude template="#absoluteURL#legos/reportDisplayNav.cfm">
                
        <div class="row">
        <div class="medium-6 columns">
        <!--- Get Docs --->
        <cfinvoke component="knex.docs" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getdoc"
                whatFields = "*"
                Where = "NotHidden"
                Order = "docName">
        <!---/ Get Docs --->

            
            <!---This Button Does Not Work and Has Been Put in Quarantine
            
            <cfif getdoc.RecordCount GT 0>
                <button href="##" data-toggle="Supplemental-Materials" aria-controls="drop1" aria-expanded="false" class="button dropdown left BGGreen">Supplemental Materials</button>
                <div class="dropdown-pane" id="Supplemental-Materials" data-dropdown>
                      <ul class="menu vertical">
                          <cfloop query="getdoc">
                            <cfoutput>
                                <li><a href="docView.cfm?doc=#getdoc.docID#&report=#URL.report#" target="_blank">#getdoc.docName#</a></li>
                            </cfoutput>
                          </cfloop>
                    </ul>
                </div>
                <br>
            </cfif>
            
            This Button Does Not Work and Has Been Put in Quarantine--->
            
            </div>
            <div class="medium-6 columns">
            </div>
           </div>
        </cfif>
        <div class="globalPad">
            #report#
        </div>
        <cfif URL.action EQ "print">
            <script>
            $(document).ready(function(){
                window.print();
            });
            </script>    
        </cfif>
        <cfif url.action eq "share">
			<!--- restore previous session values set in Application.cfc --->
			<cfset session.cocID = session.cocID_prior />
			<cfset session.cocCity = session.cocCity_prior />
		</cfif>
    </cfoutput>
</cfif>
