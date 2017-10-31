<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<h2 class="MakePrimary">HMIS Data Quality</h2>
			<table width="100%">
				<thead>
					<th width="50%"></th>
					<th>Don't Know or Refused</th>
					<th>Missing Data</th>
					<th>Percentage Don't Know/Refused or Missing Data for All Clients</th>
				</thead>
				<tbody>
                    <!--- Get FName DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="313"
                              returnvariable="pm1">
                    <!---/ Get FName DKR  --->
                    <!--- Get FName M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="314"
                              returnvariable="pm2">
                    <!---/ Get FName M  --->
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>First Name</td>
                            <!--- Get FName DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="313"
                                      returnvariable="pm">
                            <!---/ Get FName DKR  --->
							<td>#pm.tiplink#</td>
                            <!--- Get FName M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="314"
                                      returnvariable="pm">
                            <!---/ Get FName M  --->                                
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="315"
                                      returnvariable="pm">
                            <!---/ Get Data  --->
									#pm.tiplink#
							</td>
						</tr>
					</cfif>
                    <!--- Get LName DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="316"
                              returnvariable="pm1">
                    <!---/ Get LName DKR  --->
                    <!--- Get LName M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="317"
                              returnvariable="pm2">
                    <!---/ Get LName M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Last Name</td>
                            <!--- Get LName DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="316"
                                      returnvariable="pm">
                            <!---/ Get LName DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get LName M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="317"
                                      returnvariable="pm">
                            <!---/ Get LName M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="318"
                                      returnvariable="pm">
                            <!---/ Get Data  --->
									#pm.tiplink#

							</td>
						</tr>
					</cfif>
                    <!--- Get SSN DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="319"
                              returnvariable="pm1">
                    <!---/ Get SSN DKR  --->
                    <!--- Get SSN M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="320"
                              returnvariable="pm2">
                    <!---/ Get SSN M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>SSN</td>
                            <!--- Get SSN DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="319"
                                      returnvariable="pm">
                            <!---/ Get SSN DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get SSN M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="320"
                                      returnvariable="pm">
                            <!---/ Get SSN M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="321"
                                      returnvariable="pm">
                            <!---/ Get Data  --->
									#pm.tiplink#

							</td>
						</tr>
					</cfif>
                    <!--- Get DOB DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="322"
                              returnvariable="pm1">
                    <!---/ Get DOB DKR  --->
                    <!--- Get DOB M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="323"
                              returnvariable="pm2">
                    <!---/ Get DOB M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Date of Birth (DOB)</td>
                            <!--- Get DOB DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="322"
                                      returnvariable="pm">
                            <!---/ Get DOB DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get DOB M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="323"
                                      returnvariable="pm">
                            <!---/ Get DOB M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="324"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Race DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="325"
                              returnvariable="pm1">
                    <!---/ Get Race DKR  --->
                    <!--- Get Race M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="326"
                              returnvariable="pm2">
                    <!---/ Get Race M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Race</td>
                            <!--- Get Race DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="325"
                                      returnvariable="pm">
                            <!---/ Get Race DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get Race M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="326"
                                      returnvariable="pm">
                            <!---/ Get Race M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="327"
                                      returnvariable="pm">
                            <!---/ Get Data  --->									
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Ethnicity DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="328"
                              returnvariable="pm1">
                    <!---/ Get Ethnicity DKR  --->
                    <!--- Get Ethnicity M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="329"
                              returnvariable="pm2">
                    <!---/ Get Ethnicity M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Ethnicity</td>
                            <!--- Get Ethnicity DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="328"
                                      returnvariable="pm">
                            <!---/ Get Ethnicity DKR  --->                             
							<td>#pm.tiplink#</td>
                            <!--- Get Ethnicity M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="329"
                                      returnvariable="pm">
                            <!---/ Get Ethnicity M  --->                            
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="330"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Gender DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="331"
                              returnvariable="pm1">
                    <!---/ Get Gender DKR  --->
                    <!--- Get Gender M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="332"
                              returnvariable="pm2">
                    <!---/ Get Gender M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Gender</td>
                            <!--- Get Gender DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="331"
                                      returnvariable="pm">
                            <!---/ Get Gender DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get Gender M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="332"
                                      returnvariable="pm">
                            <!---/ Get Gender M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="333"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Vet DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="334"
                              returnvariable="pm1">
                    <!---/ Get Vet DKR  --->
                    <!--- Get Vet M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="335"
                              returnvariable="pm2">
                    <!---/ Get Vet M  --->                            
					<cfif (pm1.value + pm2.value) GT 0> 
						<tr>
							<td>Veteran Status</td>
                            <!--- Get Vet DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="334"
                                      returnvariable="pm">
                            <!---/ Get Vet DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get Vet M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="335"
                                      returnvariable="pm">
                            <!---/ Get Vet M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="336"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Disabling DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="337"
                              returnvariable="pm1">
                    <!---/ Get Disabling DKR  --->
                    <!--- Get Disabling M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="338"
                              returnvariable="pm2">
                    <!---/ Get Disabling M  --->                            
					<cfif (pm1.value + pm2.value) GT 0> 
						<tr>
							<td>Disabling Condition</td>
                            <!--- Get Disabling DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="337"
                                      returnvariable="pm">
                            <!---/ Get Disabling DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get Disabling M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="338"
                                      returnvariable="pm">
                            <!---/ Get Disabling M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="339"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Residence DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="340"
                              returnvariable="pm1">
                    <!---/ Get Residence DKR  --->
                    <!--- Get Residence M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="341"
                              returnvariable="pm2">
                    <!---/ Get Residence M  --->                            
					<cfif (pm1.value + pm2.value) GT 0> 
						<tr>
							<td>Residence Prior to Entry</td>
                            <!--- Get Residence DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="340"
                                      returnvariable="pm">
                            <!---/ Get Residence DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get Residence M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="341"
                                      returnvariable="pm">
                            <!---/ Get Residence M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="342"
                                      returnvariable="pm">
                            <!---/ Get Data  --->									
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Zip DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="343"
                              returnvariable="pm1">
                    <!---/ Get Zip DKR  --->
                    <!--- Get Zip M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="344"
                              returnvariable="pm2">
                    <!---/ Get Zip M  --->                            
					<cfif (pm1.value + pm2.value) GT 0> 
						<tr>
							<td>Zip of Last Permanent Address</td>
                            <!--- Get Zip DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="343"
                                      returnvariable="pm">
                            <!---/ Get Zip DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get Zip M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="344"
                                      returnvariable="pm">
                            <!---/ Get Zip M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="345"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Housing DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="346"
                              returnvariable="pm1">
                    <!---/ Get Housing DKR  --->
                    <!--- Get Housing M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="347"
                              returnvariable="pm2">
                    <!---/ Get Housing M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>    
						<tr>
							<td>Housing Status (at entry)</td>
                            <!--- Get Housing DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="346"
                                      returnvariable="pm">
                            <!---/ Get Housing DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get Housing M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="347"
                                      returnvariable="pm">
                            <!---/ Get Housing M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="348"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Income DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="349"
                              returnvariable="pm1">
                    <!---/ Get Income DKR  --->
                    <!--- Get Income M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="350"
                              returnvariable="pm2">
                    <!---/ Get Income M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>              
						<tr>
							<td>Income (at entry)</td>
                            <!--- Get IncomeEntry DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="349"
                                      returnvariable="pm">
                            <!---/ Get IncomeEntry DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get IncomeEntry M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="350"
                                      returnvariable="pm">
                            <!---/ Get IncomeEntry M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="351"
                                      returnvariable="pm">
                            <!---/ Get Data  --->									
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get IncomeExit DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="352"
                              returnvariable="pm1">
                    <!---/ Get IncomeExit DKR  --->
                    <!--- Get IncomeExit M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="353"
                              returnvariable="pm2">
                    <!---/ Get IncomeExit M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>  
						<tr>
							<td>Income (at exit)</td>
                            <!--- Get IncomeExit DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="352"
                                      returnvariable="pm">
                            <!---/ Get IncomeExit DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get IncomeExit M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="353"
                                      returnvariable="pm">
                            <!---/ Get IncomeExit M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="354"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get NonCashEntry DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="355"
                              returnvariable="pm1">
                    <!---/ Get NonCashEntry DKR  --->
                    <!--- Get NonCashEntry M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="356"
                              returnvariable="pm2">
                    <!---/ Get NonCashEntry M  --->                            
					<cfif (pm1.value + pm2.value) GT 0> 
						<tr>
							<td>Non-cash benefits (at entry)</td>
                            <!--- Get NonCashEntry DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="355"
                                      returnvariable="pm">
                            <!---/ Get NonCashEntry DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get NonCashEntry M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="356"
                                      returnvariable="pm">
                            <!---/ Get NonCashEntry M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="357"
                                      returnvariable="pm">
                            <!---/ Get Data  --->                                
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get NonCashExit DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="358"
                              returnvariable="pm1">
                    <!---/ Get NonCashExit DKR  --->
                    <!--- Get NonCashExit M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="359"
                              returnvariable="pm2">
                    <!---/ Get NonCashExit M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Non-cash benefits (at exit)</td>
                            <!--- Get NonCashExit DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="358"
                                      returnvariable="pm">
                            <!---/ Get NonCashExit DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get NonCashExit M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="359"
                                      returnvariable="pm">
                            <!---/ Get NonCashExit M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="360"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get PhysDis DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="361"
                              returnvariable="pm1">
                    <!---/ Get PhysDis DKR  --->
                    <!--- Get PhysDis M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="362"
                              returnvariable="pm2">
                    <!---/ Get PhysDis M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Physical Disability (at entry)</td>
                            <!--- Get PhysDis DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="361"
                                      returnvariable="pm">
                            <!---/ Get PhysDis DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get PhysDis M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="362"
                                      returnvariable="pm">
                            <!---/ Get PhysDis M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="363"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get DevDis DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="364"
                              returnvariable="pm1">
                    <!---/ Get DevDis DKR  --->
                    <!--- Get DevDis M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="365"
                              returnvariable="pm2">
                    <!---/ Get DevDis M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Developmental Disability (at entry)</td>
                            <!--- Get DevDis DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="364"
                                      returnvariable="pm">
                            <!---/ Get DevDis DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get DevDis M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="365"
                                      returnvariable="pm">
                            <!---/ Get DevDis M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="366"
                                      returnvariable="pm">
                            <!---/ Get Data  --->									
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get ChronicHealth DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="367"
                              returnvariable="pm1">
                    <!---/ Get ChronicHealth DKR  --->
                    <!--- Get ChronicHealth M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="368"
                              returnvariable="pm2">
                    <!---/ Get ChronicHealth M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Chronic Health Condition (at entry)</td>
                            <!--- Get ChronicHealth DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="367"
                                      returnvariable="pm">
                            <!---/ Get ChronicHealth DKR  --->                          
							<td>#pm.tiplink#</td>
                            <!--- Get ChronicHealth M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="368"
                                      returnvariable="pm">
                            <!---/ Get ChronicHealth M  --->                               
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="369"
                                      returnvariable="pm">
                            <!---/ Get Data  --->									
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get HIV DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="370"
                              returnvariable="pm1">
                    <!---/ Get HIV DKR  --->
                    <!--- Get HIV M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="371"
                              returnvariable="pm2">
                    <!---/ Get HIV M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>HIV/AIDS (at entry)</td>
                            <!--- Get HIV DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="370"
                                      returnvariable="pm">
                            <!---/ Get HIV DKR  --->                             
							<td>#pm.tiplink#</td>
                            <!--- Get HIV M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="371"
                                      returnvariable="pm">
                            <!---/ Get HIV M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="372"
                                      returnvariable="pm">
                            <!---/ Get Data  --->									
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Mental DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="373"
                              returnvariable="pm1">
                    <!---/ Get Mental DKR  --->
                    <!--- Get Mental M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="374"
                              returnvariable="pm2">
                    <!---/ Get Mental M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Mental Health (at entry)</td>
                            <!--- Get Mental DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="373"
                                      returnvariable="pm">
                            <!---/ Get Mental DKR  --->                           
							<td>#pm.tiplink#</td>
                            <!--- Get Mental M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="374"
                                      returnvariable="pm">
                            <!---/ Get Mental M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="375"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
							
							</td>
						</tr>
					</cfif>
                    <!--- Get SA DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="376"
                              returnvariable="pm1">
                    <!---/ Get SA DKR  --->
                    <!--- Get SA M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="377"
                              returnvariable="pm2">
                    <!---/ Get SA M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Substance Abuse (at entry)</td>
                            <!--- Get SA DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="376"
                                      returnvariable="pm">
                            <!---/ Get SA DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get SA M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="377"
                                      returnvariable="pm">
                            <!---/ Get SA M  --->                              
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="378"
                                      returnvariable="pm">
                            <!---/ Get Data  --->							
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get DV DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="379"
                              returnvariable="pm1">
                    <!---/ Get DV DKR  --->
                    <!--- Get DV M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="380"
                              returnvariable="pm2">
                    <!---/ Get DV M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Domestic Violence (at entry)</td>
                            <!--- Get DV DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="379"
                                      returnvariable="pm">
                            <!---/ Get DV DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get DV M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="380"
                                      returnvariable="pm">
                            <!---/ Get DV M  --->                               
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="381"
                                      returnvariable="pm">
                            <!---/ Get Data  --->								
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
                    <!--- Get Dest DKR  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="382"
                              returnvariable="pm1">
                    <!---/ Get Dest DKR  --->
                    <!--- Get Dest M  --->
                    <cfinvoke component="knex.pm"
                              method="getProject"
                              apr="#URL.apr#"
                              project="#URL.project#"
                              pm="383"
                              returnvariable="pm2">
                    <!---/ Get Dest M  --->                            
					<cfif (pm1.value + pm2.value) GT 0>
						<tr>
							<td>Destination</td>
                            <!--- Get Dest DKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="382"
                                      returnvariable="pm">
                            <!---/ Get Dest DKR  --->                            
							<td>#pm.tiplink#</td>
                            <!--- Get Dest M  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="383"
                                      returnvariable="pm">
                            <!---/ Get Dest M  --->                             
							<td>#pm.tiplink#</td>
							<td>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="384"
                                      returnvariable="pm">
                            <!---/ Get Data  --->							
									#pm.tiplink#
								
							</td>
						</tr>
					</cfif>
					<tr>
						<td><b>Overall</b></td>
                            <!--- Get TotalDKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="387"
                                      returnvariable="pm">
                            <!---/ Get TotalDKR  --->                        
						<td><b>#pm.tiplink#</b></td>
                            <!--- Get TotalMissing  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="386"
                                      returnvariable="pm">
                            <!---/ Get TotalMissing  --->                        
						<td><b>#pm.tiplink#</b></td>
                            <!--- Get TotalPercMissingDKR  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="385"
                                      returnvariable="pm">
                            <!---/ Get TotalPercMissingDKR  --->                        
						<td><b>#pm.tiplink#</b></td>
					</tr>
				</tbody>
			</table>
			<hr>
		</div>
	</div>
</cfoutput>