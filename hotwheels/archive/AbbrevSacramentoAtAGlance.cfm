<cfoutput>

<!--- Display --->
<div class="row">
	<div class="large-12 columns">
			<h2  class="MakePrimary">Program at a Glance</h2>
			<table width="100%">
				<tbody>
				    <!--- Project Type --->
				    <tr>
				        <td width="200"><strong>Funding Category</strong></td>
				        <td colspan="3">#projectComponentLongName#</td>
				    </tr>
				    <!---/ Project Type --->
				    <!--- Total Project Budget --->
				    <tr>
				        <td width="200"><strong>Total Project Budget</strong></td>
				        <td colspan="3">#LSCurrencyFormat(NumAns02, "local")#</td>
				    </tr>
				    <!---/ Total Project Budget --->
				   
				    <!--- Amount of Grant --->
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong> 
				        <td width="300">#LSCurrencyFormat(NumAns04)#
				    	</td>
				        <td width="100">Expended
				    	</td>
				        <td >#LongAns13#
				        	
				    	</td>
				    </tr>
				    <!---/ Amount of Grant --->
				   
				</tbody>
			</table>
	</div>
</div>
<!---/ Display --->

</cfoutput>
