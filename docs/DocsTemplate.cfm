<cfoutput>
    <!--- Heading --->
    <div class="row">
        <div class="large-12 columns">
            <h1>HEADING</h1>
        </div>
    </div>
    <!---/ Heading --->
    

    <!--- Sub Nav --->
    <div class="row">
        <div class="large-12 columns">
            <hr>
            <div data-magellan-expedition="fixed" id="magellan_bar"> 
              <dl class="sub-nav">
                    <dd data-magellan-arrival="A"><a href="##A">Stop A</a></dd>
                    <dd data-magellan-arrival="B"><a href="##B">Stop B</a></dd>
              </dl>
            </div>
            <hr>
        </div>
    </div>
<!---/ Sub Nav --->

    <!--- Stop A --->
    <div class="row">
        <div class="large-12 columns">
            <a name="A"></a>
            <h2 data-magellan-destination="A">Stop A</h2>
        </div>
    </div>
    <!---/ Stop A --->
    
    <!--- Stop B --->
    <div class="row">
    	<div class="large-12 columns">
            <a name="B"></a>
            <h2 data-magellan-destination="B">Stop B</h2>
    	</div>
    </div>
    <!---/ Stop B --->
  
</cfoutput>