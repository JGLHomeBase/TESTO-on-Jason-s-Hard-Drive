<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->
    
<!--- Variables --->
<cfparam name="URL.project" default="#SESSION.projectID#">
<cfparam name="URL.q" default="0">
<cfparam name="URL.APR" default="0">
<cfparam name="ProjectName" default="">
<cfset nexttab="1">

  <!--- Get Custom Questions --->
  <cfinvoke component="knex.rfi" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getRFI"
            whatFields = "DataRFIQID"
            Where = "ThisAPR"
            Order = "qNumber ASC">
  <!---/ Get Custom Questions --->

  <cfif getRFI.RecordCount GT 0>
    <cfset ShowRFI = 1>
  <cfelse>
    <cfset ShowRFI = 0>
  </cfif>
<!---/ Variables --->

<!--- Security --->
<cfif SESSION.AuthLevel GT 6>
  <cflocation url="#AbsoluteURL#pages/login.cfm">
</cfif>
<!---/ Security --->


<!--- Process Actions --->

<!---/ Process Actions --->

    
<!--- Disable Scrolling within Numeric Table Cells --->    
<cfoutput>
    <script>  
    $(document).ready(function () {
        $('form').on('focus', 'input[type=number]', function (e) {
        $(this).on('mousewheel.disableScroll', function (e) {
            e.preventDefault()
        })
    })
            
    $('form').on('blur', 'input[type=number]', function (e) {
        $(this).off('mousewheel.disableScroll')
        })
    });
    </script>
</cfoutput>
<!---/ Disable Scrolling within Numeric Table Cells ---> 
    
    
<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                #AppShortName# Data Entry Tool
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->


<cfoutput>
<div class="panel">
  <div class="row">
    <cfif SESSION.cocID NEQ 0>
        <div class="medium-6 columns">
        <!--- Projects --->
        <cfset URL.sort = "project">
          <!--- Get Project List --->
          <cfinvoke component="knex.projects" 
                method="getList"
                DataSource = "#DataSource#"
                returnVariable = "getProjectList"
                whatFields ="Legion"
                Join = "LCoCAgencyComponent"
                Where = "SessionCoC"
                Order = "Depends">
          <!---/ Get Project List --->
        <form action="#CurrentPage#" >
          <label>Switch Projects</label>
          <input type="hidden" name="APR" value="#URL.APR#">
          <input type="hidden" name="q" value="#URL.q#">
          <select name="project" onchange="this.form.submit()">
            <option value="0" <cfif URL.project EQ 0>SELECTED</cfif>></option>
            <cfloop query="getProjectList">
              <option value="#getProjectList.projectID#" <cfif URL.project EQ getProjectList.projectID>SELECTED<cfset ProjectName = getProjectList.projectLongName></cfif>>#getProjectList.projectLongName#</option>
            </cfloop>
          </select>
        </form>
        <!--- Projects --->
      </div>
      <div class="medium-6 columns">
        <!--- APR Set --->
      <!--- Get APR Set List --->
      <cfinvoke component="knex.aprSet" 
          method="get"
          DataSource = "#DataSource#"
          returnVariable = "getAPR"
            whatFields = "APRSetName, aprID"
            Join = "LCoC"
            Where = "SessionCoC">
      <!---/ Get APR Set List --->
        <form action="#CurrentPage#">
          <label>Switch APRs</label>
          <input type="hidden" name="project" value="#URL.project#">
          <input type="hidden" name="q" value="#URL.q#">
           <select name="APR" onchange="this.form.submit()">
            <option value="0" <cfif URL.APR EQ 0>SELECTED</cfif>></option>
            <cfloop query="getAPR">
              <option value="#getAPR.aprID#" <cfif URL.APR EQ getAPR.aprID>SELECTED<cfset APRSetName = getAPR.APRSetName></cfif>>#getAPR.APRSetName#</option>
            </cfloop>
          </select>
        </form>
        <!--- APR Set --->
      </div>
    <cfelse>
      <div class="medium-12 columns">
        <div class="text-center">First, select a community from the <i>Select a Community</i> dropdown menu above.</div>
      </div>
    </cfif>
  </div>
</div>
</cfoutput>


