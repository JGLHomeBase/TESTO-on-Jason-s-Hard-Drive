<cfparam name="URL.action" default="list">
<cfif SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!--- Variables --->
<cfparam name=URL.comp default ="#SESSION.compID#">
<cfif SESSION.usercompID NEQ 0>
  <cfset URL.comp = SESSION.usercompID>
<cfelseif URL.comp EQ 0 AND SESSION.compID NEQ 0>
   <cfset URL.comp = SESSION.compID> 
</cfif>
<!---/ Variables --->

<!--- Process Actions --->
    <!--- Create New APR Set --->
    <cfparam name="FORM.aprDefaultID" default="0">
    <cfif FORM.action EQ "process" AND FORM.aprDefaultID EQ 0 AND SESSION.authLevel LTE 3 AND SESSION.usercompID EQ 0>
        <!--- New APR Set --->
        <cfset FORM.aprSetName = "#FORM.compName# Data Set">
        <cfset FORM.aprSetNotes = "Primary APR Set for #FORM.compLongName#">
        <cfset FORM.aprRangeStart = "">
        <cfset FORM.APRRangeEnd = "">
        <cfset FORM.APRDataSource = "HMIS">
        <cfset FORM.cocID = SESSION.cocID>
        <!--- Get APR Question List --->
        <cfinvoke component="knex.aprSet" 
          method="getQs"
          DataSource = "#DataSource#"
          returnVariable = "getAPRQList"
          whatFields = "Detail"
          whatAPR = "All"
          Order = "tableName">
        <!---/ Get APR Question List --->
        <cfset FORM.aprSetQList = ValueList(getAPRQList.APRQuestion)>
        <cfinvoke component="knex.aprSet" 
                  method="new"
                  DataSource = "#DataSource#">
        <!---/ New APR Set --->
        <cfquery name="NewAprSet" maxrows="1">
            SELECT aprID FROM dataapr00
            WHERE cocID = <cfqueryparam value="#FORM.cocID#">
            ORDER BY aprID DESC
            </cfquery>
        <cfset FORM.aprDefaultID = NewAprSet.aprID>
    </cfif>
    <!---/ Create New APR Set --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Comp --->
    <cfinvoke component="knex.comp" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.compID)#">
      <!---/ Nuke Comp --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Competition deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.compID EQ 0 AND SESSION.authLevel LTE 3 AND SESSION.usercompID EQ 0>
    
    <!--- New Comp --->
      <cfinvoke component="knex.comp"
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Comp --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.compLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.compID NEQ 0 AND SESSION.authLevel LTE 3 AND SESSION.usercompID EQ 0>
    <!--- Update Comp --->
      <cfinvoke component="knex.comp"
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Comp --->
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
              <cfif SESSION.usercompID EQ 0>
                Manage Competitions
              <cfelse>
                Competition Settings
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

