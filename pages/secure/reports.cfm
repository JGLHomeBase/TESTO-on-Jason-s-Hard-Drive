<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.report" default="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Report Template --->
    <cfinvoke component="knex.reports" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.ReportID)#">
    <!---/ Nuke Report Template --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Report deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.ReportID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Report Template --->
      <cfinvoke component="knex.reports" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Report Template --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.reportShortName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.ReportID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Report Template --->
      <cfinvoke component="knex.reports" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Report Template --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.reportShortName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Report Templates
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<cfif SESSION.cocID EQ 0>
    <cfset CurrentCoC = "Global">
<cfelse>
    <cfset CurrentCoC = "#SESSION.cocCity#">
</cfif>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<cfif SESSION.cocID EQ 0>
  <cfoutput>
    <div class="panel">
      <div class="row">
        <div class="large-12 columns">
          <b>HEADS UP</b>&mdash; you are in global mode and changes you make will effect all communities in #AppShortName#. To create an template specific to a single CoC select it first before continuing.
        </div>
      </div>
    </div>
  </cfoutput>
</cfif>
<!---/ Alerts --->

<div class="globalPad">
<div class="row">
  <div class="medium-2 columns">
    <cfinclude template="#AbsoluteURL#legos/reportNav.cfm">
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <!--- Get Reports --->
      <cfinvoke component="knex.reports" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getReport"
            whatFields = "*"
            Where = "ThisCoC"
            Order = "reportName ASC">
      <!---/ Get Reports --->
      <cfoutput><h1>Report Templates (#CurrentCoC#)</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Template</th>
          <th>Report Builder</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="200">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getReport">
            <tr>
              <td>
                  <b>
                  <cfif SESSION.cocID NEQ 0>
                      <a href="display.cfm?report=#getReport.reportID#">#getReport.reportName#</a>
                  <cfelse>
                      #getReport.reportName#
                  </cfif>
                  </b> 
                <cfif getReport.cocID EQ 0>
                  <span class="label"><i class="fi-web"></i> Global</span>
                </cfif>
                </td>
              <td>
                  <cfif getReport.cocID NEQ 0 OR SESSION.authLevel LTE 1>
                    <div class="tableLink">
                      <i class="fi-wrench"></i> <a href="#CurrentPage#?report=#getReport.ReportID#&action=build">Build</a>
                    </div>
                  </cfif>
                </td>
                
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <cfif getReport.cocID EQ SESSION.cocID OR SESSION.authLevel LTE 1>
                      <a href="#CurrentPage#?report=#getReport.ReportID#">
                         <i class="fi-pencil"></i> Edit
                      </a>
                      &nbsp; | &nbsp;
                      </cfif>
                      <a href="#CurrentPage#?report=#getReport.ReportID#&action=copy">
                         <i class="fi-page-copy"></i> Copy
                      </a>
                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?report=#getReport.ReportID#&action=delete">
                           <i class="fi-trash"></i> Delete
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.report NEQ "" AND SESSION.authLevel LTE 1>
          <!--- Get Reports --->
          <cfinvoke component="knex.reports" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReport"
                whatFields = "ReportID, reportShortName"
                Where = "ThisReport">
          <!---/ Get Reports --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a report template. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getReport.ReportID#" name="ReportID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getReport.reportShortName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>


    <cfelseif URL.action EQ "build" AND SESSION.authLevel LTE 5>
    <!--- Build Template --->
      <!--- Process Build Actions --->
      <cfif FORM.action EQ "addMod" AND FORM.reportPayload NEQ "">
          <!--- Get Reports --->
          <cfinvoke component="knex.reports" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReport"
                whatFields = "reportPayload, reportID, joyride"
                Where = "ThisReport">
          <!---/ Get Reports --->
        <cfif ListLen("#getReport.reportPayload#") GT 0 AND FORM.position LTE ListLen("#getReport.reportPayload#")>
          <cfset FORM.reportPayload = listInsertAt("#getReport.reportPayload#", FORM.position, "#FORM.reportPayload#")>
        <cfelseif FORM.position GTE ListLen("#getReport.reportPayload#")>
          <cfset FORM.reportPayload = listAppend("#getReport.reportPayload#", "#FORM.reportPayload#")>
        <cfelse>
          <cfset FORM.reportPayload = FORM.reportPayload>
        </cfif>
            <cfset FORM.reportID = getReport.reportID>
              <!--- Update Report --->
              <cfinvoke component="knex.reports" 
                    method="updateTwo"
                    DataSource = "#DataSource#">
              <!---/ Update Report --->
    <cfelseif IsDefined("URL.delete") AND IsDefined("URL.target")>
          <!--- Get Reports --->
          <cfinvoke component="knex.reports" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReport"
                whatFields = "reportPayload, reportID, joyride"
                Where = "ThisReport">
          <!---/ Get Reports --->
        <cfif getReport.reportPayload NEQ "">
          <cfset FORM.reportPayload = ListDeleteAt("#getReport.reportPayload#", URL.delete)>
          <cfset FORM.reportID = getReport.reportID>      
              <!--- Update Report --->
              <cfinvoke component="knex.reports" 
                    method="updateTwo"
                    DataSource = "#DataSource#">
              <!---/ Update Report --->
        </cfif>
        <cflocation url="#CurrentPage#?report=#getReport.reportID#&action=build">
    </cfif>
      <!---/ Process Build Actions --->
      <!--- Get Reports --->
      <cfinvoke component="knex.reports" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReport"
                whatFields = "*"
                Where = "ThisReport">
      <!---/ Get Reports --->
      <!--- Header --->
      <div class="row">
        <div class="large-12 columns">
          <h1><cfoutput><i class="fi-wrench"></i> #AppShortName# Report Builder</cfoutput></h1>
          <hr>
          <div class="panel BGLightGray">
            <cfoutput>
              <a href="#CurrentPage#?report=3" class="small button right">Edit</a>
              <h2 class="">
                  <cfif getReport.cocID EQ 0>
                      <i class="fi-web"></i> 
                  </cfif>
                  #getReport.reportName# (#getReport.reportShortName#)
              </h2>
              <cfif getReport.ReportDesc NEQ "">
                <p>#getReport.ReportDesc#</p>
              </cfif>
              <cfif SESSION.coCID EQ 0>
                   <div class="row">
                      <div class="small-12 columns">
                          <i>Select a Community to Enable Report Preview Links</i>
                       </div>
                  </div>
              <cfelse>
                   <form action="display.cfm" target="_blank">
                    <div class="row">

                      <div class="small-12 columns">
                          <!--- Get Project List --->
                          <cfinvoke component="knex.projects" 
                                method="getList"
                                DataSource = "#DataSource#"
                                returnVariable = "getProjectList"
                                whatFields ="Legion"
                                Join = "LCoCAgencyComponent"
                                Where = "Session"
                                Order = "Layered">
                          <!---/ Get Project List --->
                        <input type="hidden" name="report" value="#getReport.ReportID#">
                        <label>Preview this report:</label>
                        <select name="project" onchange="this.form.submit()">
                          <option>Select a Project</option>
                          <cfloop query="getProjectList">
                            <option value="#getProjectList.projectID#">#getProjectList.projectLongName#</option>
                          </cfloop>
                        </select>
                      </div>
                    </div>
                    <div class="row">

                      <div class="small-12 columns">
                          <!--- Get Project List --->

                          <!---/ Get Project List --->
                        <select name="apr">
                          <cfquery name="getAPR">
                          SELECT aprID, aprSetName
                          FROM dataapr00
                              <cfif SESSION.cocID NEQ 0>
                              WHERE cocID = <cfqueryparam value="#SESSION.cocID#">
                              </cfif>
                          </cfquery>
                          <cfloop query="getAPR">
                            <option value="#getAPR.aprID#">#getAPR.aprSetName#</option>
                          </cfloop>
                        </select>
                      </div>
                    </div>
                  </form>
              </cfif>
             
            </cfoutput>
          </div>
        </div>
      </div>

      <!---/ Header --->
      <!--- Get Modules --->
      <cfinvoke component="knex.modules" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getReportMod"
            whatFields = "ReportModID, ModName, cocID"
            Where = "Builder"
            Order = "cocID ASC, ModName ASC">
       <!---/ Get Modules --->
        <!--- Get Factors --->
        <cfquery name="getScoreMod">
        SELECT reportModID, factorLongName, factorShortName
        FROM reportmod
        INNER JOIN scorefactor ON reportmod.factorID = scorefactor.factorID
        INNER JOIN scorecat ON scorecat.catID = scorefactor.catID
        WHERE cocID = <cfqueryparam value="#SESSION.cocID#"> AND scorecat.compID = <cfqueryparam value="#SESSION.compID#">
        ORDER BY catLongName, factorLongName, factorShortName
        </cfquery>
        <!---/ Get Factors --->
      <div class="row">
        <div class="large-12 columns">
          <hr>
        </div>
      </div>
      <cfoutput>
        <cfset position = 1>
        <!--- Add Content --->
        <cfinclude template="#AbsoluteURl#legos/AddMod.cfm">
        <!---/ Add Content --->

        <cfif getReport.reportPayload NEQ "">
          <cfloop list="#getReport.reportPayload#" index="modID">
              <!--- Get Modules --->
              <cfquery name="getReportMod">
                SELECT ReportModID, ModName, modType, cocID, factorID
                FROM reportmod
                WHERE ReportModID = <cfqueryparam value="#modID#">    
                </cfquery>
              <!---/ Get Modules --->
                
            <div class="">
            <cfif getReportMod.factorID EQ 0>

                <div class="panel">
                    <div class="row">
                        <div class="small-11 columns">
                          <h3>#getReportMod.ModName# <cfif SESSION.authLevel LTE 1 OR getReportMod.cocID EQ SESSION.cocID><a href="#absoluteURL#pages/secure/modules.cfm?mod=#modID#" target="_blank" class="panelLink"><i class="fi-pencil"></i></a></cfif></h3>
                        </div>
                        <div class="small-1 columns text-right">
                          <h3>
                            <a href="#CurrentPage#?report=#getReport.reportID#&action=build&delete=#position#&target=#modID#" class="panelLink"><i class="fi-x"></i></a>
                          </h3>
                        </div>
                      </div>
                </div>
            <cfelse>
                <!---- Score Factors ---->
                <cfquery name="getFactor">
                SELECT * FROM scorefactor
                WHERE factorID = <cfqueryparam value="#getReportMod.factorID#">
                </cfquery>
                <div class="panel BGLightGray">
                    <div class="row">
                        <div class="small-9 columns">
                          <h3>#getFactor.factorLongName# <cfif SESSION.authLevel LTE 1 OR getReportMod.cocID EQ SESSION.cocID><a href="#absoluteURL#pages/secure/scoreFactors.cfm?factor=#getFactor.factorID#" target="_blank" class="panelLink"><i class="fi-pencil"></i></a></cfif></h3>
                        </div>
                        <div class="small-2 columns text-right">
                          <h3>
                            <cfif Right(DecimalFormat(getFactor.maxPoints),2) EQ "00">
                                #NumberFormat(getFactor.maxPoints,"0")#
                            <cfelseif Right(DecimalFormat(getFactor.maxPoints),1) EQ "0">
                                #NumberFormat(getFactor.maxPoints,"0.0")#
                            <cfelse>
                                #getFactor.maxPoints#
                            </cfif>
                             <small>Pts.</small>
                             <cfif getFactor.forced EQ 1>
                                &nbsp;&nbsp;<span data-tooltip aria-haspopup="true" class="has-tip" title="Score Fixed"><i class="fi-lock"></i></span>
                            </cfif>
                          </h3>
                        </div>
                        <div class="small-1 columns text-right">
                          <h3>
                            <a href="#CurrentPage#?report=#getReport.reportID#&action=build&delete=#position#&target=#modID#" class="panelLink"><i class="fi-x"></i></a>
                          </h3>
                        </div>
                      </div>
                </div>
                <!----/ Score Factors ---->
            </cfif>
             <cfset position = position+1>
              <!--- Get Modules --->
              <cfinvoke component="knex.modules" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getReportMod"
                    whatFields = "ReportModID, ModName, cocID"
                    Where = "Builder"
                    Order = "cocID ASC, ModName ASC">
               <!---/ Get Modules --->              
              <!--- Add Content --->
              <cfinclude template="#AbsoluteURl#legos/AddMod.cfm">
              <!---/ Add Content --->
            </div>
            
          </cfloop>
          <div class="row">
            <div class="large-12 columns">
              <hr>
            </div>
          </div>
        <cfelse>
          <div class="text-center"><h1 class="MakeGray"><br>Nothing to See Here<br></h1></div>
        </cfif>
        
      </cfoutput>
    <!---/ Build Template --->


    <cfelse>
      <!--- ReportMod Profile Form --->
      <!--- Get Reports --->
      <cfinvoke component="knex.reports" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReport"
                whatFields = "*"
                Where = "ThisReport">
      <!---/ Get Reports --->


      <div class="row">
        <div class="large-12 columns">
            <cfoutput>
              <cfif URL.report EQ 0>
                <h1>Add a Template (#CurrentCoC#)</h1>
              <cfelseif action EQ "copy">
                <h1>Copy a Template (#CurrentCoC#)</h1>
              <cfelse>
                <cfoutput><a href="#CurrentPage#?report=#URL.report#&action=build" class="small button right"><i class="fi-wrench"></i> Report Builder</a></cfoutput>
                <h1>Update Template (#CurrentCoC#)</h1>
              </cfif>
            </cfoutput>
          <hr>
        </div>
      </div>



      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="large-12 columns">
              <h3>Template Description</h3>
            </div>
          </div>
          <div class="row">
            <div class="medium-8 columns">
              <label>Report Title</label>
              <input type="text"
                     name="reportName"
                     value="#getReport.reportName#"
                     placeholder="Standard Performance Evaluation"
                     required
                    maxlength="256">
              <small class="form-error">This field is requried</small>
            </div>
            <div class="medium-4 columns">
              <!--- Get CoC List --->
              <cfinvoke component="knex.cocs" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getCoC"
                    whatFields = "cocID, cocLongName"
                    Where = "Active"
                    Order = "cocName ASC">
              <!---/ Get CoC List --->
               <label>Community</label>
               <select name="cocID"
                       <cfif SESSION.authlevel GT 3 OR SESSION.usercocID NEQ 0>
                        class="BGLightGray"
                        disabled
                       </cfif>
                       >
                  <option value="0"<cfif getReport.cocID EQ 0>selected</cfif>>
                    :: Global ::
                  </option>
                  <cfloop query="getCoC">
                    <cfif SESSION.cocID EQ 0 OR SESSION.cocID EQ getCoC.cocID>
                      <option value="#getCoC.cocID#"<cfif getCoC.cocID EQ getReport.cocID>selected</cfif>>
                        #getCoC.cocLongName#
                      </option>
                    </cfif>
                  </cfloop>
                </select>
            </div>
          </div>
          <div class="row">
            <div class="medium-6 columns">
              <label>Report Nickname</label>
              <input type="text"
                     name="reportShortName"
                     value="#getReport.reportShortName#"
                     placeholder="DefaultEval"
                     required
                    maxlength="256">
              <small class="form-error">This field is requried</small>
            </div>

            <div class="medium-6 columns">
              <label>Joy Ride Enabled</label>
              <select name="joyRide" required>
                     
                     <option value="0" <cfif getReport.joyRide EQ 0>selected</cfif>>No</option>
                     <option value="1" <cfif getReport.joyRide EQ 1>selected</cfif>>Yes</option>
              </select>
            </div>
          </div>

          <div class="row">
            <div class="medium-12 columns">
              <label>Description</label>
              <textarea name="ReportDesc"
                     placeholder="Report Description" >#getReport.ReportDesc#</textarea>
            </div>
          </div>

         

          <div class="row">
            <div class="large-12 columns text-right">
              <cfif URL.action EQ "copy">
                <input type="hidden" value="0" name="ReportID">
                <input type="hidden" value="#URL.report#" name="parentReportID">

              <cfelse>
                <input type="hidden" value="#URL.report#" name="ReportID">
                <input type="hidden" value="0" name="parentReportID">
              </cfif>
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#getReport.reportPayload#" name="reportPayload">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.report EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ ReportMod Profile Form --->
    </cfif>
    </div>
  </div>
</div>