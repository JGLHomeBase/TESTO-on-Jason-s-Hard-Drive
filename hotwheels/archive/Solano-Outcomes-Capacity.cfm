<cfoutput>
<div class="row">
	<div class="large-12 columns">
		<h2 class="MakePrimary"> 2) Outcomes </h2>
		<!--- Utilization Rates --->
	    	<h3 class="MakePrimary"> 2a) Capacity </h3>
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
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Jan_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Jan_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
						       		<tr>
						       			<td>April</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Apr_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Apr_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
						       		<tr>
						       			<td>July</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Jul_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Jul_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
						       		<tr>
						       			<td>October</td>
						       			<td>
						       			<cfif apr05_Total_ActualUnits NEQ 0>
						       				#NumberFormat((apr09_Oct_Total/apr05_Total_ActualUnits*100),"0.0")#%
						       			</cfif>
						       			(#apr09_Oct_Total# of #apr05_Total_ActualUnits#)</td>
						       		</tr>
					       		</tbody>
		       				</table>
		       			<!---/ Data Table --->
	</div>
</div>
</cfoutput>

<!--- Utilization Rates --->

