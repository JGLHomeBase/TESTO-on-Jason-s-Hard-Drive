<cfoutput>
	<div class="row">
		<div class="large-12 columns text-left">
			<cfoutput>
				<cfset tmapr08_Total = (apr07_TotalLeavers-apr29Less90_DKR_Total-apr29More90_DKR_Total-apr29More90_Missing_Total-apr29Less90_Missing_Total)>
				#tmapr08_Total# of #apr07_TotalLeavers#
				<cfif apr07_TotalLeavers NEQ 0>
					(#NumberFormat((tmapr08_Total/apr07_TotalLeavers)*100, "__")#%) Leavers exited to known destinations.
				</cfif>
			</cfoutput>
		</div>
	</div>
</div>
</div>
</cfoutput>






