<!--- Variables --->
<cfparam name=URL.user default ="0">
<cfparam name=URL.comp default ="#SESSION.compID#">
<!---/ Variables --->
    
<!--- Get Comp Info --->
<cfquery name="getComp">
SELECT compID, compLongName, compName
FROM comp
WHERE compID = <cfqueryparam value="#URL.comp#">    
</cfquery>
<!---/ Get Comp Info --->
    
<!--- Get Recipients --->
<cfif FORM.action EQ "preview" OR FORM.action EQ "send">
    <cfif FORM.emailTo EQ "panel">
        <cfquery name="getTo">
        SELECT compPanelID, userEmail, userFirst, userLast, authLevel, users.userID
        FROM comppanel
            INNER JOIN users ON comppanel.userID = users.userID
        WHERE comppanel.compID = <cfqueryparam value="#getComp.compID#">
        </cfquery>
    </cfif>
    <cfif FORM.emailTo EQ "apps">
        <cfquery name="getTo">
        SELECT DISTINCT userEmail, userFirst, userLast, authLevel, users.userID
        FROM compapp
            INNER JOIN users ON compapp.contactApprove = users.userID
                             OR compapp.contactAlt = users.userID
        WHERE compapp.compID = <cfqueryparam value="#getComp.compID#">
        </cfquery>
    </cfif>
</cfif>
<!---/ Get Recipients --->
    
<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>Draft Email</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->


