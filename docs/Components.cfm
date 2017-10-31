<cfoutput>
    <!--- Heading --->
    <div class="row">
        <div class="large-12 columns">
            <h1>#AppShortName# Components</h1>
        </div>
    </div>
    <!---/ Heading --->
    

    <!--- Sub Nav --->
    <div class="row">
        <div class="large-12 columns">
            <hr>
            <div data-magellan-expedition="fixed" id="magellan_bar"> 
              <dl class="sub-nav">
                    <dd data-magellan-arrival="Agency"><a href="##Agency">Agency</a></dd>
                    <dd data-magellan-arrival="aprData"><a href="##aprData">aprData</a></dd>
                    <dd data-magellan-arrival="aprSet"><a href="##aprSet">aprSet</a></dd>
                    <dd data-magellan-arrival="CoCs"><a href="##CoCs">CoCs</a></dd>
                    <dd data-magellan-arrival="Competitions"><a href="##Competitions">Competitions</a></dd>
                    <dd data-magellan-arrival="Component"><a href="##Component">Component</a></dd>
                    <dd data-magellan-arrival="CustomGoals"><a href="##CustomGoals">CustomGoals</a></dd>
                    <dd data-magellan-arrival="DirectLinks"><a href="##DirectLinks">DirectLinks</a></dd>
                    <dd data-magellan-arrival="Docs"><a href="##Docs">Docs</a></dd>
                    <dd data-magellan-arrival="EventLog"><a href="##EventLog">EventLog</a></dd>
                    <dd data-magellan-arrival="Export"><a href="##Export">Export</a></dd>
                    <dd data-magellan-arrival="Field"><a href="##Field">Field</a></dd>
                    <dd data-magellan-arrival="Image"><a href="##Image">Image</a></dd>
                    <dd data-magellan-arrival="Login"><a href="##Login">Login</a></dd>
                    <dd data-magellan-arrival="Modules"><a href="##Modules">Modules</a></dd>
                    <dd data-magellan-arrival="Projects"><a href="##Projects">Projects</a></dd>
                    <dd data-magellan-arrival="Reports"><a href="##Reports">Reports</a></dd>
                    <dd data-magellan-arrival="RFI"><a href="##RFI">RFI</a></dd>
                    <dd data-magellan-arrival="Score"><a href="##Score">Score</a></dd>
                    <dd data-magellan-arrival="ScoreCat"><a href="##ScoreCat">ScoreCat</a></dd>
                    <dd data-magellan-arrival="ScoreFactors"><a href="##ScoreFactors">ScoreFactors</a></dd>
                    <dd data-magellan-arrival="ScoreScales"><a href="##ScoreScales">ScoreScales</a></dd>
                    <dd data-magellan-arrival="Survey"><a href="##Survey">Survey</a></dd>
                    <dd data-magellan-arrival="Table"><a href="##Table">Table</a></dd>
                    <dd data-magellan-arrival="Twilio"><a href="##Twilio">Twilio</a></dd>
                    <dd data-magellan-arrival="Updates"><a href="##Updates">Updates</a></dd>
                    <dd data-magellan-arrival="Users"><a href="##Users">Users</a></dd>
              </dl>
            </div>
            <hr>
        </div>
    </div>
