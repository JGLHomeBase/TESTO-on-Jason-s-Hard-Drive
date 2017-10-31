<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.mod" default="0">
<!---/ Variables --->

<!--- Process Merge Fields --->
<cfif FORM.action EQ "process">
    <cfset mergeFieldList = "">
    <!--- Get PM's --->
    <cfquery name="getPMs">
    SELECT pmID, pmName
    FROM performmeasure
    WHERE (cocID = '0' OR cocID = <cfqueryparam value="#FORM.cocID#">)
        AND active = '1'
    </cfquery>
    <!---/ Get PM's --->
    <!--- Loop Through PM's and Add to Merge List --->
    <cfloop query="getPMs">
        <cfif FindNoCase("!#getPMs.pmName#!",FORM.content) NEQ 0>
            <cfset mergeFieldList = ListAppend(mergeFieldList, getPMs.pmID)>
        </cfif>
    </cfloop>
    <!---/ Loop Through PM's and Add to Merge List --->
    <cfif mergeFieldList NEQ "">
        <cfset FORM.mergeFields = mergeFieldList>
    <cfelse>
        <cfset FORM.mergeFields = 0>
    </cfif>
</cfif>
<!---/ Process Merge Fields --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Agency --->
    <cfinvoke component="knex.modules" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.ReportModID)#">
      <!---/ Nuke Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Report Module deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.ReportModID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Module --->
      <cfinvoke component="knex.modules" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Module --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.ModName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.ReportModID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Module --->
      <cfinvoke component="knex.modules" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Module --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.ModName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Report Modules
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
          <b>HEADS UP</b>&mdash; you are in global mode and changes you make will effect all communities in #AppShortName#. To create an module specific to a single CoC select it first before continuing.
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
      <!--- Get Records --->
      <cfinvoke component="knex.modules" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getReportMod"
            whatFields = "*"
            Where = "ThisCoC">
      <!---/ Get Records --->

      <cfoutput><h1>Report Modules (#CurrentCoC#)</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Module</th>
          <th>Type</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="200">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getReportMod">
            <tr>
              <td>
                <b><cfif getReportMod.modCat EQ "">General<cfelse>#getReportMod.modCat#</cfif> &mdash; #getReportMod.ModName#</b>
                <cfif getReportMod.cocID EQ 0>
                  <cfif getReportMod.cocID EQ 0>
                    <span class="label"><i class="fi-web"></i> Global</span>
                  </cfif>
                </cfif>
              </td>
              <td>
                  <cfif getReportMod.ModType EQ "static">
                      Static HTML
                  <cfelseif getReportMod.ModType EQ "merge">
                      HTML /w Merged Fields
                  <cfelseif getReportMod.ModType EQ "file">
                      Pre-Built
                  </cfif>
                  
              </td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <cfif SESSION.authLevel LTE 1 OR getReportMod.cocID EQ SESSION.cocID>
                          <a href="#CurrentPage#?mod=#getReportMod.ReportModID#">
                             <i class="fi-pencil"></i> Edit
                          </a>
                          &nbsp; | &nbsp;
                      </cfif>
                       <a href="#CurrentPage#?mod=#getReportMod.ReportModID#&action=copy">
                         <i class="fi-page-copy"></i> Copy
                      </a>
                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?mod=#getReportMod.ReportModID#&action=delete">
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
    <cfelseif URL.action EQ "delete" AND URL.mod NEQ "" AND SESSION.authLevel LTE 1>
          <!--- Get Records --->
          <cfinvoke component="knex.modules" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReportMod"
                whatFields = "ReportModID, ModName"
                Where = "ThisModule"
                Order = "modCat, ModName">
          <!---/ Get Records --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a report module. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getReportMod.ReportModID#" name="ReportModID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getReportMod.ModName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- ReportMod Profile Form --->
          <!--- Get Records --->
      <cfinvoke component="knex.modules" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getReportMod"
                whatFields = "*"
                Where = "ThisModule">
      <!---/ Get Records --->

      <div class="row">
        <div class="large-12 columns">
            <cfoutput>
              <cfif URL.mod EQ 0>
                <h1>Add a Module (#CurrentCoC#)</h1>
              <cfelseif URL.action EQ "copy">
                <h1>Duplicate Module (#CurrentCoC#)</h1>
              <cfelseif URL.action EQ "copy">
                <h1>Update Module (#CurrentCoC#)</h1>
              </cfif>
            </cfoutput>
          <hr>
        </div>
      </div>



      <cfoutput>
        <cfform method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="large-12 columns">
              <h3>Module Description</h3>
            </div>
          </div>
          <div class="row">
            <div class="medium-8 columns">
              <label>Module Name</label>
              <input type="text"
                     name="ModName"
                     value="#getReportMod.ModName#"
                     placeholder="Mainstream Benefits Chart (/w Type Comparisons)"
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
              <label>Scope</label>
               <select name="cocID"
                       <cfif SESSION.authlevel GT 3 OR SESSION.usercocID NEQ 0>
                        class="BGLightGray"
                        disabled
                       </cfif>
                       >
                  <option value="0"<cfif getReportMod.cocID EQ 0>selected</cfif>>
                    :: Global ::
                  </option>
                  <cfloop query="getCoC">
                    <cfif SESSION.cocID EQ 0 OR SESSION.cocID EQ getCoC.cocID>
                      <option value="#getCoC.cocID#"<cfif getCoC.cocID EQ getReportMod.cocID>selected</cfif>>
                        #getCoC.cocLongName#
                      </option>
                    </cfif>
                  </cfloop>
                </select>
            </div>
          </div>

          <div class="row">
              <div class="medium-3 columns">
                  <label>Module Nickname</label>
                  <input type="text"
                         name="modShortName"
                         value="#getReportMod.modShortName#"
                         placeholder="Benefits Chart"
                         required
                        maxlength="256">
                  <small class="form-error">This field is requried</small>
                </div>
            <div class="medium-3 columns">
               <label>Category</label>
               <select name="modCat">
                  <option value="General"<cfif getReportMod.modCat EQ "General" OR getReportMod.modCat EQ "" >selected</cfif>>
                    General
                  </option>
                  <option value="Capacity"<cfif getReportMod.modCat EQ "Capacity">selected</cfif>>
                    Capacity
                  </option>
                  <option value="HMIS"<cfif getReportMod.modCat EQ "HMIS">selected</cfif>>
                    HMIS
                  </option>
                  <option value="Housing"<cfif getReportMod.modCat EQ "Housing">selected</cfif>>
                    Housing
                  </option>
                  <option value="Income"<cfif getReportMod.modCat EQ "Income">selected</cfif>>
                    Income
                  </option>

                  <option value="Local"<cfif getReportMod.modCat EQ "Local">selected</cfif>>
                    Local
                  </option>
                  <option value="Other"<cfif getReportMod.modCat EQ "Other">selected</cfif>>
                    Other
                  </option>
                </select>
            </div>
            <div class="medium-3 columns">
              <label>Module Type</label>
              <select name="modType" required>
                <cfif getReportMod.modType EQ "static"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="static"#selected#>Static HTML</option>

                <cfif getReportMod.modType EQ "merge"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="merge"#selected#>HTML /w Merged Fields</option>
                
                <cfif getReportMod.modType EQ "chart"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="chart"#selected#>Chart</option>
                    
                <cfif getReportMod.modType EQ "chartMerge"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="chartMerge"#selected#>Chart /w Merged HTML</option>
                
                <cfset theDir = GetDirectoryFromPath(expandPath("#AbsoluteURL#hotwheels/"))>
                <cfset TargetPath = "#theDir##getReportMod.modShortName#.cfm">
                <cfif fileExists(TargetPath)>
                  <option value="File" selected>Pre-Built &mdash; #getReportMod.modShortName#.cfm</option>
                </cfif>
              </select>
              <small class="form-error">This field is requried</small>
            </div>
            <div class="medium-3 columns">
              <label>Panel Bkg.</label>
              <select name="panel" required>
                <cfif getReportMod.panel EQ "0"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="0"#selected#>None</option>
                
                <cfif getReportMod.panel EQ "1"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="1"#selected#>Gray</option>
                    
                <cfif getReportMod.panel EQ "2"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="2"#selected#>Blue/Gray</option>
                    
                <cfif getReportMod.panel EQ "3"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="3"#selected#>Dark Gray</option>
                    
                <cfif getReportMod.panel EQ "4"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="4"#selected#>Orange</option>
                    
                <cfif getReportMod.panel EQ "5"><cfset selected = " selected"><cfelse><cfset selected = ""></cfif>
                <option value="5"#selected#>Green</option>

              </select>
              <small class="form-error">This field is requried</small>
            </div>
          </div>
          
          <cfquery name="getCharts">
            SELECT chartTitle, chartID
              FROM reportchart
              WHERE cocID='0' OR cocID=<cfqueryparam value="#SESSION.cocID#">
              ORDER BY cocID, chartTitle
          </cfquery>
          <div class="row">
            <div class="large-12 columns">
              <hr>
              <h3>Charts</h3>
            </div>
          </div>
          <div class="row">
            <div class="medium-2 columns">
              <label>Chart A</label>
              <select name="chartID1">
                    <option value="0"<cfif getReportMod.chartID1 EQ 0 OR getReportMod.chartID1 EQ ""> selected</cfif>>:: None ::</option>
                  <cfloop query="getCharts">
                    <option value="#getCharts.chartID#"<cfif getReportMod.chartID1 EQ getCharts.chartID> selected</cfif>>#getCharts.chartTitle#</option>
                  </cfloop>
              </select>
            </div>
            <div class="medium-2 columns">
              <label>Chart B</lVBbel>
              <select name="chartID2">
                    <option value="0"<cfif getReportMod.chartID2 EQ 0 OR getReportMod.chartID2 EQ ""> selected</cfif>>:: None ::</option>
                  <cfloop query="getCharts">
                    <option value="#getCharts.chartID#"<cfif getReportMod.chartID2 EQ getCharts.chartID> selected</cfif>>#getCharts.chartTitle#</option>
                  </cfloop>
              </select>
            </div>
            <div class="medium-2 columns">
              <label>Chart C</label>
              <select name="chartID3">
                    <option value="0"<cfif getReportMod.chartID3 EQ 0 OR getReportMod.chartID3 EQ ""> selected</cfif>>:: None ::</option>
                  <cfloop query="getCharts">
                    <option value="#getCharts.chartID#"<cfif getReportMod.chartID3 EQ getCharts.chartID> selected</cfif>>#getCharts.chartTitle#</option>
                  </cfloop>
              </select>
            </div>
          <div class="medium-2 columns">
              <label>Chart D</label>
              <select name="chartID4">
                    <option value="0"<cfif getReportMod.chartID4 EQ 0 OR getReportMod.chartID4 EQ ""> selected</cfif>>:: None ::</option>
                  <cfloop query="getCharts">
                    <option value="#getCharts.chartID#"<cfif getReportMod.chartID4 EQ getCharts.chartID> selected</cfif>>#getCharts.chartTitle#</option>
                  </cfloop>
              </select>
            </div>
            <div class="medium-2 columns">
              <label>Chart E</label>
              <select name="chartID5">
                    <option value="0"<cfif getReportMod.chartID5 EQ 0 OR getReportMod.chartID5 EQ ""> selected</cfif>>:: None ::</option>
                  <cfloop query="getCharts">
                    <option value="#getCharts.chartID#"<cfif getReportMod.chartID5 EQ getCharts.chartID> selected</cfif>>#getCharts.chartTitle#</option>
                  </cfloop>
              </select>
            </div>
            <div class="medium-2 columns">
              <!--- height --->
                <label>Height</label>
                <div class="row collapse postfix-radius">
                    <div class="small-9 columns">
                      <cfif getReportMod.height EQ "">
                          <cfset height = 350>
                       <cfelse>
                           <cfset height =  getReportMod.height>
                       </cfif>
                        
                        <input type="number"
                               name="height"
                               value="#height#"
                               placeholder="350"
                               required
                              maxlength="4">
                        <small class="form-error">Must be a whole number</small>
                    </div>
                    <div class="small-3 columns">
                      <span class="postfix">px</span>
                    </div>
                  </div>
                
<!---/ height --->
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <hr>
              <h3>Content</h3>
              <!--- PM Lookup --->
                 <!--- Get Data  --->
                 <cfquery name="getPMs">
                    SELECT pmID, pmLongName, pmCatName, pmName
                    FROM performmeasure
                    INNER JOIN performcat ON performmeasure.pmCatID = performcat.pmCatID
                    WHERE cocID = '0' OR cocID = <cfqueryparam value="#SESSION.cocID#">
                     AND formatType <> 'varchar'
                    ORDER BY pmCatName, pmLongName
                </cfquery>
                <!---/ Get Data  --->
              <label>Performance Measure Lookup Tool</label>
              <input list="PMs" name="pmHelper" type="text">
              <datalist id="PMs">
                <cfloop query="getPMs">
                    <option value="!#getPMs.pmName#!">#getPMs.pmCatName#: #getPMs.pmLongName# (#getPMs.pmName#)</option>  
                </cfloop>
              </datalist>
              <!---/ PM Lookup --->
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
              <cftextarea name="content"
                          placeholder="Module Content" 
                          height="420" 
                          id="txtContent" 
                          richtext="true" 
                          toolbar="Basic">#getReportMod.content#</cftextarea>
            </div>
          </div>   
          <div class="row">
            <div class="large-12 columns">
              <hr>
              <h3>Joy Ride Report Tour: Stop Info</h3>
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
              <label>Stop Title</label>
              <input type="text"
                     name="RideTitle"
                     value="#getReportMod.RideTitle#"
                     placeholder="Mainstream Benefits"
                    maxlength="256">
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
              <label>Content</label>
              <textarea name="RideText"
                        placeholder="Ride Text" >#getReportMod.RideText#</textarea>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <cfif URL.action EQ "copy">
                <input type="hidden" value="0" name="ReportModID">
                <input type="hidden" value="#URL.mod#" name="parentModID">
              <cfelse>
                <input type="hidden" value="#URL.mod#" name="ReportModID">
                <input type="hidden" value="0" name="parentModID">
              </cfif>
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="0" name="reportID">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <input type="hidden" value="mergeFields" name="#getReportMod.mergeFields#">
              <cfif URL.mod EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </cfform>
      </cfoutput>
      <!---/ ReportMod Profile Form --->
    </cfif>
              </div>
  </div>
</div>