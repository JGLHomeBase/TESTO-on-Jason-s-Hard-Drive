<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.type" default="0">
<!---/ Variables --->

<!--- Security --->
<cfif SESSION.AuthLevel GT 8>
  <cflocation url="#AbsoluteURL#pages/login.cfm">
</cfif>
<!---/ Security --->

<!--- Get CoC --->
<cfinvoke component="knex.cocs"
          method="get"
          DataSource = "#DataSource#"
          returnVariable = "getCoC"
          whatFields="*"
          Where="ThisCoC">
<!---/ Get CoC --->

<!--- Get Projects --->
<cfquery datasource="#datasource#" name="getUnGeocoded">
    SELECT projects.projectID
    FROM projects
    LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
    WHERE
        projects.active = '1'
        AND projects.ProjectGeoCode = '' OR projects.ProjectGeoCode IS NULL OR projects.ProjectGeoCode = '0,0'
        <cfif SESSION.cocID NEQ 0>
        AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
        </cfif>
        <cfif SESSION.agencyID NEQ 0>
        AND projects.agencyID = <cfqueryparam value="#SESSION.agencyID#">
        </cfif>
</cfquery>
<!---/ Get Projects --->

<!--- Geocode Project --->
<cfloop query="getUnGeocoded">
    <!--- geocode --->
      <cfinvoke component="knex.tomtom" 
          method="geocode"
          DataSource = "#DataSource#"
          project = "#getUnGeocoded.projectID#">
    <!---/ geocode --->
</cfloop>
<!--- Geocode Project --->
            
<!--- Header Row --->
<div class="hide-for-print">
    <div class="CFSmallBox">
        <div class="row">
          <div class="large-12 columns">
            <cfoutput>
                <h1 class="CFHeader"><br>
                    #getcoc.CoCLongName# Provider Map
                 </h1>
            </cfoutput>
          </div>
        </div>
    </div>
</div>
<!---/ Header Row --->

<cfset county = "#getCoC.CoCCity#, #getCoC.CoCState#">

<!--- Project Component Drop Down --->
<cfset county = "#getCoC.CoCCity#, #getCoC.CoCState#">
<cfoutput>
    <div class="medium-4 columns">
          <!--- Get Project Components --->
          <cfinvoke component="knex.component" 
                    method="get"
                    DataSource = "#DataSource#"
                    returnVariable = "getProjectCom"
                    whatFields = "projectComponentLongName, projectComponentName, projectComponentID">
          <!---/ Get Project Components --->
    <form action="#CurrentPage#">
    <label><h3>Project Type</h3></label>
      <select name="type" onchange="this.form.submit()">
          <option value="0">All Project Types</option>
        <cfloop query="getProjectCom">
            <cfset selected = "">
            <cfif URL.type EQ getProjectCom.projectComponentID><cfset selected="  selected"></cfif>
          <option value="#getProjectCom.projectComponentID#"#selected#>#getProjectCom.projectComponentLongName#</option>
        </cfloop>
      </select>
    </form>
    </div>
</cfoutput>

<!---/ Project Component Drop Down --->
    
<!--- Get Projects --->
<cfquery datasource="#datasource#" name="getProjects">
    SELECT projects.projectID, projects.ProjectStreet1, projects.ProjectStreet2, projects.ProjectCity, projects.ProjectState, projects.ProjectZip, projects.ProjectGeoCode, projects.ProjectLongName, projects.ProjectComponentID, projects.PopServed, dataapr05.apr05_Total_ActualUnits, dataapr05.apr05_Total_ActualBeds, projectComponent.projectComponentName, agency.agencyLongName
    FROM projects
    LEFT JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
    LEFT JOIN dataapr05 ON projects.projectID = dataapr05.projectID
    LEFT JOIN agency ON projects.agencyID = agency.agencyID
    WHERE
        projects.active = '1'
        AND projects.ProjectGeoCode <> '' AND projects.projectGeoCode <> <cfqueryparam value="0,0">
        <cfif SESSION.cocID NEQ 0>
        AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
        </cfif>
        <cfif SESSION.agencyID NEQ 0>
        AND projects.agencyID = <cfqueryparam value="#SESSION.agencyID#">
        </cfif>
        <cfif URL.type NEQ 0>
        AND projects.ProjectComponentID = <cfqueryparam value="#URL.type#">
        </cfif>