<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<cfif URL.project NEQ 0 AND URL.APR NEQ 0 AND SESSION.cocID NEQ 0>
	<!--- Data Entry Tool --->
	<!--- Get Question List --->
	<!--- Get List of APR Questions --->
	<cfinvoke component="knex.aprSet" method="getQs" DataSource = "#DataSource#" returnVariable = "getAPRQList" whatFields = "any" whatAPR = "any" Order = "any">
	
	<!--- Get List of APR Questions --->
	<!--- Get Question List --->
	<div class="globalPad">
		<div class="row">
			<div class="medium-3 columns">
			<cfoutput>
				<!--- Navigation --->
				<ul class="menu vertical"#SESSION.authLevel gte 6 ? 'style="display: none;"':''#>
					<li <cfif URL.q EQ 0>class="active"</cfif>>
						<a href="#CurrentPage#?project=#URL.project#&APR=#URL.apr#&q=0">Summary</a>
					</li>
					<li><label>APR Questions</label></li>
					
					<!--- Get Project Components --->
					<cfinvoke component="knex.component" method="getThis" DataSource = "#DataSource#" returnVariable = "getProjectCom">
					
					<!--- Get Project Components --->
					<cfloop list="#getAPRQList.aprSetQList#" index="question">
						<!--- Get APR Question Title and Component List --->
						<cfinvoke component = "knex.table" method = "get" datasource = "#datasource#" returnVariable = "getTables" Question = "#question#" whatFields = "tableAPRQTitle, programComponentList" Where = "namedQuestion">
						
						<!---/ Get APR Question Title and Component List --->            
						<cfif listContains("#getTables.programComponentList#", "#getProjectCom.projectComponentID#")>
							<li <cfif URL.q EQ "#question#">class="active"<cfset QuestionTitle = getTables.tableAPRQTitle></cfif>>
								<a href="#CurrentPage#?project=#URL.project#&APR=#URL.apr#&q=#question#">
									#getTables.tableAPRQTitle#
								
									<!--- Get APR ID from DataAPR Table --->
									<cfinvoke component = "knex.aprData" method = "tmp"	datasource = "#datasource#"	returnVariable = "getTables"	Question = "#question#">
								
									<!---/ Get APR ID from DataAPR Table --->
									<cfif getTables.RecordCount NEQ 0><i class="fi-check MakeGreen"></i></cfif>
								</a>
							</li>							
						<cfelse>
							<li <cfif URL.q EQ "#question#">class="active"<cfset QuestionTitle = getTables.tableAPRQTitle></cfif>>
							#getTables.tableAPRQTitle#
							</li>
							<cfparam name="nextQ" default="0">
							<cfif question EQ nextQ>
								<cfset nextQ = ListFind(getAPRQList.aprSetQList,"#URL.q#")+2>
								<cfif nextQ GT ListLen(getAPRQList.aprSetQList)>
									<cfset nextQ = 0>
								<cfelse>
									<cfset nextQ = ListGetAt(getAPRQList.aprSetQList,"#nextQ#")>
								</cfif>
								
								<cfset successpage = "#CurrentPage#?project=#URL.project#&apr=#URL.apr#&q=#nextQ#">
							</cfif>
						</cfif>
						
						<!--- Success Page --->
						
						<cfif URL.q EQ "#question#">
							<cfset nextQ = ListFind(getAPRQList.aprSetQList,"#URL.q#")+1>
							<cfif nextQ GT ListLen(getAPRQList.aprSetQList)>
								<cfset nextQ = 0>
							<cfelse>
								<cfset nextQ = ListGetAt(getAPRQList.aprSetQList,"#nextQ#")>
							</cfif>
							<cfset successpage = "#CurrentPage#?project=#URL.project#&apr=#URL.apr#&q=#nextQ#">
						</cfif>
					</cfloop>
					
					<cfif ShowRFI EQ 1>
						<li class="divider"></li>
						<label>#SESSION.CoCCity# Questions</label>
						<li <cfif URL.q EQ "99">class="active"<cfset QuestionTitle = "#SESSION.CoCCity# Supplemental Questions"></cfif>>
							<a href="#CurrentPage#?project=#URL.project#&APR=#URL.apr#&q=99">Supplemental Questions</a>
						</li>
						<cfset nextQ = 0>
					</cfif>
					
					<li class="divider"></li>
					<label>Additional Performance Measures</label>
					<li>
						<a href="#absoluteURL#pages/secure/rfi.cfm?action=list&APR=#URL.apr#" data-open="measures" target="_blank">Add/Update Measures</a>
					</li>
					<!--- Success Page --->		
					
					<li class="divider"></li>
				</ul>
				<!--- Navigation --->
			</cfoutput>
		</div>
	<div class="medium-9 columns">
		<cfoutput>
			<cfif URL.q NEQ 0 AND IsDefined("QuestionTitle")>
				<h1>#QuestionTitle#</h1>
				<h2 class="">#ProjectName#</h2>
				<hr>        
				
				<form method="post" action="#CurrentPage#?project=#URL.project#&apr=#URL.apr#&q=#URL.q#"  data-abide>
					<!--- Q7 Totals --->
					<!--- Get APR07 Totals --->
					<cfinvoke component = "knex.aprdata" method = "q7totals" datasource = "#datasource#" returnVariable = "q7totals">
					
					<!---/ Get APR07 Totals --->
					<cfparam name="DataCheck" default="no">
					<cfif q7totals.RecordCount GT 0 AND URL.q NEQ 99>
						<cfset DataCheck = "yes">
						<div class="panel BGLightGray">
							<h3>Data Quality</h3>
							<p>
								<b>Persons Served</b> #q7totals.apr07_TotalClients# &nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;
								
								<cfset persons="#q7totals.apr07_TotalClients#">
								
								<input type="hidden" value="#q7totals.apr07_TotalClients#" id="persons">
								<b>Adults</b> #q7totals.apr07_TotalAdults# &nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;
								
								<cfset adults="#q7totals.apr07_TotalAdults#">
								
								<input type="hidden" value="#q7totals.apr07_TotalAdults#" id="adults">
								<b>Children</b> #q7totals.apr07_TotalChildrenUnaccomp# &nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;
								
								<cfset children="#q7totals.apr07_TotalChildrenUnaccomp#">
								<cfset ageUkwn=persons-adults-children>
								
								<input type="hidden" value="#q7totals.apr07_TotalChildrenUnaccomp#" id="children">
								<input type="hidden" value="#ageUkwn#" id="ageUkwn">
								<b>Leavers</b> #q7totals.apr07_TotalLeavers# &nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;
								<input type="hidden" value="#q7totals.apr07_TotalLeavers#" id="leavers">
								
								<cfset leavers="#q7totals.apr07_TotalLeavers#">
								<cfset stayers = q7totals.apr07_TotalClients-q7totals.apr07_TotalLeavers>
								
								<input type="hidden" value="#Stayers#" id="stayers">
								<b>Stayers</b> #Stayers# &nbsp;&nbsp; &nbsp;|&nbsp;&nbsp;&nbsp;
								<a href="#CurrentPage#?project=#URL.project#&apr=#URL.apr#&q=7">update</a>
							</p>
						</div>
					<cfelseif URL.q GT 7 AND URL.q NEQ 99>
						<div class="panel BGLightGray">
							<h3 class="MakeRed">WARNING</h3>
							To ensure accurate data entry complete the first section of <a href="#CurrentPage#?project=#URL.project#&apr=#URL.apr#&q=7">APR Question 7</a> before continuing.
						</div>
					</cfif>
					<!---/ Q7 Totals --->
					
					
					<cfinclude template="#absoluteURL#legos/APRForm#URL.q#.cfm">
					<div class="row">
						<div class="large-12 columns text-right">
							<input type="hidden" value="process" name="action">
							<input type="hidden" value="#URL.apr#" name="aprID">
							<input type="hidden" value="#URL.project#" name="projectID">
							<input type="hidden" value="#SESSION.userID#" name="inputUserID">
							<input type="hidden" value="0" name="reviewUserID">
							<input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
							
							<input type="submit" value="update" name="submit" class="small button secondary" <cfif isdefined("nexttab")>tabindex="#nexttab#"</cfif>>
						</div>
					</div>
				</form>
			<cfelseif URL.q EQ 0>
				<h1>#ProjectName#</h1>
				<h2 class="">Data Entry Summary (#getAPR.APRSetName#)</h2>
				<hr>
				<div class="row">
					<div class="large-12 columns text-right">
						<cfinclude template="#absoluteURL#legos/APRFormDataCheck.cfm">
					</div>
				</div>
			</cfif>
			</div>
			</div>
		</cfoutput>
	</div>
<!---/ Data Entry Tool --->
<cfelse>
	<div class="row">
		<div class="large-12 columns text-center">
			<br><br><br>
			<h1 class="">Select a Project and APR Data Set</h1>
			<br><br><br>
		</div>
	</div>
</cfif>