<!--- Variables --->
<cfparam name=URL.app default ="0" />
<!---/ Variables --->

<cfif URL.app NEQ "0">
    <cfquery datasource = "#DataSource#" name="getLink">
    SELECT * FROM reportLink
    WHERE compAppID = <cfqueryparam value="#URL.app#" />
    </cfquery>
    <cfif getLink.RecordCount EQ 0 OR URL.action EQ "newLink">
        <cfset FORM.compAppID = URL.app />
        <cfset FORM.singleUse = "0" />
        <cfset FORM.userID = SESSION.userID />
        <cfset FORM.linkKey = URLEncodedFormat(GenerateSecretKey("aes")) />
        <cfif getLink.RecordCount EQ 0>
            <cfinsert datasource="#DataSource#" tablename="reportLink" formFields="compAppID, singleUse, userID, linkKey" />
        <cfelse>
            <cfset FORM.linkID = getLink.linkID />
            <cfupdate datasource="#DataSource#" tablename="reportLink" formFields="compAppID, singleUse, userID, linkKey, linkID" />
        </cfif>
            <!---
        <cfoutput><a href="#FullURL#pages/reportLink.cfm?linkKey=#FORM.linkKey#" class="button success" target="_blank">Public Link</a></cfoutput>
            --->
    </cfif>
    <cfif getLink.RecordCount GT 0>
         <!---
        <cfoutput><a href="#FullURL#pages/reportLink.cfm?linkKey=#getLink.linkKey#" class="button success" target="_blank">Public Link</a></cfoutput>
   --->
    </cfif>
</cfif>

