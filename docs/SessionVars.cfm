<cfoutput>
    <!--- Heading --->
    <div class="row">
        <div class="large-12 columns">
            <h1>#AppShortName# Session Variables</h1>
        </div>
    </div>
    <!---/ Heading --->
    

    <!--- Sub Nav --->
    <div class="row">
        <div class="large-12 columns">
            <hr>
            <div data-magellan-expedition="fixed" id="magellan_bar"> 
              <dl class="sub-nav">
                    <dd data-magellan-arrival="Navigation"><a href="##Navigation">Navigation</a></dd>
                    <dd data-magellan-arrival="User"><a href="##User">User</a></dd>
                    <dd data-magellan-arrival="Request"><a href="##Request">Request</a></dd>
              </dl>
            </div>
            <hr>
        </div>
    </div>
<!---/ Sub Nav --->

    <!--- Navigation Vars --->
    <div class="row">
    	<div class="large-12 columns">
            <a name="Navigation"></a>
            <h2 data-magellan-destination="Navigation">Navigation</h2>
    		<table width="100%">
                <thead>
                    <th width="5"></th>
                    <th>Variable Name</th>
                    <th>Data Type</th>
                    <th>Default</th>
                    <th>Notes</th>
                </thead>
                <tbody>
                	
                	<!--- cocID --->
                	<tr>
                		<td></td>
                		<td><b>cocID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>Current CoC; Value of 0 prompts user selection</td>
                	</tr>
                	<!---/ cocID --->

                    <!--- cocLongName --->
                    <tr>
                        <td></td>
                        <td><b>cocLongName</b></td>
                        <td>String</td>
                        <td></td>
                        <td>Full name of the current CoC</td>
                    </tr>
                    <!---/ cocLongName --->

                    <!--- cocName --->
                    <tr>
                        <td></td>
                        <td><b>cocName</b></td>
                        <td>String</td>
                        <td></td>
                        <td>Nickname for current CoC</td>
                    </tr>
                    <!---/ cocName --->

                    <!--- cocCity --->
                    <tr>
                        <td></td>
                        <td><b>cocCity</b></td>
                        <td>String</td>
                        <td></td>
                        <td>City or region where current CoC is located</td>
                    </tr>
                    <!---/ cocCity --->

                    <!--- cocState --->
                    <tr>
                        <td></td>
                        <td><b>cocState</b></td>
                        <td>String</td>
                        <td></td>
                        <td>State where current CoC is located</td>
                    </tr>
                    <!---/ cocState --->
                	
                	<!--- compID --->
                	<tr>
                		<td></td>
                		<td><b>compID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>Current competition; Value of 0 prompts user selection</td>
                	</tr>
                	<!---/ compID --->

                </tbody>
        	</table>
    	</div>
    </div>
    <!---/ Navigation Vars --->
    
    <!--- User Vars --->
    <div class="row">
    	<div class="large-12 columns">
    		<a name="User"></a>
            <h2 data-magellan-destination="Navigation">User</h2>
    		<table width="100%">
                <thead>
                    <th width="5"></th>
                    <th>Variable Name</th>
                    <th>Data Type</th>
                    <th>Default</th>
                    <th>Notes</th>
                </thead>
                <tbody>
                	
                	<!--- AuthLevel --->
                	<tr>
                		<td></td>
                		<td><b>authLevel</b></td>
                		<td>Int</td>
                		<td>10</td>
                		<td>User authorization level on a 1-10 scale. Guest users have an authLevel of 10</td>
                	</tr>
                	<!---/ AuthLevel --->

                    <!--- GoldenTicket --->
                    <tr>
                        <td></td>
                        <td><b>goldenTicket</b></td>
                        <td>string</td>
                        <td></td>
                        <td>Session-specific form token used to verify form submissions</td>
                    </tr>
                    <!---/ GoldenTicket --->
                	
                	<!--- Require PW Reset --->
                	<tr>
                		<td></td>
                		<td><b>requireReset</b></td>
                		<td>Boolean</td>
                		<td>0</td>
                		<td>Require user to reset password on next login</td>
                	</tr>
                	<!---/ Require PW Reset --->
                	
                	<!--- Staff --->
                	<tr>
                		<td></td>
                		<td><b>staff</b></td>
                		<td>Boolean</td>
                		<td>0</td>
                		<td>User is a member of the #AppShortName# host organzation staff</td>
                	</tr>
                	<!---/ Staff --->
                	
                	<!--- userID --->
                	<tr>
                		<td></td>
                		<td><b>userID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>UserID of the current user. Guests have a userID of 0</td>
                	</tr>
                	<!---/ userID --->
                	
                	<!--- userFirst --->
                	<tr>
                		<td></td>
                		<td><b>userFirst</b></td>
                		<td>String</td>
                		<td>Guest</td>
                		<td>First name of the current user. Guests have the first name "Guest"</td>
                	</tr>
                	<!---/ userFirst --->
                	
                	<!--- userLast --->
                	<tr>
                		<td></td>
                		<td><b>userLast</b></td>
                		<td>String</td>
                		<td></td>
                		<td>Last name of the current user</td>
                	</tr>
                	<!---/ userLast --->
                	
                	<!--- userEmail --->
                	<tr>
                		<td></td>
                		<td><b>userEmail</b></td>
                		<td>String</td>
                		<td></td>
                		<td>Email address of the current user</td>
                	</tr>
                	<!---/ userEmail --->
                	
                	<!--- usercocID --->
                	<tr>
                		<td></td>
                		<td><b>usercocID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>Restricts user to a specific CoC (referenced by cocID). Value of 0 provides global access.</td>
                	</tr>
                	<!---/ usercocID --->
                	
                	<!--- usercompID --->
                	<tr>
                		<td></td>
                		<td><b>usercompID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>Restricts user to a specific competition (referenced by compID). Value of 0 provides global access.</td>
                	</tr>
                	<!---/ usercompID --->
                	
                	<!--- useragencyID --->
                	<tr>
                		<td></td>
                		<td><b>useragencyID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>Restricts user to a specific project sponsor (referenced by agencyID). Value of 0 provides global access.</td>
                	</tr>
                	<!---/ useragencyID --->
                	
                	<!--- userprojectID --->
                	<tr>
                		<td></td>
                		<td><b>userprojectID</b></td>
                		<td>Int</td>
                		<td>0</td>
                		<td>Restricts user to a specific project (referenced by projectID). Value of 0 provides global access.</td>
                	</tr>
                	<!---/ userprojectID --->
                 </tbody>
        	</table>
    	</div>
    </div>
    <!---/ User Vars --->
    
    
    <!--- Request Vars --->
    <div class="row">
    	<div class="large-12 columns">
            <a name="Request"></a>
            <h2 data-magellan-destination="Request">Request</h2>
    		<table width="100%">
                <thead>
                    <th width="5"></th>
                    <th>Variable Name</th>
                    <th>Data Type</th>
                    <th>Default</th>
                    <th>Notes</th>
                </thead>
                <tbody>
                 	
                	<!--- userIP --->
                	<tr>
                		<td></td>
                		<td><b>userIP</b></td>
                		<td>string</td>
                		<td></td>
                		<td>Current remote IP address</td>
                	</tr>
                	<!---/ userIP --->
                	
                	<!--- SSLConnection --->
                	<tr>
                		<td></td>
                		<td><b>SSLConnection</b></td>
                		<td>Boolean</td>
                		<td></td>
                		<td>Secure port</td>
                	</tr>
                	<!---/ SSLConnection --->
                	
                	<!--- browser --->
                	<tr>
                		<td></td>
                		<td><b>browser</b></td>
                		<td>string</td>
                		<td></td>
                		<td>Browser version</td>
                	</tr>
                	<!---/ browser --->
                </tbody>
        	</table>
    	</div>
    </div>
    <!---/ Request Vars --->
  
</cfoutput>