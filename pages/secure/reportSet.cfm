<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name=URL.reportSet.cfm default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 5>
  <cfquery datasource="#datasource#" name="getreportset">
    SELECT reportSetID, ReportSetName FROM reportset WHERE reportSetID = <cfqueryparam value="#FORM.reportSetID#">
  </cfquery>
  <cfif getreportset.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM reportset WHERE reportSetID = <cfqueryparam value="#getreportset.reportSetID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getreportset.ReportSetName#"
          EventDesc = "Report Set Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Report Set deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.reportSetID EQ 0 AND SESSION.authLevel LTE 5>
  <cfset FORM.cocID = SESSION.cocID>
  <cfparam name="FORM.altReports" default="0">
  <cfinsert datasource="#datasource#" tablename="reportset" formfields="ReportSetName, ReportSetDesc, cocID, defaultReport, defaultPH, defaultTH, defaultSSO, defaultOther, altReports">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new recordset (#FORM.ReportSetName#)"
          EventDesc = "New Report Set" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.ReportSetName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.reportSetID NEQ 0 AND SESSION.authLevel LTE 5>
    <cfparam name="FORM.altReports" default="0">
  <cfupdate datasource="#datasource#" tablename="reportset" formfields="reportSetID, ReportSetName, ReportSetDesc, cocID, defaultReport, defaultPH, defaultTH, defaultSSO, defaultOther, altReports">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new recordset (#FORM.ReportSetName#)"
          EventDesc = "New Report Set" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.ReportSetName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <cfif SESSION.cocID EQ 0>
                <cfset CurrentCoC = "Global">
            <cfelse>
                <cfset CurrentCoC = "#SESSION.cocCity#">
            </cfif>
            <h1 class="CFHeader"><br>
                Manage Report Sets
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
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
      <cfquery datasource="#datasource#" name="getreportset">
        SELECT * from reportset
        WHERE active = '1'
          AND (cocID = <cfqueryparam value="0"> OR cocID = <cfqueryparam value="#SESSION.cocID#">)
        ORDER BY ReportSetName ASC
      </cfquery>
      <cfoutput><h1>Report Sets  (#CurrentCoC#)</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Report Set</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getreportset"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td>
                  <b>#getreportset.ReportSetName#</b>
                  <cfif getreportset.cocID EQ 0>
                      <span class="label"><i class="fi-web"></i> Global</span>
                    </cfif>
                  <br>
                  <i>#getreportset.ReportSetDesc#</i>
              </td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                        <cfif getreportset.cocID NEQ "0" OR SESSION.authLevel LT 3>
                          <a href="#CurrentPage#?reportSet.cfm=#getreportset.reportSetID#">
                             <i class="fi-pencil"></i>
                          </a>
                          <cfif SESSION.authLevel LTE 5>
                            &nbsp; | &nbsp;
                            <a href="#CurrentPage#?reportSet.cfm=#getreportset.reportSetID#&action=delete">
                               <i class="fi-trash"></i>
                            </a></cfif>
                        </cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!--- Pagination --->
        <cfset pageRecordCount = getreportset.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.reportSet.cfm NEQ "" AND SESSION.authLevel LTE 5>
      <cfquery datasource="#datasource#" name="getreportset">
          SELECT reportSetID, ReportSetName FROM reportset 
          WHERE reportSetID = <cfqueryparam value="#URL.reportSet.cfm#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a recordset. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getreportset.reportSetID#" name="reportSetID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getreportset.ReportSetName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getreportset">
        SELECT * FROM reportset WHERE reportSetID = <cfqueryparam value="#URL.reportSet.cfm#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.reportSet.cfm EQ 0>
            <cfoutput>
                <h1>Add a Report Set (#CurrentCoC#)</h1>
            </cfoutput>
          <cfelse>
            <h1>Update Report Set Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <cfform method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-8 columns">
              <label>Report Set Name</label>
              <input type="text" 
                     name="ReportSetName" 
                     value="#getreportset.ReportSetName#" 
                     placeholder=""
                     required>
              <small class="form-error"></small>
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
                  <option value="0"<cfif getReportset.cocID EQ 0>selected</cfif>>
                    :: Global ::
                  </option>
                  <cfloop query="getCoC">
                    <cfif SESSION.cocID EQ 0 OR SESSION.cocID EQ getCoC.cocID>
                      <option value="#getCoC.cocID#"<cfif getCoC.cocID EQ getReportset.cocID>selected</cfif>>
                        #getCoC.cocLongName#
                      </option>
                    </cfif>
                  </cfloop>
                </select>
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
                <!--- Report Set Description --->
                <label>Report Set Description</label>
                <cftextarea name="ReportSetDesc"  height="420"
                       placeholder="Report Set Description" >
                    #getReportSet.ReportSetDesc#
                </cftextarea>
                <!---/ Report Set Description --->
            </div>
          </div>
        <div class="row">
            <div class="large-12 column">
                <hr>
            </div>
        </div>
        <cfquery name="getReports">
        SELECT reportID, reportName
        FROM report
        WHERE cocID = '0' OR cocID = <cfqueryparam value="#SESSION.cocID#">
        ORDER BY cocID, reportName
        </cfquery>
        <div class="row">
            <div class="large-12 columns">
                <label>Default Report Template</label>
                <select name="defaultReport">
                    <cfloop query="getReports">
                        <cfif getReportSet.defaultReport EQ getReports.reportID>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getReports.reportID#"#selected#>#getReports.reportName#</option>
                    </cfloop>
                </select>
            </div>    
        </div>
        <div class="row">
            <div class="medium-6 columns">
                <label>Default PH Template (If Different)</label>
                <select name="defaultPH">
                    <option value="0">:: None ::</option>
                    <cfloop query="getReports">
                        <cfif getReportSet.defaultPH EQ getReports.reportID>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getReports.reportID#"#selected#>#getReports.reportName#</option>
                    </cfloop>
                </select>
            </div>
            <div class="medium-6 columns">
                <label>Default TH Template (If Different)</label>
                <select name="defaultTH">
                    <option value="0">:: None ::</option>
                    <cfloop query="getReports">
                        <cfif getReportSet.defaultTH EQ getReports.reportID>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getReports.reportID#"#selected#>#getReports.reportName#</option>
                    </cfloop>
                </select>
            </div>            
        </div>
        <div class="row">
            <div class="medium-6 columns">
                <label>Default SSO Template (If Different)</label>
                <select name="defaultSSO">
                    <option value="0">:: None ::</option>
                    <cfloop query="getReports">
                        <cfif getReportSet.defaultSSO EQ getReports.reportID>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getReports.reportID#"#selected#>#getReports.reportName#</option>
                    </cfloop>
                </select>
            </div>
            <div class="medium-6 columns">
                <label>Default Other Template (If Different)</label>
                <select name="defaultOther">
                    <option value="0">:: None ::</option>
                    <cfloop query="getReports">
                        <cfif getReportSet.defaultOther EQ getReports.reportID>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getReports.reportID#"#selected#>#getReports.reportName#</option>
                    </cfloop>
                </select>
            </div>            
        </div>
        <div class="row">
            <div class="large-12 columns">
            <hr>
            <h3>Additional Available Templates</h3>
            <cfloop query="getReports">
                        <cfif ListContainsNoCase(getReportSet.altReports,"#getReports.reportID#") NEQ 0>
                            <cfset selected = " checked">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <label><input name="altReports" type="checkbox" value="#getReports.reportID#"#selected#> #getReports.reportName#</label>
                    </cfloop>
            </div>            
        </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <hr>
              <input type="hidden" value="#URL.reportSet.cfm#" name="reportSetID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.reportSet.cfm EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
            </div>
          </div>
        </cfform>
      </cfoutput>
      <!---/  Profile Form --->
    </cfif>
    </div>
  </div>
</div>