<!--- Variables --->
<cfparam name=URL.user default ="0">
<cfparam name=URL.comp default ="#SESSION.compID#">
<!---/ Variables --->
    
<!-- Get Comp Info --->
<cfquery name="getComp">
SELECT compID, compLongName
FROM comp
WHERE compID = <cfqueryparam value="#URL.comp#">    
</cfquery>
<!---/ Get Comp Info --->
<cfquery name="getDocs">
SELECT docID, docName, compID, docBox, docDesc, docPrivate, projectID, docLabel
FROM docs
WHERE docs.compID = <cfqueryparam value="#URL.comp#">
ORDER BY docName
</cfquery>
    
<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>Competition Documents</h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->


<cfoutput>
     <div class="row">
            <div class="large-12 columns">
                <br><br>
                <h1>#SESSION.cocCity# #getComp.compLongName# Documents</h1>
                <p>There <cfif getDocs.RecordCount EQ 1>is <b>#getDocs.RecordCount#</b> document<cfelse>are <b>#getDocs.RecordCount#</b> documents</cfif><cfif getDocs.RecordCount EQ 0>.<cfelse>:</cfif></p>
                <hr>
                <iframe src="https://homebaseccc.box.com/embed_widget/s/#REReplaceNoCase(getdocs.docBox, "https://homebase.box.com/s/", "")#" width="100%" height="800" frameborder="0" allowfullscreen="allowfullscreen"></iframe>
            </div>
        </div>
</cfoutput>