<!-- CoC Check  --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.apr" default ="0">
<cfparam name="URL.q" default ="0">
<cfset maxShort = 25>
<cfset maxLong = 35>
<cfset maxNum = 30>
<cfset fieldList = "">
  <!--- Occupied List --->
      <!--- Get Occupied List --->
      <cfinvoke component="knex.rfi" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getRFI"
            whatFields = "FieldName"
            Where = "ThisAPR"
            Order = "FieldName">
      <!---/ Get Occupied List --->
  <cfset occupiedList = "">
  <cfloop query="getRFI">
    <cfset occupiedList = ListAppend(occupiedList, fieldname)>
  </cfloop>
  <!---/ Occupied List --->
  <!--- Short Answers --->
  <cfloop from="1" to="#maxShort#" index="LoopCount">
    <cfset FieldListAdd = "ShortAns#NumberFormat(LoopCount,"00")#">
    <cfif listFindNoCase("#occupiedList#", "#FieldListAdd#") EQ 0>
      <cfset fieldList = ListAppend(fieldList, FieldListAdd)>
      <cfbreak>
    </cfif>
  </cfloop>
  <!---/ Short Answers --->
  <!--- Long Answers --->
  <cfloop from="1" to="#maxLong#" index="LoopCount">
    <cfset FieldListAdd = "LongAns#NumberFormat(LoopCount,"00")#">
    <cfif listFindNoCase("#occupiedList#", "#FieldListAdd#") EQ 0>
      <cfset fieldList = ListAppend(fieldList, FieldListAdd)>
      <cfbreak>
    </cfif>
  </cfloop>
  <!---/ Long Answers --->
  <!--- Short Answers --->
  <cfloop from="1" to="#maxNum#" index="LoopCount">
    <cfset FieldListAdd = "NumAns#NumberFormat(LoopCount,"00")#">
    <cfif listFindNoCase("#occupiedList#", "#FieldListAdd#") EQ 0>
      <cfset fieldList = ListAppend(fieldList, FieldListAdd)>
      <cfbreak>
    </cfif>
  </cfloop>
  <!---/ Short Answers --->
<!---/ Variables --->
      <!--- Get APR Set --->
      <cfinvoke component="knex.aprSet" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAPR"
            whatFields = "APRSetName, aprID"
            Where = "ThisAPRCoC">
      <!---/ Get APR Set --->

<cfif getAPR.RecordCount GT 0>
  <cfset URL.apr = getAPR.aprID>
<cfelse>
  <cfset URL.apr = 0>
