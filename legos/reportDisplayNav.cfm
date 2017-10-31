<cfparam name="variables.urlToShare" default="" />
<cftry>
	<!--- get URL for sharing --->
	<cfset variables.urlToShorten = "#variables.htProtocol#://#cgi.http_host#/#cgi.script_name#?action=share&apr=#URL.apr#&project=#URL.project#&report=#URL.report#&score=#URL.score#">
	
	<cfhttp method="get" url="https://api-ssl.bitly.com/v3/shorten" result="res">
		<cfhttpparam type="url" name="access_token" value="#APIKey.BitlyToken#" />
		<cfhttpparam type="url" name="longUrl" value="#variables.urlToShorten#" />
		<cfhttpparam type="url" name="domain" value="j.mp" />
	</cfhttp>
	
	<cfif isJson(res.FileContent)>
		<cfset variables.urlToShare = deserializeJson(res.FileContent).data.url />
	</cfif><!---
	
	<!--- restore previous session values --->
	<cfset session.cocID = session.cocID_prior />
	<cfset session.cocCity = session.cocCity_prior />--->
	
	<cfcatch type="any"><cfdump var="#cfcatch#">
		<!--- fail silently --->
	</cfcatch>
</cftry>
<cfoutput>
    <div class="panel hide-for-print">
        <form action="#CurrentPage#">
        <div class="row">
            <cfif URL.mode EQ "explore">
                <div class="medium-5 column">
                     <!--- Get Project List --->
                      <cfinvoke component="knex.projects" 
                            method="getList"
                            DataSource = "#DataSource#"
                            returnVariable = "getProjectList"
                            whatFields ="Legion"
                            Join = "LCoCAgencyComponent"
                            Where = "Session"
                            Order = "Layered">
                      <!---/ Get Project List --->
                    <label>Project:</label> 
                    <select name="project" onchange="this.form.submit()">
                      <cfloop query="getProjectList">
                        <cfif getProjectList.projectID EQ URL.project>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getProjectList.projectID#"#selected#>#getProjectList.projectLongName#</option>
                      </cfloop>
                    </select>
                </div>
                <div class="medium-4 column">
                      <label>APR Set:</label>  
                      <select name="apr">
                      <cfquery name="getAPR">
                      SELECT aprID, aprSetName
                      FROM dataapr00
                          <cfif SESSION.cocID NEQ 0>
                          WHERE cocID = <cfqueryparam value="#SESSION.cocID#">
                          </cfif>
                      </cfquery>
                      <cfloop query="getAPR">
                        <cfif getAPR.aprID EQ URL.apr>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getAPR.aprID#"#selected#>#getAPR.aprSetName#</option>
                      </cfloop>
                    </select>
                    <input type="hidden" value="#URL.report#" name="report">
                </div>
            <cfelseif URL.mode EQ "score">
                
                <!--- Get List --->
              <cfquery name="getApps">
              SELECT compapp.appName, 
                     compapp.compAppID,
                     compapp.projectID,
                     agency.agencyName,
                     compapp.fundAward,
                     compapp.fundReq,
                     compapp.reportID,
                     comp.aprDefaultID,
                     projects.projectLongName
              FROM compapp
                    INNER JOIN projects ON compapp.projectID = projects.projectID
                    INNER JOIN agency ON projects.agencyID = agency.agencyID
                    INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
                    INNER JOIN comp ON compapp.compID = comp.compID
              WHERE compapp.active = '1'
                  AND compapp.compID = <cfqueryparam value="#SESSION.compID#">
                  ORDER BY projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC
              </cfquery>
             <cfset appList = ValueList(getApps.compAppID)>
                <!---/ Get List --->
                    
                <!--- Score Nav --->
                <div class="medium-3 columns text-left">
                    <cfif ListFind(appList,"#URL.app#") GT 1>
                        <cfset TargetPrev = ListFind(appList,"#URL.app#")-1>
                        <cfset TargetPrev = ListGetAt(appList,TargetPrev)>
                        <a href="#CurrentPage#?app=#TargetPrev#&score=#URL.score#" class="button small"><i class="fi-arrow-left"></i></a>
                    </cfif>
                    <a href="scoreHome.cfm" class="button small"><i class="fi-home"></i></a>
                    <cfif ListFind(appList,"#URL.app#") LT ListLen(appList)>
                        <cfset TargetNext = ListFind(appList,"#URL.app#")+1>
                        <cfset TargetNext = ListGetAt(appList,TargetNext)>
                        <a href="#CurrentPage#?app=#TargetNext#&score=#URL.score#" class="button small"><i class="fi-arrow-right"></i></a>
                    </cfif>
                </div>
                <div class="medium-6 columns text-center">
                    <select name="app" onchange="this.form.submit()">
                      <cfloop query="getApps">
                        <cfif getApps.compAppID EQ URL.app>
                            <cfset selected = " selected">
                        <cfelse>
                            <cfset selected = "">
                        </cfif>
                        <option value="#getApps.compAppID#"#selected#>#getApps.appName#</option>
                      </cfloop>
                    </select>
                    <input type="hidden" name="score" value="#URL.score#">
                </div>
                <!---/ Score Nav --->
            <cfelse>
                <div class="medium-9 columns"></div>
            </cfif>
            
            <div class="medium-3 column text-right">
                <cfif SESSION.authLevel LT 7>
                    <cfinclude template="#AbsoluteURL#legos/reportLink.cfm" />
                    <a href="scorecard.cfm?app=#URL.app#" class="button">Scorecard</a>
                </cfif>
                
                <cfif variables.urlToShare neq "">
                	<a href="##" class="button" title="Share this report" data-open="shareurl"><img src="#AbsoluteURL#img/icons/share.png" border="0" alt="Share this report"> Share</a>
				</cfif>
                
                <a href="#CurrentPage#?action=print&apr=#URL.apr#&project=#URL.project#&report=#URL.report#&score=#URL.score#" class="button small" target="_blank" title="Print this report"><img src="#AbsoluteURL#img/icons/printer.svg" width="30" alt="Print"> Print</a>
                <!---<a href="#CurrentPage#?action=pdf&apr=#URL.apr#&project=#URL.project#&report=#URL.report#&score=#URL.score#" class="button small" target="_blank"><img src="#AbsoluteURL#img/icons/pdf.svg" width="30" alt="PDF"> PDF</a>--->
            </div>
			<div id="shareurl" style="background-color: white !important;" class="reveal small BGPrimary" data-reveal>
				<cfoutput>
					<h2>Copy/paste this URL:</h2>
					<h3 style="text-align: center;"><a href="#variables.urlToShare#" target="_blank">#variables.urlToShare#</a></h3>
				</cfoutput>
			</div>
        </div>
        
        </form>
    </div>
</cfoutput>
