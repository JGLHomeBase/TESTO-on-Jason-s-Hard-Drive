<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.cat" default="0">
<cfparam name="URL.factor" default="0">
<cfparam name="URL.scale" default="0">
<cfparam name="URL.comp" default ="#SESSION.compID#">
<cfif SESSION.usercompID NEQ 0>
  <cfset URL.comp = #SESSION.usercompID#>
</cfif>
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Agency --->
    <cfinvoke component="knex.scoreScales" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.scaleID)#">
      <!---/ Nuke Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Scoring scale deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.scaleID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Scale --->
      <cfinvoke component="knex.scoreScales" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Scale --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.scaleName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.scaleID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Scale --->
      <cfinvoke component="knex.scoreScales" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Scale --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.scaleName# updated successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="SmallBox BGPrimary">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="MakeWhite"><br>

                Edit Scales
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

      <!---/ List --->
    <cfif URL.action EQ "delete" AND URL.comp NEQ "" AND SESSION.authLevel LTE 3>
      <cfquery datasource="#datasource#" name="getScoreScale">
          SELECT scaleID, scaleName FROM scorescale WHERE scaleID = <cfqueryparam value="#URL.scale#">
        </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete a scoring scale. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getScoreScale.scaleID#" name="scaleID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getScoreScale.scaleName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- comp Profile Form --->
      <cfquery datasource="#datasource#" name="getScoreScale">
        SELECT * FROM scorescale WHERE scaleID = <cfqueryparam value="#URL.scale#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.scale EQ 0>
            <h1  class="">Add Scale</h1>
          <cfelse>
            <h1  class="">Edit Scales</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?cat=#URL.cat#&comp=#URL.comp#&factor=#URL.factor#" data-abide>

          <div class="row">
            <div class="medium-6 columns">
              <!--- scaleName --->
              <label>Label</label>
              <input type="text"
                     name="scaleName"
                     value="#getScoreScale.scaleName#"
                     placeholder="Scale Name"
                     required
                    maxlength="256">
              <small class="form-error">This field is requried</small>
              <!---/ scaleName --->
            </div> 
            <div class="medium-3 columns">
              <!--- minValue --->
              <label>Minimum Required Value</label>
              <input type="number"
                     step=".01"
                     name="minValue"
                     value="#NumberFormat(getScoreScale.minValue, "9.99")#"
                     placeholder="0"
                    maxlength="6">
              <small class="form-error">Must be a number.</small>
              <!---/ minValue --->
            </div>
            <div class="medium-3 columns">
              <!--- ptScore --->
              <label>Point Allotted</label>
              <input type="number"
                     step=".01"
                     name="ptScore"
                     value="#NumberFormat(getScoreScale.ptScore, "9.99")#"
                     placeholder="0"
                    maxlength="6">
              <small class="form-error">Must be a number. Do not use commas.</small>
              <!---/ ptScore --->
            </div>
          </div>


    

          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.scale#" name="scaleID">
              <input type="hidden" value="#URL.factor#" name="factorID">
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



          <!--- List --->
      <cfquery datasource="#datasource#" name="getScoreScales">
        SELECT * FROM scorescale
        WHERE scorescale.factorID = <cfqueryparam value="#URL.factor#">
        ORDER BY minValue ASC, scaleName ASC
      </cfquery>
      <cfoutput><h1 class="">Current Scales</h1></cfoutput>
      <cfquery datasource="#datasource#" name="getFactor">
        SELECT factorLongName FROM scorefactor
        WHERE factorID = <cfqueryparam value="#URL.factor#">
      </cfquery>
      <cfoutput><h3 class="MakePrimary">#getFactor.factorLongName#</h3></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Scale</th>
          <th>Minimum Required Value</th>
          <th>Point Allotted</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getScoreScales">
            <tr>
              <td><b>#getScoreScales.scaleName#</b></td>
              <td>#getScoreScales.minValue#</td>
              <td>#getScoreScales.ptScore#</td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?cat=#URL.cat#&comp=#URL.comp#&factor=#URL.factor#&scale=#getScoreScales.scaleID#">
                         <i class="fi-pencil"></i>
                      </a>
                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?cat=#URL.cat#&comp=#URL.comp#&factor=#URL.factor#&scale=#getScoreScales.scaleID#&action=delete">
                           <i class="fi-trash"></i>
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>

  </div>
</div>