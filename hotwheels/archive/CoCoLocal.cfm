<cfoutput>
<div class="row">
	<div class="large-12 columns">
			<h2 class="MakePrimary">Local Application Questions</h2>
			<h3 class="">Project Description </h3>

				<p>#LongAns01#</p>

				<h3 class="">FY2014 Total Project Budget </h3>

				<p>#LSCurrencyFormat(NumAns01)#</p>

				<h3 class="">FY2014 Total Grant Request</h3>

				<p>#LSCurrencyFormat(NumAns02)#</p>

				<h3 class="">Which outcomes in the APR best reflect your project's performance (Q36 or Q37)? Please describe how these outcomes demonstrate the successful performance of your project.</h3>

				<p>#LongAns02#</p>

				<h3 class="">Have there been significant changes in operations or structure of either this program or within the agency in general over the last 12 months (e.g., you offer different supportive services, you increased or decreased the number of beds in the project, you serve a different population, the length of your transitional housing program changed)?  If so, please describe. Are there any plans for significant changes in operations or structure of either this program or within the agency in general over the next 12-24 months?  If so, please describe. Will these changes be reflected in your Project Application (Exhibit 2)?
</h3>

				<p>#LongAns03#</p>

				<h3 class="">Do you have any concerns about not spending down the HUD CoC grant for this program by the end of the grant term?  Have you had any draw down irregularities?  If so, please describe.</h3>

				<p>#LongAns04#</p>

				<h3 class="">How you assess what services/housing your consumers need to become independent.</h3>

				<p>#LongAns05#</p>

				<h3 class="">How you connect consumers to the services/housing they need which your program does not provide.</h3>

				<p>#LongAns06#</p>

				<h3 class="">How you assist your consumers in attaining social and community re-integration.</h3>

				<p>#LongAns07#</p>

				<h3 class="">How you assist your consumers in attaining permanent housing.</h3>

				<p>#LongAns08#</p>

				<h3 class="">If this is a permanent housing program, how you provide follow-up services to consumers who are housed more than a year.  (How often do you see clients who are continuing to remain housed, and what types of services do you provide to those who remain stable in housing longer than one year?)</h3>

				<p>#LongAns09#</p>

				<h3 class="">How many staff are employed by this program?  Please list by job titles and FTE status.</h3>

				<p>#LongAns10#</p>

				<h3 class="">Please describe your staff training, who is trained, and how often.</h3>

				<p>#LongAns11#</p>

				<h3 class="">How does your program evaluate its performance in serving homeless people?</h3>

				<p>#LongAns12#</p>

				<h3 class="">In the past fiscal year, has HUD ever deobligated, or is HUD planning to deobligate, any grant funds awarded to this project? If yes, please indicate the amount, date and reason.</h3>

				<p>#LongAns13#</p>

				<h3 class="">Are there any unresolved HUD monitoring findings or outstanding audit findings related to this project?</h3>

				<p>#ShortAns01#</p>

				<h3 class="">What is the total value of all leverage commitments (cash and in-kind)?</h3>

				<p>#LSCurrencyFormat(NumAns03)#</p>
        
                <h3 class="">What is the total percentage of all leverage commitments (cash and in-kind)?</h3>

				<cfif NumAns02 NEQ 0>
                    <p>#(NumAns03/NumAns02*100)#%</p>
                <cfelse>
                    0
                    </cfif>

	</div>
</div>
</cfoutput>