<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name=URL.q default ="0">
<cfparam name=URL.apr default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Agency --->
    <cfinvoke component="knex.survey" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.surveyQID)#">
      <!---/ Nuke Agency --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Survey Question  deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.surveyQID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Survey --->
      <cfinvoke component="knex.survey" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Survey --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.surveyQText# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.surveyQID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update Survey --->
      <cfinvoke component="knex.survey" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Survey --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.surveyQText# created successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Survey Question 
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
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new&q=#URL.q#">Add Question</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list&q=#URL.q#">Manage Questions</a></li>
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
          <!--- Get Survey Questions --->
          <cfinvoke component="knex.survey" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getQ"
                whatFields = "*"
                Where = "CoC"
                Order = "surveyQText"
                Join = "IDataAPR00">
          <!---/ Get Survey Questions --->
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
          <cfoutput query="getQ"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getQ.surveyQText#</b> (#getQ.surveyQText#)</td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?q=#getQ.surveyQID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?q=#getQ.surveyQID#&action=delete">
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
          <cfset pageRecordCount = getQ.RecordCount>
          <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
        <!---/ Pagination --->
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.q NEQ "" AND SESSION.authLevel LTE 1>
      <!--- Get Questions --->
      <cfinvoke component="knex.survey" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getQ"
            whatFields = "surveyQID, surveyQText"
            Where = "ThisQ">
      <!---/ Get Questions --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNINGG!</h1>
            <p class="MakeWhite">You are about to delete an survey question. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getQ.surveyQID#" name="surveyQID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getQ.surveyQText#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- doc Profile Form --->
      <!--- Get Questions --->
      <cfinvoke component="knex.survey" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getQ"
            whatFields = "*"
            Where = "ThisQ">
      <!---/ Get Questions --->
      <div class="row">
        <div class="large-12 columns">
          <cfif URL.q EQ 0>
            <h1>Add Question</h1>
          <cfelse>
            <h1>Update Question</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-12 columns">
              <label>Survey Question</label>
              <input type="text" 
                     name="surveyQText" 
                     value="#getQ.surveyQText#" 
                     placeholder="Springfield Applicant Handbook"
                     maxlength="256"
                     required
                     >
              <small class="form-error">Enter the survey question</small>
            </div>
          </div>
          <div class="row">
      <!--- Get APR Set List --->
      <cfinvoke component="knex.aprSet" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAPR"
            whatFields = "aprSetName, CoCCity, CompName, aprID"
            Join = "LCompCoC"
            Where = "Depends"
            Order = "CoCCity, CompName">
      <!---/ Get APR Set List --->
            <div class="medium-6 columns">
              <label>APR Set</label>
              <select name="aprID">
                <cfloop query ="getAPR">
                  <option value="#getAPR.aprID#" <cfif getQ.aprID EQ "#getAPR.aprID#">SELECTED</cfif>>#getAPR.CoCCity# - #getAPR.CompName# - #getAPR.aprSetName#</option>
                </cfloop>
              </select>
            </div>
             <div class="medium-6 columns">
              <label>Category</label>
              <select name="surveyCat">
                  <option value="Reliability" <cfif getQ.surveyCat EQ "Reliability">SELECTED</cfif>>Reliability and Responsiveness</option>
                  <option value="Admin" <cfif getQ.surveyCat EQ "Admin">SELECTED</cfif>>Administrative Efficiency</option>
                  <option value="Quality" <cfif getQ.surveyCat EQ "Quality">SELECTED</cfif>>Quality Assessment</option>
                  <option value="Accessible" <cfif getQ.surveyCat EQ "Accessible">SELECTED</cfif>>Accessible Services</option>
                  <option value="Improve" <cfif getQ.surveyCat EQ "Improve">SELECTED</cfif>>Improved Quality of Life</option>
              </select>
            </div>
          </div>

         
       

          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.q#" name="surveyQID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.q EQ 0>
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