<!--- Variables --->
<cfparam name=URL.app default ="0">
<cfparam name=URL.comp default ="#SESSION.compID#">
<!---/ Variables --->
    
<!-- Get Comp Info --->
<cfquery name="getComp">
SELECT compID, compLongName, aprDefaultID, defaultReport, defaultPH, defaultTH, defaultSSO, defaultOther, altReports, ARD
FROM comp
INNER JOIN reportset ON comp.reportSetID = reportset.reportSetID
WHERE compID = <cfqueryparam value="#URL.comp#">   
</cfquery>
<!---/ Get Comp Info --->

<!--- Set Default Reports --->
<cfset reports = "">
<cfset reports = ListAppend(reports,"#getComp.defaultReport#")>
<cfif getComp.defaultPH NEQ "0">
    <cfset reports = ListAppend(reports,"#getComp.defaultPH#")>
</cfif>
<cfif getComp.defaultTH NEQ "0">
    <cfset reports = ListAppend(reports,"#getComp.defaultTH#")>
</cfif>
<cfif getComp.defaultSSO NEQ "0">
    <cfset reports = ListAppend(reports,"#getComp.defaultSSO#")>
</cfif>
<cfif getComp.defaultOther NEQ "0">
    <cfset reports = ListAppend(reports,"#getComp.defaultOther#")>
</cfif>
<cfif getComp.altReports NEQ "0" AND getComp.altReports NEQ "">
    <cfset reports = ListAppend(reports,"#getComp.altReports#")>
</cfif>
<!---/ Set Default Reports --->

<cfquery name="getReports">
SELECT reportID, ReportName
FROM report
WHERE 
    reportID = '0'
    <cfloop list="#reports#" index="report">
        OR reportID = <cfqueryparam value="#report#">
    </cfloop>
</cfquery>
    
<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 5>
  <cfquery datasource="#datasource#" name="getcompapp">
    SELECT compAppID FROM compapp WHERE compAppID = <cfqueryparam value="#FORM.compAppID#">
  </cfquery>
  <cfif getcompapp.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM compapp WHERE compAppID = <cfqueryparam value="#getcompapp.compAppID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted an application"
          EventDesc = "Applicant Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Applicant deleted successfully.">
  </cfif>
<cfelseif URL.action EQ "copy" AND SESSION.authLevel LTE 5>
    <cfquery name="getApp">
    SELECT * FROM compapp
    WHERE compAppID = <cfqueryparam value="#URL.app#">
    </cfquery>
    <cfset FORM.AppType = getApp.AppType>
    <cfset FORM.compID = getApp.compID>
    <cfset FORM.contactAlt = getApp.contactAlt>
    <cfset FORM.contactApprove = getApp.contactApprove>
    <cfset FORM.evalStatus = getApp.evalStatus>
    <cfset FORM.fundAward = 0>
    <cfif (getApp.fundReq-getApp.fundAward) GT 0 AND getApp.fundAward NEQ 0>
        <cfset FORM.fundReq = (getApp.fundReq-getApp.fundAward)>
    <cfelse>
         <cfset FORM.fundReq = 0>
    </cfif>
    <cfset FORM.projectID = getApp.projectID>
    <cfset FORM.rankForce = getApp.rankForce>
    <cfset FORM.reportID = getApp.reportID>
    <cfset FORM.scoreDisable = getApp.scoreDisable>
    <cfset FORM.scoreOverride = getApp.scoreOverride>
    <cfset FORM.appName = "#getApp.appName# II">
    <!--- Insert Record --->
    <cfinsert datasource="#DataSource#" tablename="compapp" formfields="appName, AppType, compID, contactAlt, contactApprove, evalStatus, fundAward, fundReq, projectID, rankForce, reportID, scoreDisable, scoreOverride">
    <!---/ Insert Record --->
    <cfset CurrentPageVar = "#CurrentPage#?comp=#URL.comp#">
