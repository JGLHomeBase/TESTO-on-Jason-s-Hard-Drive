<cfoutput>
<div class="row">
	<div class="large-12 columns">
			<h3  class="MakePrimary">2d) Mainstream Benefits</h3>
			<table width="100%">
				<thead>
					<th>Number of Non-Cash Benefit Sources</th>
					<th>Percent of Adults</th>
				</thead>
				<tbody>
				    <tr>
				    	<td> No Source</td>
				        <td>#(apr26Stayers_NoSources_Adult+apr26Leavers_NoSources_Adult)# of #apr08_Adult_Total# (#numberFormat((apr26Stayers_NoSources_Adult+apr26Leavers_NoSources_Adult)/apr08_Adult_Total*100, "0")#)</td>
				    </tr>
				    </tr>
				    <tr>
				    	<td>1 or More Sources</td>
				        <td>#(apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult)# of #apr08_Adult_Total# (#numberFormat((apr26Leavers_1Plus_Adult+apr26Stayers_1Plus_Adult)/apr08_Adult_Total*100, "0")#)</td>
				    </tr>
				    <tr>
				    	<td>Don't Know or Refused</td>
				        <td>#(apr26Leavers_DKR_Total+apr26Stayers_DKR_Adult)# of #apr08_Adult_Total# (#numberFormat((apr26Leavers_DKR_Total+apr26Stayers_DKR_Adult)/apr08_Adult_Total*100, "0")#)</td>
				    </tr>
				    <tr>
				    	<td>Missing Information</td>
				        <td>#(apr26Leavers_Missing_Adult+apr26Stayers_Missing_Adult)# of #apr08_Adult_Total# (#numberFormat((apr26Leavers_Missing_Adult+apr26Stayers_Missing_Adult)/apr08_Adult_Total*100, "0")#)</td>
				    </tr>
			    </body>
		    </table>
    </div>
</div>



<div class="row">
	<div class="large-12 columns">
			<h3  class="MakePrimary">2e) Employed at Exit or Follow Up</h3>
			<table width="100%">
				<p>#NumberFormat(NumberAdultsHadEmployment,"0")# of #apr08_Adult_Total# (#NumberFormat(PercAdultsHadEmployment*100,"0")#%) adult participants had employment income.</p>
			</table>
    </div>
</div>
</cfoutput>




