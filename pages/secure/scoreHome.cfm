<!--- Defaults --->
<cfparam name="TFA" default="0">
<!---/ Defaults --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                #SESSION.compName# Panelist Instructions
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<!--- Get User Role Info --->
<cfquery name="roleCheck">
SELECT compPanelID, scoreAllow, scoreInclude
FROM comppanel
WHERE Active = '1'
    AND userID = <cfqueryparam value="#SESSION.userID#">
    AND compID = <cfqueryparam value="#SESSION.compID#">
</cfquery>
    
<cfif roleCheck.RecordCount EQ 0>
    <cfset roleScore = 0>
    <cfset roleInclude = 0>
<cfelse>
    <cfset roleScore = roleCheck.scoreAllow>
    <cfset roleInclude = roleCheck.scoreInclude>
</cfif>
<!---/ Get User Role Info --->

<!--- Get Comp Info --->
<cfquery datasource="#datasource#" name="GetCompInfo">
  SELECT * FROM comp WHERE compID = <cfqueryparam value="#SESSION.compID#">
</cfquery>
<!---/ Get Comp Info --->

<cfif GetCompInfo.ScoringOpen EQ 0>
  <div class="panel text-center">
    <h2 class="MakeRed">Scoring Closed</h2>
  </div>
</cfif>

<cfoutput>
<div class="GlobalPad">
    <div class="row">
      <div class="medium-12 columns">
        <cfif SESSION.authLevel lt 6>#GetCompInfo.PanelInstructions#</cfif>
      </div>
    </div>

    <div class="row">
      <div class="large-12 columns">
        <hr>
      </div>
    </div>
</div>
    