<cfelseif FORM.action EQ "process" AND FORM.projectID NEQ 0 AND SESSION.authLevel LTE 5>
    <!--- Process App --->
    
        <!--- Process Users --->
            <!--- Contact: Approval --->
            <cfif FORM.contactApprove EQ "new" AND FORM.approveEmail NEQ "">
                <!--- Check for Exisiting User --->
                <cfquery name="userCheck">
                SELECT userID
                FROM users
                WHERE userEmail = <cfqueryparam value="#FORM.approveEmail#">
                </cfquery>
                <!---/ Check for Exisiting User --->
                <cfif userCheck.RecordCount GT 0>
                    <cfset FORM.contactApprove = userCheck.userID>
                <cfelse>
                <!--- Add New User --->
                    <!--- Get Agency Info --->
                    <cfquery name="getProject">
                    SELECT projects.agencyID, agency.agencyLongName, agency.agencyName, projects.cocID
                    FROM projects 
                    INNER JOIN agency ON projects.agencyID = agency.agencyID
                    WHERE projectID = <cfqueryparam value="#FORM.projectID#">
                    </cfquery>
                    <!---/ Get Agency Info --->
                    <!--- Set Default First/Last Name --->
                    <cfif FORM.approveFirst EQ "">
                        <cfif getProject.agencyName NEQ "">
                            <cfset FORM.approveFirst = getProject.agencyName>
                        <cfelse>
                            <cfset FORM.approveFirst = getProject.agencyLongName>
                        </cfif>
                    </cfif>
                    <cfif FORM.approveLast EQ "">
                        <cfset FORM.approveLast = "Representative">
                    </cfif>
                    <!---/ Set Default First/Last Name --->
                    <cfset FORM.agencyID = getProject.agencyID>
                    <cfset FORM.cocID = getProject.cocID>
                    <cfset FORM.userFirst = FORM.approveFirst>
                    <cfset FORM.userLast = FORM.approveLast>
                    <cfset FORM.userEmail = FORM.approveEmail>
                    <cfset FORM.password = left(generateSecretKey("Blowfish",32),6)>
                    <cfset FORM.userPassword = Hash(FORM.password,"SHA-512")>
                    <cfset FORM.authLevel = "9">
                    <cfset FORM.requireReset = "1">
                    <cfinsert datasource="#datasource#" 
                              tablename="users" 
                              formfields="userEmail, userFirst, userLast, agencyID, compID, cocID, authLevel, userPassword, requireReset">
                    <!--- Fetch New UserID --->
                    <cfquery name="userCheck">
                    SELECT userID
                    FROM users
                    WHERE userEmail = <cfqueryparam value="#FORM.userEmail#">
                    </cfquery>
                    <cfset FORM.contactApprove = userCheck.userID>
                    <!---/ Fetch New UserID --->
                <!---/ Add New User --->
                </cfif>

            </cfif>
            <!---/ Contact: Approval --->
            <!--- Contact: Alternate --->
            <cfif FORM.contactAlt EQ "new" AND FORM.altEmail NEQ "">
                <!--- Check for Exisiting User --->
                <cfquery name="userCheck">
                SELECT userID
                FROM users
                WHERE userEmail = <cfqueryparam value="#FORM.altEmail#">
                </cfquery>
                <!---/ Check for Exisiting User --->
                <cfif userCheck.RecordCount GT 0>
                    <cfset FORM.contactAlt = userCheck.userID>
                <cfelse>
                <!--- Add New User --->
                    <!--- Get Agency Info --->
                    <cfquery name="getProject">
                    SELECT projects.agencyID, agency.agencyLongName, agency.agencyName, projects.cocID
                    FROM projects 
                    INNER JOIN agency ON projects.agencyID = agency.agencyID
                    WHERE projectID = <cfqueryparam value="#FORM.projectID#">
                    </cfquery>
                    <!---/ Get Agency Info --->
                    <!--- Set Default First/Last Name --->
                    <cfif FORM.altFirst EQ "">
                        <cfif getProject.agencyName NEQ "">
                            <cfset FORM.altFirst = getProject.agencyName>
                        <cfelse>
                            <cfset FORM.altFirst = getProject.agencyLongName>
                        </cfif>
                    </cfif>
                    <cfif FORM.altLast EQ "">
                        <cfset FORM.altLast = "Representative">
                    </cfif>
                    <!---/ Set Default First/Last Name --->
                    <cfset FORM.agencyID = getProject.agencyID>
                    <cfset FORM.cocID = getProject.cocID>
                    <cfset FORM.userFirst = FORM.altFirst>
                    <cfset FORM.userLast = FORM.altLast>
                    <cfset FORM.userEmail = FORM.altEmail>
                    <cfset FORM.password = left(generateSecretKey("Blowfish",32),6)>
                    <cfset FORM.userPassword = Hash(FORM.password,"SHA-512")>
                    <cfset FORM.authLevel = "9">
                    <cfset FORM.requireReset = "1">
                    <cfinsert datasource="#datasource#" 
                              tablename="users" 
                              formfields="userEmail, userFirst, userLast, agencyID, compID, cocID, authLevel, userPassword, requireReset">
                    <!--- Fetch New UserID --->
                    <cfquery name="userCheck">
                    SELECT userID
                    FROM users
                    WHERE userEmail = <cfqueryparam value="#FORM.userEmail#">
                    </cfquery>
                    <cfset FORM.contactAlt = userCheck.userID>
                    <!---/ Fetch New UserID --->
                <!---/ Add New User --->
                </cfif>
            </cfif>
            <!---/ Contact: Alternate --->
        <!---/ Process Users --->    
        <!--- Prep Data --->
        <cfif FORM.fundReq EQ "">
            <cfset FORM.fundReq = 0>
        <cfelse>
            <cfset FORM.fundReq = LSParseCurrency(FORM.fundReq)>
        </cfif>
        <cfif FORM.fundAward EQ "">
            <cfset FORM.fundAward = 0>
        <cfelse>
            <cfset FORM.fundAward = LSParseCurrency(FORM.fundAward)>
        </cfif>
        <!---/ Prep Data --->
        
        <cfif FORM.compAppID EQ 0>
            <!--- Insert Record --->
            <cfinsert datasource="#DataSource#" tablename="compapp" formfields="appName, AppType, compID, contactAlt, contactApprove, evalStatus, fundAward, fundReq, projectID, rankForce, reportID, scoreDisable, scoreOverride">
            <!---/ Insert Record --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog"
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new applicant"
                  EventDesc = "New Applicant" >
            <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Applicant added successfully.">
        <cfelse>
            <!--- Update Record --->
            <cfupdate datasource="#DataSource#" tablename="compapp" formfields="appName, AppType, compID, contactAlt, contactApprove, evalStatus, fundAward, fundReq, projectID, rankForce, reportID, scoreDisable, scoreOverride, compAppID">
            <!---/ Update Record --->
            <!--- Update Competition Scores --->
            <cfinvoke component="knex.sortinghat" 
                    method="scoreComp"
                    DataSource = "#DataSource#"
                    compID="#SESSION.compID#">
            <!---/ Update Competition Scores --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Update" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) updated an application"
                  EventDesc = "Updated Application" >
            <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Update successful.">
        </cfif>
        
    <!---/ Process App --->
            
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Competition Settings
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->


