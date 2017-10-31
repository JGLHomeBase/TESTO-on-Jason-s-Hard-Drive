<cfparam name="iconClass" default = "fi-page-filled">
<!--- Icon Dropdown --->
<label>Icon</label>
<select name="iconClass">
    <option value="fi-page-filled" <cfif iconClass EQ "fi-page-filled">selected</cfif>><i class="fi-page-filled"></i> Document (default)</option>
    <option value="fi-address-book" <cfif iconClass EQ "fi-address-book">selected</cfif>><i class="fi-address-book"></i> Address Book</option>
    <option value="fi-archive" <cfif iconClass EQ "fi-archive">selected</cfif>><i class="fi-archive"></i> Archive</option>
    <option value="fi-book" <cfif iconClass EQ "fi-book">selected</cfif>><i class="fi-book"></i> Book</option>
    <option value="fi-calendar" <cfif iconClass EQ "fi-calendar">selected</cfif>><i class="fi-calendar"></i> Calendar</option>
    <option value="fi-clipboard-notes" <cfif iconClass EQ "fi-clipboard-notes">selected</cfif>><i class="fi-clipboard-notes"></i> Checklist</option>
    <option value="fi-cloud" <cfif iconClass EQ "fi-cloud">selected</cfif>><i class="fi-cloud"></i> Cloud</option>
    <option value="fi-comment-quotes" <cfif iconClass EQ "fi-comment-quotes">selected</cfif>><i class="fi-comment-quotes"></i> Discussion</option>
    <option value="fi-database" <cfif iconClass EQ "fi-database">selected</cfif>><i class="fi-database"></i> Dataset</option>
    <option value="fi-graph-trend" <cfif iconClass EQ "fi-graph-trend">selected</cfif>><i class="fi-graph-trend"></i> Graph</option>
    <option value="fi-map" <cfif iconClass EQ "fi-map">selected</cfif>><i class="fi-map"></i> Map</option>
    <option value="fi-social-skillshare" <cfif iconClass EQ "fi-social-skillshare">selected</cfif>><i class="fi-social-skillshare"></i> Training</option>
    <option value="fi-web" <cfif iconClass EQ "fi-web">selected</cfif>><i class="fi-web"></i> Web</option>
    <option value="fi-wrench" <cfif iconClass EQ "fi-wrench">selected</cfif>><i class="fi-wrench"></i> Wrench</option>
</select>
<!---/ Icon Dropdown --->