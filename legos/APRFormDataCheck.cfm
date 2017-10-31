  <!--- Get List of APR Questions --->
      <cfinvoke component="knex.aprSet" 
          method="getQs"
          DataSource = "#DataSource#"
          returnVariable = "getAPRQList"
          whatFields = "any"
          whatAPR = "any"
          Order = "any">
  <!--- Get List of APR Questions --->

<!--- Get Project Components --->
<cfinvoke component="knex.component" 
          method="getThis"
          DataSource = "#DataSource#"
          returnVariable = "getProjectCom">
<!--- Get Project Components --->

<cfoutput>
	<div class="row">
		<div class="large-12 columns">
			<table width="100%">
				<thead>
					<th></th>
					<th colspan="2">Data Entry</th>
				</thead>
				<tbody>
					<cfloop list="#getAPRQList.aprSetQList#" index="question">
			            <!--- Get APR Question Title and Component List --->
                        <cfinvoke component = "knex.table"
                                  method = "get"
                                  datasource = "#datasource#"
                                  returnVariable = "getTables"
                                  Question = "#question#"
                                  whatFields = "tableAPRQTitle, programComponentList"
                                  Where = "namedQuestion">
			            <!---/ Get APR Question Title and Component List --->

			            <cfif listContains("#getTables.programComponentList#", "#getProjectCom.projectComponentID#")>
                            <!--- Get Input User ID and APR Id --->
                            <cfinvoke component = "knex.aprData"
                                      method = "progress"
                                      datasource = "#datasource#"
                                      returnVariable = "progress"
                                      Question = "#question#"
                                      whatFields = "inputUserID, aprID">
                            <!---/ Get Input User ID and APR Id --->
			            	<tr>
			            		<td>
			            			<a href="#CurrentPage#?project=#URL.project#&APR=#URL.apr#&q=#question#">#getTables.tableAPRQTitle#</a>
			            		</td>
			            		<td>
					              <cfif progress.RecordCount NEQ 0>
					              	<h2><i class="fi-check MakeGreen"></i></h2>
					              <cfelse>
					              	<h2><i class="fi-x MakeOrange"></i></h2>
					              </cfif>
			            		</td>
			            		<td>
                            <!--- Get User Name and APR Id --->
                            <cfinvoke component = "knex.aprData"
                                      method = "progress"
                                      datasource = "#datasource#"
                                      returnVariable = "progress"
                                      Question = "#question#"
                                      whatFields = "users.userFirst, users.userLast, aprID"
                                      Join = "users">
                            <!---/ Get User Name and APR Id --->
			            			<cfif progress.RecordCount NEQ 0>
			            				#progress.userFirst# #progress.userLast#
			            			</cfif>
			            			
			            		</td>
			            	</tr>
			            </cfif>
			        </cfloop>
			         <!--- Get Custom Questions --->
					  <cfinvoke component = "knex.rfi"
                                method = "get"
                                datasource = "#datasource#"
                                returnVariable = "get"
                                whatFields = "DataRFIQID"
                                Where = "thisAPR">
					  <!---. Get Custom Questions --->
					  <cfif get.RecordCount GT 0>
                        <!--- Get User Name and APR Id --->
                        <cfinvoke component = "knex.aprData"
                                  method = "progressTwo"
                                  datasource = "#datasource#"
                                  returnVariable = "progress"
                                  whatFields = "DataRFIID, inputUserID">
                        <!---/ Get User Name and APR Id --->					  	
					   <tr>
		            		<td>
		            			<a href="#CurrentPage#?project=#URL.project#&APR=#URL.apr#&q=99">Supplemental Questions</a>
		            		</td>
		            		<td>
				              <cfif progress.RecordCount NEQ 0>
				              	<h2><i class="fi-check MakeGreen"></i></h2>
				              <cfelse>
				              	<h2><i class="fi-x MakeOrange"></i></h2>
				              </cfif>
		            		</td>
		            		<td>
                                <!--- Get User Name and APR Id --->
                                <cfinvoke component = "knex.aprData"
                                          method = "progressTwo"
                                          datasource = "#datasource#"
                                          returnVariable = "progress"
                                          whatFields = "DataRFIID, userFirst, userLast"
                                          Join = "users">
                                <!---/ Get User Name and APR Id --->
		            			<cfif progress.RecordCount NEQ 0>
		            				#progress.userFirst# #progress.userLast#
		            			</cfif>
		            			
		            		</td>
		            	</tr>
					</cfif>
				</tbody>
			</table>
		</div>
	</div>	
</cfoutput>






    