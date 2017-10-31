<cfoutput>
<div class="row">
	<div class="large-12 columns">
			<h2  class="MakePrimary">3) Budget</h2>
			<table width="100%">
				<tbody>
				    <!--- Budget attached --->
				    <tr>
				        <td> <h3  class="MakePrimary">3a) Budget Clarity</h3></td>
				        <td width="200">
                            <cfif ShortAns01 NEQ "">
                            <a href="#ShortAns01#" target="_blank">See attached budget</a>
                            </cfif>
                        </td>
				    </tr>
				    <!---/ Budget Attached --->
				    <!--- Draw Down --->
				    <tr>
				    	<td> <h3  class="MakePrimary">3b) Percent of Grant Drawn Down During Last Operational Year</h3></td>
				        <td>#NumberFormat(GrantExpendPercent,"0")#%</td>
				    </tr>
				    <!---/ Draw Down --->
			    </body>
		    </table>
    </div>
</div>
</cfoutput>
				    