<!---/ Sub Nav --->

    <!--- Agency --->
    <div class="row">
    	<div class="large-12 columns">
            <a name="Agency"></a>
            <h1 data-magellan-destination="Agency">agency.cfc</h1>
    		<table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                	<!--- new --->
                	<tr>
                		<td><b><a href="#CurrentPage#?doc=#URL.doc###Agency_new">New</a></b></td>
                		<td>Creates a new record</td>
                	</tr>
                	<!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Agency_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Agency_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Agency_get">Get</a></b></td>
                        <td>Grabs project component for the current project</td>
                    </tr>
                    <!---/ get --->
                </tbody>
        	</table>
            <!--- new --->
            <a name="Agency_new"></a>
            <h2 class="">agency.cfc | New</h2>
    		<table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                	<!--- DataSource --->
                	<tr>
                		<td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                		<td>ColdFusion DataSource Name</td>
                	</tr>
                	<!---/ DataSource --->
                </tbody>
        	</table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Agency_nuke"></a>
            <h2 class="">agency.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Agency_update"></a>
            <h2 class="">agency.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Agency_get"></a>
            <h2 class="">agency.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Sets which agencies the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Orders the selected agency information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
    	</div>
    </div>
    <!---/ Agency --->
    
    <!--- aprData --->
    <div class="row">
        <div class="large-12 columns">
            <a name="aprData"></a>
            <h1 data-magellan-destination="aprData">aprData.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_get">Get</a></b></td>
                        <td>Grabs the ID for this APR Form</td>
                    </tr>
                    <!---/ get --->
                    <!--- newCheck --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_newCheck">NewCheck</a></b></td>
                        <td>Progress Check</td>
                    </tr>
                    <!---/ newCheck --->
                    <!--- progress --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_progress">Progress</a></b></td>
                        <td>Grabs user name and APR ID</td>
                    </tr>
                    <!---/ progress --->
                    <!--- progressTwo --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_progressTwo">ProgressTwo</a></b></td>
                        <td>Second Progress Check</td>
                    </tr>
                    <!---/ progressTwo --->
                    <!--- tmp --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_tmp">Tmp</a></b></td>
                        <td>Get APR ID from DataAPR Table</td>
                    </tr>
                    <!---/ tmp --->
                    <!--- q7totals --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_q7totals">Q7Totals</a></b></td>
                        <td>Grabs totals from DataAPR07</td>
                    </tr>
                    <!---/ q7totals --->
                    <!--- enter00 --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_enter00">Enter00</a></b></td>
                        <td>Insert and Update APRForm00</td>
                    </tr>
                    <!---/ enter00 --->
                    <!--- enter99 --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprData_enter99">Enter99</a></b></td>
                        <td>Insert and Update APRForm99</td>
                    </tr>
                    <!---/ enter99 --->
                </tbody>
            </table>
            <!--- get --->
            <a name="aprData_get"></a>
            <h2 class="">aprData.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- FormID --->
                    <tr>
                        <td><b>FormID</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ FormID --->
                    <!--- Form --->
                    <tr>
                        <td><b>Form</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what table is queried</td>
                    </tr>
                    <!---/ Form --->
                </tbody>
            </table>
            <!---/ get --->
            <!--- newCheck --->
            <a name="aprData_newCheck"></a>
            <h2 class="">aprData.cfc | NewCheck</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- FormID --->
                    <tr>
                        <td><b>FormID</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ FormID --->
                    <!--- Form --->
                    <tr>
                        <td><b>Form</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what table is queried</td>
                    </tr>
                    <!---/ Form --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets conditions for query</td>
                    </tr>
                    <!---/ Where --->
                </tbody>
            </table>
            <!---/ newCheck --->
            <!--- progress --->
            <a name="aprData_progress"></a>
            <h2 class="">aprData.cfc | Progress</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- Question --->
                    <tr>
                        <td><b>Question</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Identity of local question variable</td>
                    </tr>
                    <!---/ Question --->
                </tbody>
            </table>
            <!---/ progress --->
            <!--- progressTwo --->
            <a name="aprData_progressTwo"></a>
            <h2 class="">aprData.cfc | ProgressTwo</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ progressTwo --->
            <!--- tmp --->
            <a name="aprData_tmp"></a>
            <h2 class="">aprData.cfc | Tmp</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- Question --->
                    <tr>
                        <td><b>Question</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Identity of local question variable</td>
                    </tr>
                    <!---/ Question --->
                </tbody>
            </table>
            <!---/ tmp --->
            <!--- q7totals --->
            <a name="aprData_q7totals">q7totals</a>
            <h2 class="">aprData.cfc | Q7Totals</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ q7totals --->
            <!--- enter00 --->
            <a name="aprData_enter00">enter00</a>
            <h2 class="">aprData.cfc | Enter00</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- newRecord --->
                    <tr>
                        <td><b>newRecord</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>newRecord local variable value</td>
                    </tr>
                    <!---/ newRecord --->
                    <!--- dataAPRID --->
                    <tr>
                        <td><b>dataAPRID</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>DataaprID generated by the newCheck query</td>
                    </tr>
                    <!---/ dataAPRID --->
                </tbody>
            </table>
            <!---/ enter00 --->
            <!--- enter99 --->
            <a name="aprData_enter99"></a>
            <h2 class="">aprData.cfc | Enter99</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- newRecord --->
                    <tr>
                        <td><b>newRecord</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>newRecord local variable value</td>
                    </tr>
                    <!---/ newRecord --->
                    <!--- dataAPRID --->
                    <tr>
                        <td><b>dataAPRID</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>DataaprID generated by the newCheck query</td>
                    </tr>
                    <!---/ dataAPRID --->
                </tbody>
            </table>
            <!---/ enter99 --->
        </div>
    </div>
    <!---/ aprData --->

    <!--- aprSet --->
    <div class="row">
        <div class="large-12 columns">
            <a name="aprSet"></a>
            <h1 data-magellan-destination="aprSet">aprSet.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprSet_new">new</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprSet_nuke">nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprSet_update">update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprSet_get">get</a></b></td>
                        <td>Grabs a list of APR Sets</td>
                    </tr>
                    <!---/ get --->
                    <!--- getQs --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprSet_getQs">getQs</a></b></td>
                        <td>Grabs a list of APR Sets</td>
                    </tr>
                    <!---/ getQs --->
                    <!--- check --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###aprSet_check">check</a></b></td>
                        <td>Grabs APR IDs</td>
                    </tr>
                    <!---/ check --->
                </tbody>
            </table>
            <!--- new --->
            <a name="aprSet_new"></a>
            <h2 class="">aprSet.cfc | new</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="aprSet_nuke"></a>
            <h2 class="">aprSet.cfc | nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="aprSet_update"></a>
            <h2 class="">aprSet.cfc | update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="aprSet_get"></a>
            <h2 class="">aprSet.cfc | get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>0=0</td>
                        <td>Sets which APR sets the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>aprID</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->

            <!--- getQs --->
            <a name="aprSet_getQs"></a>
            <h2 class="">aprSet.cfc | getQs</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- whatAPR --->
                    <tr>
                        <td><b>whatAPR</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets which APR questions the query looks at</td>
                    </tr>
                    <!---/ whatAPR --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ getQs --->

            <!--- check --->
            <a name="aprSet_check"></a>
            <h2 class="">aprSet.cfc | check</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- APRQ --->
                    <tr>
                        <td><b>APRQ</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Identifies APR Q</td>
                    </tr>
                    <!---/ APRQ --->
                </tbody>
            </table>
            <!---/ check --->
        </div>
    </div>
    <!---/ aprSet --->

    <!--- CoCs --->
    <div class="row">
        <div class="large-12 columns">
            <a name="CoCs"></a>
            <h1 data-magellan-destination="CoCs">cocs.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CoCs_new">new</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CoCs_nuke">nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CoCs_update">update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CoCs_get">get</a></b></td>
                        <td>Grabs information about CoCs</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="CoCs_new"></a>
            <h2 class="">cocs.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="CoCs_nuke"></a>
            <h2 class="">cocs.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="CoCs_update"></a>
            <h2 class="">cocs.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="CoCs_get"></a>
            <h2 class="">cocs.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which CoCs the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>CoCID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ CoCs --->

    <!--- Competitions --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Competitions"></a>
            <h1 data-magellan-destination="Competitions">comp.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Competitions_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Competitions_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Competitions_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Competitions_get">Get</a></b></td>
                        <td>Grabs a list of Competitions</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Competitions_new"></a>
            <h2 class="">comp.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Competitions_nuke"></a>
            <h2 class="">comp.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Competitions_update"></a>
            <h2 class="">comp.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Competitions_get"></a>
            <h2 class="">comp.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Sets which competitions the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->

        </div>
    </div>
    <!---/ Comp --->