<div class="row">
  <div class="medium-2 columns">
    <cfoutput>
      <!--- Navigation --->
      <cfinclude template="#AbsoluteURL#legos/compMenu.cfm">
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "delete" AND URL.app NEQ "" AND SESSION.authLevel LTE 5>
      <cfquery datasource="#datasource#" name="getcompapp">
          SELECT compAppID, appName
          FROM compapp
          WHERE compAppID = <cfqueryparam value="#URL.app#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">
                <cfoutput>
                    You are about to remove an applicant from the competition (#getcompapp.appName#). This will permanently delete the applicant's scores for this competition. Are you sure?
                </cfoutput>
            </p>
            <cfoutput>
              <form action="#CurrentPage#?comp=#URL.comp#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getcompapp.compAppID#" name="compAppID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Exclude Applicant" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
        <hr>
    </cfif>
     <!--- List --->
    
    <cfquery name="getApps">
        SELECT compapp.compAppID, compapp.appName, compapp.projectID, compapp.appType, compapp.compID, compapp.contactApprove, compapp.contactAlt, compapp.evalStatus, compapp.fundAward, compapp.fundReq, compapp.rankForce, compapp.reportID, compapp.Score, compapp.scoreDisable, compapp.ScoreOverride, projects.projectLongName, projects.projectName, agency.agencyLongName, projects.agencyID, projectcomponent.projectCompCategory, projects.cocID
        FROM compapp
            INNER JOIN projects ON compapp.projectID = projects.projectID
            INNER JOIN agency ON projects.agencyID = agency.agencyID
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
        WHERE compapp.active = '1'
            AND compapp.compID = <cfqueryparam value="#URl.comp#">
        ORDER BY compapp.Score DESC, projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC
    </cfquery>
    <cfset AppList = ValueList(getApps.projectID)>
    <cfset TotalReq = 0>
    <cfloop query="getApps">
        <cfif getApps.fundAward NEQ 0 AND getApps.fundAward NEQ "">
            <cfset TotalReq = TotalReq + getApps.fundAward>
        <cfelseif getApps.fundReq NEQ 0 AND getApps.fundReq NEQ  "">
            <cfset TotalReq = TotalReq + getApps.fundReq>
        </cfif>    
    </cfloop>
    <cfif getComp.ARD NEQ "" AND TotalReq NEQ "">
        <cfset TotalARDRemain = getComp.ARD-TotalReq>
    <cfelse>
        <cfset TotalARDRemain = 0>
    </cfif>
    <cfif getComp.ARD NEQ "" AND TotalReq NEQ "" AND getComp.ARD NEQ 0>
         <cfset TotalARDPercent = (TotalReq/getComp.ARD)*100>
    <cfelse>
        <cfset TotalARDPercent = 0>
    </cfif>
   
    <cfquery name="getProjects">
        SELECT projects.projectID, projects.projectLongName, projects.projectName, agency.agencyLongName, projects.agencyID, projectcomponent.projectCompCategory, projects.cocID
        FROM projects
            INNER JOIN agency ON projects.agencyID = agency.agencyID
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
        WHERE projects.active = '1'
            AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
    </cfquery>
    <cfoutput>
        <div class="row">
            <div class="large-12 columns">
                <br><br>
                <h1>#SESSION.cocCity# #getComp.compLongName#</h1>
                <h3>Included Projects</h3>
                <p>There <cfif getApps.RecordCount EQ 1>is <b>#getApps.RecordCount#</b> active project<cfelse>are <b>#getApps.RecordCount#</b> active projects</cfif> 
                    requesting a total of <b>#LSCurrencyFormat(TotalReq)#</b> (#NumberFormat(TotalARDPercent,"9")#% of the #LSCurrencyFormat(getComp.ARD)# ARD<cfif TotalARDRemain GT 0>;  #LSCurrencyFormat(TotalARDRemain)# remaining.</cfif>)<cfif getApps.RecordCount EQ 0>.<cfelse>:</cfif></p>
            </div>
        </div>
        <div class="row">
            <div class="large-12 columns">
                <cfloop query="getApps">
                    <div class="panel BGLightGray">
                        <div class="row">
                            <div class="medium-2 columns">
                                <div class="panel text-center">
                                    <h2>#NumberFormat(getApps.Score,"0.9")#</h2>
                                    <h6>#Left(getApps.projectCompCategory,3)#</h6>
                                </div>
                            </div>
                            <div class="medium-6 columns">
                                <h4>#getApps.appName#</h4>
                                    <i>
                                        #agencyLongName#
                                        <cfif getApps.contactAlt NEQ 0 AND getApps.contactAlt NEQ "">
                                            <cfquery name="getAlt">
                                            SELECT userEmail FROM users WHERE userID = <cfqueryparam value="#getApps.contactAlt#">
                                            </cfquery>    
                                            <cfquery name="getApprove">
                                            SELECT userEmail FROM users WHERE userID = <cfqueryparam value="#getApps.contactApprove#">
                                            </cfquery>
                                            <br>(Approval Contact: <a href="mailto:#getApprove.userEmail#">#getApprove.userEmail#</a> | Alt: <a href="mailto:#getAlt.userEmail#">#getAlt.userEmail#</a>)
                                        <cfelseif getApps.contactApprove NEQ 0 AND getApps.contactApprove NEQ "">
                                            <cfquery name="getApprove">
                                            SELECT userEmail FROM users WHERE userID = <cfqueryparam value="#getApps.contactApprove#">
                                            </cfquery>
                                            <br>(Approval Contact: <a href="mailto:#getApprove.userEmail#">#getApprove.userEmail#</a>)
                                        </cfif>
                                    </i>
                                    <br><br>
                                    <cfif getApps.fundAward NEQ 0>
                                        #LSCurrencyFormat(getApps.fundAward)#
                                        <cfif getApps.fundReq LT getApps.fundAward>
                                            <cfset fundDiff = getApps.fundAward-getApps.fundReq>
                                            (#LSCurrencyFormat(fundDiff)# more than requested.)
                                        <cfelseif getApps.fundReq GT getApps.fundAward>
                                            <cfset fundDiff = getApps.fundReq-getApps.fundAward>
                                            (#LSCurrencyFormat(fundDiff)# less than requested.)
                                        </cfif>
                                    <cfelseif getApps.fundAward EQ 0 AND getApps.fundReq NEQ 0>
                                        #LSCurrencyFormat("#getApps.fundReq#")#
                                    <cfelseif getApps.fundAward EQ 0 AND getApps.fundReq EQ 0>
                                        <i>Not Funded</i>.
                                    </cfif>
                            </div>
                            <div class="medium-4 columns text-right">
                                <h3>
                                    <a href="#CurrentPageVar#&action=copy&app=#getApps.compAppID#" class="panelLink button small" style="display: none;"><i class="fi-plus"></i> Copy</a>
                                    <a href="#CurrentPageVar#&action=delete&app=#getApps.compAppID#" class="panelLink button small alert" style="display: none;"><i class="fi-x"></i></a>
                                </h3>
                            </div>
                        </div>
                        <div class="panelLink" id="#getProjects.projectID#">
                            <cfset FormType = "update">
                            <cfinclude template="#AbsoluteURL#legos/compAppForm.cfm">
                        </div>
                    </div>
                </cfloop>
                <div class="row">
                    <div class="large-12 columns">
                        <br><br><hr>
                        <h3>Excluded Projects</h3>
                    </div>
                </div>
                <cfloop query="getProjects">
                    <cfif ListFind(AppList,"#getProjects.projectID#") EQ 0>
                        <!--- Project Panel --->
                        <div class="panel">
                            <div class="row">
                                <div class="medium-2 columns">
                                    <div class="panel text-center">
                                        <h3>#Left(getProjects.projectCompCategory,3)#</h3>
                                    </div>
                                </div>
                                <div class="medium-8 columns">
                                    <h4><cfif projectLongName NEQ "">#projectLongName#<cfelse>#projectName#</cfif></h4>
                                    <i>#agencyLongName#</i>
                                </div>
                                <div class="medium-2 columns text-right">
                                    
                                </div>
                            </div>
                            <div class="panelLink" id="#getProjects.projectID#">
                                <cfset FormType = "new">
                                <cfinclude template="#AbsoluteURL#legos/compAppForm.cfm">
                            </div>
                        </div>
                        <!---/ Project Panel --->
                    </cfif>
                </cfloop>
            </div>
        </div>
    </cfoutput>
    <!---/ List --->
  </div>
</div>