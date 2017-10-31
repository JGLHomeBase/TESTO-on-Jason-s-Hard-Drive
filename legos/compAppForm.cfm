<cfparam name="formType" default="new">
    
<cfoutput>
    <form action="#CurrentPageVar#" method="post" class="panelLink">
        <div class="row">
            <div class="medium-10 columns">
                <label>Application Title</label>
                <input type="text"
                       name="appName"
                       maxlength="256"
                       <cfif formType EQ "update">value="#getApps.appName#"<cfelse>value="<cfif projectLongName NEQ "">#projectLongName#<cfelse>#projectName#</cfif>"</cfif>>
            </div>
            <div class="medium-2 columns text-right">
                <cfif formType EQ "update">
                    <input type="submit" value="update" name="submit" class="small button">
                <cfelse>
                    <input type="submit" value="add" name="submit" class="small button">
                </cfif>
            </div>
        </div>
        <div class="row">
            <div class="medium-6 columns">
                <label>	Applicant Type
                <select name="AppType">
                    <cfif formType EQ "update" AND getApps.appType EQ "new"><cfset SELECTED = " selected"><cfelse><cfset SELECTED = ""></cfif>
                    <option value="new"#SELECTED#>New Project</option>
                    <cfif formType EQ "update" AND getApps.appType EQ "Renewal">
                        <cfset SELECTED = " selected">
                    <cfelseif formType EQ "new">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="Renewal"#SELECTED#>Renewal</option>
                </select>
                </label>
            </div>
            <div class="medium-3 columns">
                <cfquery name="getDefaultAmt">
                SELECT apr03Amount
                FROM dataapr03
                WHERE dataapr03.projectID = <cfqueryparam value="#getProjects.projectID#">
                    AND dataapr03.aprID = <cfqueryparam value="#getComp.aprDefaultID#">
                </cfquery>
                <!--- fundReq --->
                <label>Funding: Requested</label>
                <cfif formType EQ "update">
                    <cfset defaultValue = "#LSCurrencyFormat(getApps.fundReq)#">
                <cfelse>
                    <cfset defaultValue = "#LSCurrencyFormat(getDefaultAmt.apr03Amount)#">
                </cfif>
                <input type="text"
                       name="fundReq"
                       value="#defaultValue#"
                       placeholder="0"
                       maxlength="11,2">
                <!---/ fundReq --->
            </div>
            <div class="medium-3 columns">
                <!--- fundAward --->
                <label>Funding: Revised</label>
                <input type="text"
                       name="fundAward"
                       maxlength="11,2"
                       <cfif formType EQ "update">value="#LSCurrencyFormat(getApps.fundAward)#"</cfif>>
                <!---/ fundAward --->
            </div>
        </div>
        <div class="row">
            <div class="medium-2 columns">
                <label>	Eval. Status
                <select name="evalStatus">
                    <cfif formType EQ "update" AND getApps.evalStatus EQ "Draft">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="Draft"#SELECTED#>Draft</option>
                    <cfif formType EQ "update" AND getApps.evalStatus EQ "Review">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="Review"#SELECTED#>Review</option>
                    <cfif formType EQ "update" AND getApps.evalStatus EQ "Updated">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="Updated"#SELECTED#>Updated</option>
                    <cfif formType EQ "update" AND getApps.evalStatus EQ "Approved">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="Approved"#SELECTED#>Approved</option>
                    <cfif formType EQ "update" AND getApps.evalStatus EQ "Final">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="Final"#SELECTED#>Final</option>
                </select>
                </label>
            </div>
            <div class="medium-4 columns">
                <label>	Report Template 
                <select name="reportID">
                    <cfif formType EQ "new">
                        <cfif getProjects.projectCompCategory EQ "PH" AND getComp.defaultPH NEQ "0">
                            <cfset defaultReport = getComp.defaultPH>
                        <cfelseif getProjects.projectCompCategory EQ "TH" AND getComp.defaultTH NEQ "0">
                            <cfset defaultReport = getComp.defaultTH>
                        <cfelseif getProjects.projectCompCategory EQ "SSO" AND getComp.defaultSSO NEQ "0">
                            <cfset defaultReport = getComp.defaultSSO>
                        <cfelseif getProjects.projectCompCategory EQ "Other" AND getComp.defaultOther NEQ "0">
                            <cfset defaultReport = getComp.defaultOther>
                        <cfelse>
                            <cfset defaultReport = getComp.defaultReport>
                        </cfif>
                    <cfelse>
                        <cfset defaultReport = getApps.reportID>
                    </cfif>
                    <cfloop query="getReports">
                        <option value="#getReports.ReportID#" <cfif getReports.ReportID EQ defaultReport>selected</cfif>>#getReports.reportName#</option>
                    </cfloop>
                </select>
                </label>

            </div>
            <div class="medium-2 columns">
                <!--- scoreDisable --->
                <label>Panel Scoring</label>
                <select name="scoreDisable" required>
                    <cfif formType EQ "update" AND getApps.scoreDisable EQ "1">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="1"#SELECTED#>Enable</option>
                    <cfif formType EQ "update" AND getApps.scoreDisable EQ "0">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="0"#SELECTED#>Disable</option>
                </select>
                <!---/ scoreDisable --->
            </div>
            <div class="medium-2 columns">
                <!--- scoreOverride --->
                <label>Scoring - Override</label>
                <input type="number"
                       name="scoreOverride"
                       placeholder="0"
                      maxlength="11,3"
                       <cfif formType EQ "update">value="#getApps.scoreOverride#"</cfif>>
                <!---/ scoreOverride --->
            </div>
            <div class="medium-2 columns">
                <!--- rankForce --->
                <label>Ranking</label>
                <select name="rankForce">
                    <cfif FormType EQ "update" AND getApps.rankForce EQ "default">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="default"#SELECTED#>Default</option>
                    <cfif FormType EQ "update" AND getApps.rankForce EQ "t2Top">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="t2Top"#SELECTED#>Tier 2 - Top</option>
                        <cfif FormType EQ "update" AND getApps.rankForce EQ "t2Bottom">
                        <cfset SELECTED = " selected">
                    <cfelse>
                        <cfset SELECTED = "">
                    </cfif>
                    <option value="t2Bottom"#SELECTED#>Tier 2 - Bottom</option>
                </select>
                <!---/ rankForce --->
            </div>
        </div>
        <!--- Contacts --->
        <cfquery name="getUser">
        SELECT userID, userFirst, userLast, userEmail
        FROM users
        WHERE agencyID = <cfqueryparam value="#getProjects.agencyID#">
            OR (agencyID = '0' AND compID = <cfqueryparam value="#URL.comp#">)
            OR (agencyID = '0' AND compID = '0' 
                               AND cocID = <cfqueryparam value="#getProjects.cocID#">)
        ORDER BY agencyID DESC, userLast ASC, userFirst ASC
        </cfquery>
        <div class="row">
            <div class="large-12 columns">
                <div class="panel">
                    <div class="row">
                        <div class="small-12 columns">
                            <h6>Approval Contact</h6>
                            <b>Primary</b><br><br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="medium-4 columns">
                            <label>Existing Contact</label>
                            <select name="contactApprove">
                                <option value="0">None</option>
                                <option value="new">New Contact &rarr;</option>
                                <cfloop query="getUser">
                                    <cfif formType EQ "update" AND getApps.contactApprove EQ "#getUser.userID#">
                                        <cfset SELECTED = " selected">
                                    <cfelse>
                                        <cfset SELECTED = "">
                                    </cfif>
                                    <option value="#getUser.userID#"#SELECTED#>
                                        #getUser.userFirst# #getUser.userLast# (#getUser.userEmail#)
                                    </option>
                                </cfloop>
                            </select>
                        </div>
                        <div class="medium-1 columns text-center">
                            <br><br><h6>&mdash; OR &mdash;</h6>
                        </div>
                        <div class="medium-2 columns">
                            <label>First Name</label>
                            <input type="text"
                                   name="approveFirst"
                                   placeholder="Jane"
                                   maxlength="150">
                        </div>
                        <div class="medium-2 columns">
                            <label>Last Name</label>
                            <input type="text"
                                   name="approveLast"
                                   placeholder="Doe"
                                   maxlength="150">
                        </div>
                        <div class="medium-3 columns">
                            <label>Email</label>
                            <input type="email"
                                   name="approveEmail"
                                   placeholder="jane.doe@provider.org"
                                   maxlength="256">
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-12 columns">
                            <hr>
                            <b>Alternate</b><br><br>
                        </div>
                    </div>
                    <div class="row">
                        <div class="medium-4 columns">
                            <label>Existing Contact</label>
                            <select name="contactAlt">
                                <option value="0">None</option>
                                <option value="new">New Contact &rarr;</option>
                                <cfloop query="getUser">
                                     <cfif formType EQ "update" AND getApps.contactAlt EQ "#getUser.userID#">
                                        <cfset SELECTED = " selected">
                                    <cfelse>
                                        <cfset SELECTED = "">
                                    </cfif>
                                    <option value="#getUser.userID#"#SELECTED#>
                                        #getUser.userFirst# #getUser.userLast# (#getUser.userEmail#)
                                    </option>
                                </cfloop>
                            </select>
                        </div>
                        <div class="medium-1 columns text-center">
                            <br><br><h6>&mdash; OR &mdash;</h6>
                        </div>
                        <div class="medium-2 columns">
                            <label>First Name</label>
                            <input type="text"
                                   name="altFirst"
                                   placeholder="Jane"
                                   maxlength="150">
                        </div>
                        <div class="medium-2 columns">
                            <label>Last Name</label>
                            <input type="text"
                                   name="altLast"
                                   placeholder="Doe"
                                   maxlength="150">
                        </div>
                        <div class="medium-3 columns">
                            <label>Email</label>
                            <input type="email"
                                   name="altEmail"
                                   placeholder="jane.doe@provider.org"
                                   maxlength="256">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!---/ Contacts --->
        <input type="hidden" name="action" value="process">
        <input type="hidden" name="compID" value="#URL.comp#">
        <cfif FormType EQ "update">
            <input type="hidden" name="compAppID" value="#getApps.compAppID#">
            <input type="hidden" name="projectID" value="#getApps.projectID#">
        <cfelse>
            <input type="hidden" name="compAppID" value="0">
            <input type="hidden" name="projectID" value="#getProjects.projectID#">
        </cfif>
        
    </form>
</cfoutput>