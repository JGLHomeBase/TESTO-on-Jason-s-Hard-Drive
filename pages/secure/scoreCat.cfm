<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.cat" default="0">
<cfparam name=URL.comp default ="#SESSION.compID#">
<cfif SESSION.usercompID NEQ 0>
  <cfset URL.comp = #SESSION.usercompID#>
</cfif>
<cfparam name="FORM.componentList" default="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Score Cat --->
    <cfinvoke component="knex.scoreCat" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.catID)#">
    <!---/ Nuke Score Cat --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Scoring category deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.catID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Score Cat --->
      <cfinvoke component="knex.scoreCat" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Score Cat --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.catLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.catID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Score Cat --->
      <cfinvoke component="knex.scoreCat" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Score Cat --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.catLongName# updated successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="MakeWhite"><br>
              <cfif SESSION.usercompID EQ 0>
                Manage Scoring Categories
              <cfelse>
                Edit Category
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


<div class="row">
  <div class="medium-2 columns">
    <cfoutput>
      <cfinclude template="#absoluteURL#legos/scoreEditNav.cfm">
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
          <!--- Get Score Categories --->
          <cfinvoke component="knex.scoreCat" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getScoreCat"
                whatFields = "All"
                Where = "ThisComp"
                Order = "LongName">
          <!---/ Get Score Categories --->
      <cfoutput><h1>Scoring Categories</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th width="50%">Category</th>
          <th>Score Factors</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getScoreCat">
            <tr>
              <td><b>#getScoreCat.catLongName#</b></td>
              <td>
                  <cfquery name="getFactors">
                  SELECT factorID FROM scorefactor
                  WHERE catID = <cfqueryparam value="#getScoreCat.catID#">
                  </cfquery>
                  #getFactors.RecordCount# Score Factor<cfif getFactors.RecordCount NEQ 1>s</cfif>
                  <a href="scoreFactors.cfm?action=list&comp=#URL.comp#&cat=#getScoreCat.catID#" class="tableLink"><i class="fi-pencil"></i></a> 
              </td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?cat=#getScoreCat.catID#&comp=#URL.comp#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?cat=#getScoreCat.catID#&comp=#URL.comp#&action=delete">
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
    <cfelseif URL.action EQ "delete" AND URL.comp NEQ "" AND SESSION.authLevel LTE 3>
          <!--- Get Score Categories --->
          <cfinvoke component="knex.scoreCat" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getScoreCat"
                whatFields = "Children"
                Where = "ThisCat"
                Order = "Any">
          <!---/ Get Score Categories --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a scoring category. <b>This cannot be undone. Are you sure?</b> <p class="MakeWhite">The following scoring factors will also be deleted:</p> <cfloop query="getScoreCat"><p class="MakeWhite"><cfoutput>#getScoreCat.factorLongName#</cfoutput></p></cfloop> </b>
          <!--- Get Score Categories --->
          <cfinvoke component="knex.scoreCat" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getScoreCat"
                whatFields = "IDLongName"
                Where = "ThisCat"
                Order = "Any">
          <!---/ Get Score Categories --->
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getScoreCat.catID#" name="catID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getScoreCat.catLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- comp Profile Form --->
          <!--- Get Score Categories --->
          <cfinvoke component="knex.scoreCat" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getScoreCat"
                whatFields = "All"
                Where = "ThisCat"
                Order = "Any">
          <!---/ Get Score Categories --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.cat EQ 0>
            <h1>Add a Category</h1>
          <cfelse>
            <h1>Edit Category</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?cat=#URL.cat#&comp=#URL.comp#" data-abide>
          <div class="row">
            <div class="medium-8 columns">
             <!--- catLongName --->
            <label>Scoring Category (Tip: Include ##'s &mdash; <i>1. Housing...</i>)</label>
            <input type="text"
                   name="catLongName"
                   value="#getScoreCat.catLongName#"
                   placeholder="Category Long Name"
                   required
                  maxlength="256">
            <small class="form-error">This field is requried</small>
            <!---/ catLongName --->
            </div> 
            <div class="medium-4 columns">
             <!--- catShortName --->
            <label>Short Name</label>
            <input type="text"
                   name="catShortName"
                   value="#getScoreCat.catShortName#"
                   placeholder="Category Short Name"
                   required
                  maxlength="256">
            <small class="form-error">This field is requried</small>
<!---/ catShortName --->
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
            <!--- catDesc --->
            <label>Description (Basic HTML OK)</label>
            <textarea name="catDesc"
                   placeholder="The Housing Results section evaluates a program's..." >#getScoreCat.catDesc#</textarea>
            <!---/ catDesc --->
            </div>
          </div>
         
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.comp#" name="compID">
              <input type="hidden" value="#URL.cat#" name="catID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.comp EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ comp Profile Form --->
    </cfif>

  </div>
</div>