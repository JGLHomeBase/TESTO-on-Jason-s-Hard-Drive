<!--- Process Updates --->
<cfif FORM.action EQ "new" AND SESSION.authLevel LTE 1>
      <!--- Insert Record --->
      <cfinvoke component="knex.updates" 
          method="new"
          DataSource = "#DataSource#">
      <!---/ Insert Record --->
<cfelseif FORM.action EQ "update" AND SESSION.authLevel LTE 1>
      <!--- Update Record --->
      <cfinvoke component="knex.updates" 
          method="update"
          DataSource = "#DataSource#">
      <!---/ Update Record --->
<cfelseif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
      <!--- Nuke Update --->
    <cfinvoke component="knex.updates" 
            method="nuke"
            DataSource = "#DataSource#"
            returnVariable = "deleteUpdate"
            redshirt = "#FORM.updateID#">
    <!---/ Nuke Update --->
</cfif>
<!---/ Process Updates --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>Recent #AppShortName# Updates</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<!--- Delete Confirm --->
<cfif URL.action EQ "DeleteConfirm" AND SESSION.authLevel LTE 1>
      <!--- Get Update --->
      <cfinvoke component="knex.updates" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUpdate"
            redshirt = "#URL.event#"
            whatFields = "IDName">
      <!---/ Get Update --->

  <div class="row">
    <div class="large-12 columns">
      <br><br>
      <div class="panel BGOrange text-center">
        <h1 class="MakeWhite">WARNING!</h1>
        <p class="MakeWhite">You are about to delete an update. This cannot be undone. Are you sure?</b>
        <cfoutput>
          <form action="#CurrentPage#" method="post">
            <input type="hidden" value="delete" name="action">
            <input type="hidden" value="#getUpdate.updateID#" name="updateID">
            <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
            <input type="submit" value="Delete #getUpdate.updateName#" name="submit" class="button alert">
          </form>
        </cfoutput>
      </div>
    </div>
  </div>
</cfif>
<!---/ Delete Confirm --->

<!--- Get Update --->
<cfinvoke component="knex.updates" 
        method="getAll"
        DataSource = "#DataSource#"
        returnVariable = "getUpdates">
<!---/ Get Update --->


<div class="row">
  
  <div class="medium-9 columns">
    <cfif URL.action EQ "edit" AND SESSION.authLevel LTE 1>
      <cfparam name="URL.event" default="0">
      <!--- Get Update --->
      <cfinvoke component="knex.updates" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getUpdate"
            redshirt = "#URL.event#"
            whatFields = "All">
      <!---/ Get Update --->
      <cfoutput>
        <cfif URL.event EQ 0>
           <h2>Add a New #AppShortName# Update</h2>
        <cfelse>
          <h2>Edit an Update: #getUpdate.updateName#</h2>
        </cfif>
        <form action="#CurrentPage#" method="post" data-abide>
          <div class="row">
            <div class="large-12 columns">
              <label>Headline &mdash; a quick title for the update</label>
              <input type="text" 
                     name="updateName"
                     placeholder="New Program Component Types"
                     value="#getUpdate.updateName#"
                     requried>
              <small class="form-error">Enter a quick title for the update</small>
            </div>
          </div>
          <div class="row">
            <div class="medium-2 columns">
              <label>Update Date</label>
              <input type="text"
                     name="updateDate"
                     placeholder="#DateFormat(ahora,"MM/DD/YYYY")#"
                     value="#DateFormat(getUpdate.updateDate, "MM/DD/YYYY")#"
                     required>
              <small class="form-error">Required</small>

            </div>
            <div class="medium-2 columns">
              <label>Public</label>
              <select name="public"
                      required>
                <option <cfif getUpdate.public EQ "No">selected</cfif> value="No">
                  No
                </option>
                <option <cfif getUpdate.public EQ "Yes">selected</cfif> value="Yes">
                  Yes
                </option>
              </select>
              <small class="form-error">Required</small>

            </div>
            <div class="medium-4 columns">
              <label>Category</label>
              <select name="updatecat"
                      required>
                <option <cfif getUpdate.updatecat EQ "System">selected</cfif> value="System">
                  System
                </option>
                <option <cfif getUpdate.updatecat EQ "Data Structure and Entry">selected</cfif> value="Data Structure and Entry">
                  Data Structure and Entry
                </option>
                <option <cfif getUpdate.updatecat EQ "Reporting">selected</cfif> value="Reporting">
                  Reporting
                </option>
                <option <cfif getUpdate.updatecat EQ "Scoring">selected</cfif> value="Scoring">
                  Scoring
                </option>
              </select>
              <small class="form-error">Pick a category</small>
            </div>
            <div class="medium-4 columns">
              <label>Type of Update</label>
              <select name="updateType"
                      required>
                <option <cfif getUpdate.updateType EQ "Bug Fix">selected</cfif> value="Bug Fix">
                  Bug Fix
                </option>
                <option <cfif getUpdate.updateType EQ "Minor Tweak">selected</cfif> value="Minor Tweak">
                  Minor Tweak
                </option>
                <option <cfif getUpdate.updateType EQ "Major Change">selected</cfif> value="Major Change">
                  Major Change
                </option>
                <option <cfif getUpdate.updateType EQ "New Feature">selected</cfif> value="New Feature">
                 New Feature
                </option>
              </select>
              <small class="form-error">Choose an event type</small>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <label>Update Description</label>
              <textarea name="updateNotes" required>#getUpdate.updateNotes#</textarea>
            </div>
          </div>
          <div class="text-right">
            <cfif URL.event EQ 0>
              <input name="action" type="hidden" value="new">
              <input type="submit" value="add" name="submit" class="small button secondary">
            <cfelse>
              <input name="action" type="hidden" value="update">
              <input type="hidden" value="#getUpdate.updateID#" name="updateID">
              <input type="submit" value="update" name="submit" class="small button secondary">
            </cfif>
          </div>
          <hr>
        </form>
        <hr>
      </cfoutput>
    </cfif>
    <cfif getUpdates.RecordCount GT 0>
       <cfoutput query="getUpdates" maxrows="#maxrows#">
        <div >
          <a name="#getUpdates.updateID#"><h2 class="">#getUpdates.updateName#</h2></a>
        </div
        
        <p>
         
          <b class="MakeDarkGray">#DateFormat(getUpdates.updateDate,"MMM D, YYYY")#</b>
           <span class="MakeDarkGray">| #getUpdates.updateCat# &mdash; #getUpdates.updateType# </span>
          <cfif SESSION.authLevel LTE 1>
             &nbsp;&nbsp;
            <a href="#CurrentPage#?action=edit&event=#getUpdates.updateID#"><i class="fi-pencil"></i></a>
            <span class="MakeDarkGray">|
            <a href="#CurrentPage#?action=deleteConfirm&event=#getUpdates.updateID#"><i class="fi-trash"></i></a>
           </cfif>
        </p>
        <p>#getUpdates.updateNotes#</p>
        <hr>
      </cfoutput>
      <!--- Pagination --->
      <cfset pageRecordCount = getUpdates.RecordCount>
      <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
    <!---/ Pagination --->
    </cfif>
   
  </div>
  <div class="medium-3 columns text=right">
    <!--- Add Update --->
    <cfif SESSION.authLevel LTE 1>
      <cfoutput>
        <a href="#CurrentPage#?action=edit" class="button">New Update</a>
      </cfoutput>
    </cfif>
    <!---/ Add Update --->
  </div>
</div>
