<!--- Variables --->
<cfparam name=URL.goal default ="0">
<cfparam name=URL.apr default ="0">
<cfparam name=URL.project default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Agency --->
    <cfinvoke component="knex.customGoals" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.customGoalID)#">
      <!---/ Nuke Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Survey Question  deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.customGoalID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Custom Goal --->
      <cfinvoke component="knex.customGoals" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Custom Goal --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.goalName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.customGoalID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Custom Goal --->
      <cfinvoke component="knex.customGoals" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Custom Goal --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.goalName# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Additional Performance Measures
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
      <!--- doc Navigation --->
      <ul class="menu vertical">
        <!--- Manage comps --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>Questions</label></li>
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new&project=#URL.project#&apr=#URL.apr#">Add Measure</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list&project=#URL.project#&apr=#URL.apr#">Manage Measure</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage comps --->
      </ul>
      <!--- doc Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <!--- Get Custom Goals --->
      <cfinvoke component="knex.customGoals" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getcustomGoals"
            whatFields = "*"
            Where = "ThisProject"
            Order = "goalName ASC">
      <!---/ Get Custom Goals --->
      <cfoutput><h1>#SESSION.compName# Survey Question </h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Question</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getcustomGoals"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getcustomGoals.goalName#</b> (#getcustomGoals.goalName#)</td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?goal=#getcustomGoals.customGoalID#&project=#URL.project#&apr=#URL.project#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?goal=#getcustomGoals.customGoalID#&action=delete&project=#URL.project#&apr=#URL.apr#">
                           <i class="fi-trash"></i>
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
        <!--- Pagination --->
          <cfset pageRecordCount = getcustomGoals.RecordCount>
          <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
        <!---/ Pagination --->
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.goal NEQ "" AND SESSION.authLevel LTE 1>
      <!--- Get Custom Goals --->
      <cfinvoke component="knex.customGoals" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getcustomGoals"
            whatFields = "customGoalID, goalName"
            Where = "ThisGoal">
      <!---/ Get Custom Goals --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNINGG!</h1>
            <p class="MakeWhite">You are about to delete an survey question. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getcustomGoals.customGoalID#" name="customGoalID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getcustomGoals.goalName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- doc Profile Form --->
      <!--- Get Custom Goals --->
      <cfinvoke component="knex.customGoals" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getcustomGoals"
            whatFields = "*"
            Where = "ThisGoal">
      <!---/ Get Custom Goals --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.goal EQ 0>
            <h1>Add Measure</h1>
          <cfelse>
            <h1>Update Measure</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?project=#URL.project#&apr=#URL.apr#" data-abide>
          <div class="row">
            <div class="medium-12 columns">
              <label>Performance Measure</label>
              <textarea name="goalName"  placeholder="Households served by the project will..." required>#getcustomGoals.goalName#</textarea>
              <small class="form-error">Enter the survey question</small>
            </div>
          </div>
          <div class="row">
            <div class="medium-3 columns">
              <label>Target ## of persons</label>
              <input type="text"
                     name="goalTarget"
                     value="#getcustomGoals.goalTarget#"
                     placeholder="0"
                     pattern="integer"
                    maxlength="11">
              <small class="form-error">Must be a whole number</small>
            </div>
            <div class="medium-3 columns">
              <div class="row collapse">
                  <label>Target &##37; of persons</label>
                  <div class="small-9 large-10 columns">
                    
                     <input type="text"
                         name="goalTargetPer"
                         value="#getcustomGoals.goalTargetPer#"
                         placeholder="0"
                         pattern="integer"
                        maxlength="11">
                    <small class="form-error">Must be a whole number</small>
                  </div>
                  <div class="small-3 large-2 columns">
                    <span class="postfix">&##37;</span>
                  </div>
              </div>

            </div>
            <div class="medium-3 columns">
              <label>## of  applicable persons</label>
              <input type="text"
                     name="goalParticipants"
                     value="#getcustomGoals.goalParticipants#"
                     placeholder="0"
                     pattern="integer"
                    maxlength="11">
              <small class="form-error">Must be a whole number</small>
            </div>
            <div class="medium-3 columns">
              <label>## of successful persons</label>
              <input type="text"
                     name="GoalSuccess"
                     value="#getcustomGoals.GoalSuccess#"
                     placeholder="0"
                     pattern="integer"
                    maxlength="11">
              <small class="form-error">Must be a whole number</small>
            </div>
          </div>

         
       

          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.goal#" name="customGoalID">
              <input type="hidden" value="#URL.apr#" name="aprID">
              <input type="hidden" value="#URL.project#" name="projectID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.goal EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ doc Profile Form --->
    </cfif>

  </div>
</div>