<div class="globalPad">
    <div class="row">
      <div class="medium-2 columns">
        <cfoutput>
          <!--- comp Navigation --->
          <cfinclude template="#AbsoluteURL#legos/compMenu.cfm">
          <!--- comp Navigation --->
        </cfoutput>
      </div>
      <div class="medium-10 columns">
        <cfif URL.action EQ "list" AND SESSION.usercompID EQ 0>
          <!--- List --->
          <!--- Get Comps --->
          <cfinvoke component="knex.comp" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getCompList"
                whatFields = "*"
                Where = "ThisCoC"
                Order = "compFY DESC, compLongName ASC">
          <!---/ Get Comps --->
          <cfoutput><h1>#SESSION.cocCity# Competitions</h1></cfoutput>
          <hr>
          <table width="100%">
            <thead>
              <th>Competition</th>
              <th>
                  <i class="fi-like"></i>
                  <i class="fi-dislike"></i>
                  Scoring
                </th>
              <th>
                  <i class="fi-page"></i>
                  Documents
                </th>
              <cfif SESSION.authLevel LTE 5>
                <th class="text-right" width="80">Edit</th>
              </cfif>
            </thead>
            <tbody>
              <cfoutput query="getCompList">
                <tr>
                  <td><b>#getCompList.compLongName#</b> (#getCompList.compName#)</td>
                  <td>
                      <div class="tableLink">
                        <a href="scoreCat.cfm?comp=#getCompList.compID#&action=list">
                             <i class="fi-like"></i><i class="fi-dislike"></i> Scoring
                          </a>
                      </div>
                  </td>
                  <td>
                      <div class="tableLink">
                        <a href="compDoc.cfm?comp=#getCompList.compID#">
                             <i class="fi-page"></i> Documents
                          </a>
                      </div>
                    </td>
                  <cfif SESSION.authLevel LTE 5>
                    <td class="text-right">
                        <div class="tableLink">
                          <a href="#CurrentPage#?comp=#getCompList.compID#">
                             <i class="fi-pencil"></i>
                          </a>

                          <cfif SESSION.authLevel LTE 1>
                            &nbsp; | &nbsp;
                            <a href="#CurrentPage#?comp=#getCompList.compID#&action=delete">
                               <i class="fi-trash"></i>
                            </a></cfif>
                        </div>
                    </td>
                  </cfif>
                </tr>
              </cfoutput>
            </tbody>
          </table>
          <!---/ List --->
        <cfelseif URL.action EQ "delete" AND URL.comp NEQ "" AND SESSION.authLevel LTE 1>
          <!--- Get Comps --->
         <cfquery name="getCompList">
         SELECT * FROM comp 
         WHERE compID = <cfqueryparam value="#URL.comp#"> AND cocID = <cfqueryparam value="#SESSION.cocID#">     
         </cfquery>
          <!---/ Get Comps --->
          <div class="row">
            <div class="large-12 columns">
              <br><br>
              <div class="panel BGOrange text-center">
                <h1 class="MakeWhite">WARNING!</h1><cfoutput></cfoutput>
                <p class="MakeWhite"><p class="MakeWhite">You are about to delete a competition. <b>This cannot be undone. Are you sure?</b> <p class="MakeWhite">The following scoring categories will also be deleted, along with associated scoring factors.</p></b>
                <cfoutput>
                  <form action="#CurrentPageVar#" method="post">
                    <input type="hidden" value="delete" name="action">
                    <input type="hidden" value="#getCompList.compID#" name="compID">
                    <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                    <input type="submit" value="Delete #getCompList.compLongName#" name="submit" class="button alert">
                  </form>
                </cfoutput>
              </div>
            </div>
          </div>
        <cfelse>
          <!--- comp Profile Form --->
          <!--- Get Comps --->
         <cfif SESSION.userCompID NEQ 0><cfset URL.comp = SESSION.userCompID></cfif>
         <cfquery name="getCompList">
         SELECT * FROM comp
         WHERE compID = <cfqueryparam value="#URL.comp#">
         </cfquery>
          <!---/ Get Comps --->
          <div class="row">
            <div class="large-12 columns">
              <cfif URL.comp EQ 0>
                <h1>Add a Competition</h1>
              <cfelse>
                <h1>Update Competition Profile</h1>
              </cfif>
              <hr>
            </div>
          </div>
          <cfoutput>
            <cfform method="post" action="#CurrentPage#?action=list" data-abide>
            <div class="row">
                <div class="large-12 columns">
                <h3>Competition Info</h3>
                </div>    
            </div>  
            <div class="row">
                <div class="medium-6 columns">
                  <label>Full Name of Competition</label>
                  <input type="text" 
                         name="compLongName" 
                         value="#getCompList.compLongName#" 
                         placeholder="HUD FY2014 Continuum of Care Program NOFA"
                         maxlength="256"
                         required>
                  <small class="form-error">Enter the full name of the competition</small>
                </div>
                <div class="medium-4 columns">
                  <label>Nickname for Competition</label>
                  <input type="text" 
                         name="compName" 
                         value="#getCompList.compName#"
                         placeholder="FY2014 NOFA"
                         maxlength="128"
                         required>
                  <small class="form-error">Enter a nickname for the competition</small>
                </div>
                <div class="medium-2 columns">
                  <label>Fiscal Year</label>
                  <div class="input-group">
                      <span class="input-group-label">FY</span>
                       <input type="text" 
                         name="CompFY" 
                         value="#getCompList.CompFY#"
                         placeholder="2016"
                         maxlength="4"
                         pattern="^\d{4}$"
                          class="input-group-field">
                      <small class="form-error">Enter the four-digit year that is the closest match to your fiscal year, e.g., "2016".</small>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="large-12 columns">
                    <hr>
                </div>
              </div>
              <div class="row">
                <div class="medium-3 columns">
                  <label>ARD</label>
                  <div class="input-group">
                      <span class="input-group-label">$</span>
                      <input type="text" 
                         name="ARD" 
                         value="#DecimalFormat(getCompList.ARD)#"
                         placeholder="$1.00"
                         maxlength="11"
                         class="input-group-field"
                         required>
                      <small class="form-error">Enter the ARD</small>
                    </div>
                </div>
                <div class="medium-3 columns">
                  <label>FPRN</label>
                  <div class="input-group">
                      <span class="input-group-label">$</span>
                       <input type="text" 
                         name="FPRN" 
                         value="#DecimalFormat(getCompList.FPRN)#"
                         placeholder="$1.00"
                         maxlength="11"
                         class="input-group-field"
                         required>
                      <small class="form-error">Enter the FPRN</small>
                  </div>
                </div>
                <div class="medium-2 columns">
                   <label>Planning</label>
                      <div class="input-group">
                          <span class="input-group-label">$</span>
                           <input type="text" 
                               name="PlanningGrant" 
                               value="#DecimalFormat(getCompList.PlanningGrant)#"
                               placeholder="$1.00"
                               maxlength="11"
                               class="input-group-field"
                               required>
                            <small class="form-error">Enter the planning grant amount</small>
                      </div>
                  </div>
                  <div class="medium-2 columns">
                   <label>UFA</label>
                    <div class="input-group">
                          <span class="input-group-label">$</span>
                           <input type="text" 
                               name="UFA" 
                               value="#DecimalFormat(getCompList.UFA)#"
                               placeholder="$1.00"
                               maxlength="11"
                               class="input-group-field"
                               required>
                            <small class="form-error">Enter the UFA grant amount</small>
                      </div>
                  </div>
                <div class="medium-2 columns">
                  <label>Tier 1 Cut</label>
                   <div class="input-group">
                         
                          <input type="number" 
                                 name="ARDCut" 
                                 value="#NumberFormat(getCompList.ARDCut,9.99)#"
                                 placeholder="5"
                                 maxlength="6"
                                 class="input-group-field"
                                required>
                          <small class="form-error">Enter a number between 0 and 100.</small>
                          <span class="input-group-label">%</span>
                      </div>
                </div>
            </div>
            <div class="row">
                <div class="medium-2 columns">
                  <label>Scoring Open</label>
                  <select name="ScoringOpen">
                    <option value="1" <cfif getCompList.ScoringOpen EQ 1>selected</cfif>>Yes</option>
                    <option value="0" <cfif getCompList.ScoringOpen EQ 0 OR getCompList.ScoringOpen EQ "">selected</cfif>>No</option>
                  </select>
                </div>
                <div class="medium-2 columns">
                  <label>Ranked List</label>
                  <select name="ListOpen">
                    <option value="1" <cfif getCompList.ListOpen EQ 1>selected</cfif>>Show</option>
                    <option value="0" <cfif getCompList.ListOpen EQ 0 OR getCompList.ListOpen EQ "">selected</cfif>>Hide</option>
                  </select>
                </div>
                <div class="medium-2 columns">
                  <label>Peer Scores</label>
                  <select name="PeerOpen">
                    <option value="1" <cfif getCompList.PeerOpen EQ 1>selected</cfif>>Show</option>
                    <option value="0" <cfif getCompList.PeerOpen EQ 0 OR getCompList.PeerOpen EQ "">selected</cfif>>Hide</option>
                  </select>
                </div>
                <div class="medium-2 columns">
                     <!--- ReportsOpen --->
                    <label>Reports Open</label>
                    <select name="ReportsOpen" required>
                           <option value="1" <cfif getCompList.ReportsOpen EQ 1>selected</cfif>>Yes</option>
                           <option value="0" <cfif getCompList.ReportsOpen EQ 0>selected</cfif>>No</option>
                    </select>
                    <!---/ ReportsOpen --->
                </div>
                <div class="medium-4 columns">

                </div>
              </div>

            <div class="row">
                <div class="medium-12 columns">
                    <hr>
                    <h3>Program Evaluations</h3>
                </div>
            </div>
            <div class="row">
                <div class="medium-6 columns">
                    <cfquery name="getReportSets">
                    SELECT ReportSetName, reportSetID
                    FROM reportset
                    WHERE 
                        active = '1'
                        AND (cocID = '0' OR cocID = <cfqueryparam value="#SESSION.cocID#">) 
                    ORDER BY cocID, ReportSetName
                    </cfquery>
                    <label>Report Template Set</label>
                    <select name="reportSetID">
                        <cfloop query="getReportSets">
                            <option value="#getReportSets.reportSetID#" <Cfif getReportSets.reportSetID EQ getCompList.reportSetID> selected</Cfif>>#getReportSets.ReportSetName#</option>
                        </cfloop>
                    </select>
                </div>
                <div class="medium-6 columns">
                    <label>Primary APR Set</label>
                    <!--- Get APRs --->
                      <cfinvoke component="knex.aprSet" 
                            method="get"
                            DataSource = "#DataSource#"
                            returnVariable = "getAPR"
                            whatFields = "*"
                            Where = "ThisCoC"
                            Order = "aprSetName ASC">
                      <!---/ Get APRs --->
                    <select name="aprDefaultID">
                        <cfif getAPR.RecordCount EQ 0>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="0"#selected#>:: Create New APR Set ::</option>
                        <cfloop query="getAPR">
                            <cfif getCompList.aprDefaultID EQ getAPR.aprID>
                                <cfset selected = " selected">
                            <cfelse>
                                <cfset selected = "">
                            </cfif>
                            <option value="#getAPR.aprID#"#selected#>#getAPR.aprSetName#</option>
                        </cfloop>
                    </select>
                </div>
            </div>

            <input type="hidden" name="aprCompAID" value="#getCompList.aprCompAID#">
            <input type="hidden" name="aprCompBID" value="#getCompList.aprCompBID#">                
            <!---
            <div class="row">
                <div class="medium-6 columns">
                    <label>Comparison APR Set (A)</label>
                    <cfinvoke component="knex.aprSet" 
                        method="get"
                        DataSource = "#DataSource#"
                        returnVariable = "getAPR"
                        whatFields = "*"
                        Where = "ThisCoC"
                        Order = "aprSetName ASC">
                    <select name="aprCompAID">
                        <cfif getCompList.aprCompAID EQ 0>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="0"#selected#>None</option>
                        <cfloop query="getAPR">
                            <cfif getCompList.aprCompAID EQ getAPR.aprID>
                                <cfset selected = " selected">
                            <cfelse>
                                <cfset selected = "">
                            </cfif>
                            <option value="#getAPR.aprID#"#selected#>#getAPR.aprSetName#</option>
                                </cfloop>
                    </select>
                </div>
                <div class="medium-6 columns">
                    <label>Comparison APR Set (B)</label>
                    <cfinvoke component="knex.aprSet" 
                        method="get"
                        DataSource = "#DataSource#"
                        returnVariable = "getAPR"
                        whatFields = "*"
                        Where = "ThisCoC"
                        Order = "aprSetName ASC">
                    <select name="aprCompBID">
                        <cfif getCompList.aprCompBID EQ 0>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="0"#selected#>None</option>
                        <cfloop query="getAPR">
                            <cfif getCompList.aprCompBID EQ getAPR.aprID>
                                <cfset selected = " selected">
                            <cfelse>
                                <cfset selected = "">
                            </cfif>
                            <option value="#getAPR.aprID#"#selected#>#getAPR.aprSetName#</option>
                        </cfloop>
                    </select>
                </div>
            </div>
            --->

            <cfif getCompList.compID NEQ 0 AND getCompList.compID NEQ "">
                <div class="row">
                    <div class="medium-12 columns">
                        <hr>
                        <h3>Applicants</h3>
                    </div>
                </div>
                <cfquery name="getApps">
                SELECT compAppID
                FROM compapp
                WHERE compID = <cfqueryparam value="#getCompList.compID#">
                    AND active = '1'
                </cfquery>
                <div class="row">
                    <div class="medium-12 columns">
                        <div class="panel">
                        <p>There <cfif getApps.RecordCount EQ 1><a href="compApp.cfm?comp=#URL.comp#">is #getApps.RecordCount# active applicant</a><cfelse>are <a href="compApp.cfm?comp=#URL.comp#">#getApps.RecordCount# active applicants</a></cfif> in this competition.</p>
                        </div>
                    </div>
                </div>          
            </cfif>

              <div class="row">
                <div class="large-12 columns">
                    <hr>
                  <h3>Panel Instructions</h3>
                    <cftextarea name="PanelInstructions" height="420" id="txtContent" richtext="true" toolbar="Basic">#getCompList.PanelInstructions#</cftextarea>

                </div>
              </div>
              <div class="row">
                <div class="large-12 columns text-right">
                  <input type="hidden" value="#URL.comp#" name="compID">
                  <input type="hidden" value="process" name="action">
                  <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                  <cfif URL.comp EQ 0>
                    <input type="submit" value="add" name="submit" class="small button secondary">
                  <cfelse>
                    <input type="submit" value="update" name="submit" class="small button secondary">
                  </cfif>

                </div>
              </div>
            </cfform>
          </cfoutput>
          <!---/ comp Profile Form --->
        </cfif>

      </div>
    </div>
</div>