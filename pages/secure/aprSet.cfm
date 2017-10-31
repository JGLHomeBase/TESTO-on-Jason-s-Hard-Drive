<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name=URL.apr default ="0">
<!---/ Variables --->

<!--- Process Form Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke APR Set --->
    <cfinvoke component="knex.aprSet" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.aprID)#">
      
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "APR Set deleted successfully.">
</cfif>
    <!---/ Nuke APR Set --->
<cfif FORM.action EQ "process" AND FORM.aprID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New APR Set --->
      <cfinvoke component="knex.aprSet" 
          method="new"
          DataSource = "#DataSource#">
    
     <cfset URL.action = "list">         
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.aprSetName# created successfully.">
</cfif>
    <!---/ New APR Set --->    
<cfif FORM.action EQ "process" AND FORM.aprID NEQ 0 AND SESSION.authLevel LTE 3>
    <!--- Update APR Set --->
      <cfinvoke component="knex.aprSet" 
          method="update"
          DataSource = "#DataSource#">
          
    <cfset URL.action = "list">         
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.aprSetName# updated successfully.">      
</cfif>
    <!---/ Update APR Set --->
    
        
    <!--- Move RFIs into new APR Set when Copying --->
<cfif FORM.action EQ "process" AND FORM.submit EQ "copy" AND SESSION.authLevel LTE 3>
       
    
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Hooray! This section got used at all, even a little bit.">
    
       
    
        <cfinvoke component="knex.rfi" 
                method="get"
                DataSource = "#DataSource#"
                returnVariable = "oldRFI"
                whatFields = "*"
                Where = "OldAPR">
        
        <cfinvoke component="knex.aprSet"
                  method="latest"
                  DataSource = "#DataSource#"
                  returnVariable = "latestAPR">
        
        <cfloop query="latestAPR">
            <cfset REQUEST.aprKey = #latestAPR.aprKey#>
        </cfloop>     
            
        <form>    
            
            
            <input type="hidden" value="" name="aprID">
                           
            <input type="hidden" value="" name="fieldname"> 
            <input type="hidden" value="" name="format"> 
            <input type="hidden" value="" name="instruction"> 
            <input type="hidden" value="" name="nickname"> 
            <input type="hidden" value="" name="programComponentList"> 
            <input type="hidden" value="" name="qNumber"> 
            <input type="hidden" value="" name="question"> 
            <input type="hidden" value="" name="required">
                                
        <cfloop query="oldRFI">
            
            <cfset FORM.fieldname =  #oldRFI.fieldname#>
            <cfset FORM.format = #oldRFI.format#>
            <cfset FORM.instruction = #oldRFI.instruction#>
            <cfset FORM.nickname = #oldRFI.nickname#>
            <cfset FORM.programComponentList = #oldRFI.programComponentList#>
            <cfset FORM.qNumber = #oldRFI.qNumber#>
            <cfset FORM.question = #oldRFI.question#>
            <cfset FORM.required = #oldRFI.required#>
                
            <cfset FORM.aprID = #REQUEST.aprKey#>    
                        
            <cfinvoke component="knex.rfi" 
                method="new"
                DataSource = "#DataSource#">
        </cfloop>
        
                
        </form>         
                
        <!--- Debugging         
        </br></br></br></br></br></br></br>
        <cfdump var="I am trying to look for RFIs from APR number">
        <cfdump var="#OriginalAPR#">
        <cfdump var="Here is what I found:">    
        <cfdump var="#oldRFI#">
        <cfdump var="The nickname for the last RFI in that APR is:">    
        <cfdump var="#FORM.nickname#">    
                
        <cfabort> 

        / Debugging --->
                
</cfif>
    <!---/ Move RFIs into new APR Set when Copying ---> 
    
                
    <!--- Display debugging variables --->            
      <cfparam name = "OriginalAPR" default = "not set yet">
      <cfparam name = "URL.apr" default = "not set yet"> 
    <cfparam name = "FORM.aprID" default = "not set yet">
        <cfparam name = "FORM.submit" default = "not set yet"> 
            <cfparam name = "FORM.action" default = "not set yet"> 
        
        <cfset SESSION.messageText = "The current value of OriginalAPR is #OriginalAPR#, the current value of URL.apr is #URL.apr#, and the current value of FORM.aprID is #FORM.aprID#. The current value of FORM.submit is #FORM.submit#, and the current value of FORM.action is #FORM.action#.">
      
    <!---/ Display debugging variables --->      
        
<!---/ Process Form Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage APR Sets
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
        <cfif SESSION.authLevel LTE 3>
          <li><label>APR Sets</label></li>
             <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add APR Set</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage APR Set</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage --->
      </ul>
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">       
      
      
<!---Figure Out Where To Go Next Based on URL.action--->
      
