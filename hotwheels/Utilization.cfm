<cfoutput>
<!--- Get Total Actual Units  --->
<cfinvoke component="knex.pm"
          method="getProject"
          apr="#URL.apr#"
          project="#URL.project#"
          pm="304"
          returnvariable="pm">
<!---/ Get Total Actual Units  --->                                            
<cfif pm.value NEQ 0>
<div class="row">
	<div class="large-12 columns">
        <!--- Get Average Utilization  --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="268"
                  returnvariable="pm">
        <!---/ Get Average Utilization  ---> 
        <p> The average unit occupancy rate for this program is #pm.tiplink#.</p>
		    	<cfchart  
				    chartHeight = "300" 
				    chartWidth = "975" 
				    font = "Lato" 
				    fontBold = "no" 
				    fontItalic = "no" 
				    fontSize = "11" 
				    format = "html" 
				    gridlines = "5" 
				    showBorder = "yes" 
				    showLegend = "no" 
				    showMarkers = "yes" 
				    showXGridlines = "yes"
				    showYGridlines = "no" 
				    sortXAxis = "no" 
				    tipStyle = "MouseOver"
				    title = "Point in time unit utilization rate on the last Wednesday of:"> 
				    <cfchartseries 
					    type="bar"
					    seriesLabel="Persons Served">
					    <cfchartdata item="January" value="#apr09_Jan_Total#">
				    	<cfchartdata item="April" value="#apr09_Apr_Total#">
			    		<cfchartdata item="July" value="#apr09_Jul_Total#">
			    		<cfchartdata item="October" value="#apr09_Oct_Total#">
					</cfchartseries>
					<cfchartseries 
					    type="line"
					    seriesLabel="Capacity">
					    <cfchartdata item="January" value="#apr05_Total_ActualUnits#">
				    	<cfchartdata item="April" value="#apr05_Total_ActualUnits#">
			    		<cfchartdata item="July" value="#apr05_Total_ActualUnits#">
			    		<cfchartdata item="October" value="#apr05_Total_ActualUnits#">
					</cfchartseries>
				</cfchart>



		       			<!--- Data Table --->
		       				<table width="100%">
					       		<tbody>
						       		<tr>
						       			<td>January</td>
						       			<td>
                                        <!--- Get JanUtilization  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="260"
                                                  returnvariable="pm">
                                        <!---/ Get JanUtilization  --->
						       			#pm.tiplink#
                                        <!--- Get JanHouseholds  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="261"
                                                  returnvariable="pm">
                                        <!---/ Get JanHouseholds  --->                                            
						       			(#pm.tiplink# of 
                                        <!--- Get Total Actual Units  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="304"
                                                  returnvariable="pm">
                                        <!---/ Get Total Actual Units  --->                                             
                                        #pm.tiplink#)</td>
						       		</tr>
						       		<tr>
						       			<td>April</td>
						       			<td>
                                        <!--- Get AprUtilization  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="262"
                                                  returnvariable="pm">
                                        <!---/ Get AprUtilization  --->                                            
						       			#pm.tiplink#
                                        <!--- Get AprHouseholds  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="263"
                                                  returnvariable="pm">
                                        <!---/ Get AprHouseholds  --->                                               
						       			(#pm.tiplink# of 
                                        <!--- Get Total Actual Units  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="304"
                                                  returnvariable="pm">
                                        <!---/ Get Total Actual Units  --->                                             
                                        #pm.tiplink#)</td>
						       		</tr>
						       		<tr>
						       			<td>July</td>
						       			<td>
                                        <!--- Get JulUtilization  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="264"
                                                  returnvariable="pm">
                                        <!---/ Get JulUtilization  --->                                                                  
						       			#pm.tiplink#
                                        <!--- Get JulHouseholds  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="265"
                                                  returnvariable="pm">
                                        <!---/ Get JulHouseholds  --->                                              
						       			(#pm.tiplink# of 
                                        <!--- Get Total Actual Units  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="304"
                                                  returnvariable="pm">
                                        <!---/ Get Total Actual Units  --->                                             
                                        #pm.tiplink#)</td>
						       		</tr>
						       		<tr>
						       			<td>October</td>
						       			<td> 
                                        <!--- Get OctUtilization  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="266"
                                                  returnvariable="pm">
                                        <!---/ Get OctUtilization  --->                                  
						       			#pm.tiplink#
                                        <!--- Get OctHouseholds  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="267"
                                                  returnvariable="pm">
                                        <!---/ Get OctHouseholds  --->                                               
						       			(#pm.tiplink# of 
                                        <!--- Get Total Actual Units  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="304"
                                                  returnvariable="pm">
                                        <!---/ Get Total Actual Units  --->                                             
                                        #pm.tiplink#)</td>
						       		</tr>
					       		</tbody>
		       				</table>
		       			<!---/ Data Table --->
	</div>
</div>
</cfif>
</cfoutput>