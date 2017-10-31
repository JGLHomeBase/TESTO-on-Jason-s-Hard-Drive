<!--- Variables --->
<cfparam name=URL.project default ="0">
<!---/ Variables --->

<!--- Get Data --->
<cfinclude template="#absoluteURL#legos/dump.cfm">
<!---/ Get Data --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
               Project Var Dump
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->


<cfdump var="#VARIABLES#">