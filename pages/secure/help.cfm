<cfparam name=URL.doc default ="GettingStarted">

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>#AppShortName# Docs</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->
<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<div class="row">
  <div class="medium-2 columns">
    <cfinclude template="#AbsoluteURL#docs/docnav.cfm">
  </div>
  <div class="medium-10 columns">
    <cfinclude template="#AbsoluteURL#docs/#URL.doc#.cfm">
  </div>
</div>
