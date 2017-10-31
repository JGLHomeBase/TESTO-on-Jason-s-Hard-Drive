<cfoutput>
<div class="row">
	<div class="large-12 columns">
			<h3 class="MakePrimary">Historical Grant Expenditure</h3>
			<table width="100%">
				<tbody>

				    <tr>
				    	<td> <h3  class="MakePrimary">Year</h3></td>
				        <td> <h3  class="MakePrimary">Grant Amount</h3></td>
				        <td> <h3  class="MakePrimary">Grant Expended</h3></td>
				        <td> <h3  class="MakePrimary">Percentage Not Expended</h3></td>
				    </tr>
					<tr>
				        <td> <h3  class="MakePrimary">2013</h3></td>
				        <td>#LSCurrencyFormat(NumAns09)#</td>
				        <td>#LSCurrencyFormat(NumAns10)#</td>
				        <td>#NumberFormat(NumAns13,"0")#%</td>
				    </tr>
					<tr>
						<td> <h3  class="MakePrimary">2012</h3></td>
				        <td>#LSCurrencyFormat(NumAns07)#</td>
				        <td>#LSCurrencyFormat(NumAns08)#</td>
				        <td>#NumberFormat(NumAns12,"0")#%</td>
				    </tr>
					<tr>
				    	<td> <h3  class="MakePrimary">2011</h3></td>
				        <td>#LSCurrencyFormat(NumAns05)#</td>
				        <td>#LSCurrencyFormat(NumAns06)#</td>
				        <td>#NumberFormat(NumAns11,"0")#%</td>
				    </tr>
			    </body>
		    </table>
    </div>
</div>
</cfoutput>
				 