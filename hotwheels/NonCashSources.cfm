<cfoutput>
	<div class="row">
		<div class="large-12 columns">

		<table width="100%">
			<thead>
				<tr>
					<th width="45%" class="text-left">
						<em>Sources of Non-Cash Benefits</em>
					</th>
					<th class="text-center" >
						<em>Leavers</em>
					</th>
					<th class="text-center" >
						<em>Stayers</em>
					</th>
				</tr>
			</thead>
			<tbody>
                <!--- Get L SNAP  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="196"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S SNAP  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="198"
                          returnvariable="pm2">
                <!---/ Get Data  --->               
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						Supplemental Nutrition Assistance Program
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L SNAP  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="196"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="197"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->                         
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S SNAP  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="198"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="199"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->                         
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L Medicaid  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="200"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Medicaid  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="202"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						Medicaid
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L Medicaid  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="200"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="201"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S Medicaid  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="202"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                           
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="203"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L Medicare  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="204"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Medicare  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="206"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						Medicare
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L Medicare  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="204"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="205"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S Medicare  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="206"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="207"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L ChildHealth  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="208"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S ChildHealth  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="210"
                          returnvariable="pm2">
                <!---/ Get Data  --->                  
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						State Children's Health Insurance
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L ChildHealth  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="208"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="209"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S ChildHealth  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="210"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="211"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L WIC  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="212"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S WIC  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="214"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						WIC
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L WIC  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="212"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="213"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S WIC  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="214"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="215"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L VAMedical  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="216"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S VAMedical  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="218"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						VA Medical Services
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L VAMedical  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="216"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                       
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="217"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S VAMedical  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="218"
                                  returnvariable="pm">
                        <!---/ Get Data  --->    
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="219"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L TANFChild  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="220"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TANFChild  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="222"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						TANF Child Care
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L TANFChild  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="220"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="221"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S TANFChild  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="222"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="223"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L TANFTransport  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="224"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TANFTransport  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="226"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						TANF Transit
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L TANFTransport  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="224"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="225"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S TANFTransport  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="226"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="227"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L TANFTransport  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="224"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TANFTransport  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="226"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						TANF Other
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L TANFOther  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1116"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1117"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S TANFOther  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1115"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1118"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L TRA  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="228"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TRA  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="230"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						Other Temporary Rental Assistance
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L TRA  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="228"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="229"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S TRA  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="230"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="231"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L Seciton8  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="232"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Section8  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="234"
                          returnvariable="pm2">
                <!---/ Get Data  --->                 
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						Section 8
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L Seciton8  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="232"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                       
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="233"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S Section8  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="234"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                           
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="235"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L Other  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="236"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Other  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="238"
                          returnvariable="pm2">
                <!---/ Get Data  --->                  
				<cfif pm1.value+pm2.value GT 0>
				<tr>
					<td valign="top">
						Other Source
					</td>
					<td valign="top" class="text-center">
                        <!--- Get L Other  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="236"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                       
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="298"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="237"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
                        (#pm.tiplink#)
					</td>
					<td valign="top" class="text-center">
                        <!--- Get S Other  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="238"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="300"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="239"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                            
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
			</tbody>
		</table>

		<hr>

		</div>
	</div>

</cfoutput>