<!--- Component --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Component"></a>
            <h1 data-magellan-destination="Component">component.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Component_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Component_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Component_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Component_get">Get</a></b></td>
                        <td>Grabs project component for the current project</td>
                    </tr>
                    <!---/ get --->
                    <!--- getThis --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Component_getThis">GetThis</a></b></td>
                        <td>Grabs components from projects</td>
                    </tr>
                    <!---/ getThis --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Component_new"></a>
            <h2 class="">component.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Component_nuke"></a>
            <h2 class="">component.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Component_update"></a>
            <h2 class="">component.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Component_get"></a>
            <h2 class="">component.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which competitions the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>projectComponentID</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->

            <!--- getThis --->
            <a name="Component_getThis"></a>
            <h2 class="">component.cfc | getThis</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getThis --->

        </div>
    </div>
    <!---/ Component --->

    <!--- CustomGoals --->
    <div class="row">
        <div class="large-12 columns">
            <a name="CustomGoals"></a>
            <h1 data-magellan-destination="CustomGoals">customGoals.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CustomGoals_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CustomGoals_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CustomGoals_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###CustomGoals_get">Get</a></b></td>
                        <td>Grabs database fields for custom goals</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="CustomGoals_new"></a>
            <h2 class="">customGoals.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="CustomGoals_nuke"></a>
            <h2 class="">customGoals.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="CustomGoals_update"></a>
            <h2 class="">customGoals.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="CustomGoals_get"></a>
            <h2 class="">customGoals.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which custom goalss the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>customGoalID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ CustomGoals --->

    <!--- DirectLinks --->
    <div class="row">
        <div class="large-12 columns">
            <a name="DirectLinks"></a>
            <h1 data-magellan-destination="DirectLinks">directlinks.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###DirectLinks_update">Update</a></b></td>
                        <td>Updates and existing record</td>
                    </tr>
                    <!---/ update --->
                </tbody>
            </table>
            <!--- update --->
            <a name="DirectLinks_update"></a>
            <h2 class="">directlinks.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                    
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->

                    <!--- ProjectID --->
                    <tr>
                        <td><b>ProjectID</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Project ID generated by getProjects query</td>
                    </tr>
                    <!---/ ProjectID --->
                </tbody>
            </table>
            <!---/ update --->
        </div>
    </div>
    <!---/ Direct Links --->

    <!--- Docs --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Docs"></a>
            <h1 data-magellan-destination="Docs">docs.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Docs_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Docs_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Docs_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Docs_get">Get</a></b></td>
                        <td>Grabs database fields for uploaded documents</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Docs_new"></a>
            <h2 class="">docs.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Docs_nuke"></a>
            <h2 class="">docs.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Docs_update"></a>
            <h2 class="">docs.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Docs_get"></a>
            <h2 class="">docs.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which docs the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>docID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Docs --->

    <!--- DocsP --->
    <div class="row">
        <div class="large-12 columns">
            <a name="DocsP"></a>
            <h1 data-magellan-destination="DocsP">docsP.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###DocsP_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###DocsP_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###DocsP_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                </tbody>
            </table>
            <!--- new --->
            <a name="DocsP_new"></a>
            <h2 class="">docsP.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="DocsP_nuke"></a>
            <h2 class="">docsP.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="DocsP_update"></a>
            <h2 class="">docsP.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->
        </div>
    </div>
    <!---/ DocsP --->

 <!--- EventLog --->
    <div class="row">
        <div class="large-12 columns">
            <a name="EventLog"></a>
            <h1 data-magellan-destination="EventLog">eventLog.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- newEvent --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###EventLog_newEvent">newEvent</a></b></td>
                        <td>Record and display events from the event log</td>
                    </tr>
                    <!---/ newEvent --->
                </tbody>
            </table>
            <!--- newEvent --->
            <a name="EventLog_newEvent"></a>
            <h2 class="">eventLog.cfc | newEvent</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                    
                </thead>
                <tbody>
                    <!--- EventType --->
                    <tr>
                        <td><b>EventType</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>General Information</td>
                        <td>Type of event</td>
                    </tr>
                    <!---/ EventType --->
                    <!--- EventPriority --->
                    <tr>
                        <td><b>EventPriority</b></td>
                        <td>Numeric</td>
                        <td>No</td>
                        <td>7</td>
                        <td>Importance of event on a 1-10 scale</td>
                    </tr>
                    <!---/ EventPriority --->
                    <!--- EventDetail --->
                    <tr>
                        <td><b>EventDetail</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>"none"</td>
                        <td>Detailed description of event</td>
                    </tr>
                    <!---/ EventDetail --->
                    <!--- EventDescription --->
                    <tr>
                        <td><b>EventDescription</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>"none"</td>
                        <td>Brief description of event</td>
                    </tr>
                    <!---/ EventDescription --->
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ newEvent --->
        </div>
    </div>
    <!---/ EventLog --->