<cfif URL.action EQ "list">
      <!--- List --->
      <!--- Get APRs --->
      <cfinvoke component="knex.aprSet" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAPR"
            whatFields = "*"
            Where = "ThisCoC"
            Order = "aprSetName ASC">
      <!---/ Get APRs --->
      <cfoutput><h1>APR Sets</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>APR Set</th>
          <th>Supplemental Questions</th>
          <th><i class="fi-download"></i> Download</th>
            <cfif SESSION.authLevel LTE 3>
                <th><i class="fi-page-copy"></i> Copy</th>
            
            </cfif>
          <cfif SESSION.authLevel LTE 3>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getAPR"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td><b>#getAPR.aprSetName#</b></td>
              <td>
                  <div class="tableLink">
                <a href="#absoluteURL#pages/secure/rfi.cfm?action=list&apr=#getAPR.aprID#"><i class="fi-pencil"></i> Edit Questions</a>
                  </div>
              </td>
              <td>
                  <div class="tableLink">
                    <a href="Bridget2Go.cfm?apr=#getAPR.aprID#"><i class="fi-download"></i> Excel</a>
                  </div>
              </td>
                <cfif SESSION.authLevel LTE 3>
                <td class="text-right">
                    <div class="tableLink">
                        <a href="#CurrentPage#?apr=#getAPR.aprID#&action=copy">
                            <i class="fi-page-copy"></i>
                        </a>
                    </div>    
                </td>
                </cfif>
                
              <cfif SESSION.authLevel LTE 3>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?apr=#getAPR.aprID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 3>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?apr=#getAPR.aprID#&action=delete">
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
        <cfset pageRecordCount = getAPR.RecordCount>
        <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
      <!---/ Pagination --->

      <!---/ List --->
