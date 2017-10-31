<cfcomponent displayname="Event Log">
	<cffunction name="newEvent" displayname="Log New Event" hint="Logs a new event in the event log" access="public">
		<cfargument name="EventDesc" displayname="Event Description" required="true" type="string" hint="A description of the event">
		
	</cffunction>
</cfcomponent>