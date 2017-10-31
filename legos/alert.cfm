<!--- Alerts --->
<cfparam name="SESSION.message" default="none">
<cfparam name="SESSION.messageText" default="">
<cfparam name="SESSION.messageTitle" default="">
    
<cfif SESSION.message EQ "message">
    <div class="secondary callout" data-closable="slide-out-right">
        <div class="row">
            <div class="large-12 columns">
                <cfoutput>
                    <cfif SESSION.messageTitle NEQ ""><h3>#SESSION.messageTitle#</h3></cfif>
                    <p>#SESSION.messageText#</p>
                </cfoutput>
                <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
<cfelseif SESSION.message EQ "alert">
    <div class="alert callout" data-closable="slide-out-right">
        <div class="row">
            <div class="large-12 columns">
                <cfoutput>
                    <cfif SESSION.messageTitle NEQ ""><h3>#SESSION.messageTitle#</h3></cfif>
                    <p>#SESSION.messageText#</p>
                </cfoutput>
                <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
<cfelseif SESSION.message EQ "success">
    <div class="success callout" data-closable="slide-out-right">
        <div class="row">
            <div class="large-12 columns">
                <cfoutput>
                    <cfif SESSION.messageTitle NEQ ""><h3>#SESSION.messageTitle#</h3></cfif>
                    <p>#SESSION.messageText#</p>
                 </cfoutput>
                <button class="close-button" aria-label="Dismiss alert" type="button" data-close>
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
</cfif>
<cfset SESSION.message = "none">
<cfset SESSION.messageText = "">
<!---/ Alert --->