<cfelseif URL.action EQ "delete" AND URL.apr NEQ "" AND SESSION.authLevel LTE 3>
      <!--- Get APR --->
      <cfinvoke component="knex.aprSet" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAPR"
            whatFields = "APRSetName, aprID"
            Where = "ThisAPR">
      <!---/ Get APR --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete an APR Set, and<b> all of the Supplemental Questions, Supplemental Question Responses, and APR Data</b> it contains. This cannot be undone. Are you sure?
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getAPR.aprID#" name="aprID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete #getAPR.aprSetName#" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
<cfelseif URL.action EQ "copy" OR URL.action EQ "new" OR URL.action EQ "update" OR URL.action EQ "none" OR URL.action EQ "">
      <!--- Profile Form --->
      <!--- Get APR --->
      <cfinvoke component="knex.aprSet" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getAPR"
            whatFields = "*"
            Where = "ThisAPR">
      <!---/ Get APR --->
          
       
              
             
            
      <div class="row">
        <div class="large-12 columns">


          <cfif URL.apr EQ 0>
             <div class="large-12 columns">
            <h1>Add an APR Set</h1>
            </div>
          <cfelseif URL.action EQ "copy">
            <div class="large-10 columns">
            <h1>Copy APR Set Profile</h1>
            </div>
          <cfelse>  
            <div class="large-10 columns">
            <h1>Update APR Set Profile</h1>
            </div>
            <cfoutput>
              <div class="large-2 columns">
            <a href="#absoluteurl#pages/secure/dataentry.cfm?apr=#getAPR.aprID#" class="small button secondary">Data Entry</a>
            </div>
            </cfoutput>
          </cfif>

          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" data-abide>
          <div class="row">
            <div class="medium-12 columns">
              <cfif SESSION.cocID EQ 0>
                <i>NOTE: you are about to create a global APR Set accessible to all communities in #AppShortName#. To create an APR set specific to a single CoC select it first before completing this form.</i><br><br>
              </cfif>
              <!--- aprSetName --->
              <cfif URL.action EQ "copy">
                    <label>Old APR Set Name</label>
                    <input type="text"
                     name="oldAPRSetName"
                     value="#getAPR.aprSetName#"
                     placeholder="APR Set Name"
                     readonly
                     class="BGLightGray"
                     maxlength="256">
                     
                    <label>New APR Set Name</label>
                    <input type="text"
                     name="aprSetName"
                     value="New Version of #getAPR.aprSetName#"
                     placeholder="New Version of APR Set Name"
                     required
                     maxlength="256">
                    <small class="form-error">Enter a name for this set of APR's</small>
                  
              <cfelse>
                    
                    <label> APR Set Name</label>
                    <input type="text"
                     name="aprSetName"
                     value="#getAPR.aprSetName#"
                     placeholder="APR Set Name"
                     required
                    maxlength="256">
                    <small class="form-error">Enter a name for this set of APR's</small>
                    
              </cfif>
                  
              <!---/ aprSetName --->
            </div>
          </div>
          <div class="row">
            <div class="medium-12 columns">
              <!--- aprSetNotes --->
              <label>APR Set Notes</label>
              <textarea name="aprSetNotes"
                     placeholder="APR Set Notes" >#getAPR.aprSetNotes#</textarea>
              <!---/ aprSetNotes --->
            </div>
          </div>
          <div class="row">
            <div class="medium-4 columns">
              <!--- aprRangeStart --->
              <label>APR Start of APR Date Range</label>
              <input type="date"
                     name="aprRangeStart"
                     value="#getAPR.aprRangeStart#"
                     placeholder="01/01/2013">
              <small class="form-error">Must be a date (YYYY-MM-DD)</small>
              <!---/ aprRangeStart --->
            </div>
            <div class="medium-4 columns">
              <!--- APRRangeEnd --->
              <label>APR End of APR Date Range</label>
              <input type="date"
                     name="APRRangeEnd"
                     value="#getAPR.APRRangeEnd#"
                     placeholder="12/31/2014">
              <small class="form-error">Must be a date (YYYY-MM-DD)</small>
              <!---/ APRRangeEnd --->
            </div>
            <div class="medium-4 columns">
              <label>APR Data Source</label>
              <select name="APRDataSource">
                <option value="HUD" <cfif getAPR.APRDataSource EQ "HUD">SELECTED</cfif>>
                  Official HUD APR
                </option>
                <option value="HMIS" <cfif getAPR.APRDataSource EQ "HMIS">SELECTED</cfif>>
                  HMIS Generated
                </option>
                <option value="Project" <cfif getAPR.APRDataSource EQ "Project">SELECTED</cfif>>
                  Project Generated
                </option>
              </select>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns">
              <label>Include the following APR questions in data collection:</label>
                  <!--- Get APR Question List --->
                  <cfinvoke component="knex.aprSet" 
                      method="getQs"
                      DataSource = "#DataSource#"
                      returnVariable = "getAPRQList"
                      whatFields = "Detail"
                      whatAPR = "All"
                      Order = "tableName">
                  <!---/ Get APR Question List --->
              <cfloop query="#getAPRQList#">
                <cfif getAPRQList.APRQuestion EQ "7">
                  <cfset checked="checked readonly">
                <cfelseif listFind(getAPR.aprSetQList, "#getAPRQList.APRQuestion#") GT 0>
                  <cfset checked="checked">
                <cfelseif URL.apr EQ 0 AND getAPRQList.tableAPRPriority NEQ "hide">
                  <cfset checked="checked">
                <cfelse>
                  <cfset checked="">
                </cfif>
                <input type="checkbox" name="aprSetQList" value="#getAPRQList.APRQuestion#" #checked#>
                  <cfif tableAPRPriority EQ "hide"><span class="MakeGray"></cfif>
                  <cfif tableAPRPriority EQ "req"><b></cfif>
                  #getAPRQList.tableAPRQTitle#
                  <cfif tableAPRPriority EQ "req"></b></cfif>
                  <cfif tableAPRPriority EQ "hide"></span></cfif>
                </input><br>
              </cfloop>
            </div>
          </div>

                      
<!--- Button(s) at the Bottom of the Page --->                      
                      
          <div class="row">
            <div class="large-12 columns text-right">
              <cfif URL.action EQ "copy">
                  <input type="hidden" value="#URL.apr#" name="OriginalAPR">
                  <input type="hidden" value="0" name="aprID">
              <cfelse>
                  <input type="hidden" value="irrelevant" name="OriginalAPR">
                  <input type="hidden" value="#URL.apr#" name="aprID">
              </cfif>
              <input type="hidden" name="cocID" value="#SESSION.cocID#">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.apr EQ 0>
                <input type="submit" value="add" name="submit" class="small button secondary">
              <cfelseif URL.action EQ "copy">
                <input type="submit" value="copy" name="submit" class="small button secondary">
              <cfelse>      
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
                
<!---/ Button(s) at the Bottom of the Page --->
                
      </cfoutput>
              
 <!---/  Profile Form --->
              
<cfelse>
    <cfoutput>
    <h3>I'm sorry, but I don't know how to #URL.action#.</h3>                  
    </cfoutput>
</cfif>       
              
<!---/ Figure Out Where To Go Next Based on URL.action--->                    
              
    
  </div>
</div>
</div>