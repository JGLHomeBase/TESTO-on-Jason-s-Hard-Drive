
	<cfoutput>
	<div class="row">
		<div class="large-12 columns">
            <!--- Get Project Name  --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="289"
                      returnvariable="pm">
            <!---/ Get Project Name  --->
			<h1 class="MakePrimary">#pm.value#
            <!--- Get Project Comp  --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="288"
                      returnvariable="pm">
            <!---/ Get Project Comp  --->                
                (#pm.value#)</h1>
            <!--- Get Agency Name  --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="290"
                      returnvariable="pm">
            <!---/ Get Agency Name  --->
			<h2 class="MakeSecondary">#pm.value#</h2>
			<p>
                <!--- Get Adress Line 1  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="291"
                          returnvariable="pm">
                <!---/ Get Adress Line 1  --->
				<cfif pm.value NEQ "">
                <!--- Get Adress Line 1  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="291"
                          returnvariable="pm">
                <!---/ Get Adress Line 1  --->
					#pm.value#<br>
				</cfif>
                <!--- Get Adress Line 2  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="292"
                          returnvariable="pm">
                <!---/ Get Adress Line 2  --->
				<cfif pm.value NEQ "">
                <!--- Get Adress Line 2  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="292"
                          returnvariable="pm">
                <!---/ Get Adress Line 2  --->
					#pm.value#<br>
				</cfif>
                <!--- Get Neighborhood  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="293"
                          returnvariable="pm">
                <!---/ Get Neighborhood  --->
				<cfif pm.value  NEQ "">
                <!--- Get Neighborhood  --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="293"
                          returnvariable="pm">
                <!---/ Get Neighborhood  --->
					#pm.value#<br>
				</cfif>
			</p>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<hr>
		</div>
	</div>

</cfoutput>