<!--- Export --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Export"></a>
            <h1 data-magellan-destination="Export">export.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- getPayload --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Export_getPayload">getPayload</a></b></td>
                        <td>Gets apr data for excel export</td>
                    </tr>
                    <!---/ getPayload --->
                </tbody>
            </table>
            <!--- getPayload --->
            <a name="Export_getPayload"></a>
            <h2 class="">export.cfc | getPayload</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                    
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- WhatFields --->
                    <tr>
                        <td><b>WhatFields</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>*</td>
                        <td>Defines SELECT fields</td>
                    </tr>
                    <!---/ WhatFields --->
                    <!--- From --->
                    <tr>
                        <td><b>From</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines APR data table</td>
                    </tr>
                    <!---/ From --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>projectComponentName, projectLongName</td>
                        <td>Sets order of fields</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ getPayload --->
        </div>
    </div>
    <!---/ Export --->

    <!--- Field --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Field"></a>
            <h1 data-magellan-destination="Field">field.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Field_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Field_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Field_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Field_get">Get</a></b></td>
                        <td>Grabs information for fields</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Field_new"></a>
            <h2 class="">field.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Field_nuke"></a>
            <h2 class="">field.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Field_update"></a>
            <h2 class="">field.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Field_get"></a>
            <h2 class="">field.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what database information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which fields the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>fieldName ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                    <!--- tableID --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>fieldName ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ tableID --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Field --->

    <!--- Image --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Image"></a>
            <h1 data-magellan-destination="Image">img.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Image_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Image_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Image_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Image_get">Get</a></b></td>
                        <td>Grabs project component for the current project</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Image_new"></a>
            <h2 class="">img.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Image_nuke"></a>
            <h2 class="">img.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Image_update"></a>
            <h2 class="">img.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Image_get"></a>
            <h2 class="">img.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which images the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>imgID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Image --->

 <!--- Login --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Login"></a>
            <h1 data-magellan-destination="Login">login.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Login_new">Email</a></b></td>
                        <td>Updates user fields</td>
                    </tr>
                    <!---/ new --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Login_update">Update</a></b></td>
                        <td>Updates password</td>
                    </tr>
                    <!---/ update --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Login_new"></a>
            <h2 class="">login.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- update --->
            <a name="Login_update"></a>
            <h2 class="">login.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->
        </div>
    </div>
    <!---/ Login --->

    <!--- Modules --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Modules"></a>
            <h1 data-magellan-destination="Modules">modules.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Modules_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Modules_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Modules_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Modules_get">Get</a></b></td>
                        <td>Grabs info on modules</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Modules_new"></a>
            <h2 class="">modules.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Modules_nuke"></a>
            <h2 class="">modules.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Modules_update"></a>
            <h2 class="">modules.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Modules_get"></a>
            <h2 class="">modules.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- modID --->
                    <tr>
                        <td><b>modID</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>No</td>
                        <td>Defines Module ID</td>
                    </tr>
                    <!---/ modID --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which agencies the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>ReportModID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Modules --->

