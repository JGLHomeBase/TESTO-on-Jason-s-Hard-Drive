
	<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<h1 class="MakePrimary">#ProjectLongName# (#projectComponentName#)</h1>
			<h2 class="MakeSecondary">#agencyLongName#</h2>
			<p>
				<cfif ProjectStreet1 NEQ "">
					#ProjectStreet1#<br>
				</cfif>
				<cfif ProjectStreet2 NEQ "">
					#ProjectStreet2#<br>
				</cfif>
				<cfif ProjectHood  NEQ "">
					#ProjectHood#<br>
				</cfif>
			</p>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<hr>
		</div>
	</div>

</cfoutput>
