<!--- Variables --->
<cfparam name=URL.coc default ="#SESSION.cocID#">
<cfif SESSION.authLevel LTE 5 AND URL.action EQ "new">
    <cfset URL.coc = 0>
</cfif>
<cfif SESSION.usercocID NEQ 0>
  <cfset URL.coc = #SESSION.usercocID#>
</cfif>
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
      <!--- Get CoCs --->
      <cfinvoke component="knex.cocs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getCoC"
            whatFields = "coc.cocID, coc.cocLongName"
            Where = "ThisCoC">
      <!---/ Get CoCs --->
  <cfif getCoC.RecordCount EQ 1>
      <!--- Nuke Agency --->
        <cfinvoke component="knex.cocs" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.cocID)#">
      <!---/ Nuke Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "CoC deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.cocID EQ 0 AND SESSION.authLevel LTE 3 AND SESSION.usercocID EQ 0>
    <!--- New CoC --->
      <cfinvoke component="knex.cocs" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New CoC --->  
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.cocLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.cocID NEQ 0 AND SESSION.authLevel LTE 3 AND SESSION.usercocID EQ 0>
    <!--- Update CoC --->
      <cfinvoke component="knex.cocs" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update CoC --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.cocLongName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
              <cfif SESSION.userCoCID EQ 0>
                Manage CoCs
              <cfelse>
                CoC Settings
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
      <!--- CoC Navigation --->
      <ul class="menu vertical">
        <cfif URL.coc NEQ 0>
            <li><label>Update CoC</label></li>
            <li><a href="#CurrentPage#?coc=#URL.coc#">CoC Settings</a></li>
            <li><label>Banner Images</label></li>
            <li><li><a href="#AbsoluteURL#pages/secure/img.cfm?action=new">Upload New Image</a></li></li>
            <li><li><a href="#AbsoluteURL#pages/secure/img.cfm?action=list">Manage Images</a></li></li>
            <hr>
        </cfif>
        <!--- Manage CoCs --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>CoCs</label></li>
          <cfif  SESSION.usercocID EQ 0>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add CoC</a></li>
          </cfif>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage CoCs</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage CoCs --->
      </ul>
      <!--- CoC Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list" AND SESSION.usercocID EQ 0>
      <!--- List --->
      <!--- Get CoCs --->
      <cfinvoke component="knex.cocs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getCoC"
            whatFields = "*"
            Where = "Active"
            Order = "cocLongName ASC">
      <!---/ Get CoCs --->

      <h1>Continuums of Care</h1>
      <table width="100%">
        <thead>
          <th>Continuum</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getCoC">
            <tr>
              <td>
                <b>#getCoC.cocLongName#</b> (#getCoC.cocName#)
              </td>
              <cfif SESSION.authLevel LTE 5>
                <td>
                    <div class="tableLink">
                      <a href="#CurrentPage#?action=cocswitch&coc=#getCoC.cocID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?coc=#getCoC.cocID#&action=delete">
                           <i class="fi-trash"></i>
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.coc NEQ "" AND SESSION.authLevel LTE 1>
      <!--- Get CoCs --->
      <cfinvoke component="knex.cocs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getCoC"
            whatFields = "coc.cocID, coc.cocLongName, agency.agencyLongName"
            Where = "Children">
      <!---/ Get CoCs --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite"><b>Hold up.</b> You are about to delete an entire community. <b>This cannot be undone. Are you sure?</b></p> <p class="MakeWhite"><b>You will also delete the following agencies, and ALL of their projects:</b></p> <cfloop query="getCoC"><p class="MakeWhite"><cfoutput>#getCoC.agencyLongName#</cfoutput><br></p></cfloop></b>
        <cfinvoke component="knex.cocs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getCoC"
            whatFields = "coc.cocID, coc.cocLongName"
            Where = "ThisCoC">
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getCoC.cocID#" name="cocID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete the #getCoC.cocLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- CoC Profile Form --->
      <!--- Get CoCs --->
      <cfinvoke component="knex.cocs" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getCoC"
            whatFields = "*"
            Where = "ThisCoC">
      <!---/ Get CoCs --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.coc EQ 0>
            <h1>Add a Continuum</h1>
          <cfelse>
            <h1>Update Continuum Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <cfform method="post" action="#CurrentPage#" data-abide>
        <div class="row">
            <div class="large-12 columns">
                <h3>Continuum  Info</h3>
            </div>    
        </div>
          <div class="row">
            <div class="large-9 columns">
              <label>Full Name of CoC</label>
              <input type="text" 
                     name="cocLongName" 
                     value="#getCoC.cocLongName#" 
                     placeholder="Springfield Homeless Coordinating Board"
                     maxlength="256"
                     required>
              <small class="form-error">Enter the full name of the CoC</small>
            </div>
            <div class="large-3 columns">
              <label>Nickname for CoC</label>
              <input type="text" 
                     name="cocName" 
                     value="#getCoC.cocName#"
                     placeholder="SHCB"
                     maxlength="64"
                     required>
              <small class="form-error">Enter a nickname for the CoC</small>
            </div>
          </div>
          <div class="row">
            <div class="large-6 columns">
              <label>City or Region</label>
              <input type="text" 
                     name="CoCCity" 
                     value="#getCoC.CoCCity#" 
                     placeholder="Springfield"
                     maxlength="128"
                     required>
              <small class="form-error">Enter city or region where the CoC is located</small>
            </div>
            <div class="large-3 columns">
              <label>State</label>
              <select name="CoCState" required>
                <option value="AL" <cfif getCoC.CoCState EQ "AL">SELECTED</cfif>>Alabama</option>
                <option value="AK" <cfif getCoC.CoCState EQ "AK">SELECTED</cfif>>Alaska</option>
                <option value="AZ" <cfif getCoC.CoCState EQ "AZ">SELECTED</cfif>>Arizona</option>
                <option value="AR" <cfif getCoC.CoCState EQ "AR">SELECTED</cfif>>Arkansas</option>
                <option value="CA" <cfif getCoC.CoCState EQ "CA" OR getCoC.CoCState EQ "">SELECTED</cfif>>California</option>
                <option value="CO" <cfif getCoC.CoCState EQ "CO">SELECTED</cfif>>Colorado</option>
                <option value="CT" <cfif getCoC.CoCState EQ "CT">SELECTED</cfif>>Connecticut</option>
                <option value="DE" <cfif getCoC.CoCState EQ "DE">SELECTED</cfif>>Delaware</option>
                <option value="FL" <cfif getCoC.CoCState EQ "FL">SELECTED</cfif>>Florida</option>
                <option value="GA" <cfif getCoC.CoCState EQ "GA">SELECTED</cfif>>Georgia</option>
                <option value="HI" <cfif getCoC.CoCState EQ "HI">SELECTED</cfif>>Hawaii</option>
                <option value="ID" <cfif getCoC.CoCState EQ "ID">SELECTED</cfif>>Idaho</option>
                <option value="IL" <cfif getCoC.CoCState EQ "IL">SELECTED</cfif>>Illinois</option>
                <option value="IN" <cfif getCoC.CoCState EQ "IN">SELECTED</cfif>>Indiana</option>
                <option value="IA" <cfif getCoC.CoCState EQ "IA">SELECTED</cfif>>Iowa</option>
                <option value="KS" <cfif getCoC.CoCState EQ "KS">SELECTED</cfif>>Kansas</option>
                <option value="KY" <cfif getCoC.CoCState EQ "KY">SELECTED</cfif>>Kentucky</option>
                <option value="LA" <cfif getCoC.CoCState EQ "LA">SELECTED</cfif>>Louisiana</option>
                <option value="ME" <cfif getCoC.CoCState EQ "ME">SELECTED</cfif>>Maine</option>
                <option value="MD" <cfif getCoC.CoCState EQ "MD">SELECTED</cfif>>Maryland</option>
                <option value="MA" <cfif getCoC.CoCState EQ "MA">SELECTED</cfif>>Massachusetts</option>
                <option value="MI" <cfif getCoC.CoCState EQ "MI">SELECTED</cfif>>Michigan</option>
                <option value="MN" <cfif getCoC.CoCState EQ "MN">SELECTED</cfif>>Minnesota</option>
                <option value="MS" <cfif getCoC.CoCState EQ "MS">SELECTED</cfif>>Mississippi</option>
                <option value="MO" <cfif getCoC.CoCState EQ "MO">SELECTED</cfif>>Missouri</option>
                <option value="MT" <cfif getCoC.CoCState EQ "MT">SELECTED</cfif>>Montana</option>
                <option value="NE" <cfif getCoC.CoCState EQ "NE">SELECTED</cfif>>Nebraska</option>
                <option value="NV" <cfif getCoC.CoCState EQ "NV">SELECTED</cfif>>Nevada</option>
                <option value="NH" <cfif getCoC.CoCState EQ "NH">SELECTED</cfif>>New Hampshire</option>
                <option value="NJ" <cfif getCoC.CoCState EQ "NJ">SELECTED</cfif>>New Jersey</option>
                <option value="NM" <cfif getCoC.CoCState EQ "NM">SELECTED</cfif>>New Mexico</option>
                <option value="NY" <cfif getCoC.CoCState EQ "NY">SELECTED</cfif>>New York</option>
                <option value="NC" <cfif getCoC.CoCState EQ "NC">SELECTED</cfif>>North Carolina</option>
                <option value="ND" <cfif getCoC.CoCState EQ "ND">SELECTED</cfif>>North Dakota</option>
                <option value="OH" <cfif getCoC.CoCState EQ "OH">SELECTED</cfif>>Ohio</option>
                <option value="OK" <cfif getCoC.CoCState EQ "OK">SELECTED</cfif>>Oklahoma</option>
                <option value="OR" <cfif getCoC.CoCState EQ "OR">SELECTED</cfif>>Oregon</option>
                <option value="PA" <cfif getCoC.CoCState EQ "PA">SELECTED</cfif>>Pennsylvania</option>
                <option value="RI" <cfif getCoC.CoCState EQ "RI">SELECTED</cfif>>Rhode Island</option>
                <option value="SC" <cfif getCoC.CoCState EQ "SC">SELECTED</cfif>>South Carolina</option>
                <option value="SD" <cfif getCoC.CoCState EQ "SD">SELECTED</cfif>>South Dakota</option>
                <option value="TN" <cfif getCoC.CoCState EQ "TN">SELECTED</cfif>>Tennessee</option>
                <option value="TX" <cfif getCoC.CoCState EQ "TX">SELECTED</cfif>>Texas</option>
                <option value="UT" <cfif getCoC.CoCState EQ "UT">SELECTED</cfif>>Utah</option>
                <option value="VT" <cfif getCoC.CoCState EQ "VT">SELECTED</cfif>>Vermont</option>
                <option value="VA" <cfif getCoC.CoCState EQ "VA">SELECTED</cfif>>Virginia</option>
                <option value="WA" <cfif getCoC.CoCState EQ "WA">SELECTED</cfif>>Washington</option>
                <option value="WV" <cfif getCoC.CoCState EQ "WV">SELECTED</cfif>>West Virginia</option>
                <option value="WI" <cfif getCoC.CoCState EQ "WI">SELECTED</cfif>>Wisconsin</option>
                <option value="WY" <cfif getCoC.CoCState EQ "WY">SELECTED</cfif>>Wyoming</option>
              </select>
              <small class="form-error">Select a state</small>
            </div>
            <div class="large-3 columns">
              <label>HUD CoC Number</label>
              <input type="text" 
                     name="HUDCoCID" 
                     value="#getCoC.HUDCoCID#" 
                     placeholder="CA-501"
                     maxlength="32">
              <small class="form-error">HUD CoC number</small>
            </div>
          </div>
          <div class="row">
            <div class="medium-3 columns">
              <!--- profileEnable --->
                <label>Enable Public Profile</label>
                <select name="profileEnable" required>
                       <option value="1" <cfif getCoC.profileEnable EQ 1>selected</cfif>>Yes</option>
                       <option value="0" <cfif getCoC.profileEnable EQ 0>selected</cfif>>No</option>
                </select>
                <!---/ profileEnable --->
            </div>
            <div class="medium-9 columns">
              <label>CoC Website URL</label>
              <input type="text"
                     name="CoCURL"
                     value="#getCoC.CoCURL#"
                     placeholder="https://springfieldhomeless.org"
                     pattern="url"
                     maxlength="256">
              <small class="form-error">Enter the full URL of the continuum</small>
            </div>
          </div>
          <div class="row">
              <div class="large-12 columns">
                <hr>
                <h3>Continuum  Profile (Public)</h3>
                <cftextarea name="profileBody" height="420" id="txtContent" richtext="true" toolbar="Basic">#getCoC.profileBody#</cftextarea>
              </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.coc#" name="cocID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.coc EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </cfform>
      </cfoutput>
      <!---/ CoC Profile Form --->
    </cfif>
    </div>
  </div>
</div>