<!--- Variables --->
<cfparam name=URL.reportChart.cfm default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 5>
  <cfquery datasource="#datasource#" name="getReportChart">
    SELECT chartID, chartTitle FROM reportchart WHERE chartID = <cfqueryparam value="#FORM.chartID#">
  </cfquery>
  <cfif getReportChart.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM reportchart WHERE chartID = <cfqueryparam value="#getReportChart.chartID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getReportChart.chartTitle#"
          EventDesc = "Chart Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Chart deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.chartID EQ 0 AND SESSION.authLevel LTE 5>
  <cfset FORM.cocID = SESSION.cocID>
  <cfinsert datasource="#datasource#" tablename="reportchart" formfields="chartTitle, showZeros, pmID1, pmID2, pmID3, pmID4, pmID5, pmID6, pmID7, pmID8, pmID9, pmID10, pmID11, pmID12, pmID13, pmID14, pmID15, chartType, cocID, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, label14, label15, showTitle">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new chart (#FORM.chartTitle#)"
          EventDesc = "New Chart" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.chartTitle# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.chartID NEQ 0 AND SESSION.authLevel LTE 5>
    <cfupdate datasource="#datasource#" tablename="reportchart" formfields="chartID, chartTitle, showZeros, pmID1, pmID2, pmID3, pmID4, pmID5, pmID6, pmID7, pmID8, pmID9, pmID10, pmID11, pmID12, pmID13, pmID14, pmID15, chartType, cocID, label1, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, label14, label15, showTitle">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new chart (#FORM.chartTitle#)"
          EventDesc = "New Chart" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.chartTitle# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Charts
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
      <cfquery datasource="#datasource#" name="getReportChart">
        SELECT * from reportchart WHERE active = '1'
        ORDER BY chartTitle ASC
      </cfquery>
      <cfoutput><h1>Charts</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Chart</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getReportChart"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getReportChart.chartTitle#</b></td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
<cfif getReportChart.cocID EQ SESSION.cocID OR SESSION.authLevel LTE 1>
                      <a href="#CurrentPage#?reportChart.cfm=#getReportChart.chartID#">                       
                         <i class="fi-pencil"></i>
                      </a></cfif>

                      <cfif SESSION.authLevel LTE 1 OR getReportChart.cocID EQ SESSION.cocID>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?reportChart.cfm=#getReportChart.chartID#&action=delete">
                           <i class="fi-trash"></i>
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!--- Pagination --->
        <cfset pageRecordCount = getReportChart.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.reportChart.cfm NEQ "" AND SESSION.authLevel LTE 5>
      <cfquery datasource="#datasource#" name="getReportChart">
          SELECT chartID, chartTitle FROM reportchart WHERE chartID = <cfqueryparam value="#URL.reportChart.cfm#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a chart. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getReportChart.chartID#" name="chartID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getReportChart.chartTitle#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getReportChart">
        SELECT * FROM reportchart WHERE chartID = <cfqueryparam value="#URL.reportChart.cfm#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
            <cfoutput>
                 <cfif URL.reportChart.cfm EQ 0>
                    <h1>Add a Chart (#CurrentCoC#)</h1>
                  <cfelse>
                    <h1>Update Chart Profile (#CurrentCoC#)</h1>
                  </cfif>
            </cfoutput>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
           <div class="row">
              <div class="medium-12 columns">
                  <h3>Chart Options</h3>
              </div>
          </div>
          <div class="row">
            <div class="medium-10 columns">
              <label>Chart Title</label>
              <input type="text" 
                     name="chartTitle" 
                     value="#getReportChart.chartTitle#" 
                     placeholder=""
                     required>
              <small class="form-error"></small>
            </div>
            <div class="medium-2 columns">
                <!--- showTitle --->
                <label>Show Title</label>
                <select name="showTitle" required>
                       <option value="1" <cfif getReportChart.showTitle EQ 1>selected</cfif>>Yes</option>
                       <option value="0" <cfif getReportChart.showTitle EQ 0>selected</cfif>>No</option>
                </select>
                <!---/ showTitle --->  
            </div>
          </div>
          <div class="row">
              <div class="medium-3 columns">
                <label>Chart Type</label>
                <select name="chartType">
                    <option value="bar"<cfif getReportChart.chartType EQ "bar" OR getReportChart.chartType EQ "horizontalbar"> selected</cfif>>Bar</option>
                    <option value="pie"<cfif getReportChart.chartType EQ "pie"> selected</cfif>>Pie</option>
                </select>
              </div>
              <div class="medium-3 columns">
                  <!--- showLegend --->
                    <label>Show Measures /w '0' Value</label>
                    <select name="showZeros" required>
                           <option value="1" <cfif getReportChart.showZeros EQ 1>selected</cfif>>Yes</option>
                           <option value="0" <cfif getReportChart.showZeros EQ 0 OR getReportChart.showZeros EQ "">selected</cfif>>No</option>
                    </select>
                    <!---/ showLegend --->
              </div>
              
              <div class="medium-3 columns">

              </div>
              <div class="medium-3 columns">

              </div>
          </div>
          <!--- Series A --->
          <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 1</h3>
              </div>
          </div>
          <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID1"
                          nullOK="false"
                          selected="#getReportChart.pmID1#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- labelA --->
                <label>Label</label>
                <input type="text"
                       name="label1"
                       value="#getReportChart.label1#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ labelA --->
            </div>
          </div>
          <!---/ Series 1 --->
        
         <!--- Series B --->
          <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 2</h3>
              </div>
          </div>
          <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID2"
                          nullOK="true"
                          selected="#getReportChart.pmID2#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label2 --->
                <label>Label</label>
                <input type="text"
                       name="label2"
                       value="#getReportChart.label2#"
                       placeholder="Label"
                      maxlength="256">
<!---/ labelB --->
              </div>
          </div>
          <!---/ Series B --->
        
        <!--- Series C --->
          <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 3</h3>
              </div>
          </div>
          <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID3"
                          nullOK="true"
                          selected="#getReportChart.pmID3#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- labelB --->
                <label>Label</label>
                <input type="text"
                       name="label3"
                       value="#getReportChart.label3#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ labelB --->
              </div>
          </div>
          <!---/ Series C --->
        
        <!--- Series D --->
          <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 4</h3>
              </div>
          </div>
          <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID4"
                          nullOK="true"
                          selected="#getReportChart.pmID4#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- labelD --->
                <label>Label</label>
                <input type="text"
                       name="label4"
                       value="#getReportChart.label4#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ labelD --->
              </div>
          </div>
          <!---/ Series D --->
          
          <!--- Series E --->
          <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 5</h3>
              </div>
          </div>
          <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID5"
                          nullOK="true"
                          selected="#getReportChart.pmID5#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- labelE --->
                <label>Label</label>
                <input type="text"
                       name="label5"
                       value="#getReportChart.label5#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ labelE --->   
             </div>
          </div>
          <!---/ Series E --->

          <!--- Series F --->
          <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 6</h3>
              </div>
          </div>
          <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID6"
                          nullOK="true"
                          selected="#getReportChart.pmID6#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- labelF --->
                <label>Label</label>
                <input type="text"
                       name="label6"
                       value="#getReportChart.label6#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ labelF --->
              </div>
          </div>
          <!---/ Series F --->
          
        <!--- Series 7 --->
        <div class="row">
          <div class="medium-12 columns">
              <hr>
              <h3>Series 7</h3>
          </div>
        </div>
        <div class="row">
          <div class="medium-9 columns">
            <!--- Get Field --->
           <label>Performance Measure</label>
           <cfinvoke component="knex.pm"
                      method="getField"
                      fieldname="pmID7"
                      nullOK="true"
                      selected="#getReportChart.pmID7#"
                      returnvariable="field">
            #field#
            <!---/ Get Field --->
          </div>
          <div class="medium-3 columns">
            <!--- label 7 --->
            <label>Label</label>
            <input type="text"
                   name="label7"
                   value="#getReportChart.label7#"
                   placeholder="Label"
                  maxlength="256">
            <!---/ label 7 --->
          </div>
        </div>
        <!---/ Series 7 --->
            
        <!--- Series 8 --->
        <div class="row">
          <div class="medium-12 columns">
              <hr>
              <h3>Series 8</h3>
          </div>
        </div>
        <div class="row">
          <div class="medium-9 columns">
            <!--- Get Field --->
           <label>Performance Measure</label>
           <cfinvoke component="knex.pm"
                      method="getField"
                      fieldname="pmID8"
                      nullOK="true"
                      selected="#getReportChart.pmID8#"
                      returnvariable="field">
            #field#
            <!---/ Get Field --->
          </div>
          <div class="medium-3 columns">
            <!--- label 8 --->
            <label>Label</label>
            <input type="text"
                   name="label8"
                   value="#getReportChart.label8#"
                   placeholder="Label"
                  maxlength="256">
            <!---/ label 8 --->
          </div>
        </div>
        <!---/ Series 8 ---> 
        
        <!--- Series 9 --->
        <div class="row">
          <div class="medium-12 columns">
              <hr>
              <h3>Series 9</h3>
          </div>
        </div>
        <div class="row">
          <div class="medium-9 columns">
            <!--- Get Field --->
           <label>Performance Measure</label>
           <cfinvoke component="knex.pm"
                      method="getField"
                      fieldname="pmID9"
                      nullOK="true"
                      selected="#getReportChart.pmID9#"
                      returnvariable="field">
            #field#
            <!---/ Get Field --->
          </div>
          <div class="medium-3 columns">
            <!--- label 9 --->
            <label>Label</label>
            <input type="text"
                   name="label9"
                   value="#getReportChart.label9#"
                   placeholder="Label"
                  maxlength="256">
            <!---/ label 9 --->
           </div>
        </div>  
            <!--- Series 10 --->
            <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 10</h3>
              </div>
            </div>
            <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID10"
                          nullOK="true"
                          selected="#getReportChart.pmID10#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label 10 --->
                <label>Label</label>
                <input type="text"
                       name="label10"
                       value="#getReportChart.label10#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ label 10 --->
              </div>
            </div>
            <!---/ Series 10 --->
                
            <!--- Series 11 --->
            <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 11</h3>
              </div>
            </div>
            <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID11"
                          nullOK="true"
                          selected="#getReportChart.pmID11#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label 11 --->
                <label>Label</label>
                <input type="text"
                       name="label11"
                       value="#getReportChart.label11#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ label 11 --->
              </div>
            </div>
            <!---/ Series 11 --->
                
            <!--- Series 12 --->
            <div class="row">
              <div class="medium-12 columns">
                  <hr>
                  <h3>Series 12</h3>
              </div>
            </div>
            <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID12"
                          nullOK="true"
                          selected="#getReportChart.pmID12#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label 12 --->
                <label>Label</label>
                <input type="text"
                       name="label12"
                       value="#getReportChart.label12#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ label 12 --->
              </div>
            </div>
            <!---/ Series 12 --->
                
            <!--- Series 13 --->
            <div class="row">
              <div class="medium-13 columns">
                  <hr>
                  <h3>Series 13</h3>
              </div>
            </div>
            <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID13"
                          nullOK="true"
                          selected="#getReportChart.pmID13#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label 13 --->
                <label>Label</label>
                <input type="text"
                       name="label13"
                       value="#getReportChart.label13#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ label 13 --->
              </div>
            </div>
            <!---/ Series 13 --->

            <!--- Series 14 --->
            <div class="row">
              <div class="medium-14 columns">
                  <hr>
                  <h3>Series 14</h3>
              </div>
            </div>
            <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID14"
                          nullOK="true"
                          selected="#getReportChart.pmID14#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label 14 --->
                <label>Label</label>
                <input type="text"
                       name="label14"
                       value="#getReportChart.label14#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ label 14 --->
              </div>
            </div>
            <!---/ Series 14 --->
            
            <!--- Series 15 --->
            <div class="row">
              <div class="medium-15 columns">
                  <hr>
                  <h3>Series 15</h3>
              </div>
            </div>
            <div class="row">
              <div class="medium-9 columns">
                <!--- Get Field --->
               <label>Performance Measure</label>
               <cfinvoke component="knex.pm"
                          method="getField"
                          fieldname="pmID15"
                          nullOK="true"
                          selected="#getReportChart.pmID15#"
                          returnvariable="field">
                #field#
                <!---/ Get Field --->
              </div>
              <div class="medium-3 columns">
                <!--- label 15 --->
                <label>Label</label>
                <input type="text"
                       name="label15"
                       value="#getReportChart.label15#"
                       placeholder="Label"
                      maxlength="256">
                <!---/ label 15 --->
              </div>
            </div>
            <!---/ Series 15 --->
<!---/ Series 9 ---> 
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.reportChart.cfm#" name="chartID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <input type="hidden" value="#SESSION.cocID#" name="cocID">
              <cfif URL.reportChart.cfm EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/  Profile Form --->
    </cfif>
    </div>
  </div>
</div>