</cfif>

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
      <!--- Nuke RFI Question --->
      <cfinvoke component="knex.rfi" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.DataRFIQID)#">
      <!---/ Nuke RFI Question --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Supplemental question deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.DataRFIQID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New RFI Question --->
      <cfinvoke component="knex.rfi" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New RFI Question --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.question# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.DataRFIQID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update RFI Question --->
      <cfinvoke component="knex.rfi" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update RFI Question --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.question# updated successfully.">
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Local Questions
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
      <!--- comp Navigation --->
      <ul class="menu vertical">
        <!--- Manage comps --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>Questions</label></li>
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new&apr=#URL.apr#">Add Question</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list&apr=#URL.apr#">Manage Question</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage comps --->
      </ul>
      <!--- comp Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.apr EQ 0>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGLightGray text-center">
            <h1 class="">Woops!</h1>
            <cfoutput>
            <p class="">Something went wrong. What <a href="#AbsoluteURL#pages/secure/aprset.cfm?action=list">
                      APR set</a> were you working on again?</b></p></cfoutput>
          </div>
        </div>
      </div>
    <cfelseif URL.action EQ "list">
      <!--- List --->
      <!--- Get Records --->
      <cfinvoke component="knex.rfi" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getRFI"
            whatFields = "*"
            Where = "ThisAPR"
            Order = "qNumber ASC">
      <!---/ Get Records --->
      <cfoutput>
        <h1>#SESSION.cocCity# Questions</h1>
        <h3>#getAPR.aprSetName#</h3>
      </cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>Question</th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getRFI">
            <tr>
              <td><b>#getRFI.qNumber#. #getRFI.question#</b> (#getRFI.nickname#)
                <cfif getRFI.Instruction NEQ ""><br>
                <i>#getRFI.instruction#</i></cfif>
              </td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?q=#getRFI.DataRFIQID#&apr=#URL.apr#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?q=#getRFI.DataRFIQID#&apr=#URL.apr#&action=delete">
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
    <cfelseif URL.action EQ "delete" AND URL.q NEQ "" AND SESSION.authLevel LTE 1>
          <!--- Get Records --->
          <cfinvoke component="knex.rfi" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getRFI"
                whatFields = "DataRFIQID, question, nickname"
                Where = "ThisRFI">
          <!---/ Get Records --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete an applicaiton question <cfoutput>(#getRFI.nickname#)</cfoutput>. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">

                <input type="hidden" value="#getRFI.DataRFIQID#" name="DataRFIQID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getRFI.nickname#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>

    
    <cfelse>
      <!--- comp Profile Form --->
          <!--- Get Records --->
          <cfinvoke component="knex.rfi" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "getRFI"
                whatFields = "*"
                Where = "ThisRFI">
          <!---/ Get Records --->
      <div class="row">
        <div class="large-12 columns">
          <cfoutput>
            <cfif URL.q EQ 0>
              <h1>Add a Question</h1>
              <h3>#getAPR.aprSetName#</h3>
            <cfelse>
              <h1>Update Question</h1>
              <h3>#getAPR.aprSetName#</h3>
            </cfif>
          </cfoutput>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#?apr=#URL.apr#" data-abide>
          <div class="row">
            <div class="medium-2 columns">
              <label>Question ##</label>
              <input type="number" 
                     name="qNumber" 
                     value="#getRFI.qNumber#" 
                     placeholder="42"
                     maxlength="4">
                     <small class="form-error">##'s only</small>
            </div>
            <div class="medium-10 columns">
              <label>Full Question</label>
              <input type="text" 
                     name="question" 
                     value="#getRFI.question#" 
                     placeholder="What is the answer to life, the universe, and everything?"
                     maxlength="256"
                     required>
              <small class="form-error">Enter the full question text</small>
            </div>
           
          </div>
          <div class="row">
            <div class="medium-2 columns">
              <label>Nickname</label>
              <input type="text" 
                     name="nickname" 
                     value="#getRFI.nickname#" 
                     placeholder="The Question"
                     maxlength="256"
                     required>
              <small class="form-error">Enter a nickname for the question</small>
            </div>
            <div class="medium-4 columns">
              <label>Database Field</label>
              <select name="fieldname" required>
                <cfif getRFI.fieldname NEQ "">
                  <option value-"#getRFI.fieldname#">#getRFI.fieldname#</option>
                </cfif>
                <cfloop list="#fieldList#" index="fieldselect">
                 
                  <option value-"#fieldselect#">#fieldselect#</option>
                </cfloop>
              </select>
                     <small class="form-error">##'s only</small>
            </div>
            <div class="medium-4 columns">
              <label>Data Formating</label>
              <select name="format" required>
                <option <cfif getRFI.format EQ "None">selected</cfif> >None</option>
                <option <cfif getRFI.format EQ "Currency">selected</cfif> >Currency</option>
                <option <cfif getRFI.format EQ "Percentage">selected</cfif> >Percentage</option>
              </select>
              <small class="form-error">Enter the full question text</small>
            </div>
            <div class="medium-2 columns">
              <label>Required?</label>
              <select name="required" required>
                     <option value="1" <cfif getRFI.required EQ 1>selected</cfif>>Yes</option>
                     <option value="0" <cfif getRFI.required EQ 0>selected</cfif>>No</option>
              </select>
            </div>
            
          </div>
          <div class="row">
            <div class="large-12 columns">
              <label>Your answer should include...</label>
              <textarea name="instruction"
                     placeholder="Instructions" >#getRFI.instruction#</textarea>
            </div>
          </div>
		  <div class="row">
		  	<div class="large-12 columns">
		  		<label>Public?</label>
				<input type="radio" name="isPrivate" id="isPrivateYes" value="0"#getRFI.isPrivate eq 0 ? ' checked="checked"': ''#> Yes &nbsp;&nbsp;&nbsp;
				<input type="radio" name="isPrivate" id="isPrivateNo" value="1"#getRFI.isPrivate eq 1 ? ' checked="checked"': ''#> No
		  	</div>
		  </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.q#" name="DataRFIQID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#URL.apr#" name="aprID">
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
      <!---/ comp Profile Form --->
    </cfif>
</div>
  </div>
</div>