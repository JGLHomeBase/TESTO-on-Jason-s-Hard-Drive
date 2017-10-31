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

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 5>
  <cfquery datasource="#datasource#" name="getDocs">
    SELECT docID, docName, compID, docBox, docDesc, docPrivate, projectID, docLabel
    FROM docs
    WHERE docID = <cfqueryparam value="#FORM.docID#">
  </cfquery>
  <cfif getDocs.RecordCount EQ 1>
    <cfquery datasource="#datasource#" name="deleteDoc">
      DELETE FROM docs WHERE docID = <cfqueryparam value="#getDocs.docID#">
    </cfquery>
    <!--- Log Event --->
      <cfinvoke component="knex.eventLog" 
          method="newEvent"
          DataSource = "#DataSource#"
          EventType = "Delete" 
          EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) deleted a document"
          EventDesc = "Document Deleted" >
      <!---/ Log Event --->
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "Document deleted successfully.">
  </cfif>
<cfelseif FORM.action EQ "process" AND SESSION.authLevel LTE 5>
    <!--- Process Doc --->
    
        <cfif FORM.docID EQ 0>
            <!--- Insert Record --->
            <cfinsert datasource="#DataSource#" tablename="docs" formfields="docName, compID, docBox, docDesc, docPrivate, docLabel, docLabelColor">
            <!---/ Insert Record --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog"
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "New" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) added a new document"
                  EventDesc = "New Document" >
            <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Document added successfully.">
        <cfelse>
            <!--- Update Record --->
            <cfupdate datasource="#DataSource#" tablename="docs" formfields="docName, compID, docBox, docDesc, docPrivate, docLabel, docLabelColor, docID">
            <!---/ Update Record --->
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                  method="newEvent"
                  DataSource = "#DataSource#"
                  EventType = "Update" 
                  EventDetail = "A user (#SESSION.userFirst# #SESSION.userLast#) updated a document"
                  EventDesc = "Updated Document" >
            <!---/ Log Event --->
            <cfset SESSION.message = "success">
            <cfset SESSION.messageText = "Update successful.">
        </cfif>
        
    <!---/ Process Doc --->
            
</cfif>
<!---/ Process Actions --->

<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Competition Settings
            </h1>
        </cfoutput>
      </div>
    </div>
</div>
<!---/ Header Row --->

<!--- Alerts --->
<cfinclude template="#AbsoluteURL#legos/alert.cfm"></cfinclude>
<!---/ Alerts --->

<div class="globalPad">
<div class="row">
  <div class="medium-2 columns">
    <cfoutput>
      <!--- Navigation --->
      <cfinclude template="#AbsoluteURL#legos/compMenu.cfm">
      <!--- Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "delete" AND URL.user NEQ "" AND SESSION.authLevel LTE 5>
      <cfquery datasource="#datasource#" name="getDocs">
          SELECT docID, docName
          FROM docs
          WHERE docID = <cfqueryparam value="#URL.doc#">
      </cfquery>
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">
                <cfoutput>
                    You are about to delete a document (#getDocs.docName#). This cannot be undone. Are you sure?
                </cfoutput>
            </p>
            <cfoutput>
              <form action="#CurrentPage#?doc=#getDocs.docID#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getDocs.docID#" name="docID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete Document" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
        <hr>
    </cfif>
     <!--- List --->
   
   <cfquery name="getDocs">
   SELECT docID, docName, compID, docBox, docDesc, docPrivate, projectID, docLabel, docLabelColor
   FROM docs
   WHERE docs.compID = <cfqueryparam value="#URL.comp#">
   ORDER BY docName
   </cfquery>
    <cfoutput>
        <div class="row">
            <div class="large-12 columns">
                <br><br>
                <h1>#SESSION.cocCity# #getComp.compLongName#</h1>
                <h3>Documents</h3>
                <p>There <cfif getDocs.RecordCount EQ 1>is <b>#getDocs.RecordCount#</b> document<cfelse>are <b>#getDocs.RecordCount#</b> documents</cfif><cfif getDocs.RecordCount EQ 0>.<cfelse>:</cfif></p>
            </div>
        </div>
        <div class="row">
            <div class="large-12 columns">
                <cfloop query="getDocs">
                    <div class="panel BGLightGray">
                        <div class="row">
                            <div class="medium-2 columns">
                                <div class="panel text-center">
                                    <h2>#currentrow#</h2>
                                </div>
                            </div>
                            <div class="medium-6 columns">
                                <h4>
                                    #getDocs.docName#
                                    <cfif getDocs.docLabel NEQ "">
                                        <span class="round label #getDocs.docLabelColor#">#getDocs.docLabel#</span>  
                                    </cfif>
                                </h4>
                                    <i>
                                    </i>
                                    <br><br>
                            </div>
                            <div class="medium-4 columns text-right">
                                <h3>
                                    <a href="https://homebase.box.com/s/#REReplaceNoCase(getdocs.docBox, "https://homebase.box.com/s/", "")#" class="panelLink button small" style="display: none;" target="_blank"><i class="fi-page-filled"></i></a>
                                    <a href="#CurrentPageVar#&action=delete&doc=#getDocs.docID#" class="panelLink button small alert" style="display: none;"><i class="fi-x"></i></a>
                                </h3>
                            </div>
                        </div>
                        <div class="panelLink">
                            <cfset FormType = "update">
                            <cfinclude template="#AbsoluteURL#legos/docForm.cfm">
                        </div>
                    </div>
                </cfloop>
                <div class="row">
                    <div class="large-12 columns">
                        <br><br><hr>
                        <h3>Add a Document</h3>
                        <div class="panel">
                            <div class="">
                                <cfset FormType = "new">
                                <cfinclude template="#AbsoluteURL#legos/docForm.cfm">
                            </div>
                        </div>
                        <br><br>
                    </div>
            
            </div>
        </div>
        </div>
    </cfoutput>
    <!---/ List --->
  </div>
</div>
            </div>