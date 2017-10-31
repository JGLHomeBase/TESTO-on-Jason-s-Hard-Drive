<cfparam name="formType" default="new">
    
<cfoutput>
    <form action="#CurrentPageVar#" method="post" class="<cfif formType EQ "update">panelLink</cfif>">
        <!--- Contacts --->
       
        <div class="row">
            <div class="large-12 columns">
                <div class="row">
                    <div class="medium-10 columns">
                        <!--- docName --->
                        <label>Document Title</label>
                        <input type="text"
                               name="docName"
                               placeholder="Document Title"
                               required
                               maxlength="256"
                               <cfif formType EQ "update">value="#getdocs.docName#"</cfif>>
                        <!---/ docName --->
                    </div>
                    
                    <div class="medium-2 columns text-right">
                        <cfif FormType EQ "update">
                            <input type="submit" value="update" name="submit" class="small button">
                        <cfelse>
                             <input type="submit" value="add" name="submit" class="small button">
                        </cfif>
                    </div>
                </div>
                <div class="row">
                    <div class="medium-6 columns">
                        <label>Box ID</label>
                        <div class="input-group">
                            <span class="input-group-label">https://homebase.box.com/s/</span>
                            <!--- docBox --->
                            <cfif formType EQ "update">
                                <cfset defaultValue=REReplaceNoCase(getdocs.docBox, "https://homebase.box.com/s/", "") />
                            <cfelse>
                                <cfset defaultValue = "" />
                            </cfif>
                            <input type="text"
                                   name="docBox"
                                   placeholder="dfu647vhxw9apmot7ci46g0zbwilpein"
                                   required
                                  maxlength="256"
                                   value="#defaultValue#">
                            <!---/ docBox --->
                        </div>
                    </div>
                    <div class="medium-2 columns">
                        <!--- docPrivate --->
                        <label>Public?</label>
                        <select name="docPrivate" required>
                            <cfif formType EQ "update" AND getdocs.docPrivate EQ "0">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value="1" #SELECTED#>Yes</option>
                              <cfif formType EQ "update" AND getdocs.docPrivate EQ "1">
                                    <cfset SELECTED = " selected">
                                <cfelse>
                                    <cfset SELECTED = "">
                                </cfif>
                            <option value="0" #SELECTED#>No</option>
                        </select>
                        <!---/ docPrivate --->    
                    </div>
                     <div class="medium-2 columns">
                        <!--- docLabel --->
                        <label>Label</label>
                        <input type="text"
                               name="docLabel"
                               placeholder="Document Label"
                              maxlength="128"
                               <cfif formType EQ "update">value="#getdocs.docLabel#"</cfif>>
                        <!---/ docLabel --->
                    </div>
                    <div class="medium-2 columns">
                        <label>Label Color</label>
                        <select name="docLabelColor">
                            <cfif formType EQ "update" AND getdocs.docLabelColor EQ "">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value=""#SELECTED#>Default</option>
                            <cfif formType EQ "update" AND getdocs.docLabelColor EQ "secondary">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value="secondary"#SELECTED#>Secondary</option>
                            <cfif formType EQ "update" AND getdocs.docLabelColor EQ "alert">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value="alert"#SELECTED#>Alert</option>
                            <cfif formType EQ "update" AND getdocs.docLabelColor EQ "warning">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value="warning"#SELECTED#>Warning</option>
                            <cfif formType EQ "update" AND getdocs.docLabelColor EQ "success">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value="success"#SELECTED#>Success</option>
                            <cfif formType EQ "update" AND getdocs.docLabelColor EQ "info">
                                <cfset SELECTED = " selected">
                            <cfelse>
                                <cfset SELECTED = "">
                            </cfif>
                            <option value="info"#SELECTED#>Info</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="medium-12 columns">
                        <label>Document Description</label>
                        <textarea name="docDesc"><cfif formType EQ "update">#getdocs.docDesc#</cfif></textarea>
                    </div>
                </div>
            </div>
        </div>
        <!---/ Contacts --->
        <input type="hidden" name="action" value="process">
        <input type="hidden" name="compID" value="#getComp.compID#">
        <cfif FormType EQ "update">
            <input type="hidden" name="docID" value="#getDocs.docID#">
        <cfelse>
            <input type="hidden" name="docID" value="0">
        </cfif>
    </form>
</cfoutput>