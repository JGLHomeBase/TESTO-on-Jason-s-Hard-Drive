<cfparam name="URL.doc" default="" />
<cfparam name="URL.report" default="" />

<!--- Get Doc --->
<cfquery name="getDoc">
SELECT docID, docName, compID, docBox, docDesc, docPrivate, projectID, docLabel
FROM docs
WHERE docID = <cfqueryparam value="#URL.doc#" />
ORDER BY docName
</cfquery>
<!---/ Get Doc --->


<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="medium-10 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                <cfoutput>#getDoc.docName#</cfoutput>
            </h1>
            
        </cfoutput>
      </div>
      <div class="medium-2 columns text-right">
          <h1 class="CFHeader"><br></h1>
          <cfif getDoc.docBox NEQ "">
            <cfoutput><a href="https://homebase.box.com/shared/static/#REReplaceNoCase(getDoc.docBox, "https://homebase.box.com/s/", "")#" class="button"><i class="fi-download"></i> Download</a></cfoutput>
          </cfif>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Page Body --->
<cfif SESSION.cocID NEQ 0>
    <div class="globalPad">
        <div class="row">
            <div class="large-12 columns">
                <cfoutput>
                    <nav aria-label="You are here:" role="navigation">
                      <ul class="breadcrumbs">
                        <li><a href="scoreHome.cfm">#SESSION.compName#</a></li>
                        <li>
                          <span class="show-for-sr">Current: </span> #getDoc.docName#
                        </li>
                      </ul>
                    </nav>
                </cfoutput>
            </div>
        </div>
    </div>
</cfif>


<cfif getDoc.docBox NEQ "">
    <!--- Get Box DocID--->
    <cfset boxReq = {
           "url": "https://homebase.box.com/shared/static/#REReplaceNoCase(getDoc.docBox, "https://homebase.box.com/s/", "")#"
           } />
    <cfhttp url="https://view-api.box.com/1/documents"
            method="post"
            result="boxDoc">
        <cfhttpparam type="header" name="Content-Type" value="application/json" />
        <cfhttpparam type="header" name="Authorization" value="Token #APIKey.BoxView#" />
        <cfhttpparam type="body" value="#serializeJSON(boxReq)#" />
    </cfhttp>
    <cfset boxDocResult=boxDoc.Responseheader />
    <cfset boxDoc=DeserializeJSON(boxDoc.filecontent) />
    <!---/ Get Box DocID--->
    <cfif boxDocResult.Status_Code EQ "202" and boxDoc.id NEQ "">
        <!--- Create Box View Session --->
        <cfset boxReq = {
               "document_id": "#boxDoc.id#",
               "durantion": 60
               } />
        <cfhttp url="https://view-api.box.com/1/sessions"
                method="post"
                result="boxView">
            <cfhttpparam type="header" name="Content-Type" value="application/json" />
            <cfhttpparam type="header" name="Authorization" value="Token #APIKey.BoxView#" />
            <cfhttpparam type="body" value="#serializeJSON(boxReq)#" />
        </cfhttp>
        <cfset boxViewResult=boxView.Responseheader />
        <cfif boxViewResult.Status_Code EQ "202">
            <cfset sleep(2000) />
            <cfhttp url="https://view-api.box.com/1/sessions"
                method="post"
                result="boxView">
                <cfhttpparam type="header" name="Content-Type" value="application/json" />
                <cfhttpparam type="header" name="Authorization" value="Token #APIKey.BoxView#" />
                <cfhttpparam type="body" value="#serializeJSON(boxReq)#" />
            </cfhttp>
        </cfif>
        <cfset boxViewResult=boxView.Responseheader />
        <cfif boxViewResult.Status_Code EQ "202">
            <cfset sleep(2000) />
            <cfhttp url="https://view-api.box.com/1/sessions"
                method="post"
                result="boxView">
                <cfhttpparam type="header" name="Content-Type" value="application/json" />
                <cfhttpparam type="header" name="Authorization" value="Token #APIKey.BoxView#" />
                <cfhttpparam type="body" value="#serializeJSON(boxReq)#" />
            </cfhttp>
        </cfif>
        <cfset boxViewResult=boxView.Responseheader />
        <cfif boxViewResult.Status_Code EQ "202">
            <cfset sleep(2000) />
            <cfhttp url="https://view-api.box.com/1/sessions"
                method="post"
                result="boxView">
                <cfhttpparam type="header" name="Content-Type" value="application/json" />
                <cfhttpparam type="header" name="Authorization" value="Token #APIKey.BoxView#" />
                <cfhttpparam type="body" value="#serializeJSON(boxReq)#" />
            </cfhttp>
        </cfif>
        <cfset boxView=DeserializeJSON(boxView.filecontent) />
        <cfif isDefined("boxView.id")>
            <cfoutput>
                    <iframe src="https://view-api.box.com/1/sessions/#boxView.id#/view?theme=light" frameborder="0" style="positon:fixed; height:100%; width:100%;"></iframe>
            </cfoutput>
            <cfelse>
                <div class="row">
                    <div class="large-12 columns text-center">
                        <h1>Document Not Found</h1>
                    </div>
                </div>
        </cfif>
        
        <!---/ Create Box View Session --->
    <cfelse>
        <div class="row">
            <div class="large-12 columns text-center">
                <h1>Document Not Found</h1>
            </div>
        </div>
    </cfif>
    <cfelse>
        <div class="row">
            <div class="large-12 columns text-center">
                <h1>Document Not Found</h1>
                <cfoutput><p>Invalid #AppShortName# Document ID. Check URL and try again.</p></cfoutput>
            </div>
        </div>
 </cfif>   
<!---/ Page Body --->