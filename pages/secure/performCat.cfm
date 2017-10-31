<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name=URL.performCat.cfm default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 1>
  <cfquery datasource="#datasource#" name="getperformcat">
    SELECT pmCatID, pmCatLongName FROM performcat WHERE pmCatID = <cfqueryparam value="#FORM.pmCatID#">
  </cfquery>
  <cfif getperformcat.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deletecomp">
      DELETE FROM performcat WHERE pmCatID = <cfqueryparam value="#getperformcat.pmCatID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted #getperformcat.pmCatLongName#"
          EventDesc = "Performance Category Deleted" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Performance Category deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND FORM.pmCatID EQ 0 AND SESSION.authLevel LTE 1>
  <cfset FORM.cocID = SESSION.cocID>
  <cfinsert datasource="#datasource#" tablename="performcat" formfields="parentID, pmCatLongName, pmCatName, pmCatDesc, pmCatDetail">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new performance category (#FORM.pmCatLongName#)"
          EventDesc = "New Performance Category" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.pmCatLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.pmCatID NEQ 0 AND SESSION.authLevel LTE 1>
  <cfupdate datasource="#datasource#" tablename="performcat" formfields="pmCatID, parentID, pmCatLongName, pmCatName, pmCatDesc, pmCatDetail">
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "New" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) created a new performance category (#FORM.pmCatLongName#)"
          EventDesc = "New Performance Category" >
      <!---/ Log Event --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.pmCatLongName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Performance Categories
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
      <!--- Navigation --->
      <ul class="menu vertical">
        <!--- Manage --->
        <cfif SESSION.authLevel LTE 1>
          <cfif SESSION.authLevel LTE 1>
          <li><label>Performance Categories</label></li>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="performCat.cfm?action=new">Add Performance Category</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="performCat.cfm?action=list">Manage Performance Category</a></li>
          <li class="divider"></li>
          <li><label>Measurement Groups</label></li>
            <li><a href="performGroup.cfm?action=new">Add Measurement Group</a></li>
            <li><a href="performGroup.cfm?action=list">Manage Measurement Group</a></li>
          <li class="divider"></li>
            <li><label>Performance Measures</label></li>
          <li><a href="performMeasure.cfm?action=new">Add Performance Measure</a></li>
          <li><a href="performMeasure.cfm?action=list">Manage Performance Measure</a></li>
          <li class="divider"></li>
        </cfif>
        </cfif>
        <!---/ Manage --->
      </ul>
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <cfquery datasource="#datasource#" name="getperformcat">
        SELECT * from performcat
        WHERE active = '1' AND parentID = '0'
        ORDER BY pmCatLongName ASC
      </cfquery>
      <cfoutput><h1>Performance Categories</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Performance Category</th>
          <cfif SESSION.authLevel LTE 1>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getperformcat"  startrow="#startRow#" maxrows="#maxrows#">
            <!--- Get Kids --->
            <cfquery datasource="#datasource#" name="getKids">
            SELECT * from performcat
            WHERE active = '1' AND parentID = <cfqueryparam value="#getperformcat.pmCatID#">
            ORDER BY pmCatLongName ASC
            </cfquery>
            <!---/ Get Kids --->
            <tr>
              <td><b>#getperformcat.pmCatLongName#</b></td>
              <cfif SESSION.authLevel LTE 1>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?performCat.cfm=#getperformcat.pmCatID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <cfif getKids.RecordCount EQ 0>
                            <a href="#CurrentPage#?performCat.cfm=#getperformcat.pmCatID#&action=delete">
                                <i class="fi-trash"></i>
                            </a>
                        <cfelse>
                            <i class="fi-trash"></i>
                        </cfif>
                      </cfif>
                    </div>
                </td>
              </cfif>
            </tr>
            <!--- Show Kids --->
            <cfloop query="getKids">
                <tr>
                  <td>
                      <span class="MakeGray">#getperformcat.pmCatLongName#: </span>
                      #getKids.pmCatLongName#
                  </td>
                  <cfif SESSION.authLevel LTE 1>
                    <td class="text-right">
                        <div class="tableLink">
                          <a href="#CurrentPage#?performCat.cfm=#getKids.pmCatID#">
                             <i class="fi-pencil"></i>
                          </a>

                          <cfif SESSION.authLevel LTE 1>
                            &nbsp; | &nbsp;
                            <a href="#CurrentPage#?performCat.cfm=#getKids.pmCatID#&action=delete">
                               <i class="fi-trash"></i>
                            </a></cfif>
                        </div>
                    </td>
                  </cfif>
                </tr>
            </cfloop>    
            <!---/  Kids --->
          </cfoutput>
        </tbody>
      </table>
      <!--- Pagination --->
        <cfset pageRecordCount = getperformcat.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.performCat.cfm NEQ "" AND SESSION.authLevel LTE 1>
      <cfquery datasource="#datasource#" name="getperformcat">
          SELECT pmCatID, pmCatLongName FROM performcat WHERE pmCatID = <cfqueryparam value="#URL.performCat.cfm#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a performance category. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getperformcat.pmCatID#" name="pmCatID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getperformcat.pmCatLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- Profile Form --->
      <cfquery datasource="#datasource#" name="getperformcat">
        SELECT * FROM performcat WHERE pmCatID = <cfqueryparam value="#URL.performCat.cfm#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.performCat.cfm EQ 0>
            <h1>Add a Performance Category</h1>
          <cfelse>
            <h1>Update Performance Category Profile</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-8 columns">
              <label>Performance Category</label>
              <input type="text" 
                     name="pmCatLongName" 
                     value="#getperformcat.pmCatLongName#" 
                     placeholder=""
                     required>
              <small class="form-error"></small>
            </div>
            <div class="medium-4 columns">
              <label>Category Nickname</label>
                <input type="text"
                       name="pmCatName"
                       value="#getperformCat.pmCatName#"
                       placeholder="Performance Measure Category Nickname"
                       required
                      maxlength="128">
                <small class="form-error">This field is requried</small>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
            <label>Parent Cateogry</label>
            <cfquery datasource="#datasource#" name="getParents">
            SELECT pmCatID, pmCatLongName FROM performcat WHERE parentID = '0'
          </cfquery>
            <select name="parentID">
                <cfif getPerformCat.ParentID EQ 0>
                    <cfset selected = " selected">
                <cfelse>
                    <cfset selected = "">
                </cfif>
                <option value="0"#selected#>
                    None (Top-Level Category)
                </option>
                <cfloop query="getParents">
                     <cfif getPerformCat.ParentID EQ getParents.pmCatID>
                        <cfset selected = " selected">
                    <cfelse>
                        <cfset selected = "">
                    </cfif>
                    <option value="#getParents.pmCatID#"#selected#>
                        #getParents.pmCatLongName#
                    </option>   
                </cfloop>
            </select>
            </div>  
          </div>
          <div class="row">
            <div class="large-12 columns">
            <label>Description of Performance Measure Category</label>
            <input type="text"
                   name="pmCatDesc"
                   value="#getperformCat.pmCatDesc#"
                   placeholder="Description of this Performance Measure Category"
                   required
                  maxlength="256">
            <small class="form-error">This field is requried</small>
            </div>  
          </div>
          <div class="row">
            <div class="large-12 columns">
            <label>Detailed Description of Category</label>
            <textarea name="pmCatDetail"
                   placeholder="Detailed Description of Category" >#getperformCat.pmCatDetail#</textarea>
            </div>  
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.performCat.cfm#" name="pmCatID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.performCat.cfm EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/  Profile Form --->
    </cfif>
    </div>
  </div>
</div>