<cfoutput>
 <div class="row">
 	<div class="large-12 columns">
	 	<h2 class="MakePrimary">Administrative Efficiency</h2>
	 	<div class="row">
	 	<div class="large-12 columns">
			<h3 class="">Are there any unresolved HUD, SSF, or DHA monitoring findings related to this project?</h3>
			 <p>
                 <cfif LongAns02 EQ "">
                N/A
                <CFELSE>
                #LongAns02#
                </cfif>
             </p>
        
            <h3 class="">In the past 3 operating years, has HUD ever deobligated any grant funds awarded to this project? This includes                 not spending all of the grant awarded.</h3>
                <p>
                    <cfif ShortAns01 EQ "">
                    N/A
                    <CFELSE>
                    #ShortAns01#
                    </cfif>
                </p>
            
             <h3 class="">Explanation of drawdown history and deobligation of funds:</h3>
                <p> 
                    <cfif LongAns04 EQ "">
                    N/A
                    <CFELSE>
                    #LongAns04#
                    </cfif>
                </p>

                <h3 class="">Audit Findings</h3>
                <p> 
                    <cfif LongAns04 EQ "">
                    N/A
                    <CFELSE>
                    #LongAns14#
                    </cfif>
                </p>
            
			<h3 class="">CoC Committee Membership Participation</h3>
                <p>
                    <cfif LongAns05 EQ "">
                    N/A
                    <CFELSE>
                    #LongAns05#
                    </cfif>
                </p>

            <h3 class="">Did the project submit GIW information on time?</h3>
                <p>
                    <cfif ShortAns02 EQ "" OR ShortAns02 EQ "Tbd" OR ShortAns02 EQ "DumbFuck">
                    yes
                    <CFELSE>
                    #ShortAns02#
                    </cfif>     
                    </p>

            <h3 class="">Did the agency attend the Kickoff Conference and other required CoC meetings?</h3>
                <p>
                    <cfif LongAns11 EQ "" OR LongAns11 EQ "Tbd" OR LongAns11 EQ "DumbFuck">
                    yes
                    <CFELSE>
                    #LongAns11#
                    </cfif>  
                </p>

			<h3 class="">Coordinated Assessment Participation</h3>
                <p>
                    <cfif LongAns06 EQ "">
                    N/A
                    <CFELSE>
                    #LongAns06#
                    </cfif>  
                </p>

			<h3 class="">Strategic Planning Participation</h3>
                <p>
                    <cfif LongAns07 EQ "">
                    N/A
                    <CFELSE>
                    #LongAns07#
                    </cfif> 
                </p>
            
            <h3 class="">Amount of Grant Leveraged by Other Funds</h3>
                <p>
                    <cfif NumAns04 EQ "">
                    N/A
                    <CFELSE>
                    #LSCurrencyFormat(NumAns04)#
                    </cfif> 
                </p>
                    
             <h3 class="">Percentage of Grant Leveraged by Other Funds</h3>
                <p>
                    <cfif NumAns01 EQ "">
                    N/A
                    <CFELSE>
                    #NumAns01#%
                    </cfif> 
                </p>
                    
            <h3 class="">Amount of Grant Matched by Other Funds</h3>
                <p>
                    <cfif NumAns05 EQ "">
                    N/A
                    <CFELSE>
                    #LSCurrencyFormat(NumAns05)#
                    </cfif> 
                </p>
                    
             <h3 class="">Percentage of Grant Matched by Other Funds</h3>
                <p>
                    <cfif NumAns02 EQ "">
                    N/A
                    <CFELSE>
                    #NumAns02#%
                    </cfif> 
                </p>
                    
                <h3 class="">Percentage of Null or Missing Values in HMIS</h3>
                <p>
                    <cfif NumAns06 EQ "">
                    0%
                    <CFELSE>
                    #NumAns06#%
                    </cfif> 
                </p>
                    
                    
			
			<!-- Other CoC Planning Efforts -->

					</div>
				</div>
			</div>
		</div>
	</cfoutput>