</cfquery>
<!---/ Get Projects --->
<!--- PSH --->
<cfset icon = "#FullURL#img/icons/blueHouse.svg">




<!--- Display Map --->   
<cfoutput>
    <cfif getProjects.RecordCount GT 0>
        <style type="text/css">
          html, body { height: 100%; margin: 0; padding: 0; }
          ##map { height: 100%; width: 100%;}
          ##mapWrap { height: 100%; padding-bottom: 150px; }
        </style>
        <div id="mapWrap"><div id="map"></div></div>

        <script type="text/javascript">
            function initialize() {
                var map;
                var bounds = new google.maps.LatLngBounds();
                var mapOptions = {
                    mapTypeId: 'roadmap'
                };


                // Display a map on the page
                map = new google.maps.Map(document.getElementById("map"), mapOptions);
                map.setTilt(45);

                // Transit Layer
                var transitLayer = new google.maps.TransitLayer();
                transitLayer.setMap(map);

                // Multiple Markers
                var markers = [
                    <cfloop query="getProjects">
                        ['#jsStringFormat(getProjects.projectLongName)#', #getProjects.projectGeoCode#]<cfif getProjects.CurrentRow LT GetProjects.RecordCount>,</cfif>
                    </cfloop>
                ];
                // Info Window Content

                var infoWindowContent = [
                    <cfloop query="getProjects">
                    <cfsavecontent variable = "infoWindow">
                        <cfoutput>
                            <h3>#getProjects.projectLongName# (#getProjects.projectComponentName#)</h3>
                            <p><strong>#getprojects.agencyLongName#</strong></p>
                            <p>#getProjects.ProjectStreet1#
                                <br>#getProjects.ProjectCity#, #getProjects.ProjectState# #getProjects.ProjectZip#</p>
                            <p><cfif getProjects.apr05_Total_ActualUnits NEQ "" AND getProjects.apr05_Total_ActualUnits NEQ "0"><strong>Units:</strong> #getProjects.apr05_Total_ActualUnits#</cfif>
                            <cfif getProjects.apr05_Total_ActualBeds NEQ "" AND getProjects.apr05_Total_ActualBeds NEQ "0"> <strong>Beds:</strong> #getProjects.apr05_Total_ActualBeds#</cfif>
                            <br><strong>Population Served:</strong> #getProjects.popServed#</p>
                        </cfoutput>
                    </cfsavecontent>
                        ['<div class="infoWindow">' +
                    '#jsStringFormat(infoWindow)#' +
                    '</div>']<cfif getProjects.CurrentRow LT GetProjects.RecordCount>,</cfif>
                    </cfloop>
                ];

                // Display multiple markers on a map
                var infoWindow = new google.maps.InfoWindow(), marker, i;
                
                // Loop through our array of markers & place each one on the map  
                for( i = 0; i < markers.length; i++ ) {
                    var icon = '#icon#';
                    var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
                    bounds.extend(position);
                    marker = new google.maps.Marker({
                        animation: google.maps.Animation.DROP,
                        position: position,
                        map: map,
                        title: markers[i][0],
                        icon: icon
                    });

                    // Allow each marker to have an info window    
                    google.maps.event.addListener(marker, 'click', (function(marker, i) {
                        return function() {
                            infoWindow.setContent(infoWindowContent[i][0]);
                            infoWindow.open(map, marker);
                        }
                    })(marker, i));

                    // Automatically center the map fitting all markers on the screen
                    map.fitBounds(bounds);
                }


            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=#APIKey.Google#&callback=initialize">
        </script>


    <cfelse>
        <div class="row">
            <div class="large-12 columns">
                <div class="text-center">
                    <h1>Map Not Available</h1>
                </div>
            </div>
        </div>
    </cfif>
</cfoutput>
<!---/ Display Map --->   