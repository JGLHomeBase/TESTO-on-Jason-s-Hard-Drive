<cfoutput>
	<div class="row">
		<div class="large-12 columns text-left">
                <h3 class="MakePrimary">Destination At Program Exit</h3>
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="310"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->
						<p>
                            <cfif pm.value GT 0>
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="310"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->
							Excluding #pm.tipLink# tenant
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="310"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->                            
                            <cfif pm.value GT 1>s</cfif> who passed away,
						</cfif>
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="3"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->
						#pm.tipLink# of 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="299"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->
                        #pm.tipLink#
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="299"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->
							<cfif pm.value NEQ 0>
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->
								(#pm.tipLink#)
							</cfif>
						exiting tenants left for permanent housing opportunities
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="3"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->                            
                            <cfif pm.value GT 0>, including
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="4"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
							<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="4"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								#pm.tipLink# in housing they own, 
							</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="5"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
							<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="5"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								#pm.tiplink# in VASH subsidized rental housing, 
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="6"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="6"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
									#pm.tiplink# with other rental subsidies, 
								</cfif>
							<cfelse>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="6"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="6"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
									#pm.tiplink# in subsidized rental housing, 
								</cfif>
							</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="7"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
							<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="7"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								#pm.tiplink# in unsubsidized rental housing, 
							</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="8"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
							<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="8"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								#pm.tiplink# in permanent supportive housing, 
							</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="4"
                                      returnvariable="pm1">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="5"
                                      returnvariable="pm2">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="8"
                                      returnvariable="pm3">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="3"
                                      returnvariable="pm4">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="3"
                                      returnvariable="pm5">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="9"
                                      returnvariable="pm6">
                            <!---/ Get Get Data  --->
							<cfif pm1.value EQ 0 AND pm2.value EQ 0 AND pm3.value EQ 0 AND pm4.value NEQ 0 AND (pm5.value-pm6.value) NEQ 1>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="9"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
									#pm.tiplink# living permanently with friends or family.
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="3"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->							
                            <cfelseif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="9"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
									and #pm.tiplink# living permanently with friends or family.
							</cfif>
						<cfelse>.</cfif>
					</p>


				<!---/ PSH-SHP and S+C --->
				
				<!--- TH Sentences --->
				<p>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="299"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
                    <cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="43"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
							<cfif pm.value EQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="43"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								#pm.tiplink# of 
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="299"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->                                
                                #pm.tiplink# 
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="44"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->                                
                                (#pm.tiplink#) exiting participants were living in temporary destinations.
							<cfelse>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="43"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
								#pm.tiplink# of 
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="299"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->                                
                                #pm.tiplink# 
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="44"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->                                
                                (#pm.tiplink#) exiting participants were living in temporary destinations, including
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="45"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 								
                                <cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="45"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
									#pm.tiplink# in places not meant for human habitation, 
								</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="46"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
								<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="46"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
									#pm.tiplink# in emergency shelters, 
								</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="47"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
								<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="47"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
									#pm.tiplink# in Safe Havens, 
								</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="48"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
								<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="48"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
									#pm.tiplink# in hotels or motels, 
								</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="49"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
								<cfif pm.value NEQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="49"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
									#pm.tiplink# staying temporarily with friends or family, 
								</cfif>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="45"
                                      returnvariable="pm1">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="46"
                                      returnvariable="pm2">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="47"
                                      returnvariable="pm3">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="48"
                                      returnvariable="pm4">
                            <!---/ Get Get Data  --->
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="49"
                                      returnvariable="pm5">
                            <!---/ Get Get Data  --->
									<cfif pm1.value EQ 0 AND pm2.value EQ 0 AND pm3.value EQ 0 AND pm4.value EQ 0 AND pm5.value EQ 0>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="50"
                                      returnvariable="pm">
                            <!---/ Get Get Data  ---> 
										#pm.tiplink# in transitional housing.
									<cfelse>
                            <!--- Get Data  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="50"
                                      returnvariable="pm">
                            <!---/ Get Get Data  --->
										and #pm.tiplink# in transitional housing.
									</cfif>
								</cfif>
							
							</cfif>
						</p>
			<!---/ TH Sentences --->

			<!--- Inst Sentences --->
			<p>
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm">
                            <!---/ Get Total Inst  --->
				#pm.tiplink# went to an institution
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm">
                            <!---/ Get Total Inst  --->
                <cfif pm.value GT 0>, including</cfif>
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get detox  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="52"
                                      returnvariable="pm2">
                            <!---/ Get detox  --->
				<cfif (pm1.value-pm2.value) EQ "0">
                            <!--- Get detox  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="52"
                                      returnvariable="pm">
                            <!---/ Get detox --->
					#pm.tiplink# in detox.
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get detox  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="52"
                                      returnvariable="pm2">
                            <!---/ Get detox  --->
                    <cfelseif pm2.value GT "0" AND (pm1.value-pm2.value) GT "0">
                            <!--- Get detox  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="52"
                                      returnvariable="pm">
                            <!---/ Get detox --->
					#pm.tiplink# in detox,
				</cfif>
                             <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Foster  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="53"
                                      returnvariable="pm2">
                            <!---/ Get Foster --->
				<cfif (pm1.value-pm2.value) EQ "0">
                            <!--- Get Foster  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="53"
                                      returnvariable="pm">
                            <!---/ Get Foster --->
					#pm.tiplink# in foster care.
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Foster  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="53"
                                      returnvariable="pm2">
                            <!---/ Get Foster --->
                    <cfelseif pm2.value GT "0" AND (pm1.value-pm2.value) GT "0">
                            <!--- Get Foster  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="53"
                                      returnvariable="pm">
                            <!---/ Get Foster --->
					#pm.tiplink# in foster care,
				</cfif>
                             <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Hospital  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="54"
                                      returnvariable="pm2">
                            <!---/ Get Hospital --->
				<cfif (pm1.value-pm2.value) EQ "0">
                            <!--- Get Hospital  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="54"
                                      returnvariable="pm">
                            <!---/ Get Hospital --->
					#pm.tiplink# in hospital(s).
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Hospital  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="54"
                                      returnvariable="pm2">
                            <!---/ Get Hospital --->
                    <cfelseif pm2.value GT "0" AND (pm1.value-pm2.value) GT "0">
                            <!--- Get Hospital  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="54"
                                      returnvariable="pm">
                            <!---/ Get Hospital --->
					#pm.tiplink# in hospital(s),
				</cfif>
                             <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Psych  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="55"
                                      returnvariable="pm2">
                            <!---/ Get Psych --->
				<cfif (pm1.value-pm2.value) EQ "0">
                            <!--- Get Psych  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="55"
                                      returnvariable="pm">
                            <!---/ Get Psych --->
					#pm.tiplink# in psychiatric facilities.
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Psych  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="55"
                                      returnvariable="pm2">
                            <!---/ Get Psych --->
                    <cfelseif pm2.value GT "0" AND (pm1.value-pm2.value) GT "0">
                            <!--- Get Psych  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="55"
                                      returnvariable="pm">
                            <!---/ Get Psych --->
					#pm.tiplink# in psychiatric facilities,
				</cfif>
                             <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Jail  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="56"
                                      returnvariable="pm2">
                            <!---/ Get Jail ---> 
				<cfif (pm1.value-pm2.value) EQ "0">
                            <!--- Get Jail  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="56"
                                      returnvariable="pm">
                            <!---/ Get Jail ---> 
					#pm.tiplink# in jail.
                            <!--- Get Total Inst  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="51"
                                      returnvariable="pm1">
                            <!---/ Get Total Inst  --->
                            <!--- Get Jail  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="56"
                                      returnvariable="pm2">
                            <!---/ Get Jail ---> 
                    <cfelseif pm2.value GT "0" AND (pm1.value-pm2.value) GT "0">
                            <!--- Get Jail  --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="56"
                                      returnvariable="pm">
                            <!---/ Get Jail --->                    
                and #pm.tiplink# in jail.</cfif>
			</p>
			<!---/ Inst Sentences --->
			<!--- Other Sentence --->
                <!--- Get Data  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1114"
                          returnvariable="pm">
                <!---/ Get Get Data  --->
                <cfif pm.value NEQ "" AND pm.value GT "1">
                <p>
                <!--- Get Data  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1114"
                          returnvariable="pm">
                <!---/ Get Get Data  --->
                    #pm.tiplink# exited to other destinations.
                </p>
                <cfelseif pm.value EQ "1">
                <p>
                <!--- Get Data  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1114"
                          returnvariable="pm">
                <!---/ Get Get Data  --->
                #pm.tiplink# exited to a destination described as "other".
                </p>
                </cfif>
			<!---/ Other Sentence --->
		</div>
	</div>
</cfoutput>