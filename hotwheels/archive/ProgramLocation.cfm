<cfoutput>
	<cfif GEOCODELOCATION NEQ "none">
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">Project Location</h2>
			<table width="100%">
				<tr>
					<td width="50%">
						<a href="https://maps.google.com/?q=#GeoCodeLocation#" target="_blank">
							<img src="//maps.googleapis.com/maps/api/staticmap?size=475x250&markers=%7Ccolor:0x6ECDDC%7C#GeoCodeLocation#&sensor=false&visual_refresh=true&scale=2&zoom=15&key=#APIKey.Google#" 
								 border="1px" width="475" height="250"/>
						</a>
					</td>
					<td width="50%">
						<cfparam name="HideStreetView" default="0">
						<cfif HideStreetView EQ 1>
							<img src="img/NoImage.png" alt="No Image Available" >
						<cfelse>
							<img src="//maps.googleapis.com/maps/api/streetview?size=475x255&location=#GeoCodeLocation#&sensor=false&key=#APIKey.Google#<cfif ProjectGeoHeading NEQ "">&heading=#ProjectGeoHeading#</cfif>" 
							 border="1px" width="475" height="250"/>
						</cfif>
						
					</td>
				</tr>
			</table>
			<hr>
		</div>
	</div>
	</cfif>
</cfoutput>