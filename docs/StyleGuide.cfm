<cfoutput>
    <!--- Heading --->
    <div class="row">
        <div class="large-12 columns">
            <h1>#AppShortName# Style Guide</h1>
            <p>Branding guidelines and CSS styles for #AppShortName#</p>
        </div>
    </div>
    <!---/ Heading --->

    <!--- Fonts --->
    <div class="row">
        <div class="large-12 columns">
            <h2>Fonts</h2>
            <p>
                #AppShortName# keeps things simple. The application uses the same sans serif font stack for both headings and body copy. Styles default to a Google Fonts hosted copy of the open source <a href="https://www.google.com/fonts/specimen/Lato" target="_blank"><i>Lato</i></a> typeface family by Lukasz Dziedzic and fall back to <i>Helvetica Neue</i>, <i>Helvetica</i>, and <i>Arial</i>.
            </p>
        </div>
    </div>
    <!---/ Fonts --->

    <!--- Colors --->
    <div class="row">
    	<div class="large-12 columns">
    		<h2>Colors</h2>
    		<table width="100%" class="text-center">
    			<thead>
    				<th width="150"></th>
    				<th class="text-center">Color</th>
    				<th class="text-center">HEX</th>
    				<th class="text-center">Foreground Class</th>
    				<th class="text-center">Background Class</th>
    			</thead>
    			<tbody>
    				<!--- Primary --->
    				<tr>
    					<td class="BGPrimary"></td>
    					<td><b>Primary*</b></td>
    					<td><a href="http://www.colorhexa.com/2a80b9" target="_blank">2A80B9</a></td>
    					<td>MakePrimary</td>
    					<td>BGPrimary</td>
    				</tr>
    				<!---/ Primary --->
    				<!--- Secondary --->
    				<tr>
    					<td class="BGSecondary"></td>
    					<td><b>Secondary*</b></td>
    					<td><a href="http://www.colorhexa.com/2c3e50" target="_blank">2C3E50</a></td>
    					<td>MakeSecondary</td>
    					<td>BGSecondary</td>
    				</tr>
    				<!---/ Secondary --->
    				<!--- Info --->
    				<tr>
    					<td class="BGLightBlue"></td>
    					<td><b>Light Blue</b> (Info*)</td>
    					<td><a href="http://www.colorhexa.com/a0d3e8" target="_blank">A0D3E8</a></td>
    					<td>MakeLightBlue</td>
    					<td>BGLightBlue</td>
    				</tr>
    				<!---/ Info --->
    				<!--- Green --->
    				<tr>
    					<td class="BGGreen"></td>
    					<td><b>Green</b> (Success*)</td>
    					<td><a href="http://www.colorhexa.com/1abc9c" target="_blank">1ABC9C</a></td>
    					<td>MakeGreen</td>
    					<td>BGGreen</td>
    				</tr>
    				<!---/ Green --->
    				<!--- Alert --->
    				<tr>
    					<td class="BGRed"></td>
    					<td><b>Red</b> (Alert*)</td>
    					<td><a href="http://www.colorhexa.com/e0293f" target="_blank">E0293F</a></td>
    					<td>MakeRed</td>
    					<td>BGRed</td>
    				</tr>
    				<!---/ Alert --->
    				<!--- Warning --->
    				<tr>
    					<td class="BGOrange"></td>
    					<td><b>Orange</b> (Warning*)</td>
    					<td><a href="http://www.colorhexa.com/e9662c" target="_blank">E9662C</a></td>
    					<td>MakeOrange</td>
    					<td>BGOrange</td>
    				</tr>
    				<!---/ Warning --->
    				<!--- Dark Gray --->
    				<tr>
    					<td class="BGDarkGray"></td>
    					<td><b>Dark Gray</b></td>
    					<td><a href="http://www.colorhexa.com/5b6470" target="_blank">5B6470</a></td>
    					<td>MakeDarkGray</td>
    					<td>BGDarkGray</td>
    				</tr>
    				<!---/ Dark Gray --->
    				<!--- Gray --->
    				<tr>
    					<td class="BGGray"></td>
    					<td><b>Gray</b></td>
    					<td><a href="http://www.colorhexa.com/BDC7D6" target="_blank">BDC7D6</a></td>
    					<td>MakeGray</td>
    					<td>BGGray</td>
    				</tr>
    				<!---/ Gray --->
    				<!--- Light Gray --->
    				<tr>
    					<td class="BGLightGray"></td>
    					<td><b>Light Gray</b></td>
    					<td><a href="http://www.colorhexa.com/E4EDFA" target="_blank">E4EDFA</a></td>
    					<td>MakeLightGray</td>
    					<td>BGLightGray</td>
    				</tr>
    				<!---/ Light Gray --->
    			</tbody>
    			<tfoot>
    				<td colspan="5"><i>*Foundation element style</i></td>
    			</tfoot>
    		</table>
    	</div>
    </div>
    <!--- Colors --->
</cfoutput>