<cfoutput>
    <div class="row">
      <div class="medium-2 columns">
        <cfoutput>
          <!--- Navigation --->
          <cfinclude template="#AbsoluteURL#legos/compMenu.cfm">
          <!--- Navigation --->
        </cfoutput>
      </div>
      <div class="medium-10 columns">
         <div class="row">
                <div class="large-12 columns">
                    <br><br>
                    <h1>#SESSION.cocCity# #getComp.compLongName# Messages</h1>
                    <p>Draft a new message to applicants and/or panelists.</p>
                    <hr>
                    <cfif FORM.action EQ "send">
                        <cfloop query="getTo">
                             <!--- Store Body and Subject --->
                            <cfset ORGemailBody =  FORM.emailBody>
                            <cfset ORGemailSubject = FORM.emailSubject>
                            <!---/ Store Body and Subject --->
                            <cfif FindNoCase("!NewPassword!", FORM.emailBody) NEQ 0 AND getTo.authLevel GTE 7>
                                <cfset FORM.password = left(generateSecretKey("Blowfish",32),6)>
                                <cfset FORM.userPassword = Hash(FORM.password,"SHA-512")>
                                <cfset FORM.requireReset = 1>
                                <cfset FORM.userID = getTo.userID>
                                <cfupdate datasource="#DataSource#" tablename="users" formfields="userPassword, requireReset, userID">
                                <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!NewPassword!", "#FORM.password#")>
                            </cfif>
                            <!--- Projects Table --->
                            <cfif FindNoCase("!AppTable!", ORGemailBody) NEQ 0>
                                <cfquery name="getApps">
                                SELECT * 
                                FROM compapp
                                WHERE contactApprove=<cfqueryparam value="#getTo.userID#">
                                      OR contactAlt=<cfqueryparam value="#getTo.userID#">
                                </cfquery>
                                <cfsavecontent variable="AppTable">
                                    <table>
                                        <thead>
                                            <th align="left">Project</th>
                                            <th>Funding Request</th>
                                            <th>Score</th>
                                        </thead>
                                        <tbody>
                                            <cfloop query="getApps">
                                                <tr>
                                                    <td><b>#getApps.appName#</b></td>
                                                    <td>
                                                    <cfif getApps.fundAward NEQ 0>
                                                        #LSCurrencyFormat(getApps.fundAward)#
                                                        <cfif getApps.fundReq LT getApps.fundAward>
                                                            <cfset fundDiff = getApps.fundAward-getApps.fundReq>
                                                            (#LSCurrencyFormat(fundDiff)# more than requested.)
                                                        <cfelseif getApps.fundReq GT getApps.fundAward>
                                                            <cfset fundDiff = getApps.fundReq-getApps.fundAward>
                                                            (#LSCurrencyFormat(fundDiff)# less than requested.)
                                                        </cfif>
                                                    <cfelseif getApps.fundAward EQ 0 AND getApps.fundReq NEQ 0>
                                                        #LSCurrencyFormat("#getApps.fundReq#")#
                                                    <cfelseif getApps.fundAward EQ 0 AND getApps.fundReq EQ 0>
                                                        <i>Not Funded</i>.
                                                    </cfif>
                                                    </td>
                                                    <td>
                                                        #getApps.score#
                                                    </td>
                                                </tr>
                                            </cfloop>
                                        </tbody>
                                    </table>
                                </cfsavecontent>
                                <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!AppTable!", AppTable)>
                            </cfif>
                            <!---/ Projects Table --->
                            <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!UserFirst!", "#getTo.userFirst#")>
                            <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!UserLast!", "#getTo.UserLast#")>
                            <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!UserEmail!", "#getTo.UserEmail#")>
                            <cfset FORM.emailSubject = ReReplaceNoCase(FORM.emailSubject, "!UserFirst!", "#getTo.userFirst#")>
                            <cfset FORM.emailSubject = ReReplaceNoCase(FORM.emailSubject, "!UserLast!", "#getTo.UserLast#")>
                            <cfset FORM.emailSubject = ReReplaceNoCase(FORM.emailSubject, "!UserEmail!", "#getTo.UserEmail#")>
                            <cfinvoke component="knex.gopostal" 
                                      method="send"
                                      DataSource = "#DataSource#"
                                      HelpEmail="#FORM.emailFrom#"
                                      AppShortName="#AppShortName#"
                                      FullURL="#FullURL#"
                                      force="yes"
                                      emailTo="#getTo.UserEmail#"
                                      emailFrom="#FORM.emailFrom#"
                                      emailSubject="#FORM.emailSubject#"
                                      emailSubjectShort="#getComp.compName#"
                                      emailBody="#paragraphFormat(FORM.emailBody)#">
                            <cfset FORM.emailBody = ORGemailBody>
                            <cfset FORM.emailSubject = ORGemailSubject>
                        </cfloop>
                        <div class="row">
                            <div class="large-12 columns text-center">
                                <br><br>
                                <h1>#getTo.RecordCount# messages sent.</h1>
                                <br><br>
                                <a href="#CurrentPageVar#" class="button">Draft new message.</a>
                            </div>        
                        </div>
                    <cfelseif FORM.action EQ "preview">
                        <!--- Store Body and Subject --->
                        <cfset ORGemailBody =  FORM.emailBody>
                        <cfset ORGemailSubject = FORM.emailSubject>
                        <!---/ Store Body and Subject --->
                        <!--- Preview Message --->
                        <div class="row">
                            <div class="large-12 columns">
                                <form action="#CurrentPageVar#" method="post">
                                    <h3>Message Preview:</h3>
                                    <cfif FindNoCase("!NewPassword!", FORM.emailBody) NEQ 0>
                                        <div class="panel BGOrange">
                                            <h3>WARNING</h3> This email will reset the password of all recipients with panelist or reviewer level access.
                                        </div>
                                    </cfif>
                                    <div class="panel">
                                        <div class="row">
                                            <div class="large-12 columns">
                                                <p>
                                                    <b>TO:</b> 
                                                    <cfloop query="getTo">
                                                        #userFirst# #userLast# &lt;#userEmail#&gt;<cfif CurrentRow LT RecordCount>,</cfif>
                                                    </cfloop>
                                                    <input type="hidden"
                                                           name="emailTo"
                                                           value="#FORM.emailTo#">
                                                </p>
                                                <p>
                                                    <b>FROM:</b> #FORM.emailFrom#<br>
                                                    <input type="hidden"
                                                           name="emailFrom"
                                                           value="#FORM.emailFrom#">
                                                </p>
                                                <hr>
                                                 <p>
                                                    <cfset FORM.emailSubject = ReReplaceNoCase(FORM.emailSubject, "!UserFirst!", "#getTo.userFirst#")>
                                                    <cfset FORM.emailSubject = ReReplaceNoCase(FORM.emailSubject, "!UserLast!", "#getTo.UserLast#")>
                                                    <cfset FORM.emailSubject = ReReplaceNoCase(FORM.emailSubject, "!UserEmail!", "#getTo.UserEmail#")>
                                                    <b>SUBJECT:</b> #FORM.emailSubject#
                                                    <input type="hidden"
                                                           name="emailSubject"
                                                           value="#ORGemailSubject#">
                                                </p>
                                                <hr>
                                                <div>
                                                    <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!UserFirst!", "#getTo.userFirst#")>
                                                    <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!UserLast!", "#getTo.UserLast#")>
                                                    <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!UserEmail!", "#getTo.UserEmail#")>
                                                    <!--- Projects Table --->
                                                    <cfif FindNoCase("!AppTable!", FORM.emailBody) NEQ 0 AND FORM.emailTo EQ "apps">
                                                        <cfquery name="getApps">
                                                        SELECT * 
                                                        FROM compapp
                                                        WHERE contactApprove=<cfqueryparam value="#getTo.userID#">
                                                            OR contactAlt=<cfqueryparam value="#getTo.userID#">
                                                        </cfquery>
                                                        <cfsavecontent variable="AppTable">
                                                            <table>
                                                                <thead>
                                                                    <th>Project</th>
                                                                    <th>Funding Request</th>
                                                                    <th>Score</th>
                                                                </thead>
                                                                <tbody>
                                                                    <cfloop query="getApps">
                                                                        <tr>
                                                                            <td><b>#getApps.appName#</b></td>
                                                                            <td>
                                                                            <cfif getApps.fundAward NEQ 0>
                                                                                #LSCurrencyFormat(getApps.fundAward)#
                                                                                <cfif getApps.fundReq LT getApps.fundAward>
                                                                                    <cfset fundDiff = getApps.fundAward-getApps.fundReq>
                                                                                    (#LSCurrencyFormat(fundDiff)# more than requested.)
                                                                                <cfelseif getApps.fundReq GT getApps.fundAward>
                                                                                    <cfset fundDiff = getApps.fundReq-getApps.fundAward>
                                                                                    (#LSCurrencyFormat(fundDiff)# less than requested.)
                                                                                </cfif>
                                                                            <cfelseif getApps.fundAward EQ 0 AND getApps.fundReq NEQ 0>
                                                                                #LSCurrencyFormat("#getApps.fundReq#")#
                                                                            <cfelseif getApps.fundAward EQ 0 AND getApps.fundReq EQ 0>
                                                                                <i>Not Funded</i>.
                                                                            </cfif>
                                                                            </td>
                                                                            <td>
                                                                                #getApps.score#
                                                                            </td>
                                                                        </tr>
                                                                    </cfloop>
                                                                </tbody>
                                                            </table>
                                                        </cfsavecontent>
                                                        <cfset FORM.emailBody = ReReplaceNoCase(FORM.emailBody, "!AppTable!", AppTable)>
                                                    </cfif>
                                                    <!---/ Projects Table --->
                                                   #paragraphFormat(FORM.emailBody)#
                                                    <input type="hidden"
                                                           name="emailBody"
                                                           value="#ORGemailBody#">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-right">
                                        <input type="hidden" name="action" value="send">
                                        <input type="submit" value="Send Email" name="submit" class="small button">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!---/ Preview Message --->
                    <cfelse>
                        <!--- Draft Message --->
                        <form action="#CurrentPageVar#" method="post">
                            <div class="row">
                                <div class="large-12 columns">
                                    <div class="row collapse prefix-round">
                                        <div class="small-1 columns">
                                          <span class="prefix">FROM:</span>
                                        </div>
                                        <div class="small-11 columns">
                                            <input type="text"
                                                   name="emailFrom"
                                                   value="#SESSION.userEmail#"
                                                   required
                                                   maxlength="512"
                                                   readonly>
                                        </div>
                                      </div>
                                      <div class="row collapse prefix-round">
                                        <div class="small-1 columns">
                                          <span class="prefix">TO:</span>
                                        </div>
                                        <div class="small-11 columns">
                                            <select name="emailTo">
                                                <option value="panel">#getComp.compName# Panelists</option>
                                                <option value="apps">#getComp.compName# Applicants</option>
                                            </select>
                                        </div>
                                      </div>
                                </div>
                            </div>
                            <div class="row">
                                  <div class="large-12 columns">
                                      <label>Subject</label>
                                      <input type="text"
                                           name="emailSubject"
                                           placeholder="#SESSION.cocCity# #getComp.compName# Update"
                                           maxlength="512"
                                           required>
                                  </div>
                              </div>
                            <div class="row">
                                  <div class="medium-8 columns text-left">
                                    <label>Message Body</label>
                                    <textarea name="emailBody" height="420" required></textarea>
                                    <input type="hidden" name="action" value="preview">
                                    <input type="hidden" name="compID" value="#getComp.compID#">
                                    <div class="text-right">
                                        <input type="submit" value="Preview Email" name="submit" class="small button">
                                    </div>
                                  </div>
                                   <div class="medium-4 columns">
                                       <div class="panel BGLightGray">
                                        <h6>Merge Tags</h6>
                                           <p>
                                               Use can the following merge tags in the body or subject:
                                               <ul>
                                                <li><b>!UserFirst!</b> <Br> First Name</li>
                                                <li><b>!UserLast!</b> <Br> Last Name</li>
                                                <li><b>!UserEmail!</b> <Br>Email</li>
                                                <li><b>!NewPassword!</b> <Br>New temporary password (replaces current passwords)</li>
                                               </ul>
                                            </p>
                                        <h7>Applicant Merge Tags</h7>
                                           <p>
                                               Use can the following merge tags in the body or subject in messages sent to applicants:
                                               <ul>
                                                <li><b>!AppTable!</b> <Br> Table of applications, funding amounts and scores</li>
                                               </ul>
                                            </p>
                                       </div>
                                   </div>
                              </div>
                        </form>
                        <!---/ Draft Message --->
                    </cfif>

                </div>
            </div>
                        </div>
             </div>
</cfoutput>