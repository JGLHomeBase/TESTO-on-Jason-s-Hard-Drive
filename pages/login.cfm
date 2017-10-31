<!---
Filename: login.cfm
--->

<!--- Default Variables --->
<cfparam name="SESSION.AuthTargetPage" default="#CurrentPage#"></cfparam>
<!--- Default Variables --->

<!--- Header Row --->
<div class="CFBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br><br>Welcome back<cfif SESSION.userFirst NEQ "Guest">, <cfoutput>#SESSION.userFirst#</cfoutput></cfif>.</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<div class="globalPad">
    <cfif SESSION.authLevel GTE 10 AND URL.action NEQ "recover">
        <!--- Username and Password --->
        <div class="row">
            <div class="large-12 columns">
                <br>
                <h1>Please login.</h1>
                <cfoutput><p>Enter your email address and password to login to #AppShortName#. Stumpted? <a href="#CurrentPage#?action=recover">Reset your password here</a>.</p></cfoutput>
                <br>
            </div>
        </div>
         <cfoutput>
         <form action="#SESSION.AuthtargetPage#" method="post" data-abide>
            <div class="row">
                <div class='large-5 columns'>
                    <input type="email" 
                           name="email" 
                           placeholder="email address"
                           required="yes"
                           maxlength="256">
                    <small class="form-error">Enter your email address.</small>
                </div>
                <div class='large-5 columns'>
                    <input type="password" 
                           name="password"
                           placeholder="password"
                           required="yes"
                           maxlength="512">
                    <small class="form-error">Enter your password.</small>
                </div>
                <div class='large-2 columns'>
                    <input type="hidden" value="login" name="action">
                    <input type="submit" value="login" name="submit" class="small button secondary">
                </div>
            </div>
        </form>
        </cfoutput>
        <!---/ Username and Password --->
    <cfelseif URL.action EQ "reset">
        <!--- Password Reset --->
        <div class="row">
            <div class="large-12 columns">
                <br>
                <h1>Time for a new password.</h1>
                <p>
                    <b>Choose a secure password.</b>
                    Your password should include a combination of numbers, letters and symbols that is difficult to guess.
                    Do not reuse your <cfoutput>#AppShortName#</cfoutput> password on other sites.
                </p>
                <br>
            </div>
        </div>
         <cfoutput>
         <form action="#SESSION.AuthtargetPage#" method="post" data-abide>
            <div class="row">
                <div class='large-5 columns'>
                    <input type="password" 
                           name="password"
                           placeholder="new password"
                           id="password"
                           maxlength="512"
                           required>
                    <small class="form-error">Enter a new password.</small>
                </div>
                <div class='large-5 columns'>
                    <input type="password" 
                           name="confirmpassword"
                           placeholder="confirm password"
                           data-equalto="password"
                           maxlength="512"
                           required>
                    <small class="form-error">Passwords do not match.</small>
                </div>
                <div class='large-2 columns'>
                    <input type="hidden" value="#SESSION.userEmail#" name="email">
                    <input type="hidden" value="reset" name="action">
                    <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                    <input type="submit" value="ok" name="submit" class="small button secondary">
                </div>
            </div>
        </form>
        </cfoutput>
        <!---/ Password Reset --->
    <cfelseif URL.action EQ "recover" AND SESSION.authLevel GTE 10>
        <!--- Recover Password --->
        <div class="row">
            <div class="large-12 columns">
                <br>
                <h1>Password Reset</h1>
                <p>
                    <b>Can't remember your password?</b> No problem.
                    Enter your email address below to recover your <cfoutput>#AppShortName#</cfoutput> account.
                </p>
                <br>
            </div>
        </div>

         <cfoutput>
         <form action="#SESSION.AuthtargetPage#" method="post" data-abide>
            <div class="row">
                <div class='large-9 columns'>
                    <input type="email" 
                           name="email"
                           placeholder="email address"
                           maxlength="256"
                           required>
                    <small class="form-error">Enter your email address.</small>
                </div>
                <div class='large-3 columns'>
                    <input type="hidden" value="recover" name="action">
                    <input type="submit" value="send new password" name="submit" class="small button secondary">
                </div>
            </div>
        </form>
        </cfoutput>
        <!---/ Recover Password --->
    <cfelseif SESSION.authLevel LT 10>
        <!--- Session Info --->
        <cfoutput>
            <div class="row">
                <div class='large-12 columns text-center'>
                    <h1>Session Info</h1>
                    <p>You are currently logged in as #SESSION.userFirst# #SESSION.userLast# (#SESSION.userEmail#).</p>
                    <p>
                        <a href="#CurrentPage#?action=logout" class="button">logout</a>
                    </p>
                </div>
            </div>
        </cfoutput>
        <!---/ Session Info --->
    </cfif>
</div>