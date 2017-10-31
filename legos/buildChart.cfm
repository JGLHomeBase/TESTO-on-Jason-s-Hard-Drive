<!--- Set Variables --->
<cfparam name="chart.project" default="#URL.project#">
<cfparam name="chart.apr" default="#URL.apr#">
<cfparam name="chart.width" default="100%">
<cfparam name="chart.height" default="100%">
<cfparam name="chart.xAxisTitle" default="">
<cfparam name="chart.yAxisTitle" default="">
<cfparam name="chart.showLegend" default="no">
<!---/ Set Variables --->

 <!--- Get Chart Info --->
<cfquery name="getChart">
    SELECT * FROM reportchart
    WHERE chartID = <cfqueryparam value="#chart.chartID#">
</cfquery>
<cfif getChart.showTitle EQ 0>
    <cfset getChart.chartTitle = "">
</cfif>
<!---/ Get Chart Info --->

<!--- Get Chart Data --->
<cfset series1Value = "">
<cfset series1ValueLabel = "">
    <!--- PM1 --->
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID1#"
                  returnvariable="pm">
        <!---/ Get Data  --->          
        <cfif getChart.label1  EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label1#">
        </cfif>
        <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    <!---/ PM1 --->
    <!--- PM2 --->
    <cfif getChart.pmID2 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID2#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label2 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label2#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM2 --->
    <!--- PM3 --->
    <cfif getChart.pmID3 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID3#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label3 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label3#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM3 --->    
    <!--- PM4 --->
    <cfif getChart.pmID4 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID4#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label4 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label4#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM4 --->
    <!--- PM5 --->
    <cfif getChart.pmID5 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID5#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label5 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label5#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM5 --->
    <!--- PM6 --->
    <cfif getChart.pmID6 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID6#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label6 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label6#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM6 --->
    <!--- PM7 --->
    <cfif getChart.pmID7 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID7#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label7 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label7#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM7 --->
    <!--- PM8 --->
    <cfif getChart.pmID8 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID8#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label8 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label8#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM8 --->
    <!--- PM9 --->
    <cfif getChart.pmID9 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID9#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label9 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label9#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM9 --->
    <!--- PM10 --->
    <cfif getChart.pmID10 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID10#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label10 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label10#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM10 --->
    <!--- PM11 --->
    <cfif getChart.pmID11 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID11#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label11 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label11#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM11 --->
    <!--- PM12 --->
    <cfif getChart.pmID12 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID12#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label12 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label12#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM12 --->
    <!--- PM13 --->
    <cfif getChart.pmID13 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID13#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label13 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label13#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM13 --->
    <!--- PM14 --->
    <cfif getChart.pmID14 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID14#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label14 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label14#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM14 --->
    <!--- PM15 --->
    <cfif getChart.pmID15 NEQ 0>
        <!--- Get Data  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="#getChart.pmID15#"
                  returnvariable="pm">
        <!---/ Get Data  --->
        <cfif getChart.label15 EQ "">
            <cfset label = "#pm.pmName#">
        <cfelse>
            <cfset label = "#getChart.label15#">
        </cfif>
         <cfif pm.value NEQ 0 OR getChart.showZeros EQ 1>
            <cfset series1Value = ListAppend(series1Value, pm.value)>
            <cfset series1ValueLabel = ListAppend(series1ValueLabel, "'#JSStringFormat(label)#'")>
        </cfif>
    </cfif>
    <!---/ PM15 --->
<!---/ Get Chart Data --->
<cfset chartTitle = "">
<cfif getChart.chartTitle NEQ "">
    <cfsavecontent variable="chartTitle">
        title:{
            display:true,
            fontFamily:"'Lato',  'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif",
            text:'<cfoutput>#JSStringFormat(getChart.chartTitle)#</cfoutput>'
        },
    </cfsavecontent>
</cfif>
<cfset chartType = "bar">
<cfsavecontent variable = "chartLegend">
    legend: {
        display:false
            },
</cfsavecontent>
<cfsavecontent variable = "chartScales">
scales: {
        yAxes: [{
            ticks: {
                beginAtZero:true
            }
        }]
    },
</cfsavecontent>
<cfset chartBKG = "backgroundColor: '##0073C4'">
<cfsavecontent variable = "chartBKGColorful">
    backgroundColor: ["#0073C4",
        "#7BD8FF",
        "#FF6384",
        "#FFCE56",
        "#FFFF9D",
        "#BEEB9F",
        "#00A388",
        "#685C79"
    ],
    hoverBackgroundColor: [
        "#0073C4",
        "#7BD8FF",
        "##FF6384",
        "#FFCE56",
        "#FFFF9D",
        "#BEEB9F",
        "#00A388",
        "#685C79"
    ]
</cfsavecontent>
<cfif getChart.chartType EQ "pie">
    <cfset chartType = "doughnut">
    <cfset chartLegend = "">
    <cfset chartScales = "">
    <cfset chartBKG = chartBKGColorful>
</cfif>
<!--- Create Chart --->
<cfoutput>
    <canvas id="daChart#chart.chartID#" width="#chart.width#" height="#chart.height#"></canvas>
    <script>
        var ctx = document.getElementById("daChart#chart.chartID#");
        var myChart = new Chart(ctx, {
            type: '#chartType#',
            data: {
                labels: [#series1ValueLabel#],
                datasets: [
                         {
                         label: "test",
                         data: [#series1Value#],
                         #chartBKG#
                         }
                            ]
            },
            options: {
                #chartLegend##chartScales##chartTitle#defaultFontFamily:"'Open Sans',  'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif", responsive:false, maintainAspectRatio: false, animation: false
            }
        });    
    </script>
</cfoutput>
<!---/ Create Chart --->