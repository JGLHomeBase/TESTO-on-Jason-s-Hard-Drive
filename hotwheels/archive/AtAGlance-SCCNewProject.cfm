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
				  
				    <!--- Population Served --->
				    <cfif popServed NEQ "">
				    	<tr>
					        <td width="200"><strong>Population Served</strong></td>
					        <td colspan="3">#popServed#</td>
					    </tr>
				    </cfif>
				    <!---/ Population Served --->


				    <!--- Services Provided --->
				    <cfif ServicesProvided NEQ "">
					    <tr>
					        <td width="200"><strong>Services Provided</strong></td>
					        <td colspan="3">#ServicesProvided#</td>
					    </tr>
				    </cfif>
				    <!---/  Services Provided --->

				    <!--- Venues for Service --->
				    <cfif HousingProvided NEQ "">
				    <tr>
							<td width="200"><strong>Venue(s) for Service</strong></td>
					        <td colspan="3">#VenuesForService#</td>
				    </tr>
				    </cfif>
				    <!---/  Venues for Service --->

				   
				</tbody>
			</table>
	</div>
</div>
<!---/ Display --->

</cfoutput>
