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
                    <!--- Get Measure --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="288"
                              returnvariable="pm">
                    <!---/ Get Measure --->				        
                        <td colspan="3">#pm.value#</td>
				    </tr>
				    <!---/ Project Type --->
				    <!--- Total Project Budget --->
				    <cfif SESSION.cocID EQ "1">
                    <tr>
				        <td width="200"><strong>Total Agency Budget</strong></td>
                    <!--- Get Measure --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="1004"
                              returnvariable="pm">
                    <!---/ Get Measure --->
				        <td colspan="3">#pm.prettyValue#</td>
                        
				    </tr>
                    </cfif>
				    <!---/ Total Project Budget --->
				   
				    <!--- Amount of Grant --->
                    <!--- Get Grant Amount --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="270"
                              returnvariable="pm">
                    <!---/ Get Grant Amount --->
                    <cfif pm.value NEQ "" AND pm.value NEQ "0">
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong>
                    <!--- Get Grant Amount --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="270"
                              returnvariable="pm">
                    <!---/ Get Grant Amount --->	
				        <td width="300">#pm.prettyValue#</td>
				    </tr>
                    </cfif>
				    <!---/ Amount of Grant --->
				   
				    <!--- Population Served --->
                   <!--- Get Measure --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="284"
                             returnvariable="pm">
                   <!---/ Get Measure --->
				    <cfif pm.value NEQ "0" AND pm.value NEQ "">
				    	<tr>
					        <td width="200"><strong>Population Served</strong></td>
                            <!--- Get Measure --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="284"
                                      returnvariable="pm">
                            <!---/ Get Measure --->
					        <td colspan="3">#pm.value#</td>
					    </tr>
				    </cfif>
				    <!---/ Population Served --->
				    <!--- Services Provided --->
                   <!--- Get Measure --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="285"
                             returnvariable="pm">
                   <!---/ Get Measure --->
				    <cfif pm.value NEQ "0" AND pm.value NEQ "">
					    <tr>
					        <td width="200"><strong>Services Provided</strong></td>
                            <!--- Get Measure --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="285"
                                      returnvariable="pm">
                            <!---/ Get Measure --->
					        <td colspan="3">#pm.value#</td>
					    </tr>
				    </cfif>
				    <!---/  Services Provided --->

				    <!--- Housing Provided --->
                   <!--- Get Measure --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="286"
                             returnvariable="pm">
                   <!---/ Get Measure --->
				    <cfif pm.value NEQ "0" AND pm.value NEQ "">
				    <tr>
				        <td width="200"><strong>Housing Provided</strong></td>
                            <!--- Get Measure --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="286"
                                      returnvariable="pm">
                            <!---/ Get Measure --->
				        <td colspan="3">#pm.value#</td>
				    </tr>
				    </cfif>
				    <!---/  Housing Provided --->

				    <!--- Venues for Service --->
                   <!--- Get Measure --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="287"
                             returnvariable="pm">
                   <!---/ Get Measure --->
				    <cfif pm.value NEQ "0" AND pm.value NEQ "">
					    <tr>
					        <td width="200"><strong>Venue(s) for Service</strong></td>
                            <!--- Get Measure --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="287"
                                      returnvariable="pm">
                            <!---/ Get Measure --->
					        <td colspan="3">#pm.value#</td>
					    </tr>
				    </cfif>
				    <!---/  Venues for Service --->

				   
				</tbody>
			</table>
	</div>
</div>
<!---/ Display --->

</cfoutput>
