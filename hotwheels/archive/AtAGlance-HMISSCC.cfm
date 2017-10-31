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
				  
				    
				    <!--- Services Provided --->
				    <cfif ServicesProvided NEQ "">
					    <tr>
					        <td width="200"><strong>Services Provided</strong></td>
					        <td colspan="3">#ServicesProvided#</td>
					    </tr>
				    </cfif>
				    <!---/  Services Provided --->

				    

				   
				</tbody>
			</table>
	</div>
</div>
<!---/ Display --->

</cfoutput>
