<!--- Get It --->
<cfparam name="URL.coc" default="0">
<cfquery name="getProfile">
SELECT * FROM coc
WHERE active = '1' AND profileEnable = '1' AND cocID = <cfqueryparam value="#URL.coc#">
</cfquery>
<!---/ Get It --->


<!--- Header Row --->
<div class="CFBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <div style="padding-top:50px;">
                <h1 class="CFHeader"><cfoutput>#getProfile.cocCity#, #getProfile.cocState#</cfoutput></h1>
                <p class="CFHeader"><cfoutput>#getProfile.cocLongName#</cfoutput></p>
            </div>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->


<div class="row" style="margin-top:25px;">
    <div class="large-9 columns">
        <cfoutput>#getProfile.profileBody#</cfoutput>
    </div>
    <div class="large-3 columns">
        <div class="text-center">
            <!--- Login --->
            <cfif SESSION.authLevel GTE 10>
                <div class="panel">
                    <cfoutput>
                        <h4>#getProfile.cocCity# Applicants &amp; Panelists</h4>
                        <a href="##" class="button" data-open="Login">Login Here</a>
                    </cfoutput>
                </div>
                <hr>
            </cfif>
            <!--- CoC Website --->
            <cfif getProfile.CoCURL NEQ "">
                <cfoutput><a href="#getProfile.CoCURL#" target="_blank" class="button">#getProfile.CoCName# Website</a></cfoutput>
            </cfif>
            
        </div>
    </div>
</div>