<!--- Projects --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Projects"></a>
            <h1 data-magellan-destination="Projects">projects.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_get">Get</a></b></td>
                        <td>Grabs data fields for projects</td>
                    </tr>
                    <!---/ get --->
                    <!--- getProjectA --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_getProjectA">getProjectA</a></b></td>
                        <td>Grabs information for projects for projects.cfm</td>
                    </tr>
                    <!---/ getProjectA --->
                    <!--- getAll --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_getAll">getAll</a></b></td>
                        <td>Grabs information for all projects</td>
                    </tr>
                    <!---/ getAll --->
                    <!--- getActive --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_getActive">getActive</a></b></td>
                        <td>Grabs information for active projects</td>
                    </tr>
                    <!---/ getActive --->
                    <!--- scoreGetProjects --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_scoreGetProjects">scoreGetProjects</a></b></td>
                        <td>Grabs information for projects for score.cfm</td>
                    </tr>
                    <!---/ scoreGetProjects --->
                    <!--- scoreHGetProjects --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_scoreHGetProjects">scoreHGetProjects</a></b></td>
                        <td>Grabs information for projects for scoreHome.cfm</td>
                    </tr>
                    <!---/ scoreHGetProjects --->
                    <!--- getOne --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_getOne">getOne</a></b></td>
                        <td>Grabs information for current project</td>
                    </tr>
                    <!---/ getOne --->
                    <!--- getList --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Projects_getList">getList</a></b></td>
                        <td>Grabs a list of projects</td>
                    </tr>
                    <!---/ getList --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Projects_new"></a>
            <h2 class="">projects.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Projects_nuke"></a>
            <h2 class="">projects.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Projects_update"></a>
            <h2 class="">projects.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Projects_get"></a>
            <h2 class="">projects.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- sortingHat --->
                    <tr>
                        <td><b>sortingHat</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>No</td>
                        <td>Defines sortingHat, which should be getagencies.agencyID</td>
                    </tr>
                    <!---/ sortingHat --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which projects the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>projectID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                </tbody>
            </table>
            <!---/ get --->

            <!--- getProjectA --->
            <a name="Projects_getProjectA"></a>
            <h2 class="">projects.cfc | getProjectA</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getProjectA --->

            <!--- getAll --->
            <a name="Projects_getAll"></a>
            <h2 class="">projects.cfc | getAll</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getAll --->

            <!--- getActive --->
            <a name="Projects_getActive"></a>
            <h2 class="">projects.cfc | getActive</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getActive --->

            <!--- scoreGetProjects --->
            <a name="Projects_scoreGetProjects"></a>
            <h2 class="">projects.cfc | scoreGetProjects</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- cocID --->
                    <tr>
                        <td><b>cocID</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>CoC ID</td>
                    </tr>
                    <!---/ cocID --->
                </tbody>
            </table>
            <!---/ scoreGetProjects --->

            <!--- scoreHGetProjects --->
            <a name="Projects_"></a>
            <h2 class="">projects.cfc | scoreHGetProjects</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- cocID --->
                    <tr>
                        <td><b>cocID</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>CoC ID</td>
                    </tr>
                    <!---/ cocID --->
                </tbody>
            </table>
            <!---/ scoreHGetProjects --->

            <!--- getOne --->
            <a name="Projects_getOne"></a>
            <h2 class="">projects.cfc | getOne</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getOne --->

            <!--- getList --->
            <a name="Projects_getList"></a>
            <h2 class="">projects.cfc | getList</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td></td>
                        <td>No</td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Sets which projects the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ getList --->
        </div>
    </div>
    <!---/ Projects --->

