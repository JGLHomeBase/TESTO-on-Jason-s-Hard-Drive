<cfoutput>
<!--- Name and Location --->
	<div class="row">
		<div class="large-12 columns">
			<h1 class="MakePrimary">|ProjectLongName| (|ProjectComponentName|)</h1>
			<h2 class="MakeSecondary">|AgencyLongName|</h2>
			<p>
				<cfif ProjectStreet1 NEQ "">
					|ProjectAddress1|<br>
				</cfif>
				<cfif ProjectStreet2 NEQ "">
					|ProjectAddress2|<br>
				</cfif>
				<cfif ProjectHood  NEQ "">
					|ProjectNeighborhood|<br>
				</cfif>
			</p>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<hr>
		</div>
	</div>
<!---/ Name and Location --->	

<!--- Project Overview --->	
	<cfif ProjectOverview NEQ "">
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Project Overview</h2>
			<p>|ProjectOverview|</p>
			<hr>
		</div>
	</div>
	</cfif>
<!---/ Project Overview --->	

<!--- Project Location --->
	<cfif GEOCODELOCATION NEQ "none">
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Project Location</h2>
			<table width="100%">
				<tr>
					<td width="50%">
						<a href="https://maps.google.com/?q=|GeoCode|" target="_blank">
							<img src="//maps.googleapis.com/maps/api/staticmap?size=475x250&markers=%7Ccolor:0x6ECDDC%7C|GeoCode|&sensor=false&visual_refresh=true&scale=2&zoom=15&key=|GoogleAPIKey|" 
								 border="1px" width="475" height="250"/>
						</a>
					</td>
					<td width="50%">
						<cfparam name="HideStreetView" default="0">
						<cfif HideStreetView EQ 1>
							<img src="img/NoImage.png" alt="No Image Available" >
						<cfelse>
							<img src="//maps.googleapis.com/maps/api/streetview?size=475x255&location=|GeoCode|&sensor=false&key=|GoogleAPIKey|<cfif ProjectGeoHeading NEQ "">&heading=|GeoHeading|</cfif>" 
							 border="1px" width="475" height="250"/>
						</cfif>
						
					</td>
				</tr>
			</table>
			<hr>
		</div>
	</div>
	</cfif>
<!---/ Project Location --->	

<!--- At A Glance --->
<div class="row">
	<div class="large-12 columns">
			<h2  class="MakePrimary">Program at a Glance</h2>
			<table width="100%">
				<tbody>
				    <!--- Project Type --->
				    <tr>
				        <td width="200"><strong>Funding Category</strong></td>
				        <td colspan="3">|ProjectComponentLongName|</td>
				    </tr>
				    <!---/ Project Type --->
				    <!--- Total Project Budget --->
				    <tr>
				        <td width="200"><strong>Total Project Budget</strong></td>
				        <td colspan="3">|NumAns2|</td>
				    </tr>
				    <!---/ Total Project Budget --->
				   
				    <!--- Amount of Grant --->
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong> 
				        <td width="300">|ContractAmount|
				    	</td>
				    </tr>
				    <!---/ Amount of Grant --->
				    
				</tbody>
			</table>
	</div>
</div>
<!---/ At a Glance --->

<!--- No Project Data --->
	<div class="row">
		<div class="large-12 columns text-left">
			<h2 class="MakePrimary">Program Performance and Client Outcomes</h2>
			<div class="row">
		<div class="large-12 columns text-left">
			<p>
				No Data to Report because Program Has Not Been Operating for At Least One year.
			</p>					

			<hr>
		</div>
	</div>
<!---/ No Project Data --->

<!--- Budget and Admin Efficiency --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Budget & Administrative Efficiency </h2>

		<p>Information to be added from Local Application response (Budget and Cost Effectiveness questions), as well as match and leverage information.</p>

	</div>
</div>
<!---/ Budget and Admin Efficiency --->

<!--- Service Improvement Efforts --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Service Improvement Efforts </h2>

		<p>Information to be added from Local Application response (Service Improvement Efforts questions).</p>

	</div>
</div>
<!---/ Service Improvement Efforts --->

<!--- HMIS and Data Improvement Efforts --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">HMIS & Data Collection Capacity </h2>

		<p>Information to be added from Local Application response (HMIS and Data Collection Capacity questions).</p>

			<hr>
	</div>
</div>
<!---/ HMIS and Data Improvement Efforts --->

<!--- Community Vision and Coordination --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Community Vision & Coordination</h2>

		<p>Information to be added from Local Application response (Community Vision & Coordination questions).</p>

	</div>
</div>
<!---/ Community Vision and Coordination --->

<!--- Increase in Permanent Housing Beds --->
<div class="row">
	<div class="large-12 columns">

		<h2 class="MakePrimary">Increase in Permanent Housing Beds</h2>

		<p>Information to be added from Local Application response (Bonus question).</p>

	</div>
</div>
<!---/ Increase in Permanent Housing Beds --->
</cfoutput>