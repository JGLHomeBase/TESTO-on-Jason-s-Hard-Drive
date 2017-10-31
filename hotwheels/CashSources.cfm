<cfoutput>
	<div class="row">
		<div class="large-12 columns">

						<table width="100%">
							<thead>
								<tr>
									<th width="45%" class="text-left">
										<em>Sources of Cash Income</em>
									</th>
									<th class="text-center" >
										<em>Adult Leavers</em>
									</th>
									<th class="text-center" >
										<em>Adult Stayers</em>
									</th>
								</tr>
							</thead>
							<tbody>
                                <!--- Get Data  --->
                                <cfinvoke component="knex.pm"
                                          method="getProject"
                                          apr="#URL.apr#"
                                          project="#URL.project#"
                                          pm="399"
                                          returnvariable="pm">
                                <!---/ Get Get Data  --->
								<cfif pm.value GT 0>
									<tr>
										<td valign="top">
											Earned Income
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="136"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->
											#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Leavers  --->                                            
                                            #pm.tiplink# 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="137"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                              
                                            (#pm.tiplink#)
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="138"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                             
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="139"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
                                            (#pm.tiplink#)
										</td>
									</tr>
								</cfif>
                                        <!--- Get L Unemployment  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="140"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S Unemployment  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="142"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  ---> 
								<cfif pm1.value + pm2.value GT 0>
									<tr>
										<td valign="top">
											Unemployment
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get L Unemployment  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="140"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                               
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="141"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                               
                                            (#pm.tiplink#)
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get S Unemployment  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="142"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                               
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="143"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                               
                                            (#pm.tiplink#)
										</td>
									</tr>
								</cfif>
                                        <!--- Get L SSI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="144"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S SSI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="146"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                             
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										SSI
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L SSI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="144"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                        
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="145"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S SSI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="146"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                        
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                          
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="147"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L SSDI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="148"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S SSDI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="150"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  ---> 
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										SSDI
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L SSDI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="148"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                          
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="149"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                          
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S SSDI  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="150"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                        
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                         
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="151"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                          
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L VetDisability  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="152"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S Vet Disability --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="154"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  ---> 
								<cfif pm1.value + pm2.value GT 0>
									<tr>
										<td valign="top">
											Veterans Disability Income
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get L VetDisability  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="152"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                              
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="153"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
                                            (#pm.tiplink#)
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get S Vet Disability --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="154"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                            
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="155"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
                                            (#pm.tiplink#)
										</td>
									</tr>
								</cfif>
                                        <!--- Get L Disability  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="156"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S Disability --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="158"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  ---> 
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										Private Disability Insurance
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L Disability  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="156"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="157"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S Disability --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="158"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                          
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="159"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L WorkersComp  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="160"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S WorkersComp --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="162"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  ---> 
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										Workers Compensation
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L WorkersComp  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="160"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                          
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="161"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                            
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S WorkersComp --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="162"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="163"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                            
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L TANF  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="164"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S TANF --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="166"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                         
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										TANF
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L TANF  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="164"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="165"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S TANF --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="166"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="167"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L GA  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="168"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S GA --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="170"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->  
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										General Assistance
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L GA  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="168"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                          
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="169"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S GA --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="170"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                          
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="171"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L Retirement  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="172"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S Retirement --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="174"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                          
								<cfif pm1.value + pm2.value GT 0>
									<tr>
										<td valign="top">
											Retirement
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get L Retirement  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="172"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                              
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="173"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
                                            (#pm.tiplink#)
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get S Retirement --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="174"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
											#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                             
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="175"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
                                            (#pm.tiplink#)
										</td>
									</tr>
								</cfif>
                                        <!--- Get L VetPension  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="176"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S VetPension --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="178"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                          
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										Veterans Pension
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L VetPension  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="176"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                          
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="177"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S VetPension --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="178"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                         
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="179"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L JobPension  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="180"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S JobPension --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="182"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                          
								<cfif pm1.value + pm2.value GT 0>
									<tr>
										<td valign="top">
											Pension from Former Job
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get L JobPension  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="180"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                               
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="181"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
                                            (#pm.tiplink#)
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get S JobPension --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="182"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
											#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                             
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="183"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
                                            (#pm.tiplink#)
										</td>
									</tr>
								</cfif>
                                        <!--- Get L ChildSupport  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="184"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S ChildSupport --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="186"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                           
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										Child Support
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L ChildSupport  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="184"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                         
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="185"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                          
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S ChildSupport --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="186"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                            
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                         
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="187"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                          
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L Alimony  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="188"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S Alimony --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="190"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                          
								<cfif pm1.value + pm2.value GT 0>
								<tr>
									<td valign="top">
										Alimony
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get L Alimony  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="188"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                        
										#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                           
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="189"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                        
                                        (#pm.tiplink#)
									</td>
									<td valign="top" class="text-center">
                                        <!--- Get S Alimony --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="190"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                           
										#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                         
                                        #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="191"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                        
                                        (#pm.tiplink#)
									</td>
								</tr>
								</cfif>
                                        <!--- Get L OtherSource  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="192"
                                                  returnvariable="pm1">
                                        <!---/ Get Get Data  ---> 
                                        <!--- Get S OtherSource --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="194"
                                                  returnvariable="pm2">
                                        <!---/ Get Get Data  --->                                           
								<cfif pm1.value + pm2.value>
									<tr>
										<td valign="top">
											Other Source
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get L OtherSource  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="192"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                             
											#pm.tiplink# of 
                                        <!--- Get Adult Leavers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="302"
                                                  returnvariable="pm">
                                        <!---/ Get Adult Leavers  --->                                               
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="193"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
                                            (#pm.tiplink#)
										</td>
										<td valign="top" class="text-center">
                                        <!--- Get S OtherSource --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="194"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
											#pm.tiplink# of 
                                        <!--- Get Adult Stayers  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="303"
                                                  returnvariable="pm">
                                        <!---/ Get Get Adult Stayers  --->                                             
                                            #pm.tiplink# 
                                        <!--- Get Data  --->
                                        <cfinvoke component="knex.pm"
                                                  method="getProject"
                                                  apr="#URL.apr#"
                                                  project="#URL.project#"
                                                  pm="195"
                                                  returnvariable="pm">
                                        <!---/ Get Get Data  --->                                              
                                            (#pm.tiplink#)
										</td>
									</tr>
								</cfif>
								
							</tbody>
						</table>


					</td>
				</tr>
			</tbody>
		</table>
 
		</div>
	</div>

</cfoutput>
