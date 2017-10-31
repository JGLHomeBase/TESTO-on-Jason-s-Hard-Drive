<cfparam name="URL.coc" default="#SESSION.cocID#">

<cfif isNumeric(SESSION.compID) and SESSION.compID>
  <cflocation url="#AbsoluteURL#pages/secure/scoreHome.cfm">
</cfif>

<div class="CFHotBoxHome">
    <div class="row">
      <div class="large-12 columns">
        <div class="text-right">
         
        </div>
      </div>
    </div>
</div>
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<div class="globalPad">
    <cfoutput>
    <div class="row">
        <div class="large-12 columns">
            <br>
        </div>
    </div>
    <div class="row">
      <div class="medium-8 columns">
            <h1>Introducing #AppShortName#...</h1>
          <p><a href="https://homebaseccc.org">HomeBase</a>'s #AppLongName# (#AppShortName#) is a web-based tool for analyzing the performance of homeless housing and service providers, and facilitating local applications for competitive federal funding.</p>
      </div>
      <div class="medium-4 columns">
        <cfquery name="getPublicCoCs">
        SELECT cocCity, cocState, cocID
        FROM coc
        WHERE active = '1' AND profileEnable = '1'
        ORDER BY cocState, cocCity
        </cfquery>
        <cfif getPublicCoCs.RecordCount GT 0>
            <div class="panel text-center">
                <h3>#AppShortName# Communities</h3>
                <form action="#AbsoluteURL#pages/coc.cfm">
                    <input type="hidden" name="action" value="cocswitch">
                    <select name="coc" onchange="this.form.submit()">
                        <option selected><i>Select a Community</i></option>
                        <cfloop query="getPublicCoCs">
                        <option value="#getPublicCoCs.cocID#">#getPublicCoCs.cocCity#, #getPublicCoCs.cocState#</option>
                        </cfloop>
                    </select>
                </form>
            </div>  
        </cfif>
      </div>
    </div>

    <div class="row">
      <div class="large-12 columns">
        <hr>
      </div>
    </div>
    <div class="row">
      <div class="medium-6 columns">
        <h2 class="MakePrimary">Created by HomeBase</h2>
        <p><cfoutput>#AppShortName#</cfoutput> was developed in San Francisco by HomeBase&mdash;a non-profit, public policy law firm that works with communities to develop effective and humane responses to homelessness. Learn more about <a href="https://homebaseccc.org/hb/index.php/about/mission-and-guiding-principles">who we are</a> and <a href="https://homebaseccc.org/hb/index.php/about/impact-testimonials">what we do</a>. </p>
      </div>
      <div class="medium-6 columns">
        <h2 class="MakePrimary">Questions?</h2>
        <p>Check our our <a href="pages/secure/help.cfm">documentation</a> for quick answers to common questions (login required). Still stumped? Contact us at <a href="mailto:#HelpEmail#">#HelpEmail#</a>.</p>
    </p>
      </div>
    </div>
    <div class="row">
      <div class="large-12 columns">
        <hr>
      </div>
    </div>
    </cfoutput>
</div>