<cfparam name="formType" default="new">
    
<cfoutput>
    <form action="#CurrentPageVar#" method="post" class="<cfif formType EQ "update">panelLink</cfif>">
        <!--- Contacts --->
        <cfquery name="getUser">
        SELECT userID, userFirst, userLast, userEmail
        FROM users
        WHERE (agencyID = '0' AND compID = <cfqueryparam value="#URL.comp#"> AND authLevel < '8')
        ORDER BY agencyID DESC, userLast ASC, userFirst ASC
        </cfquery>
        <div class="row">
            <div class="large-12 columns">
                <cfif FormType EQ "new">
                    <div class="row">
                        <div class="medium-3 columns">
                            <label>Existing Contact</label>
                            <select name="userID">
                                <option value="new">New Contact &rarr;</option>
                                <cfloop query="getUser">
                                    <cfif ListContains(PanelList,"#getUser.userID#") EQ 0>
                                        <cfif formType EQ "update" AND getPanelists.userID EQ "#getUser.userID#">
                                            <cfset SELECTED = " selected">
                                        <cfelse>
                                            <cfset SELECTED = "">
                                        </cfif>
                                        <option value="#getUser.userID#"#SELECTED#>
                                            #getUser.userFirst# #getUser.userLast# (#getUser.userEmail#)
                                        </option>
                                    </cfif>
                                </cfloop>
                            </select>
                        </div>
                        <div class="medium-1 columns text-center">
                            <br><br><h6>&mdash; OR &mdash;</h6>
                        </div>
                        <div class="medium-2 columns">
                            <label>First Name</label>
                            <input type="text"
                                   name="userFirst"
                                   placeholder="Jane"
                                   maxlength="150">
                        </div>
                        <div class="medium-2 columns">
                            <label>Last Name</label>
                            <input type="text"
                                   name="userLast"
                                   placeholder="Doe"
                                   maxlength="150">
                        </div>
                        <div class="medium-4 columns">
                            <label>Email</label>
                            <input type="email"
                                   name="userEmail"
                                   placeholder="jane.doe@organization.org"
                                   maxlength="256">
                        </div>
                    </div>
                </cfif>
                    <div class="row">
                        <div class="medium-3 columns">
                           <!--- scoreAllow --->
                            <label>Scoring: Enable</label>
                            <select name="scoreAllow" required>
                                <cfif FormType EQ "update" AND getPanelists.scoreAllow EQ 1>
                                    <cfset SELECTED = " selected">
                                <cfelse>
                                    <cfset SELECTED = "">
                                </cfif>
                                   <option value="1"#SELECTED#>Enable</option>
                                <cfif FormType EQ "update" AND getPanelists.scoreAllow EQ 0>
                                    <cfset SELECTED = " selected">
                                <cfelse>
                                    <cfset SELECTED = "">
                                </cfif>
                                <option value="0"#SELECTED#>Disable</option>
                            </select>
                            <!---/ scoreAllow --->
                        </div>
                        <div class="medium-3 columns">
                            <!--- scoreInclude --->
                            <label>Scoring: Include in Total</label>
                            <select name="scoreInclude" required>
                                <cfif FormType EQ "update" AND getPanelists.scoreInclude EQ 1>
                                    <cfset SELECTED = " selected">
                                <cfelse>
                                    <cfset SELECTED = "">
                                </cfif>
                                <option value="1"#SELECTED#>Include</option>
                                <cfif FormType EQ "update" AND getPanelists.scoreInclude EQ 0>
                                    <cfset SELECTED = " selected">
                                <cfelse>
                                    <cfset SELECTED = "">
                                </cfif>
                                <option value="0"#SELECTED#>Exclude</option>
                            </select>
                            <!---/ scoreInclude --->
                        </div>
                        <div class="medium-3 columns">
                           <!--- seat --->
                            <label>Seat Order (Number)</label>
                            <input type="number"
                                   name="seat"
                                   placeholder="0"
                                   maxlength="3"
                                   <cfif FormType EQ "update">value="#getPanelists.seat#"</cfif>>
                            <!---/ seat --->
                        </div>
                        <div class="medium-3 columns text-right">
                            <cfif FormType EQ "update">
                                <input type="submit" value="update" name="submit" class="small button">
                            <cfelse>
                                 <input type="submit" value="add" name="submit" class="small button">
                            </cfif>
                        </div>
                    </div>
                </div>
            </div>
        <!---/ Contacts --->
        <input type="hidden" name="action" value="process">
        <input type="hidden" name="compID" value="#getComp.compID#">
        <cfif FormType EQ "update">
            <input type="hidden" name="compPanelID" value="#getPanelists.compPanelID#">
        <cfelse>
            <input type="hidden" name="compPanelID" value="0">
        </cfif>

    </form>
</cfoutput>