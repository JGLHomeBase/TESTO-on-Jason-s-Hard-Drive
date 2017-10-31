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
						<em>Adult Leavers</em>
					</th>
					<th class="text-center" >
						<em>Adult Stayers</em>
					</th>
				</tr>
			</thead>
			<tbody>
                <!--- Get L SNAP  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1178"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S SNAP  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1180"
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
                                  pm="1178"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1179"
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
                                  pm="1180"
                                  returnvariable="pm">
                        <!---/ Get Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1181"
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
                          pm="1182"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Medicaid  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1184"
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
                                  pm="1182"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1183"
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
                                  pm="1184"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                           
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1185"
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
                          pm="1186"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Medicare  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1188"
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
                                  pm="1186"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1187"
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
                                  pm="1188"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1189"
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
                          pm="1190"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S ChildHealth  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1192"
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
                                  pm="1190"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1191"
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
                                  pm="1192"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1193"
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
                          pm="1194"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S WIC  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1196"
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
                                  pm="1194"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1195"
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
                                  pm="1196"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1197"
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
                          pm="1198"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S VAMedical  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1200"
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
                                  pm="1198"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                       
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1199"
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
                                  pm="1200"
                                  returnvariable="pm">
                        <!---/ Get Data  --->    
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1201"
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
                          pm="1202"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TANFChild  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1204"
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
                                  pm="1202"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1203"
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
                                  pm="1204"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1205"
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
                          pm="1206"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TANFTransport  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1208"
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
                                  pm="1206"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1207"
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
                                  pm="1208"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1209"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                          
                        (#pm.tiplink#)
					</td>
				</tr>
				</cfif>
                <!--- Get L TANFOther  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1223"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TANFOther  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1222"
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
                                  pm="1223"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1224"
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
                                  pm="1222"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1225"
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
                          pm="1210"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S TRA  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1212"
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
                                  pm="1210"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1211"
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
                                  pm="1212"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                         
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1213"
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
                          pm="1214"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Section8  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1216"
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
                                  pm="1214"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                       
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1215"
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
                                  pm="1216"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                           
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1217"
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
                          pm="1218"
                          returnvariable="pm1">
                <!---/ Get Data  ---> 
                <!--- Get S Other  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1220"
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
                                  pm="1218"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                       
						#pm.tiplink# of 
                        <!--- Get Leavers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="302"
                                  returnvariable="pm">
                        <!---/ Get Leavers  --->                         
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1219"
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
                                  pm="1220"
                                  returnvariable="pm">
                        <!---/ Get Data  --->                        
						#pm.tiplink# of 
                        <!--- Get Stayers  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="303"
                                  returnvariable="pm">
                        <!---/ Get Stayers  --->                           
                        #pm.tiplink# 
                        <!--- Get Data  --->
                        <cfinvoke component="knex.pm"
                                  method="getProject"
                                  apr="#URL.apr#"
                                  project="#URL.project#"
                                  pm="1221"
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
