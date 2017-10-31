<!--- Variables --->
<cfparam name="URL.app" default="0" />
<cfparam name="URL.dispDetail" default="no" />
<cfparam name="URL.dispNames" default="yes" />
<cfparam name="URL.edit" default="no" />
<cfset sumScaledPoints = 0>
<cfif SESSION.authLevel GTE 7>
    <cfset URL.edit="no" />
</cfif>
<cfif URL.edit EQ "yes">
    <cfoutput>
        <script>
            $(document).ready(function () {
                $(".scoreField").on("change", function () {
                    $(this).addClass("BGOrange");
                    $.post("#AbsoluteURL#takeout/secure/score.cfm", $(this).closest(".scoreForm").serialize(),$(this).removeClass("BGOrange"));
                    $(".calcField").replaceWith("--");
                });
                $(".scoreForm").submit(function(evt){
                    evt.preventDefault();
                });
            });
        </script>
    </cfoutput>
</cfif>
<!---/ Variables --->

<cfif SESSION.compID NEQ "0"> 
    <!--- Header Row --->
        <!---/ Get Competition for Header --->
        <cfinvoke component="knex.comp"
                  method="get"
                  datasource="#datasource#"
                  whatfields="compLongName"
                  where="sessionComp"
                  returnVariable="getCompList" />
        <!---/ Get Competition for Header --->

        <div class="CFSmallBox">
            <div class="row">
              <div class="large-12 columns">
                <cfoutput>
                    <h1 class="CFHeader"><br>
                       Score Card for #getCompList.compLongName#
                    </h1>
                </cfoutput>
              </div>
            </div>
        </div>
    <!---/ Header Row --->  

    <!--- Applicant Drop Down --->
    <div class="panel hide-for-print">
        <!--- Get Applicants For Drop Down --->
        <cfinvoke component="knex.compApp" 
                method="getApps"
                DataSource = "#DataSource#"
                returnVariable = "getApps"
                whatFields = "compapp.appName, compapp.compAppID"
                Where="thisComp"
                Join="scoreCard"
                Order="projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC" />
        <!---/ Get Applicants For Drop Down --->
        <cfoutput>
            <div class="row">
                <div class="medium-6 columns">
                    <form action="#CurrentPage#">
                        <h5>Select an Applicant</h5>
                        <select name="app" onchange="this.form.submit()">
                            <option value="0">Select Applicant</option>
                            <cfloop query="getApps">
                                <cfset selected = "" />
                                <cfif URL.app EQ getApps.compAppID>
                                    <cfset selected="  selected" />
                                </cfif>
                              <option value="#getApps.compAppID#"#selected#>#getApps.appName#</option>
                            </cfloop>
                        </select>
                        <input type="hidden" name="edit" value="#URL.edit#">
                        <input type="hidden" name="dispDetail" value="#URL.dispDetail#">
                        <input type="hidden" name="dispNames" value="#URL.dispNames#">
                    </form>
                </div>
                <!--- Score Card Display Settings --->
                <div class="medium-6 columns text-right">
                    <cfif SESSION.authLevel LT 7>
                        <cfif URL.edit NEQ "yes">
                             <a href="#CurrentPage#?app=#URL.app#&dispDetail=#URL.dispDetail#&dispNames=#URL.dispNames#&edit=yes" class="button warning">Edit Scores</a>
                        <cfelse>
                             <a href="#CurrentPage#?app=#URL.app#&dispDetail=#URL.dispDetail#&dispNames=#URL.dispNames#&edit=no" class="button success">Done Editing</a>
                        </cfif>
                    </cfif>
                    <cfif URL.dispDetail EQ "yes">
                         <a href="#CurrentPage#?app=#URL.app#&dispDetail=no&dispNames=#URL.dispNames#&edit=#URL.edit#" class="button secondary">Hide Descriptions</a>
                    <cfelse>
                         <a href="#CurrentPage#?app=#URL.app#&dispDetail=yes&dispNames=#URL.dispNames#&edit=#URL.edit#" class="button">Show Descriptions</a>
                    </cfif>
                    <cfif URL.dispNames EQ "yes">
                          <a href="#CurrentPage#?app=#URL.app#&dispDetail=#URL.dispDetail#&dispNames=no&edit=#URL.edit#" class="button secondary">Hide Panelist Names</a>
                    <cfelse>
                          <a href="#CurrentPage#?app=#URL.app#&dispDetail=#URL.dispDetail#&dispNames=yes&edit=#URL.edit#" class="button">Show Panelist Names</a>
                    </cfif>
                     <a href="javascript:window.print()" class="button small" target="_blank"><img src="#AbsoluteURL#img/icons/printer.svg" width="18" alt="Print"> Print</a>
                </div>
                <!---/ Score Card Display Settings --->
            </div>
        </cfoutput>
    </div>
    <!---/ Applicant Drop Down --->

    <!--- Score Table --->
    <div class="globalPad">
        <cfif URL.app GT "0">
            <div class="row">
                <div class="medium-12 columns">
                    <!--- Get Applicants for Title --->
                    <cfinvoke component="knex.compApp" 
                            method="getApps"
                            DataSource = "#DataSource#"
                            returnVariable = "getApps"
                            whatFields = "compapp.appName, agency.agencyLongName"
                            Where="thisApp" />
                    <!---/ Get Applicants for Title --->

                    <!--- Get List of Project Component IDs --->
                    <cfinvoke component="knex.projects"
                              method="get"
                              datasource="#datasource#"
                              returnVariable="getProjects"
                              whatFields="projects.projectComponentID"
                              Join="compApp"
                              Where="ThisApp" />
                    <!---/ Get List of Project Component IDs --->

                    <!--- Get Panelists with Included Scores --->
                    <cfinvoke component="knex.users"
                              method="get"
                              datasource="#datasource#"
                              returnVariable="getuser"
                              whatFields="users.userFirst, comppanel.compPanelID"
                              Join="comppanel"
                              Where="thisCompScores"
                              Order="comppanel.seat" />
                    <!---/ Get Panelists with Included Scores --->

                    <!--- Get List of Report Modules --->
                    <cfinvoke component="knex.reports"
                              method="get"
                              datasource="#datasource#"
                              returnVariable="getReport"
                              whatFields="report.reportPayload AS modList, compapp.compAppID AS compAppID"
                              Join="compapp"
                              Where="thisApp" />
                    <!---/ Get List of Report Modules --->

                    <!--- Get Scoring Factors to Display --->
                    <cfinvoke component="knex.scoreFactors"
                              method="get"
                              datasource="#datasource#"
                              returnVariable="getScoreFactor"
                              whatFields="scorefactor.scaled, scorefactor.factorID AS factorID, scorefactor.factorLongName, scorefactor.factorDesc, scorefactor.maxPoints, scorefactor.pmID AS pmID"
                              Join="modcat"
                              Where="inReport"
                              Order="scorecat.catLongName, scorefactor.factorLongName" />
                    <!---/ Get Scoring Factors to Display --->
                    <cfset sumMaxPoints = ArraySum(getScoreFactor["maxPoints"]) />

                    <cfoutput>
                        <h1>#getapps.appName#</h1>
                        <h3 class="MakeGray">#getapps.agencyLongName#</h3>
                        <hr>
                        <table width="100%">
                            <thead>
                                <th></th>
                                <th class="text-center">Scaled Score</th>
                                <th class="text-center">Max Points</th>
                                <th class="text-center">Average for Project Type</th>
                                    <cfloop query="getuser">
                                        <th class="text-center">
                                        <cfif URL.dispNames EQ "yes">
                                             #getuser.userFirst#
                                        </cfif>
                                        <cfif URL.dispNames NEQ "yes">
                                             Panelist #getuser.CurrentRow#
                                        </cfif>
                                        </th>
                                    </cfloop>

                                <th class="text-center">Average Panel Score</th>
                            </thead>
                            <tbody>
                                <!--- Score Card Row For Each Factor --->
                                <cfset sumTypeAvg = "0" />
                                <cfloop query="getScoreFactor">
                                    <tr>
                                        <!--- Factor Name --->
                                        <td>
                                            <h4>#getScoreFactor.factorLongName#</h4>
                                            <cfif getScoreFactor.factorDesc NEQ "" AND URL.dispDetail EQ "yes">
                                                <br>#getScoreFactor.factorDesc#
                                            </cfif>
                                        </td>
                                        <!---/ Factor Name --->
                                        
                                        <!--- Scaled Score --->
                                        <cfif getScoreFactor.scaled EQ 1>
                                            <cfset AppPtScore = 0 />
                                            <cfquery name="getScales">
                                            SELECT * FROM scorescale
                                            WHERE factorID = <cfqueryparam value="#getScoreFactor.factorID#" />
                                            ORDER BY minValue ASC
                                            </cfquery>
                                            <cfquery name="getPMInfo">
                                            SELECT comp.aprDefaultID, compapp.projectID
                                            FROM compapp
                                            INNER JOIN comp ON comp.compID = compapp.compID
                                            WHERE compapp.compAppID = <cfqueryparam value="#app#" />
                                            </cfquery>
                                            <cfinvoke component="knex.pm"
                                                              method="getProject"
                                                              apr="#getPMInfo.aprDefaultID#"
                                                              project="#getPMInfo.projectID#"
                                                              pm="#getScoreFactor.pmID#"
                                                              returnvariable="pm">
                                            <cfloop query="getScales">
                                                <cfif getScales.minValue LTE pm.value>
                                                    <cfset AppPtScore = NumberFormat(getScales.ptScore) />
                                                </cfif>    
                                            </cfloop>
                                            <cfsavecontent variable="scaleTip">
                                                Points are assigned using a #MaxPoints#-point scale:
                                                        <cfloop query="getScales">
                                                            <cfif getScales.minValue LTE pm.value>
                                                                <cfset ptScore = getScales.ptScore>
                                                            </cfif>
                                                                    <cfif getScales.scaleName EQ "">
                                                                        #getScales.minValue#
                                                                    <cfelse>
                                                                        #getScales.scaleName#
                                                                        (#getScales.minValue#)
                                                                    </cfif>
                                                               =
                                                                    #getScales.ptScore# pts.
                                                             
                                                        </cfloop>
                                            </cfsavecontent>
                                            <td class="text-center"><span data-tooltip aria-haspopup="true" class="has-tip" title="#scaleTip#">(#AppPtScore# Points)</span></td>
                                            <cfset sumScaledPoints = sumScaledPoints+AppPtScore>
                                        <cfelse>
                                            <td class="text-center"><i>N/A</i></td>
                                        </cfif>
                                        <!---/ Scaled Score --->
                                        
                                        <!--- Max Points --->
                                        <td class="text-center">#NumberFormat(getScoreFactor.maxPoints,"9.99")#</td>
                                        <!---/ Max Points --->                
                                                        
                                        <!--- Average Score for Component Type --->
                                            <!--- Get Average Score by Component Type --->
                                            <cfinvoke component="knex.sortinghat"
                                                      method="getTypeAvg"
                                                      datasource="#datasource#"
                                                      returnVariable="getTypeAvg"
                                                      factorID="#getScoreFactor.factorID#"
                                                      componentID="#getProjects.projectComponentID#" />
                                            <!---/ Get Average Score by Component Type --->
                                            <td class="text-center">
                                                <div class="calcField">#NumberFormat(getTypeAvg.typeAvg,"0.00")#</div>
                                            </td>
                                            <cfset typeAvg = getTypeAvg.typeAvg />
                                            <cfif getTypeAvg.typeAvg EQ ""><cfset typeAvg = 0/></cfif>
                                            <cfset sumTypeAvg = sumTypeAvg+typeAvg />
                                        <!---/ Average Score for Component Type --->
                                        
                                        
                                        <!--- Panel Scores --->
                                            <!--- Get Scores by Factor and Panelist --->
                                            <cfinvoke component="knex.sortinghat"
                                                      method="getScores"
                                                      datasource="#datasource#"
                                                      returnVariable="getScores"
                                                      appID="#URL.app#"
                                                      factorID="#getScoreFactor.factorID#" />
                                            <!---/ Get Scores by Factor and Panelist --->
                                            <cfloop query="getScores">
                                                <td class="text-center">
                                                    <cfif URL.edit EQ "yes">
                                                        <form action="#AbsoluteURL#takeout/secure/score.cfm" method="post" class="scoreForm">
                                                            <input type="number" step="0.01" name="Score" value="#NumberFormat(getScores.score,"0.00")#" class="scoreField">
                                                            <input type="hidden" name="compAppID" value="#URL.app#">
                                                            <input type="hidden" name="factorID" value="#getScoreFactor.factorID#">
                                                            <input type="hidden" name="compPanelID" value="#getScores.compPanelID#">
                                                            <input type="hidden" name="scoreNote" value="#getScores.scoreNote#">
                                                        </form>
                                                    <cfelse>
                                                        #NumberFormat(getScores.score,"0.00")#
                                                    </cfif>
                                                </td>
                                            </cfloop>  
                                        <!---/ Panel Scores --->

                                        <!--- Average Panel Score --->
                                            <!--- Get Scores by Factor and Panelist --->
                                            <cfinvoke component="knex.sortinghat"
                                                      method="getPanelAvg"
                                                      datasource="#datasource#"
                                                      returnVariable="getPanelAvg"
                                                      appID="#URL.app#"
                                                      factorID="#getScoreFactor.factorID#" />
                                            <!---/ Get Scores by Factor and Panelist --->
                                        <td class="text-center">
                                            <div class="calcField"><strong>#NumberFormat(getPanelAvg.panelAvg,"0.00")#</strong></div>
                                        </td>
                                        <!---/ Average Panel Score --->

                                    </tr>
                                </cfloop>
                                <!---/ Score Card Row For Each Factor --->

                                <!--- Score Card Row For Totals --->
                                <tr>
                                    <!--- Label for Totals Row --->
                                    <td class="text-right"><h4>Total Project Score</h4></td>
                                    <!---/ Label for Totals Row --->
                                    
                                     <!--- Total Scaled Points Available --->
                                    <td  class="text-center">
                                        <strong>#NumberFormat(sumScaledPoints,"9.99")#</strong>
                                    </td>
                                    <!---/ Total Scaled Points Available --->


                                    <!--- Total Points Available --->
                                    <td  class="text-center">
                                        <strong>#NumberFormat(sumMaxPoints,"9.99")#</strong>
                                    </td>
                                    <!---/ Total Points Available --->

                                    <!--- Average Total Score for Project Type --->
                                    <td  class="text-center">
                                        <div class="calcField"><strong>#NumberFormat(sumTypeAvg, "0.00")#</strong></div>
                                    </td>
                                    <!---/ Average Total Score for Project Type --->
                                                                        
                                    <!--- Total Score From Each Panelist --->
                                    <cfloop query="getuser">
                                        <!--- Get Total Scores by Panelist --->
                                        <cfinvoke component="knex.sortinghat"
                                                  method="getPanelTotals"
                                                  datasource="#datasource#"
                                                  returnVariable="getPanelTotals"
                                                  compAppID="#URL.app#"
                                                  compPanelID="#getuser.compPanelID#" />
                                        <!---/ Get Total Scores by Panelist --->
                                        <td  class="text-center">
                                            <div class="calcField"><strong>#NumberFormat(getPanelTotals.panelTotal,"0.00")#</strong></div>
                                        </td>
                                    </cfloop>
                                    <!---/ Total Score From Each Panelist --->

                                    <!--- Total Score: Panel Average --->
                                    <!--- Get Average Panel Score for Project --->
                                    <cfinvoke component="knex.sortinghat"
                                              method="getProjectScore"
                                              datasource="#datasource#"
                                              returnVariable="getProjectScore"
                                              compAppID="#URL.app#" />
                                    <td  class="text-center">
                                        <div class="calcField"><strong>#NumberFormat(getProjectScore.score,"0.00")#</strong></div>
                                    </td>
                                    <!---/ Get Average Panel Score for Project --->
                                    
                                    <!--- Total Score: Panel Average --->
                                </tr>
                                <!--- Score Card Row For Totals --->
                            </tbody>
                        </table>        
                    </cfoutput>
                </div>
            </div>
        </cfif>
    </div>
    <!---/ Score Table --->
</cfif>
