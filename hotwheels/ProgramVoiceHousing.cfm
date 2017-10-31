        <!--- Get Measure --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="1058"
                  returnvariable="pm">
        <!---/ Get Measure --->
<cfif pm.value NEQ "" AND pm.value NEQ "0">
<cfoutput>
<!--- Display --->
<h3 class="MakePrimary">Program Voice on Housing Stability</h3>
    <p>
        <!--- Get Measure --->
        <cfinvoke component="knex.pm"
                  method="getProject"
                  apr="#URL.apr#"
                  project="#URL.project#"
                  pm="1058"
                  returnvariable="pm">
        <!---/ Get Measure --->
    	#pm.value#
    </p>
</cfoutput>
<cfelse>
    <cfoutput>
        <!--- Display --->
        <h3 class="MakePrimary">Program Voice on Housing Stability</h3>
        <p>
            The program may supply a narrative for this Program Voice section, using the Project Evaluation Response Form. If no narrative is provided, this Program Voice section will not appear on the report.
        </p>
    </cfoutput>
</cfif>