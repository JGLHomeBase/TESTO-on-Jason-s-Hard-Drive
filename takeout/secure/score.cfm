<cfparam name="FORM.compAppID" default="0">
<cfparam name="FORM.factorID" default="0">
<cfparam name="FORM.Score" default="0">
<cfparam name="FORM.scoreNote" default="">
<cfparam name="FORM.compPanelID" default="0">


<cfquery name="getPanelID">
SELECT compPanelID
FROM comppanel
INNER JOIN users ON comppanel.userID = users.userID
WHERE comppanel.compID = <cfqueryparam value="#SESSION.compID#">
     AND users.userID = <cfqueryparam value="#SESSION.userID#">
</cfquery>
<cfif SESSION.authLevel LTE 5 AND FORM.compPanelID NEQ 0>
    <cfset CompPanelID = FORM.compPanelID>
<cfelse>
    <cfset CompPanelID = getPanelID.compPanelID>
</cfif>   
    
<cfif FORM.compAppID NEQ 0 AND getPanelID.compPanelID NEQ 0 AND FORM.factorID NEQ 0>
    <cfinvoke component="knex.sortinghat"
              method="post"
              DataSource = "#DataSource#"
              compAppID = "#FORM.compAppID#"
              compPanelID = "#CompPanelID#"
              factorID = "#FORM.factorID#"
              Score = "#FORM.Score#"
              scoreNote = "#FORM.scoreNote#">
</cfif>