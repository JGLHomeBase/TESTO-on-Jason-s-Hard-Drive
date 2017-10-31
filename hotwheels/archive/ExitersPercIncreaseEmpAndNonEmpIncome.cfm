<cfoutput>

	<div class="row">
		<div class="large-12 columns text-left">
			
			<div class="row">
		<div class="large-12 columns text-left">
					<p>
                        
						#LeaversIncrease# of #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
							(#NumberFormat(((apr24Leavers_NumEarned_More+apr24Leavers_NumEarned_Gained)/apr25Leavers_Total_Adults)*100, "__")#%)
						</cfif>
						of adult leavers increased their employment income from entry to exit. 
							
					</p>
					<p>
                        
						#LeaversOtherIncrease# or #apr25Leavers_Total_Adults#
						<cfif apr25Leavers_Total_Adults NEQ 0>
							(#NumberFormat(((apr24Leavers_NumOther_More+apr24Leavers_NumOther_Gained)/apr25Leavers_Total_Adults)*100, "__")#%)
						</cfif>
						 of adult leavers increased their non-employment income from entry to exit.
							
					</p>
				</div>
			</div>
		</div>
	</div>

</cfoutput>