<!--- Reports --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Reports"></a>
            <h1 data-magellan-destination="Reports">reports.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Reports_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Reports_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Reports_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- updateTwo --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Reports_updateTwo">updateTwo</a></b></td>
                        <td>Updates report ID and Payload</td>
                    </tr>
                    <!---/ updateTwo --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Reports_get">Get</a></b></td>
                        <td>Grabs templates and information themabout</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Reports_new"></a>
            <h2 class="">reports.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Reports_nuke"></a>
            <h2 class="">reports.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Reports_update"></a>
            <h2 class="">reports.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- updateTwo --->
            <a name="Reports_updateTwo"></a>
            <h2 class="">reports.cfc | updateTwo</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ updateTwo --->

            <!--- get --->
            <a name="Reports_get"></a>
            <h2 class="">reports.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Sets which templates the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Reports --->

    <!--- RFI --->
    <div class="row">
        <div class="large-12 columns">
            <a name="RFI"></a>
            <h1 data-magellan-destination="RFI">rfi.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###RFI_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###RFI_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###RFI_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###RFI_get">Get</a></b></td>
                        <td>Grabs data fields for RFIs</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="RFI_new"></a>
            <h2 class="">rfi.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="RFI_nuke"></a>
            <h2 class="">rfi.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="RFI_update"></a>
            <h2 class="">rfi.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="RFI_get"></a>
            <h2 class="">rfi.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which RFI records the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>DataRFIQID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ RFI --->

    <!--- Score --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Score"></a>
            <h1 data-magellan-destination="Score">score.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- insert --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Score_insert">Insert</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ insert --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Score_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Score_get">Get</a></b></td>
                        <td>Grabs project scores for the current project</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- insert --->
            <a name="Score_insert"></a>
            <h2 class="">score.cfc | Insert</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- formFields --->
                    <tr>
                        <td><b>formFields</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>List of all Form Fields</td>
                    </tr>
                    <!---/ formFields --->
                </tbody>
            </table>
            <!---/ insert --->

            <!--- update --->
            <a name="Score_update"></a>
            <h2 class="">score.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- formFields --->
                    <tr>
                        <td><b>formFields</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>List of all Form Fields</td>
                    </tr>
                    <!---/ formFields --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Score_get"></a>
            <h2 class="">score.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Score --->

    <!--- ScoreCat --->
    <div class="row">
        <div class="large-12 columns">
            <a name="ScoreCat"></a>
            <h1 data-magellan-destination="ScoreCat">scoreCat.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreCat_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreCat_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreCat_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreCat_get">Get</a></b></td>
                        <td>Grabs score categories for the current project</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="ScoreCat_new"></a>
            <h2 class="">scoreCat.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="ScoreCat_nuke"></a>
            <h2 class="">scoreCat.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="ScoreCat_update"></a>
            <h2 class="">scoreCat.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="ScoreCat_get"></a>
            <h2 class="">scoreCat.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Sets which score categories the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ ScoreCat --->

