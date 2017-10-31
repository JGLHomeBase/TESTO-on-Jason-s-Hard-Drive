<!--- Variables --->
<cfparam name="URL.cat" default="0">
<cfparam name="URL.factor" default="0">
<cfparam name="URL.comp" default ="#SESSION.compID#">
<cfif SESSION.usercompID NEQ 0>
  <cfset URL.comp = #SESSION.usercompID#>
</cfif>
<cfparam name="FORM.componentList" default="0">

<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Score Factor --->
    <cfinvoke component="knex.scoreFactors" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.factorID)#">
      <!---/ Nuke Score Factor --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Scoring factor deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.factorID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Score Factor --->
      <cfinvoke component="knex.scoreFactors" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Score Factor --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.factorLongName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.factorID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Score Factor --->
      <cfinvoke component="knex.scoreFactors" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Score Factor --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.factorLongName# updated successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="MakeWhite"><br>
              <cfif SESSION.usercompID EQ 0>
                Manage Scoring Factors
              <cfelse>
                Edit Factor
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
      <cfquery datasource="#datasource#" name="getScoreFactors">
        SELECT * FROM scorefactor
        INNER JOIN scorecat ON scorefactor.catID = scorecat.catID
        WHERE scorecat.compID = <cfqueryparam value="#URL.comp#">
          <cfif URL.cat NEQ 0>
          AND scorefactor.catID = <cfqueryparam value="#URL.cat#">
          </cfif>      
        ORDER BY catLongName, factorLongName ASC
      </cfquery>
      <cfoutput><h1>Scoring Factors</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th width="50%">Factor</th>
          <th>Scales</th>
          <th>Max Pts.</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getScoreFactors">
            <tr>
              <td><b>#getScoreFactors.factorLongName#</b></td>
              <td>
                  <div class="tableLink">
                    <cfif getScoreFactors.scaled EQ 1>
                      <a href="scoreScales.cfm?cat=#getScoreFactors.catID#&comp=#URL.comp#&factor=#getScoreFactors.factorID#">
                        <i class="fi-pencil"></i> Edit
                      </a>
                    </cfif>
                  </div>
              </td>
              <td>
                #getScoreFactors.maxPoints#  
              </td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?cat=#getScoreFactors.catID#&comp=#URL.comp#&factor=#getScoreFactors.factorID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?cat=#getScoreFactors.catID#&comp=#URL.comp#&factor=#getScoreFactors.factorID#&action=delete">
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
        <cfinvoke component="knex.scoreFactors" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getScoreFactor"
                    whatFields="scorefactor.factorID, scorefactor.factorLongName, scorescale.scaleName"
                    Where="Children"
                    Order="scorescale.scaleName">
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
              <p class="MakeWhite">You are about to delete a scoring factor. <b>This cannot be undone. Are you sure?</b> <p class="MakeWhite">The following scoring scales will also be deleted:</p> <cfloop query="getScoreFactor"><p class="MakeWhite"><cfoutput>#getScoreFactor.scaleName#</cfoutput></p></cfloop></b>
        <cfinvoke component="knex.scoreFactors" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getScoreFactor"
                    whatFields="scorefactor.factorID, scorefactor.factorLongName"
                    Where="thisFactor">
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getScoreFactor.factorID#" name="factorID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getScoreFactor.factorLongName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- comp Profile Form --->
      <cfquery datasource="#datasource#" name="getScoreFactor">
        SELECT * FROM scorefactor WHERE factorID = <cfqueryparam value="#URL.factor#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.cat EQ 0>
            <h1>Add a Factor</h1>
          <cfelse>
            <h1>Edit Factor</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?cat=#URL.cat#&comp=#URL.comp#" data-abide>
          <div class="row">
            <div class="medium-12 columns">
             <!--- catID --->
             <cfquery datasource="#datasource#" name="getScoreCats">
              SELECT * FROM scorecat WHERE compID = <cfqueryparam value="#URL.comp#">
              ORDER BY catLongName ASC
            </cfquery>
            <label>Scoring Category</label>
           <select name="catID">
              <cfloop query="getScoreCats">
                <option value="#getScoreCats.catID#" <cfif getScoreFactor.catID EQ getScoreCats.catID>selected</cfif>>#getScoreCats.catLongName#</option>
              </cfloop>
            </select>
            <!---/ catID --->
            </div>

          </div>
          <div class="row">
            <div class="medium-8 columns">
             <!--- factorLongName --->
            <label>Scoring Factor (Tip: Include ##'s &mdash; <i>1. Housing...</i>)</label>
            <input type="text"
                   name="factorLongName"
                   value="#getScoreFactor.factorLongName#"
                   placeholder="Category Long Name"
                   required
                  maxlength="256">
            <small class="form-error">This field is requried</small>
            <!---/ factorLongName --->
            </div> 
            <div class="medium-4 columns">
             <!--- factorShortName --->
            <label>Short Name</label>
            <input type="text"
                   name="factorShortName"
                   value="#getScoreFactor.factorShortName#"
                   placeholder="Category Short Name"
                   required
                  maxlength="256">
            <small class="form-error">This field is requried</small>
<!---/ factorShortName --->
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
            <!--- factorDesc --->
            <label>Description (Basic HTML OK)</label>
            <textarea name="factorDesc"
                   placeholder="The Housing Results section evaluates a program's..." >#getScoreFactor.factorDesc#</textarea>
            <!---/ factorDesc --->
          </div>
        </div>

          <div class="row">
            <div class="medium-6 columns">
                <cfquery name="getMeasures">
                SELECT pmID, pmLongName
                FROM performmeasure
                WHERE active = '1'
                      AND formatType <> <cfqueryparam value="varchar">
                      AND (cocID = '0' OR cocID = <cfqueryparam value="#SESSION.cocID#">)
                ORDER BY pmLongName
                </cfquery>
              <!--- fieldName --->
              <label>Scored Value (Performance Measure)</label>
              <select name="pmID">
                  <option value="0"<cfif getScoreFactor.pmID EQ 0> SELECTED</cfif>>None</option>
                  <cfloop query="getMeasures">
                      <option value="#getMeasures.pmID#"<cfif getScoreFactor.pmID EQ "#getMeasures.pmID#"> SELECTED</cfif>>#getMeasures.pmLongName#</option>
                  </cfloop>
              </select>
              <!---/ fieldName --->
            </div>
            
            <div class="medium-2 columns">
              <!--- maxPoints --->
              <label>Maximum Points</label>
              <input type="number"
                     step="0.01"
                     name="maxPoints"
                     value="#NumberFormat(getScoreFactor.maxPoints, "9.99")#"
                     placeholder="0"
                    maxlength="6">
              <small class="form-error">Must be a number</small>
              <!---/ maxPoints --->
            </div>
            <div class="medium-2 columns">
              <!--- scaled --->
              <label>Scaled?</label>
              <select name="scaled" required>
                     <option value="1" <cfif getScoreFactor.scaled EQ 1>selected</cfif>>Yes</option>
                     <option value="0" <cfif getScoreFactor.scaled EQ 0>selected</cfif>>No</option>
              </select>
              <!---/ scaled --->
            </div>
            <div class="medium-2 columns">
              <!--- force --->
              <label>Fixed Score?</label>
              <select name="forced" required>
                     <option value="1" <cfif getScoreFactor.forced EQ 1>selected</cfif>>Yes</option>
                     <option value="0" <cfif getScoreFactor.forced EQ 0>selected</cfif>>No</option>
              </select>
              <!---/ force --->
            </div>
          </div>
         

          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.comp#" name="compID">
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

  </div>
</div>