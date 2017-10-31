<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<cfparam name=URL.user default ="0">
<cfif SESSION.authLevel GT 3>
  <cfset URL.user = SESSION.userID>
</cfif>

<!--- Process Form --->
<cfif FORM.action EQ "process" AND FORM.goldenTicket EQ "#SESSION.goldenTicket#">
  <cfif FORM.userID EQ "0" AND SESSION.authLevel LTE 3>
    <!--- New User --->
      <cfinvoke component="knex.users" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New USer --->
  <cfelseif FORM.userID EQ "#SESSION.userID#" OR SESSION.authLevel LTE 3>
    <!--- Update User --->
      <cfinvoke component="knex.users" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update USer --->
  </cfif>
<cfelseif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke User --->
    <cfinvoke component="knex.users" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(URL.user)#">
      <!---/ Nuke User --->   
</cfif>
<!---/ Process Form --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
              <cfif URL.user EQ SESSION.userID>
                My #AppShortName# Account
              <cfelseif URL.action EQ "monitor">
                Active #AppShortName# Users
              <cfelse>
                Manage #AppShortName# Users
              </cfif>
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->


<div class="globalPad">
<div class="row">
  <div class="medium-2 columns">
    <cfoutput>
      <!--- Users Navigation --->
      <ul class="menu vertical">
        <!--- Manage Users --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>#AppShortName# Users</label></li>
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add User</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Users</a></li>
          <cfif SESSION.usercocID EQ 0>
              <li <cfif URL.action EQ "monitor">class="active"</cfif>><a href="#CurrentPage#?action=monitor">Active Users</a></li>
          </cfif>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage Users --->
        <!--- Account Settings --->
        <li><label>My #AppShortName# Account</label></li>
        <li <cfif SESSION.authLevel GT 3 OR URL.user EQ SESSION.userID>class="active"</cfif>><a href="#CurrentPage#?user=#SESSION.userID#">Update Profile</a></li>
        <li><a href="#AbsoluteURL#pages/login.cfm?action=reset">Change Password</a></li>
        <!---/ Account Settings --->
      </ul>
      <!--- Users Navigation --->
  </cfoutput>
  </div>
  <div class="medium-10 columns">
    
    <cfif URL.action EQ "list" OR URL.action EQ "delete">
      <!--- Heading --->
      <div class="row">
        <div class="large-12 columns">
          <h1><cfoutput>#AppShortName# Users</cfoutput></h1>
          <hr>
        </div>
      </div>
      <!---/ Heading --->

      <!--- Delete Confirm --->
      <cfif URL.action EQ "delete" and URL.user NEQ 0>
      <!--- Get User --->
      <cfinvoke component="knex.users" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUser"
            whatFields = "userID, authLevel, userFirst, userLast"
            Where = "ThisUser">
      <!---/ Get User --->
        <cfoutput>
          <div class="panel alert">
            <div class="row">
              <div class="medium-9 columns">
                
                <h3>Are you sure?</h3>
                <p>This will permanently delete #getUser.userFirst# #getUser.userLast#'s #AppShortName# account.</p>
              </div>
               <div class="medium-3 columns text-right">
                <form action="#CurrentPageVar#" method="post">
                  <input type="hidden" value="delete" name="action">
                  <input type="hidden" value="#getUser.userID#" name="userID">
                  <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                  <input type="submit" value="delete #getUser.userFirst#" name="submit" class="button alert">
                </form>
              </div>
            </div>
          </div>
        </cfoutput>
      </cfif>
      <!--- Delete Confirm --->


      <!--- Get User --->
      <cfinvoke component="knex.users" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUser"
            whatFields = "users.userID, users.userFirst, users.userLast, users.userEmail, users.authLevel, users.cocID, users.compID, users.agencyID, users.projectID, coc.cocCity, coc.cocName, agency.agencyName, projects.projectName, comp.compName"
            Join = "LCoCCompAgencyProjects"
            Where = "Depends"
            Order = "coc.cocName, users.compID, users.agencyID, users.projectID, users.authLevel, users.userLast, users.userFirst">
      <!---/ Get User --->

      <!--- List Users --->
      <div class="row">
        <div class="large-12 columns">
         <table width="100%">
          <thead>
            <th><div class="text-center"><i class="fi-camera"></i></div></th>
            <th>Name</th>
            <th>Email</th>
            <cfif SESSION.usercocID EQ 0>
              <th>Scope</th>
            </cfif>
            <th>Settings</th>
            <th class="text-right" width="80">Edit</th>
          </thead>
          <tbody>
            <cfoutput query="getUser"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td class="text-center">
                  <img width="35" 
                         height="35" 
                         class="UserPicSmall"
                         src="http://www.gravatar.com/avatar/#lcase(Hash(lcase(getUser.userEmail)))#?d=#FullURL#img/profile/default75.jpg" 
                         alt="#SESSION.userFirst# #SESSION.userLast#">
              </td>
              <td>#getUser.userFirst# #getUser.userLast#</td>
              <td><a href="mailto:#getUser.userEmail#">#getUser.userEmail#</a></td>
              <cfif SESSION.usercocID EQ 0>
                <cfif getUser.cocID EQ 0>
                  <td>Global</td>
                <cfelseif getUser.cocID NEQ 0 AND compID EQ 0>
                  <td>#getUser.cocCity#</td>
                <cfelseif getUser.compID NEQ 0 AND agencyID EQ 0>
                  <td>#getUser.cocCity# - #getUser.compName#</td>
                <cfelseif getUser.agencyID NEQ 0 AND projectID EQ 0>
                  <td>#getUser.cocCity# - #getUser.agencyName#</td>
                <cfelse>
                  <td>#getUser.cocCity# - #getUser.projectName#</td>
                </cfif>
              </cfif>
              <td>
                <cfif getUser.authLevel LTE 3>
                  <span data-tooltip class="has-tip" title="Manage Users"><i class="fi-torsos-all"></i> &nbsp;</span>
                  <span data-tooltip class="has-tip" title="Edit Data"><i class="fi-pencil"></i> &nbsp;</span>
                  <span data-tooltip class="has-tip" title="Score Projects"><i class="fi-like"></i><i class="fi-dislike"></i> &nbsp;</span>
                  <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                <cfelseif getUser.authLevel EQ 5>
                  <span data-tooltip class="has-tip" title="Edit Data"><i class="fi-pencil"></i> &nbsp;</span>
                  <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                <cfelseif getUser.authLevel EQ 7> 
                  <span data-tooltip class="has-tip" title="Score Projects"><i class="fi-like"></i><i class="fi-dislike"></i> &nbsp;</span>
                  <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                <cfelseif getUser.authLevel LTE 9>
                  <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                </cfif>
              </td>
              <td class="text-right">
                <cfif Session.authLevel LTE 3 OR Session.userID EQ getUser.userID>
                  <cfif getUser.authLevel NEQ 0 OR Session.authLevel EQ 0>
                    <div class="tableLink">
                        <a href="#CurrentPage#?user=#getUser.userID#">
                            <i class="fi-pencil"></i>
                        </a>
                        <cfif SESSION.userID NEQ getUser.userID>
                          &nbsp; | &nbsp;
                          <a href="#CurrentPage#?user=#getUser.userID#&action=delete">
                             <i class="fi-trash"></i>
                          </a>
                        </cfif>
                    </div>
                  </cfif>
                </cfif>
              </td>
            </tr>
            </cfoutput>
          </tbody>
        </table>
        </div>
      </div>
        <!--- Pagination --->
        <cfset pageRecordCount = getUser.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->
      <!---/ List Users --->
    <!--- Active Users --->
    <cfelseif URL.action EQ "monitor" AND SESSION.userCoCID EQ 0 AND SESSION.authLevel LTE 3>
        <cfquery name="getActiveUser">
            SELECT * FROM users 
            LEFT JOIN coc ON users.cocID = coc.cocID
            LEFT JOIN comp ON users.compID = comp.compID
            WHERE
              <cfloop list="#APPLICATION.activeUsers#" index="userID">
                userID = '#userID#' OR
              </cfloop>
                userID = '0'
            ORDER BY loginTime DESC
        </cfquery>
        <cfquery name="totalAPR">
        SELECT DataAPR01ID FROM dataapr01
        </cfquery>
        <cfset totalStaff = 0>
        <cfset totalPanelist = 0>
        <cfloop query="getActiveUser">
          <cfif Right(getActiveUser.userEmail, 15) EQ "homebaseccc.org">
              <cfset totalStaff = totalStaff+1>
          </cfif>
          <cfif getActiveUser.authLevel EQ 7>
              <cfset totalPanelist = totalPanelist+1>
          </cfif>
        </cfloop>
        <br>
        <div class="row">
            <div class="medium-3 columns">
                <cfoutput>
                    <div class="panel text-center">
                        <h1>#NumberFormat(getActiveUser.recordCount,0)#</h1>
                        Total Active #AppShortName# User<cfif getActiveUser.recordCount NEQ 1>s</cfif>
                    </div>
                </cfoutput>
            </div>
            <div class="medium-3 columns">
                <cfoutput>
                    <div class="panel text-center">
                        <h1>#NumberFormat(totalStaff,0)#</h1>
                        HomeBase User<cfif totalStaff NEQ 1>s</cfif>
                    </div>
                </cfoutput>
            </div>
            <div class="medium-3 columns">
                <cfoutput>
                    <div class="panel text-center">
                        <h1>#NumberFormat(totalPanelist,0)#</h1>
                        Panelist<cfif totalPanelist NEQ 1>s</cfif>
                    </div>
                </cfoutput>
            </div>
            <div class="medium-3 columns">
                <cfoutput>
                    <div class="panel text-center">
                        <h1>#NumberFormat(totalAPR.RecordCount,0)#</h1>
                        Project APR<cfif totalAPR.RecordCount NEQ 1>s</cfif>
                    </div>
                </cfoutput>
            </div>
        </div>
        <div class="row">
            <div class="large-12 columns">
             
             <table width="100%">
              <thead>
                
                <th><div class="text-center"><i class="fi-camera"></i></div></th>
                <th>Name</th>
                <th>Email</th>
                <cfif SESSION.usercocID EQ 0>
                  <th>Scope</th>
                </cfif>
                <th>Settings</th>
                <th class="text-right">Last Login</th>
              </thead>
              <tbody>
                <cfoutput query="getActiveUser" startrow="#startRow#" maxrows="#maxrows#">
                <tr>
                  <td class="text-center">
                      <img width="35" 
                             height="35" 
                             class="UserPicSmall"
                             src="http://www.gravatar.com/avatar/#lcase(Hash(lcase(getActiveUser.userEmail)))#?d=#FullURL#img/profile/default75.jpg" 
                             alt="#getActiveUser.userFirst# #getActiveUser.userLast#">
                  </td>
                  <td>#getActiveUser.userFirst# #getActiveUser.userLast#</td>
                  <td><a href="mailto:#getActiveUser.userEmail#">#getActiveUser.userEmail#</a></td>
                  <cfif SESSION.usercocID EQ 0>
                    <cfif getActiveUser.cocID EQ 0>
                      <td>Global</td>
                    <cfelseif getActiveUser.cocID NEQ 0 AND getActiveUser.compID EQ 0>
                      <td>#getActiveUser.cocCity#</td>
                    <cfelseif getActiveUser.compID NEQ 0 AND getActiveUser.agencyID EQ 0>
                      <td>#getActiveUser.cocCity# - #getActiveUser.compName#</td>
                    <cfelseif getActiveUser.agencyID NEQ 0 AND getActiveUser.projectID EQ 0>
                      <td>#getActiveUser.cocCity# - #getActiveUser.agencyName#</td>
                    <cfelse>
                      <td>#getActiveUser.cocCity# - #getActiveUser.projectName#</td>
                    </cfif>
                  </cfif>
                  <td>
                    <cfif getActiveUser.authLevel LTE 3>
                      <span data-tooltip class="has-tip" title="Manage Users"><i class="fi-torsos-all"></i> &nbsp;</span>
                      <span data-tooltip class="has-tip" title="Edit Data"><i class="fi-pencil"></i> &nbsp;</span>
                      <span data-tooltip class="has-tip" title="Score Projects"><i class="fi-like"></i><i class="fi-dislike"></i> &nbsp;</span>
                      <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                    <cfelseif getActiveUser.authLevel EQ 5>
                      <span data-tooltip class="has-tip" title="Edit Data"><i class="fi-pencil"></i> &nbsp;</span>
                      <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                    <cfelseif getActiveUser.authLevel EQ 7> 
                      <span data-tooltip class="has-tip" title="Score Projects"><i class="fi-like"></i><i class="fi-dislike"></i> &nbsp;</span>
                      <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                    <cfelseif getActiveUser.authLevel LTE 9>
                      <span data-tooltip class="has-tip" title="View Reports"><i class="fi-eye"></i> </span>
                    </cfif>
                  </td>
                  <td class="text-right">
                      <span data-tooltip 
                            aria-haspopup="true" 
                            class="has-tip"
                            title="<b>Login Details:</b>
                                   <ul>
                                   <li><i>IP Address:</i> #getActiveUser.loginIP#</li>
                                   <li><i>Browser:</i> #getActiveUser.loginBrowser#</li>
                                   </ul>">
                          #TimeFormat(getActiveUser.loginTime, "h:mm tt")# (#DateDiff("n",getActiveUser.loginTime, now())#<small> MIN AGO</small>)
                      </span>
                      
                  </td>
                </tr>
                </cfoutput>
              </tbody>
            </table>
            </div>
          </div>
            <!--- Pagination --->
            <cfset pageRecordCount = getActiveUser.RecordCount>
            <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
          <!---/ Pagination --->
    <!---/ Active Users --->    
    <cfelse>
      <!--- User Profile --->
          <!--- Get User --->
          <cfinvoke component="knex.users" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getUser"
                whatFields = "*"
                Where = "ThisUser">
          <!---/ Get User --->

      <cfoutput>
          <form action="#CurrentPageVar#" method="post" data-abide>
          <!--- Heading --->
          <div class="row">
            <div class="large-12 columns">
              <cfif URL.user EQ "0">
                <h1>Add User</h1>
              <cfelse>
                <h1>Update Profile</h1>
              </cfif>
              <hr>
            </div>
          </div>
          <!---/ Heading --->
          <div class="row">
              <div class="medium-2 columns text-center">
                  <!--- Profile Picture --->
                  <style>
                      .circlePic {
                            width: 100px;
                            height: 100px;
                            border-radius: 50px;
                            -webkit-border-radius: 50px;
                            -moz-border-radius: 50px;
                            background: url(http://www.gravatar.com/avatar/#lcase(Hash(lcase(getUser.userEmail)))#?s=100&d=#FullURL#img/profile/default100.jpg) no-repeat; 
                        }
                  </style>
                  <div class="circlePic"></div>
                  <cfif URL.user EQ SESSION.userID>
                    <br>
                    <a href="https://en.gravatar.com" target="_blank"><i class="fi-camera"></i> Edit</a>
                  </cfif>
                  <br>
                  <small>Avatars by <a href="https://en.gravatar.com/" target="_blank">Gravatar</a>.</small>
                  <!---/ Profile Picture --->
              </div>
              <div class="medium-10 columns">
                  <!--- Name --->
                  <div class="row">
                    <div class="large-6 columns">
                      <label>First Name</label>
                      <input type="text" name="userFirst" value="#getUser.userFirst#" placeholder="Jane" maxlength="150" required>
                      <small class="form-error">A first name is required</small>
                    </div>
                    <div class="large-6 columns">
                      <label>Last Name</label>
                      <input type="text" name="userLast" value="#getUser.userLast#" maxlength="150" placeholder="Doe" required>
                      <small class="form-error">A last name is required</small>
                    </div>
                  </div>
                  <!---/ Name --->
                  <!--- Email --->
                  <div class="row">
                    <div class="large-6 columns">
                      <label>Email Address</label>
                      <input type="email" name="userEmail" value="#getUser.userEmail#" maxlength="256" placeholder="jane.doe@organization.org" required>
                      <small class="form-error">Enter a valid email address</small>
                    </div>
                    <div class="large-3 columns">
                        <cfif len(getUser.CellPhone) EQ 10>
                           <cfset getUser.CellPhone = "(#left(getUser.CellPhone,3)#) #mid(getUser.CellPhone,4,3)#-#right(getUser.CellPhone,4)#" />
                       </cfif>
                      <label>Cell Phone</label>

                      <input type="tel" name="CellPhone" value="#getUser.CellPhone#" maxlength="12" placeholder="415-555-5555">
                      <small class="form-error">Enter a valid phone number; Numbers only</small>
                    </div>
                    <div class="large-3 columns">
                      <label>Role</label>
                      <cfif SESSION.authLevel GTE GetUser.AuthLevel AND GetUser.AuthLevel NEQ "">
                        <cfset disabledselect = 1>
                      <cfelseif SESSION.userID EQ GetUser.userID>
                        <cfset disabledselect = 1>
                      <cfelse>
                        <cfset disabledselect = 0>
                      </cfif>
                      <select name="FORM.role" <cfif disabledselect EQ "1">disabled</cfif>>
                        <cfif SESSION.authLevel EQ 0 AND SESSION.userID EQ getUser.userID>
                          <option value="0" selected>Root</option>
                        </cfif>
                        <cfif SESSION.authLevel LT 1 AND GetUser.authLevel EQ 1>
                          <option value="1" selected>Super Administrator</option>
                        <cfelseif SESSION.authLevel LT 1>
                          <option value="1">Super Administrator</option>
                        </cfif>
                        <cfif SESSION.authLevel LT 3 AND GetUser.authLevel EQ 3>
                          <option value="3" selected>Administrator</option>
                        <cfelseif SESSION.authLevel LT 3>
                          <option value="3">Administrator</option>
                        </cfif>
                        <cfif SESSION.authLevel LT 5 AND GetUser.authLevel EQ 5>
                          <option value="5" selected>Editor</option>
                        <cfelseif SESSION.authLevel LT 5>
                          <option value="5">Editor</option>
                        </cfif>
                        <option value="6" #getUser.authLevel EQ 6 ? "selected":""#>Respondent</option>
						<option value="7" #getUser.authLevel EQ 7 ? "selected":""#>Panelist</option>
                        <option value="9" #getUser.authLevel EQ 9 OR getUser.authLevel EQ "" ? "selected":""#>Viewer</option>
                      </select>
                    </div>
                  </div>
                  <!---/ Email --->
              </div>
          </div>
        
        <div class="row">
            <div class="large-12 columns">
                <hr>    
            </div>
        </div>
          <!--- Password --->
          <cfif URL.user NEQ SESSION.userID>
            <div class="row">
              <div class="large-4 columns">
                <cfif URL.user EQ 0>
                  <label>Password</label>
                <cfelse>
                  <label>Set New Password</label>
                </cfif>
               
                <input type="password" name="userPassword" id="Password" maxlength="512">
              </div>
              <div class="large-4 columns">
                <cfif URL.user EQ 0>
                  <label>Confirm Password</label>
                <cfelse>
                  <label>Confirm New Password</label>
                </cfif>
                <input type="password" name="confirmpassword" data-equalto="Password" maxlength="512">
                <small class="form-error">Passwords do not match.</small>
              </div>
              <div class="large-4 columns">
                <label>Force Password Change</label>
                <select name="requireReset">
                  <option value="1">Yes</option>
                  <option value="0" selected>No</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="large-12 columns">
                <hr>
              </div>
            </div>
          </cfif>
          <!---/ Password --->
          <!--- CoC --->
            <cfif disabledselect EQ 0 AND SESSION.usercocID EQ 0>
              <!--- Get CoC List --->
              <cfinvoke component="knex.cocs" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getCoC"
                    whatFields = "cocID, cocLongName"
                    Where = "Active"
                    Order = "cocName ASC">
              <!---/ Get CoC List --->        
            <div class="row">
              <div class="large-12 columns">
                <label>Limit access to a single CoC</label>
                <select name="cocID" <cfif SESSION.usercocID NEQ 0>disabled</cfif>>
                  <option value="0"<cfif getUser.cocID EQ 0>selected</cfif>>
                    Global Access
                  </option>
                  <cfloop query="getCoC">
                    <option value="#getCoC.cocID#"<cfif getUser.cocID EQ getCoC.cocID>selected</cfif>>
                      #getCoC.cocLongName#
                    </option>
                  </cfloop>
                </select>
              </div>
            </div>
          <cfelse>
            <input type="hidden" name="cocID" value="#getUser.cocID#">
          </cfif>
          <!---/ CoC --->
          <!--- Comp --->
          <cfif disabledselect EQ 0 AND SESSION.usercompID EQ 0>
              <!--- Get Comp List --->
              <cfinvoke component="knex.comp" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getCompList"
                    Join = "LCoC"
                    whatFields = "comp.compLongName, comp.compID, coc.cocCity"
                    Where = "SessionCoCActive"
                    Order = "cocCity, compLongName">
              <!---/ Get Comp List --->             

            <div class="row">
              <div class="large-12 columns">
                <label>Limit access to a single competition</label>
                <select name="compID" <cfif SESSION.usercompID NEQ 0>disabled</cfif>>
                  <option value="0"<cfif getUser.compID EQ 0>selected</cfif>>
                    All Competitions
                  </option>
                  <cfloop query="getCompList">
                    <option value="#getCompList.compID#"<cfif getUser.compID EQ getCompList.compID>selected</cfif>>
                      <cfif SESSION.usercocID EQ 0>
                        #getCompList.cocCity# - 
                      </cfif>
                      #getCompList.compLongName#
                    </option>
                  </cfloop>
                </select>
              </div>
            </div>
          <cfelse>
            <input type="hidden" name="compID" value="#getUser.compID#">
          </cfif>
          <!---/ Comp --->
          <!--- Agency --->
          <cfif disabledselect EQ 0 AND SESSION.useragencyID EQ 0>
    
              <!--- Get Agency List --->
              <cfinvoke component="knex.agency" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getAgencies"
                    whatFields = "agency.agencyLongName, agency.cocID, agency.agencyID, coc.cocCity"
                    Join = "LCoC"
                    Where = "SessionCoCActive"
                    Order = "cocCity, agencyLongName">
              <!---/ Get Agency List --->

            <div class="row">
              <div class="large-12 columns">
                <label>Limit access to a single agency</label>
                <select name="agencyID" <cfif SESSION.useragencyID NEQ 0>disabled</cfif>>
                  <option value="0"<cfif getUser.agencyID EQ 0>selected</cfif>>
                    All Agencies
                  </option>
                  <cfloop query="getAgencies">
                    <option value="#getAgencies.agencyID#"<cfif getUser.agencyID EQ getAgencies.agencyID>selected</cfif>>
                      <cfif SESSION.usercocID EQ 0>
                        #getAgencies.cocCity#
                      </cfif>
                      #getAgencies.agencyLongName#
                    </option>
                  </cfloop>
                </select>
              </div>
            </div>
          <cfelse>
            <input type="hidden" name="agencyID" value="#getUser.agencyID#">
          </cfif>
          <!---/ Agency --->
          <!--- projects --->
          <cfif disabledselect EQ 0 AND SESSION.userprojectID EQ 0>
              <!--- Get Project List --->
              <cfinvoke component="knex.projects" 
                    method="getList"
                    DataSource = "#DataSource#"
                    returnVariable = "getProjectList"
                    whatFields ="Legion"
                    Join = "LCoCAgency"
                    Where = "Active"
                    Order = "CityAgencyLongName">
              <!---/ Get Project List --->

            <div class="row">
              <div class="large-12 columns">
                <label>Limit access to a single project</label>
                <select name="projectID" <cfif SESSION.userprojectID NEQ 0>disabled</cfif>>
                  <option value="0"<cfif getUser.projectID EQ 0>selected</cfif>>
                    All Projects
                  </option>
                  <cfloop query="getprojectList">
                    <option value="#getprojectList.projectID#"<cfif getUser.projectID EQ getprojectList.projectID>selected</cfif>>
                      <cfif SESSION.usercocID EQ 0>
                        #getprojectList.cocCity# 
                      </cfif>
                      #getprojectList.projectLongName#
                    </option>
                  </cfloop>
                </select>
              </div>
            </div>
          <cfelse>
            <input type="hidden" name="projectID" value="#getUser.projectID#">
          </cfif>
          <!---/ projects --->

          <!--- Submit --->
          <div class="row">
            <div class="large-12 columns text-right">
            <div class="large-12 columns text-right">
              <input type="hidden" value="process" name="action">
              <cfif getUser.userID NEQ "">
                <input type="hidden" value="#getUser.userID#" name="userID">
              <cfelse>
                <input type="hidden" value="0" name="userID">
              </cfif>
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif getUser.userID EQ "">
                 <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                 <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
             
            </div>
          </div>
          <!---/ Submit --->
        </form>
        <cfif getUser.loginTime NEQ "">
            <div class="row">
                <div class="large-12 columns">
                    <div class="panel">
                        <p>
                            </p><b>Last Login</b><br>
                            <cfif getUser.userID EQ SESSION.userID>You<cfelse>#getuser.userFirst#</cfif> last logged into #appShortName# on #DateFormat(getuser.loginTime, "DDDD, MMMM D, YYYY")# at #TimeFormat(getUser.loginTime,"h:m tt")# from #getUser.loginIP#.
                        </p>
                    </div>
                </div>
            </div>
        </cfif>
        </div>
      </cfoutput>
      <!---/ User Profile --->
    </cfif>
    
  </div>
</div>
</div>