<!--- ScoreFactors --->
    <div class="row">
        <div class="large-12 columns">
            <a name="ScoreFactors"></a>
            <h1 data-magellan-destination="ScoreFactors">scoreFactors.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreFactors_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreFactors_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreFactors_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                </tbody>
            </table>
            <!--- new --->
            <a name="ScoreFactors_new"></a>
            <h2 class="">scoreFactors.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="ScoreFactors_nuke"></a>
            <h2 class="">scoreFactors.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="ScoreFactors_update"></a>
            <h2 class="">scoreFactors.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->
        </div>
    </div>
    <!---/ ScoreFactors --->

<!--- ScoreScales --->
    <div class="row">
        <div class="large-12 columns">
            <a name="ScoreScales"></a>
            <h1 data-magellan-destination="ScoreScales">scoreScales.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreScales_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreScales_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###ScoreScales_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                </tbody>
            </table>
            <!--- new --->
            <a name="ScoreScales_new"></a>
            <h2 class="">scoreScales.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="ScoreScales_nuke"></a>
            <h2 class="">scoreScales.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="ScoreScales_update"></a>
            <h2 class="">scoreScales.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->
        </div>
    </div>
    <!---/ ScoreScales --->

    <!--- Survey --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Survey"></a>
            <h1 data-magellan-destination="Survey">survey.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Survey_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Survey_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Survey_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Survey_get">Get</a></b></td>
                        <td>Grabs survey questions for the current project</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Survey_new"></a>
            <h2 class="">survey.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Survey_nuke"></a>
            <h2 class="">survey.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Survey_update"></a>
            <h2 class="">survey.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Survey_get"></a>
            <h2 class="">survey.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which survey questions the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>surveyQID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Survey --->

    <!--- Table --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Table"></a>
            <h1 data-magellan-destination="Table">table.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Table_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Table_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Table_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Table_get">Get</a></b></td>
                        <td>Grabs information for a specific table</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Table_new"></a>
            <h2 class="">table.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Table_nuke"></a>
            <h2 class="">table.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Table_update"></a>
            <h2 class="">table.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- get --->
            <a name="Table_get"></a>
            <h2 class="">table.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which agencies the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>tableName</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                    <!--- Question --->
                    <tr>
                        <td><b>Question</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Identity of question</td>
                    </tr>
                    <!---/ Question --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Table --->

    <!--- Twilio --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Twilio"></a>
            <h1 data-magellan-destination="Twilio">twilio.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- sendSMS --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Twilio_sendSMS">sendSMS</a></b></td>
                        <td>Sends a text message</td>
                    </tr>
                    <!---/ sendSMS --->
                </tbody>
            </table>
            <!--- sendSMS --->
            <a name="Twilio_sendSMS"></a>
            <h2 class="">twilio.cfc | sendSMS</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                    
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->

                    <!--- TwilioID --->
                    <tr>
                        <td><b>TwilioID</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Twilio AccountSid</td>
                    </tr>
                    <!---/ TwilioID --->
                    <!--- TwilioAuthToken --->
                    <tr>
                        <td><b>TwilioAuthToken</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Twilio AuthToken</td>
                    </tr>
                    <!---/ TwilioAuthToken --->
                    <!--- Message --->
                    <tr>
                        <td><b>Message</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Message body (max 960 characters)</td>
                        <td>Message body (max 960 characters).</td>
                    </tr>
                    <!---/ Message --->
                    <!--- From --->
                    <tr>
                        <td><b>From</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Number message sent from</td>
                    </tr>
                    <!---/ From --->
                    <!--- To --->
                    <tr>
                        <td><b>To</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Number message sent to</td>
                    </tr>
                    <!---/ To --->
                </tbody>
            </table>
            <!---/ sendSMS --->
        </div>
    </div>
    <!---/ Twilio --->

    <!--- Updates --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Updates"></a>
            <h1 data-magellan-destination="Updates">updates.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Updates_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Updates_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Updates_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Updates_get">Get</a></b></td>
                        <td>Gets info about an update record</td>
                    </tr>
                    <!---/ get --->
                    <!--- getAll --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Updates_getAll">GetAll</a></b></td>
                        <td>Gets info about an update record</td>
                    </tr>
                    <!---/ getAll --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Updates_new"></a>
            <h2 class="">updates.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- update --->
            <a name="Updates_update"></a>
            <h2 class="">updates.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- nuke --->
            <a name="Updates_nuke"></a>
            <h2 class="">updates.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- get --->
            <a name="Updates_get"></a>
            <h2 class="">updates.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td></td>
                        <td>Sets what data fields are selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ get --->

            <!--- getAll --->
            <a name="Updates_getAll"></a>
            <h2 class="">updates.cfc | GetAll</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getAll --->
        </div>
    </div>
    <!---/ Updates --->

    <!--- Users --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Users"></a>
            <h1 data-magellan-destination="Users">users.cfc</h1>
            <table width="100%">
                <thead>
                    <th>Function</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- new --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Users_new">New</a></b></td>
                        <td>Creates a new record</td>
                    </tr>
                    <!---/ new --->
                    <!--- nuke --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Users_nuke">Nuke</a></b></td>
                        <td>Nukes a record</td>
                    </tr>
                    <!---/ nuke --->
                    <!--- update --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Users_update">Update</a></b></td>
                        <td>Updates an existing record</td>
                    </tr>
                    <!---/ update --->
                    <!--- getUser --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Users_getUser">GetUser</a></b></td>
                        <td>Grabs information for all users</td>
                    </tr>
                    <!---/ getUser --->
                    <!--- get --->
                    <tr>
                        <td><b><a href="#CurrentPage#?doc=#URL.doc###Users_get">Get</a></b></td>
                        <td>Grabs project component for the current project</td>
                    </tr>
                    <!---/ get --->
                </tbody>
            </table>
            <!--- new --->
            <a name="Users_new"></a>
            <h2 class="">users.cfc | New</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ new --->

            <!--- nuke --->
            <a name="Users_nuke"></a>
            <h2 class="">users.cfc | Nuke</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- redshirt --->
                    <tr>
                        <td><b>redshirt</b></td>
                        <td>Numeric</td>
                        <td>Yes</td>
                        <td></td>
                        <td>Defines redshirt ID</td>
                    </tr>
                    <!---/ redshirt --->
                </tbody>
            </table>
            <!---/ nuke --->

            <!--- update --->
            <a name="Users_update"></a>
            <h2 class="">users.cfc | Update</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ update --->

            <!--- getUser --->
            <a name="Users_getUser"></a>
            <h2 class="">users.cfc | GetUser</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                </tbody>
            </table>
            <!---/ getUser --->

            <!--- get --->
            <a name="Users_get"></a>
            <h2 class="">users.cfc | Get</h2>
            <table width="100%">
                <thead>
                    <th>Attribute Name</th>
                    <th>Type</th>
                    <th>Required</th>
                    <th>Default</th>
                    <th>Description</th>
                </thead>
                <tbody>
                    <!--- DataSource --->
                    <tr>
                        <td><b>DataSource</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td></td>
                        <td>ColdFusion DataSource Name</td>
                    </tr>
                    <!---/ DataSource --->
                    <!--- whatFields --->
                    <tr>
                        <td><b>whatFields</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>*</td>
                        <td>Sets what information is selected</td>
                    </tr>
                    <!---/ whatFields --->
                    <!--- Join --->
                    <tr>
                        <td><b>Join</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>No</td>
                        <td>Selects what tables to join, and how</td>
                    </tr>
                    <!---/ Join --->
                    <!--- Where --->
                    <tr>
                        <td><b>Where</b></td>
                        <td>String</td>
                        <td>Yes</td>
                        <td>0=0</td>
                        <td>Sets which users the query looks at</td>
                    </tr>
                    <!---/ Where --->
                    <!--- Order --->
                    <tr>
                        <td><b>Order</b></td>
                        <td>String</td>
                        <td>No</td>
                        <td>userID ASC</td>
                        <td>Orders the selected information</td>
                    </tr>
                    <!---/ Order --->
                </tbody>
            </table>
            <!---/ get --->
        </div>
    </div>
    <!---/ Users --->

    
</cfoutput>