<cfoutput>
          <cfinvoke component="knex.pm"
                    method="getProject"
                    apr="#URL.apr#"
                    project="#URL.project#"
                    pm="291"
                    returnvariable="pm">    
    <cfif pm.value NEQ "">
        <div class="row">
            <div class="large-12 columns">
                <h2 class="MakePrimary">Project Location</h2>
                <cfif URL.action EQ "pdf">
                <table width="100%">
                    <tr>
                        <td width="50%">
                            <!--- Get Address 1 --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="291"
                                      returnvariable="pm1">
                            <!---/ Get Address 1 --->
                            <!--- Get City --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1002"
                                      returnvariable="pm2">
                            <!---/ Get City --->
                            <!--- Get State --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1001"
                                      returnvariable="pm3">
                            <!---/ Get State --->
                            <a href="https://maps.google.com/?q=#pm1.value#,#pm2.value#,#pm3.value#" target="_blank">

                            <!--- Get Address 1 --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="291"
                                      returnvariable="pm1">
                            <!---/ Get Address 1 --->
                            <!--- Get City --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1002"
                                      returnvariable="pm2">
                            <!---/ Get City --->
                            <!--- Get State --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1001"
                                      returnvariable="pm3">
                            <!---/ Get State --->
                                <img src="//maps.googleapis.com/maps/api/staticmap?size=475x250&markers=%7Ccolor:0x6ECDDC%7C#pm1.value#,#pm2.value#,#pm3.value#&sensor=false&visual_refresh=true&scale=2&zoom=15&key=#APIKey.Google#" 
                                     border="1px" width="475" height="250"/>
                            </a>
                        </td>
                        <td width="50%">
                            <cfparam name="HideStreetView" default="0">
                            <cfif HideStreetView EQ 1>
                                <img src="img/NoImage.png" alt="No Image Available" >
                            <cfelse>
                            <!--- Get Address 1 --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="291"
                                      returnvariable="pm1">
                            <!---/ Get Address 1 --->
                            <!--- Get City --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1002"
                                      returnvariable="pm2">
                            <!---/ Get City --->
                            <!--- Get State --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1001"
                                      returnvariable="pm3">
                            <!---/ Get State --->
                            <!--- Get Heading --->
                            <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="1022"
                                      returnvariable="pm4">
                            <!---/ Get Heading --->
                                <img src="//maps.googleapis.com/maps/api/streetview?size=475x255&location=#pm1.value#,#pm2.value#,#pm3.value#&sensor=false&key=#APIKey.Google#<cfif pm4.value NEQ "" AND pm4.value NEQ "0">&heading=#pm4.value#</cfif>" 
                                 border="1px" width="475" height="250"/>
                            </cfif>

                            </td>
                        </tr>
                    </table>
        <cfelse>
            
            <!--- Get Address 1 --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="291"
                      returnvariable="pm1">
            <!---/ Get Address 1 --->
            <!--- Get City --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                     apr="#URL.apr#"
                      project="#URL.project#"
                      pm="1002"
                      returnvariable="pm2">
            <!---/ Get City --->
            <!--- Get State --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="1001"
                      returnvariable="pm3">
            <!---/ Get State --->
            <!--- Get zip --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="1119"
                      returnvariable="pm4">
            <!---/ Get zip --->
            <!--- Get Geocode --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="1151"
                      returnvariable="geocode">
            <!---/ Get Geocode --->
            <cfset fulladdress = "#pm1.value#, #pm2.value#, #pm3.value#, #pm4.value#">
            <cfif geocode.value EQ "" AND pm1.value NEQ "" AND pm2.value NEQ "" AND pm3.value NEQ "">
                <!--- geocode --->
                <cfinvoke component="knex.tomtom" 
                      method="geocode"
                      DataSource = "#DataSource#"
                      project = "#URL.project#">
                <!---/ geocode --->
                <!--- Get Geocode --->
                <cfinvoke component="knex.pm"
                          method="getProject"
                          apr="#URL.apr#"
                          project="#URL.project#"
                          pm="1151"
                          returnvariable="geocode">
                <!---/ Get Geocode --->
            </cfif>
                    
                    
                    
            <cfif geocode.value NEQ "0,0">      
            <!--- Get Heading --->
            <cfinvoke component="knex.pm"
                      method="getProject"
                      apr="#URL.apr#"
                      project="#URL.project#"
                      pm="1022"
                      returnvariable="pm">
            <!---/ Get Heading --->
            <cfif pm.value NEQ "">
                <cfset heading = "#pm.value#">
            <cfelse>
                <cfset heading = "180">
            </cfif>

                    <table>
                        <tr>
                            <td style="height:300px; width:1200px;">
                                <style type="text/css">
                                  html, body { height: 100%; margin: 0; padding: 0; }
                                  ##map, ##pano { float: left; height: 100%; width: 50%; }
                                </style>
                                <div id="map"></div>
                                <div id="pano"></div>
                                <script type="text/javascript">
                                    function initialize() {
                                        var position = new google.maps.LatLng(#geocode.value#);
                                        var map = new google.maps.Map(document.getElementById('map'), {
                                            center: position,
                                            zoom: 14
                                          });
                                        var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), {
                                            position: position,
                                            pov: {
                                                heading: #heading#,
                                                pitch: 5
                                        }
                                        });
                                    map.setStreetView(panorama);
                                    }
                                </script>  
                                <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=#APIKey.Google#&callback=initialize">
                                </script>
                            </td>                        
                        </tr>
                    </table>
                </div>
            </div>
            <cfelse>
                <div class="row">
                    <div class="large-12 columns">
                        <div class="text-center"><i>No Map Available</i></div>
                    </div>
                </div>
            </cfif> 
        </cfif>    
    </cfif>
</cfoutput>
                             
