<!--- Variables --->
<cfparam name="URL.APR" default="0">
<cfparam name="URL.type" default="0">
<cfparam name="URL.who" default="0">
<cfparam name="URL.what" default="0">
<cfparam name="URL.whaa" default="0">
<cfparam name="URL.viz" default="bar">
<cfparam name="URL.group" default="project">
<!---/ Variables --->


<cfif URL.who NEQ 0 AND URL.what NEQ 0>
        <!--- Get Results --->
        <cfquery name="getMeasure1">
            SELECT pmName, sourceField
            FROM performmeasure
            WHERE pmID = <cfqueryparam value="#URL.what#">
        </cfquery>
        <cfquery name="getMeasure2">
            SELECT pmName, sourceField
            FROM performmeasure
            WHERE pmID = <cfqueryparam value="#URL.whaa#">
        </cfquery>
        <cfquery name="getTableList">
            SELECT APRQuestion, tableName, TableID FROM tables WHERE projectData = '1' AND APRQuestion <> '0'
        </cfquery>
            
        <cfquery name="dump">
        SELECT 
            #toString(getMeasure1.sourceField)# AS measure1,
            <cfif URL.whaa NEQ 0>
            #toString(getMeasure2.sourceField)# AS measure2,
            </cfif>
            agency.agencyName,
            projectcomponent.projectComponentName,
            projects.projectLongName,
            projects.projectName,
            projects.projectID
        FROM projects
            INNER JOIN coc on projects.cocID = coc.cocID AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
            INNER JOIN  agency ON projects.agencyID = agency.agencyID AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
                <cfif URL.type NEQ 0>
                    AND projects.projectComponentID = <cfqueryparam value="#URL.type#">    
                </cfif>
            <cfloop query="getTableList">
            LEFT JOIN  dataapr#NumberFormat(getTableList.APRQuestion,"00")# ON projects.projectID = dataapr#NumberFormat(getTableList.APRQuestion,"00")#.projectID AND dataapr#NumberFormat(getTableList.APRQuestion,"00")#.aprID = <cfqueryparam value="#URL.apr#">
            </cfloop>
            LEFT JOIN datarfi ON projects.projectID = datarfi.projectID AND datarfi.aprID = <cfqueryparam value="#apr#">
            WHERE projects.active = '1'
                <cfif SESSION.agencyID NEQ 0>
                AND projects.agencyID = <cfqueryparam value="#SESSION.agencyID#">
                </cfif>
            ORDER BY measure1 DESC
        </cfquery>
        <!---/ Get Results --->
             
        <cfquery name="getPM1">
        SELECT pmID, pmLongName, pmName, formatType, pmDesc
        FROM performmeasure
        WHERE pmID = <cfqueryparam value="#URL.what#">
        </cfquery>
        <!--- PM 1 Statistics --->
        <cfset pm1List = ValueList(dump.measure1)>
        <cfset pm1AVG = ArrayAvg(ListToArray(pm1List))>
        <cfset pm1Sum = ArraySum(ListToArray(pm1List))>
        <cfset pm1List = ListSort(pm1List,"numeric")>
        <cfset pm1Min = ListFirst(pm1List)>
        <cfif pm1Min EQ ""><cfset pm1Min = 0></cfif>
        <cfset pm1Max = ListLast(pm1List)>
        <cfif pm1Max EQ ""><cfset pm1Max = 0></cfif>
        <cfset pm1Range = pm1Max-pm1Min>
        <cfset pm1StDivCount = 0>
        <cfset pm1StDivTotal = 0>
        <cfloop query="dump">
            <cfif dump.measure1 NEQ "">
                <cfset StDivRow = (dump.measure1-pm1AVG)>
                <cfset StDivRow = (StDivRow*StDivRow)>
                <cfset pm1StDivTotal = pm1StDivTotal+StDivRow>
                <cfset pm1StDivCount = pm1StDivCount+1>
            </cfif>
        </cfloop>
        <cfif  (pm1StDivCount-1) NEQ 0>
         <cfset pm1StdDiv = (pm1StDivTotal/(pm1StDivCount-1))>
        <cfelse>
            <cfset pm1StdDiv = 0>
        </cfif>
        <cfset pm1StdDiv = sqr(pm1StdDiv)>
        <!---/ PM 1 Statistics --->
        
        <cfif URL.whaa NEQ 0>
            <cfquery name="getPM2">
            SELECT pmID, pmLongName, pmName, formatType, pmDesc
            FROM performmeasure
            WHERE pmID = <cfqueryparam value="#URL.whaa#">
            </cfquery>
            <!--- PM 2 Statistics --->
            <cfset pm2List = ValueList(dump.measure2)>
            <cfset pm2AVG = ArrayAvg(ListToArray(pm2List))>
            <cfset pm2Sum = ArraySum(ListToArray(pm2List))>
            <cfset pm2List = ListSort(pm2List,"numeric")>
            <cfset pm2Min = ListFirst(pm2List)>
            <cfif pm2Min EQ ""><cfset pm2Min = 0></cfif>
            <cfset pm2Max = ListLast(pm2List)>
            <cfif pm2Max EQ ""><cfset pm2Max = 0></cfif>
            <cfset pm2Range = pm2Max-pm2Min>
            <cfset pm2StDivCount = 0>
            <cfset pm2StDivTotal = 0>
            <cfloop query="dump">
                <cfif dump.measure2 NEQ "">
                    <cfset StDivRow = (dump.measure2-pm2AVG)>
                    <cfset StDivRow = (StDivRow*StDivRow)>
                    <cfset pm2StDivTotal = pm2StDivTotal+StDivRow>
                    <cfset pm2StDivCount = pm2StDivCount+1>
                </cfif>
            </cfloop>
            <cfif  (pm2StDivCount-1) NEQ 0>
             <cfset pm2StdDiv = (pm2StDivTotal/(pm2StDivCount-1))>
            <cfelse>
                <cfset pm2StdDiv = 0>
            </cfif>
            <cfset pm2StdDiv = sqr(pm2StdDiv)>
            <!---/ PM 2 Statistics --->
        </cfif>
        
            
        <div class="row">
            <div class="large-12 columns">
                <h1>
                    <cfoutput>Results:
                        <span data-tooltip aria-haspopup="true" class="has-tip" title="#getPM1.pmLongName# | #getPM1.pmDesc#">#getPM1.pmLongName#</span>
                    <cfif URL.whaa NEQ 0>
                        <i>compared to</i>
                            <span data-tooltip aria-haspopup="true" class="has-tip" title="#getPM2.pmLongName# | #getPM2.pmDesc#">#getPM2.pmLongName#</span>
                    </cfif>
                    </cfoutput>
                </h1>
            </div>    
        </div>
        <!--- Chart --->
        <cfif URL.viz EQ "bar">
            <div class="row">
                <div class="large-12 columns">
                    <canvas id="daChart" width="100%" height="25%"></canvas>
                    <!--- Prep Data for Chart --->
                        <!---- Get Data --->
                        <cfquery name="getGroup">
                            SELECT pmGroupLongName from performgroup WHERE pmGroupID = <cfqueryparam value="#URL.who#">
                        </cfquery>
                        <cfquery name="getData">
                            SELECT projectComponentLongName from projectcomponent WHERE projectComponentID = <cfqueryparam value="#URL.type#">
                        </cfquery>
                        <!----/ Get Data --->
                        <!--- Format Data --->
                        <cfset series1Value = "">
                        <cfset series1ValueLabel = "">
                        <cfloop query="dump">
                            <cfif dump.measure1 NEQ "">
                                <cfset series1Value = ListAppend(series1Value, NumberFormat(dump.measure1,0.00))>
                                <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(dump.projectName)#'")>
                            </cfif>
                        </cfloop>
                        <cfset yAxisLabel = JSStringFormat(getGroup.pmGroupLongName)>
                        <cfset series1Label = JSStringFormat(getPM1.pmLongName)>
                        <cfset series1Average = NumberFormat(pm1AVG,0.00)>
                        <!--- Format Data --->
                        
                        <!--- Series 2 --->
                        <cfif URL.whaa NEQ 0>
                            <cfset series2Value = "">
                            <cfset series2ValueLabel = "">
                            <cfloop query="dump">
                                <cfif dump.measure2 NEQ "">
                                    <cfset series2Value = ListAppend(series2Value, NumberFormat(dump.measure2,0.00))>
                                    <cfset series2ValueLabel = ListAppend(series2ValueLabel, "'#JSStringFormat(dump.projectName)#'")>
                                </cfif>
                            </cfloop>
                            <cfset series2Label = JSStringFormat(getPM2.pmLongName)>
                            <cfset series2Average = NumberFormat(pm2AVG,0.00)>
                        </cfif>
                        <!---/ Series 2 --->
                    <!---/ Prep Data for Chart --->
                    <!--- Create Chart --->
                    <cfoutput>
                        <script>
                            var ctx = document.getElementById("daChart");
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: [#series1ValueLabel#<cfif URL.whaa NEQ 0>,#series2ValueLabel#</cfif>],
                                    datasets: [
                                             {
                                             label: '#series1Label#',
                                             data: [#series1Value#],
                                             backgroundColor: '##0073C4'
                                             }
                                             <cfif URL.whaa NEQ 0>
                                             ,{
                                             label: '#series2Label#',
                                             data: [#series2Value#],
                                             backgroundColor: '##7BD8FF'
                                             }
                                             </cfif>
                                                ]
                                },
                                options: {
                                    defaultFontFamily:"'Open Sans',  'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif",
                                    scales: {
                                        yAxes: [{
                                            ticks: {
                                                beginAtZero:true
                                            }
                                        }]
                                    }
                                }
                            });    
                        </script>
                    </cfoutput>
                    <!---/ Create Chart --->
                </div>    
            </div>   
        </cfif>
        <!---/ Chart --->
        <div class="row">
            <div class="large-12 columns">
                <table width="100%">
                    <thead>
                        <th>Project</th>
                        <th>Agency</th>
                        <th>Component</th>
                        <th><cfoutput>
                            <span data-tooltip aria-haspopup="true" class="has-tip" title="#getPM1.pmLongName# | #getPM1.pmDesc#">#getPM1.pmLongName#</span>
                            </cfoutput></th>
                        <cfif URL.whaa NEQ 0>
                            <th><cfoutput>
                            <span data-tooltip aria-haspopup="true" class="has-tip" title="#getPM2.pmLongName# | #getPM2.pmDesc#">#getPM2.pmLongName#</span>
                            </cfoutput></th>
                        </cfif>
                    </thead>
                    <tbody>
                        <cfoutput><cfloop query="dump">
                            <cfif dump.measure1 NEQ ""> 
                                
                                <tr class="tableHighlight">
                                    <td>#dump.projectLongName#</td>
                                    <td>#dump.agencyName#</td>
                                    <td>#dump.projectComponentName#</td>
                                    <td>
                                        <cfif getPM1.formatType EQ "percent">
                                            #NumberFormat(dump.measure1,"0.0")#&##37;
                                        <cfelseif getPM1.formatType EQ "money">
                                            #LSCurrencyFormat(dump.measure1)#
                                        <cfelseif getPM1.formatType EQ "number">
                                            #NumberFormat(dump.measure1,",.00")#
                                        <cfelse>
                                            #dump.measure1#
                                        </cfif>
                                    </td>
                                    <cfif URL.whaa NEQ 0>
                                        <td>
                                        <cfif getPM2.formatType EQ "percent">
                                            #NumberFormat(dump.measure2,"0.0")#&##37;
                                        <cfelseif getPM2.formatType EQ "money">
                                            #LSCurrencyFormat(dump.measure2)#
                                        <cfelseif getPM2.formatType EQ "number">
                                            #NumberFormat(dump.measure2,",.00")#
                                        <cfelse>
                                            #dump.measure2#
                                        </cfif>
                                    </td>
                                    </cfif>
                                </tr>
                            </cfif>
                        </cfloop></cfoutput>
                    </tbody>
                    <tfoot>
                        <cfoutput>
                            <!--- Range --->
                            <tr>
                                <td colspan="3" class="text-right"><i>Range</i></td>
                                <!--- Range: PM 1 --->
                                <td>
                                    <cfif getPM1.formatType EQ "percent">
                                        #NumberFormat(pm1Range,",.00")#&##37; (#NumberFormat(pm1Min,",.00")#&##37; - #NumberFormat(pm1Max,",.00")#&##37;)
                                    <cfelseif getPM1.formatType EQ "money">
                                        #LSCurrencyFormat(pm1Range)# (#LSCurrencyFormat(pm1Min)# - #LSCurrencyFormat(pm1Max)#)
                                    <cfelse>
                                        #NumberFormat(pm1Range,",.00")# (#NumberFormat(pm1Min,",.00")# - #NumberFormat(pm1Max,",.00")#)
                                    </cfif>
                                </td>
                                <!---/ Range: PM 1 --->
                                <!--- Range: PM 2 --->
                                <cfif URL.whaa NEQ 0>
                                    <td>
                                        <cfif getPM2.formatType EQ "percent">
                                            #NumberFormat(pm2Range,",.00")#&##37; (#NumberFormat(pm2Min,",.00")#&##37; - #NumberFormat(pm2Max,",.00")#&##37;)
                                        <cfelseif getPM2.formatType EQ "money">
                                            #LSCurrencyFormat(pm2Range)# (#LSCurrencyFormat(pm2Min)# - #LSCurrencyFormat(pm2Max)#)
                                        <cfelse>
                                            #NumberFormat(pm2Range,",.00")# (#NumberFormat(pm2Min,",.00")# - #NumberFormat(pm2Max,",.00")#)
                                        </cfif>
                                    </td>
                                </cfif>
                                <!---/ Range: PM 2 --->
                            </tr>
                            <!---/ Range --->
                            
                            <!--- Average --->
                            <tr>
                                <td colspan="3" class="text-right"><i>Average (Mean)</i></td>
                                <!--- Average: PM1 --->
                                <td>
                                    <cfif getPM1.formatType EQ "percent">
                                        #NumberFormat(pm1AVG,",.00")#&##37;
                                    <cfelseif getPM1.formatType EQ "money">
                                        #LSCurrencyFormat(pm1AVG)#
                                    <cfelse>
                                        #NumberFormat(pm1AVG,",.00")#
                                    </cfif>
                                </td>
                                <!---/ Average: PM1 --->
                                
                                <cfif URL.whaa NEQ 0>
                                    <!--- Average: PM2 --->
                                    <td>
                                        <cfif getPM2.formatType EQ "percent">
                                            #NumberFormat(pm2AVG,",.00")#&##37;
                                        <cfelseif getPM2.formatType EQ "money">
                                            #LSCurrencyFormat(pm2AVG)#
                                        <cfelse>
                                            #NumberFormat(pm2AVG,",.00")#
                                        </cfif>
                                    </td>
                                    <!---/ Average: PM2 --->
                                </cfif>
                            </tr>
                            <!---/ Average --->
                            <!--- Standard Deviation --->
                            <tr>
                                <td colspan="3" class="text-right"><i>Standard Deviation</i></td>
                                <!--- Standard Deviation: PM1 --->
                                <td>
                                    <cfif getPM1.formatType EQ "percent">
                                        #NumberFormat(pm1StdDiv,",.00")#&##37;
                                    <cfelseif getPM1.formatType EQ "money">
                                        #LSCurrencyFormat(pm1StdDiv)#
                                    <cfelse>
                                        #NumberFormat(pm1StdDiv,",.00")#
                                    </cfif>
                                </td>
                                <!---/ Standard Deviation: PM1 --->
                                <cfif URL.whaa NEQ 0>
                                    <!---/ Standard Deviation: PM2 --->
                                    <td>
                                        <cfif getPM2.formatType EQ "percent">
                                            #NumberFormat(pm2StdDiv,",.00")#&##37;
                                        <cfelseif getPM2.formatType EQ "money">
                                            #LSCurrencyFormat(pm2StdDiv)#
                                        <cfelse>
                                            #NumberFormat(pm2StdDiv,",.00")#
                                        </cfif>
                                    </td>
                                    <!---/ Standard Deviation: PM2 --->
                                </cfif>
                            </tr>
                            <!---/ Standard Deviation --->

                            <!--- Sum --->
                            <tr>
                                <td colspan="3" class="text-right"><i>Total</i></td>
                                <!--- Sum: PM1 --->
                                <td>
                                    <cfif getPM1.formatType EQ "percent">
                                        Not Available
                                    <cfelseif getPM1.formatType EQ "money">
                                        #LSCurrencyFormat(pm1Sum)#
                                    <cfelse>
                                        #NumberFormat(pm1Sum,",.00")#
                                    </cfif>
                                </td>
                                <!---/ Sum: PM1 --->
                                <cfif URL.whaa NEQ 0>
                                    <!---/ Sum: PM2 --->
                                    <td>
                                        <cfif getPM2.formatType EQ "percent">
                                            Not Available
                                        <cfelseif getPM2.formatType EQ "money">
                                            #LSCurrencyFormat(pm2Sum)#
                                        <cfelse>
                                            #NumberFormat(pm2Sum,",.00")#
                                        </cfif>
                                    </td>
                                    <!---/ Sum: PM2 --->
                                </cfif>
                            </tr>
                            <!---/ Sum --->                                        
                                        
                        </cfoutput>
                    </tfoot>
                </table>
            </div>            
        </div>
        <cfif URL.action EQ "excel">
            <!--- Download File --->
                <!--- Set Vars --->
                <cfset theDir = GetDirectoryFromPath(expandPath("#AbsoluteURL#files/"))>
                <cfset Ahora = Now()>
                <cfset theFilename = "#DateFormat(Ahora,"YYYY-MM-DD")#-#SESSION.userFirst#.xls">
                <cfset theFile = theDir & theFilename>
                <!---/ Set Vars --->

                <!--- Create Spreadsheet --->
                <cfscript> 
                    //Create  empty  spreadsheet ---> 
                    TheBridget = SpreadsheetNew(); 
                </cfscript>
                <!---/ Create Spreadsheet --->
                                
                <!--- Create Headings --->
                <cfif URL.whaa EQ 0>
                    <cfset RowPayload = "Project, Agency, Program Component, #getPM1.pmName#">
                <cfelse>
                    <cfset RowPayload = "Project, Agency, Program Component, #getPM1.pmName#, #getPM2.pmName#">
                </cfif>
                
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                <cfloop query="dump">
                     <cfif URL.whaa EQ 0>
                        <cfset RowPayload = "#dump.projectLongName#, #dump.agencyName#, #dump.projectComponentName#, #dump.measure1#">
                    <cfelse>
                        <cfset RowPayload = "#dump.projectLongName#, #dump.agencyName#, #dump.projectComponentName#,  #dump.measure1#,  #dump.measure2#">
                    </cfif>
                    <cfscript> 
                      SpreadsheetAddRow(TheBridget,"#RowPayload#");
                    </cfscript>
                </cfloop>
                <cfscript> 
                  HeaderFormat = StructNew();
                  HeaderFormat.bold="true";
                  HeaderFormat.bottomborder="thick";
                  HeaderFormat.bottombordercolor="blue_grey";
                  HeaderFormat.fgcolor="grey_25_percent";
                  HeaderFormat.textwrap="true";
                  HeaderFormat.fontsize="10";
                  BoldCol = StructNew();
                  BoldCol.bold="true";
                  SpreadsheetFormatColumn(TheBridget,BoldCol,"1");
                  SpreadsheetFormatRow(TheBridget,HeaderFormat,"1");
                  SpreadsheetSetRowHeight(TheBridget,"1","50");
                  SpreadSheetAddFreezePane(TheBridget,1,1);
                </cfscript>
                <!---/ Create Headings --->
               <!---/ Loop Through Each Question --->
                <cfif URL.whaa EQ 0>
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = "">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Range:, #pm1Range#,">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Average (Mean):, #pm1AVG#,">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Standard Deviation:, #pm1StdDiv#,">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Total (Sum):, #pm1Sum#,">
                <cfelse>
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = "">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Range:, #pm1Range#, #pm2Range#">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Average (Mean):, #pm1AVG#, #pm2AVG#">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Standard Deviation:, #pm1StdDiv#, #pm2StdDiv#">
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>
                    <cfset RowPayload = ", , Total (Sum):, #pm1Sum#, #pm2Sum#">
                </cfif>
                <cfscript> 
                  SpreadsheetAddRow(TheBridget,"#RowPayload#");
                </cfscript>                            
              <cfspreadsheet action="write" filename="#theFile#" name="TheBridget" overwrite="true">
              <cflocation url="#AbsoluteURL#files/#theFilename#">
              <!---/ Make Spreadsheet --->
            <!--- Download File --->
        </cfif>
<cfelse>
    <div class="row">
            <div class="large-12 columns">
                <div class="text-center">
                    <cfoutput>
                        <h2>No Results</h2>
                    </cfoutput>
                </div>
            </div>
        </div>
</cfif>