<div class="globalPad">
<div class="row">
  <div class="medium-9 columns">
     <!--- Get Applicants --->
		<cfquery name="getApps">
		SELECT
			compapp.appName, compapp.compAppID, compapp.projectID, agency.agencyName, compapp.fundAward, compapp.fundReq, compapp.reportID, compapp.score, c.aprDefaultID, c.Active as isCompActive
		FROM 
			compapp
				INNER JOIN projects ON compapp.projectID = projects.projectID
				INNER JOIN agency ON projects.agencyID = agency.agencyID
				INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
				INNER JOIN comp c ON c.cocID = projects.cocID and c.compID = <cfqueryparam value="#SESSION.compID#">
		WHERE 
			compapp.active = '1'
			AND compapp.compID = <cfqueryparam value="#SESSION.compID#">
			<cfif structKeyExists(session, "projectID")>
				<cfif isNumeric(session.projectID) and session.projectID>
					AND compapp.projectID = <cfqueryparam value="#SESSION.projectID#">
				</cfif>
			</cfif>
		ORDER BY compapp.projectID asc, projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC
		</cfquery>
      <!--- Get Applicants --->
    <h3>Project Applicants</h3>
    <cfif getApps.RecordCount GT 0>
        <table width="100%">
            <thead>
                <th>Project</th>
                <th>Agency</th>
                <th>Request</th>
                <cfif (getCompInfo.PeerOpen EQ 1 and SESSION.authLevel lt 6) OR SESSION.authLevel LT 6>
                    <th class="text-center">Panel Score</th>
                </cfif>
                <cfif roleScore EQ 1>
                    <th class="text-center">Your Score</th>
                </cfif>
                <cfif SESSION.authLevel lte 6>
                <th>Supplemental Questions</th>
				</cfif>
            </thead>
            <tbody>
                <cfloop query="getApps">
                    <tr>
                        <td>
                            <b>
                                <cfif GetCompInfo.reportsOpen EQ "1">
                                    <a href="display.cfm?app=#getApps.compAppID#&score=inline">#getApps.appName#</a>
                                <cfelse>
                                    #getApps.appName#
                                </cfif>
                            </b>
                        </td>
                        <td>#getApps.agencyName#</td>
                        <td>
                            <cfif getApps.fundAward NEQ "" AND getApps.fundAward NEQ 0>
                            #LSCurrencyFormat(fundAward)#
                            <cfelseif getApps.fundReq NEQ "" AND getApps.fundReq NEQ 0>
                            #LSCurrencyFormat(fundReq)#
                            <cfelse>
                                <i>Not funded</i>.
                            </cfif>
                        </td>
                        <cfif (getCompInfo.PeerOpen EQ 1 and SESSION.authLevel lt 6) OR SESSION.authLevel LT 6>
                            <!--- Panel Score --->
                            <td class="text-center">
                                <a href="scoreCard.cfm?app=#getApps.compAppID#">
                                  <cfif Right(NumberFormat(getApps.Score,"0.000"),3) EQ "000">
                                        #NumberFormat(getApps.Score,"0")#
                                    <cfelseif Right(DecimalFormat(getApps.Score),2) EQ "00">
                                        #NumberFormat(getApps.Score,"0.00")#
                                    <cfelseif Right(DecimalFormat(getApps.Score),1) EQ "0">
                                        #NumberFormat(getApps.Score,"0.0")#
                                    <cfelse>
                                        #getApps.Score#
                                    </cfif>
                                </a>
                            </td>
                            <!---/ Panel Score --->
                        </cfif>
                        <!--- Score --->
                        <cfif roleScore EQ 1>
                            <cfinvoke component="knex.sortinghat"
                                      method="getPanelistScore"
                                      datasource="#datasource#"
                                      returnVariable="getScore"
                                      compAppID="#getapps.compAppID#">
                            <td class="text-center">
                                <cfif GetCompInfo.ScoringOpen EQ 0 AND getScore.Score NEQ 0>
                                   <cfif Right(NumberFormat(getScore.Score,"0.000"),3) EQ "000">
                                            #NumberFormat(getScore.Score,"0")#
                                        <cfelseif Right(DecimalFormat(getScore.Score),2) EQ "00">
                                            #NumberFormat(getScore.Score,"0.00")#
                                        <cfelseif Right(DecimalFormat(getScore.Score),1) EQ "0">
                                            #NumberFormat(getScore.Score,"0.0")#
                                        <cfelse>
                                            #getScore.Score#
                                        </cfif>
                                <cfelseif GetCompInfo.ScoringOpen EQ 0>
                                    <i>No Score</i>
                                <cfelse>
                                    <a href="display.cfm?app=#getApps.compAppID#&score=inline"><cfif getApps.Score EQ 0>Score Project<cfelse>
                                        <cfif Right(NumberFormat(getScore.Score,"0.000"),3) EQ "000">
                                            #NumberFormat(getScore.Score,"0")#
                                        <cfelseif Right(DecimalFormat(getScore.Score),2) EQ "00">
                                            #NumberFormat(getScore.Score,"0.00")#
                                        <cfelseif Right(DecimalFormat(getScore.Score),1) EQ "0">
                                            #NumberFormat(getScore.Score,"0.0")#
                                        <cfelse>
                                            #getScore.Score#
                                        </cfif>
                                    </cfif>
                                </a>
                                </cfif>
                            </td>
                        </cfif>
                        <!---/ Score --->
						<cfif SESSION.authLevel lte 6>
						<td class="text-center">
							<cfif isCompActive>
							<a href="dataentry.cfm?project=#projectID#&q=99&apr=#aprDefaultID#">Respond</a>
							<cfelse>
								&nbsp;
							</cfif>
						</td>
						</cfif>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    <cfelse>
      <div>
        <p><i>No Projects Found</i></p>
      </div>
    </cfif>

  </div>

  <div class="medium-3 columns">
    <cfquery datasource="#datasource#" name="getDocs">
      SELECT * FROM docs WHERE compID = <cfqueryparam value="#SESSION.compID#"> ORDER BY docName
    </cfquery>
    <!--- 
    <h3>Documents</h3>
    <cfif getDocs.RecordCount GT 0>
        <cfloop query="getDocs">
          <div class="panel">
            <h4>
                <a href="docView.cfm?doc=#getDocs.docID#">#getDocs.docName#</a>
                <cfif getDocs.docLabel NEQ "">
                    <span class="round label #getDocs.docLabelColor#">#getDocs.docLabel#</span>  
                </cfif>
            </h4>
            <cfif getDocs.docDesc NEQ "">
                <p>#getDocs.docDesc#</p>
            </cfif>
          </div>
        </cfloop>
    <cfelse>
      <div>
        <p><i>No Documents Posted</i></p>
      </div>
    </cfif>
      --->   
    <cfif GetCompInfo.ListOpen EQ 1 OR SESSION.authLevel LTE 5>
      <h3>Ranked List</h3>
        <a href="##" data-open="list" >View ranked list of applicants based on current scores</a>

        <cfquery name="getList">
              SELECT compapp.appName, compapp.compAppID, compapp.projectID, agency.agencyName, compapp.fundAward, compapp.fundReq, compapp.reportID, compapp.score, projectcomponent.projectCompCategory, compapp.rankForce
              FROM compapp
                    INNER JOIN projects ON compapp.projectID = projects.projectID
                    INNER JOIN agency ON projects.agencyID = agency.agencyID
                    INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
              WHERE compapp.active = '1'
                  AND compapp.compID = <cfqueryparam value="#SESSION.compID#">
                  ORDER BY compapp.score DESC, projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC
          </cfquery>
        <div id="list" class="reveal large" data-reveal>

              <h1 class="">Current Ranked List</h1>
              <a href="#absoluteURL#pages/secure/RankedList.cfm" class="button right small hide-for-print"><i class="fi-download"></i>  Excel</a>
              <cfquery datasource="#datasource#" name="GetARD">
                SELECT ARD, ARDCut, FPRN, PlanningGrant from comp WHERE compID = <cfqueryparam value="#SESSION.compID#">
              </cfquery>
              <cfif GetARD.ARD NEQ "">
                <cfif GetARD.ARDCut EQ "">
                  <cfset GetARD.ARDCut = 0>
                </cfif>
                <cfif GetARD.PlanningGrant EQ "">
                  <cfset GetARD.PlanningGrant = 0>
                </cfif>
                <table>
                  <tr>
                    <td><b>Annual Renwal Demand (ARD):</b></td>
                    <td>#LSCurrencyFormat(GetARD.ARD)#</td>
                  </tr>
                  <tr>
                    <td><b>Final Pro-Rata Need (FPRN):</b></td>
                    <td>#LSCurrencyFormat(GetARD.FPRN)#</td>
                  </tr>
                  <tr>
                    <td><b>Planning Grant:</b></td>
                    <td>#LSCurrencyFormat(GetARD.PlanningGrant)#</td>
                  </tr>
                  <tr>
                    <cfset Tier1 = GetARD.ARD*(1-GetARD.ARDCut*.01)>
                    <td><b>Tier 1:</b></td>
                    <td>#LSCurrencyFormat(Tier1)#</td>
                  </tr>
                  <tr>
                    <cfset Tier2 = GetARD.ARD*(GetARD.ARDCut*.01)+(GetARD.FPRN*.05)>
                    <td><b>Tier 2:</b></td>
                    <td>#LSCurrencyFormat(Tier2)#</td>
                  </tr>
                  <tr>
                    <cfset TFA = Tier1+Tier2>
                    <td><b>Total Funding Available:</b></td>
                    <td>#LSCurrencyFormat(TFA)#</td>
                  </tr>
                  
                </table>
              </cfif>

            <table width="100%">
              <thead>
                <th>Score</th>
                <th>Project</th>
                <th>Type</th>
                <th>Grant Amount</th>
                <th>Running Total</th>
              </thead>
              <tbody>
                <cfset RunningTotal = 0>
                <cfset Tier1Flag = 0>
                <cfset Tier2Flag = 0>
                <cfloop query="getList">
                    <cfif getList.fundReq NEQ "" AND getList.fundReq NEQ 0>
                        <cfset getList.fundAward = getList.fundReq>
                    <cfelse>
                        <cfset getList.fundAward = 0>
                    </cfif>
                  <cfif getList.fundAward EQ "">
                    <cfset getList.fundAward = 0>
                  </cfif>
                  <cfif (RunningTotal+getList.fundAward) GTE Tier1 AND Tier1Flag EQ 0>
                    <tr>
                        <td>
                          <b>#getList.Score#</b>
                        </td>
                        <td>
                         <a href="display.cfm?app=#getList.compAppID#&score=inline">
                          #getList.appName# &mdash; #getList.agencyName#
                          <cfset getList.appName = "#getList.appName# (Remainder)">
                        </a>
                        </td>
                        <td>
                          #getList.projectCompCategory#
                        </td>
                        <td>
                          #LSCurrencyFormat(Tier1-RunningTotal)# (Tier 1)
                          <cfset getList.fundAward=getList.fundAward-(Tier1-RunningTotal)>
                          <cfset runningTotal = RunningTotal+(Tier1-RunningTotal)> 
                        </td>
                        <td>
                          #LSCurrencyFormat(runningTotal)#
                        </td>
                      </tr>
                    <tr>
                      <td colspan="5" class="BGLightGray text-center">
                        <h3 class="">End of Tier 1 (#LSCurrencyFormat(Tier1)#)</h3>
                      </td>
                    </tr>
                    <cfset Tier1Flag = 1>
                  <cfelseif RunningTotal GTE (Tier2+Tier1) AND Tier2Flag EQ 0  AND Tier1Flag EQ 1>
                     <tr>
                      <td colspan="5" class="BGLightGray text-center">
                        <h3 class="">End of Total Funding Available (#LSCurrencyFormat(Tier1+Tier2)#)</h3>
                      </td>
                    </tr>
                    <cfset Tier2Flag = 1>
                  </cfif>
                  <cfset runningTotal = RunningTotal+getList.fundAward>
                  <tr>
                    <td>
                      <b>#getList.Score#</b>
                    </td>
                    <td>
                     <a href="display.cfm?app=#getList.compAppID#&score=inline">
                      #getList.appName# &mdash; #getList.agencyName# 
                    </a>
                    </td>
                    <td>
                      #getList.projectCompCategory#
                    </td>
                    <td>
                      #LSCurrencyFormat(getList.fundAward)#
                    </td>
                    <td>
                      #LSCurrencyFormat(RunningTotal)#
                    </td>
                  </tr>
                  
                </cfloop>
                  <tr class="BGLightGray">
                    <td colspan="4" class="text-right">Total Funding Available:</td>
                    <td>#LSCurrencyFormat(TFA)#</td>
                  </tr>
                  <tr class="BGLightGray">
                    <td colspan="4" class="text-right">Total Funding Request:</td>
                    <td>#LSCurrencyFormat(RunningTotal)#</td>
                  </tr>
                  <cfif TFA-RunningTotal GTE 0> 
                      <tr class="BGGreen">
                        <td colspan="4" class="text-right MakeWhite">Difference:</td>
                        <td class="MakeWhite">#LSCurrencyFormat(TFA-RunningTotal)#</td>
                      </tr>
                  <cfelse>
                      <tr class="BGRed">
                        <td colspan="4" class="text-right MakeWhite">Difference:</td>
                        <td class="MakeWhite">#LSCurrencyFormat(TFA-RunningTotal)#</td>
                      </tr>
                  </cfif> 
                  
              </tbody>
            </table>
          <button class="close-button" data-close aria-label="Close reveal" type="button"><span aria-hidden="true">&times;</span></button>
        </div>
    </cfif>
  </div>
</div>
</div>
                            
<div class="row">
  <div class="large-12 columns">
    <hr>
  </div>
</div>
</cfoutput>
