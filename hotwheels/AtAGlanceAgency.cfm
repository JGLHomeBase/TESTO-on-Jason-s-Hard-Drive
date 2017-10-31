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
				    <!--- Total Agency Budget --->
                    <!--- Get Measure --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="1004"
                              returnvariable="pm">
                    <!---/ Get Measure --->
                    <cfif pm.value NEQ "" AND pm.value NEQ "0">
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
				    <!---/ Total Agency Budget --->
				   
				    <!--- Amount of Grant --->
				    <tr>
				        <td width="200" valign="top"><strong>Amount of Grant</strong>
                    <!--- Get Measure --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="270"
                              returnvariable="pm">
                    <!---/ Get Measure --->	
				        <td width="300">#pm.prettyValue#</td>
                        <td width="100"><strong>Expended</strong></td>
                    <!--- Get Measure --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="1021"
                              returnvariable="pm">
                    <!---/ Get Measure --->
				        <td >
				        	#pm.prettyValue#
				    	</td>
				    </tr>
				    <!---/ Amount of Grant --->
				    
				   
				    <tr>
				        <td width="200" valign="top"><strong>Persons Served in Last Operating Year</strong></td>
				        <td colspan="3">
				        	<p>
                               <!--- Get Measure --->
                               <cfinvoke component="knex.pm"
                                         method="getProject"
                                         apr="#URL.apr#"
                                         project="#URL.project#"
                                         pm="269"
                                         returnvariable="pm">
                               <!---/ Get Measure --->
                                <cfif pm.value NEQ "0">
                                    <!--- Get Measure --->
                                    <cfinvoke component="knex.pm"
                                              method="getProject"
                                              apr="#URL.apr#"
                                              project="#URL.project#"
                                              pm="269"
                                              returnvariable="pm">
                                    <!---/ Get Measure --->
				        			#pm.tipLink# households
                   <!--- Get children --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="305"
                             returnvariable="pm1">
                   <!---/ Get children --->
                   <!--- Get Adults --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="301"
                             returnvariable="pm2">
                   <!---/ Get Adults --->
				        			<cfif pm1.value NEQ 0 AND pm2.value EQ 0>
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="305"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
				        				(#pm.tipLink# children)
                                   <!--- Get children --->
                                   <cfinvoke component="knex.pm"
                                             method="getProject"
                                             apr="#URL.apr#"
                                             project="#URL.project#"
                                             pm="305"
                                             returnvariable="pm">
                                   <!---/ Get children --->				        			
                                    <cfelseif pm.value NEQ 0>
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="301"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
				        				(#pm.tipLink# adults
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="305"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
                                        #pm.tipLink# children)
                                   <!--- Get Adults --->
                                   <cfinvoke component="knex.pm"
                                             method="getProject"
                                             apr="#URL.apr#"
                                             project="#URL.project#"
                                             pm="301"
                                             returnvariable="pm">
                                   <!---/ Get Adults --->
				        			<cfelseif pm.value NEQ 0>
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="296"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
				        				(#pm.tipLink# individuals)
				        			</cfif>
                                   <!--- Get children --->
                                   <cfinvoke component="knex.pm"
                                             method="getProject"
                                             apr="#URL.apr#"
                                             project="#URL.project#"
                                             pm="305"
                                             returnvariable="pm">
                                   <!---/ Get children --->				        			
                                    <cfelseif pm.value NEQ 0>
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="301"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
				        				#pm.tipLink# adults
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="305"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
                                        #pm.tipLink# children
				        			<cfelse>
                                        <!--- Get Measure --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="296"
                                                  returnvariable="pm">
                                        <!---/ Get Measure --->
				        				#pm.tipLink# individuals
				        		</cfif>
					        		
				        	</p>
				        	<p>
								Of the persons served last year, at entry 

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="271"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# were mentally ill,

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="272"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# had experience with alcohol abuse,

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="273"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# had experience with drug abuse, 

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="274"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# had HIV/AIDS and related diseases,

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="275"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# had a chronic health condition,

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="276"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# had a developmental disability, and

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="277"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

								#pm.tipLink# had a physical disability.    
				        	</p>
				        	<p>
				        		Of the persons served last year, at entry, 

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="278"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

				        		#pm.tipLink# had no conditions, 

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="279"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

				        		#pm.tipLink# had one condition, 

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="280"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

				        		#pm.tipLink# had two conditions, and 

                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="281"
                                          returnvariable="pm">
                                <!---/ Get Measure --->

				        		#pm.tipLink# had three or more conditions.
				        	</p>


                           <!--- Get Measure --->
                           <cfinvoke component="knex.pm"
                                     method="getProject"
                                     apr="#URL.apr#"
                                     project="#URL.project#"
                                     pm="282"
                                     returnvariable="pm">
                           <!---/ Get Measure --->
                            <cfif pm.value NEQ "0">
                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="282"
                                          returnvariable="pm">
                                <!---/ Get Measure --->
				        		<p>#pm.tipLink# of the adults served had past domestic violence experience;
                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="283"
                                          returnvariable="pm">
                                <!---/ Get Measure --->
                                    #pm.tipLink# had domestic violence experience in the past year.</p>
                                <!--- Get Measure --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="282"
                                          returnvariable="pm">
                                <!---/ Get Measure --->
				        	<cfelseif pm.value EQ 0>
				        		<p>None of the persons served had past domestic violence experience.</p>
				        	</cfif>
				        	<p>
				        	The program served 
                            <!--- Get Measure --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="306"
                                      returnvariable="pm">
                            <!---/ Get Measure --->
				        	#pm.tipLink# seniors and 
                            <!--- Get Measure --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="307"
                                      returnvariable="pm">
                            <!---/ Get Measure --->
				        	#pm.tipLink# veterans.
				        	</p>
				        </td>
				    </tr>
				    <!---/ Persons Served  --->

				   
				    <!--- Population Served --->
                   <!--- Get Measure --->
                   <cfinvoke component="knex.pm"
                             method="getProject"
                             apr="#URL.apr#"
                             project="#URL.project#"
                             pm="284"
                             returnvariable="pm">
                   <!---/ Get Measure --->
				  <cfif pm.value NEQ "0">
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
				     <cfif pm.value NEQ "0"> 
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
