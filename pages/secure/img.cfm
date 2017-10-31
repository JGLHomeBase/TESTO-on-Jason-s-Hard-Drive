<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<!--- Variables --->
<cfparam name="URL.img" default ="0">
<!---/ Variables --->

<!--- Process Actions --->
<cfif FORM.action EQ "delete" AND SESSION.authLevel LTE 3>
    <!--- Nuke Image --->
    <cfinvoke component="knex.img" 
            method="nuke"
            DataSource = "#DataSource#"
            redshirt = "#NumberFormat(FORM.imgID)#">
      <!---/ Nuke Image --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "img deleted successfully.">
<cfelseif FORM.action EQ "process" AND FORM.imgID EQ 0 AND SESSION.authLevel LTE 3>
    <!--- New Image --->
      <cfinvoke component="knex.img" 
          method="new"
          DataSource = "#DataSource#">
    <!---/ New Image --->
    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.imgName# created successfully.">
<cfelseif FORM.action EQ "process" AND FORM.imgID NEQ 0 AND SESSION.authLevel LTE 3>

    <cfset URL.action = "list">
    <cfset SESSION.message = "success">
    <cfset SESSION.messageText = "#FORM.imgName# created successfully.">
</cfif>
    <!--- Update Image --->
      <cfinvoke component="knex.img" 
          method="update"
          DataSource = "#DataSource#">
    <!---/ Update Image --->
<cfif FORM.action EQ "process" AND isDefined("FORM.file") AND FORM.file NEQ "" AND SESSION.authLevel LTE 3>
  <cfif FORM.imgID EQ 0>
        <!--- Get Image IDs --->
        <cfinvoke component="knex.img" 
                method="getImg"
                DataSource = "#DataSource#"
                returnVariable = "getIMGID">
        <!---/ Get IDs --->

    <cfset FORM.imgID = #getIMGID.imgID#>
  </cfif>
  <cfset theDir = GetDirectoryFromPath(expandPath("../../img/upload/"))>
  <cfset theFilename = "#form.imgID#.jpg">
  <cfset theFile = theDir & theFilename>
  <cffile action="upload" destination="#theDir#" fileField="file" accept="image/png, image/jpeg, image/jpg" nameconflict="overwrite" result="boom">
  <cfimage action="convert" source="#theDir##boom.serverFile#" destination="#theFile#" overwrite="yes" format="jpg" quality="1">
  <cfimage action="resize" width="3840" height="" source="#theFile#" destination="#theFile#" overwrite="yes" quality="1">
  <cfimage source="#theFile#" name="thePic">
  <cfset cropStart = (imageGetHeight(thePic)-1200)/2>
  <cfif cropStart LT 0>
    <cfset cropStart = 0>
  </cfif>
  <cfset ImageCrop(thePic,0,cropStart,3840,1200)>
  <cfimage action="write" source="#thePic#" destination="#theFile#" overwrite="yes" quality=".7">
  <cfimage action="resize" width="400" height="" source="#thePic#" destination="#theDir#t_#theFilename#" overwrite="yes">
  <cfset ImageCrop(thePic,0,200,3840,800)>
  <cfimage action="write" source="#thePic#" destination="#theDir#home#theFilename#" overwrite="yes" quality=".7">      
  <cfset ImageCrop(thePic,0,150,3840,500)>
  <cfimage action="write" source="#thePic#" destination="#theDir#box#theFilename#" overwrite="yes" quality=".7">
  <cfset ImageCrop(thePic,0,100,3840,300)>
  <cfimage action="write" source="#thePic#" destination="#theDir#small#theFilename#" overwrite="yes" quality=".7">
  <cfset ImageCrop(thePic,0,75,3840,150)>
  <cfimage action="write" source="#thePic#" destination="#theDir#tiny#theFilename#" overwrite="yes" quality=".7">
  <cffile action="delete" file="#theDir##boom.serverFile#">
</cfif>

<!---/ Process Actions --->




<!--- Header Row --->
<div class="CFSmallBox">
    <div class="row">
      <div class="large-12 columns">
        <cfoutput>
            <h1 class="CFHeader"><br>
                Manage Banner Images
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
      <!--- img Navigation --->
      <ul class="menu vertical">
        <!--- Manage Images --->
        <cfif SESSION.authLevel LTE 3>
          <li><label>Update CoC</label></li>
            <li><a href="#AbsoluteURL#pages/secure/cocs.cfm?coc=#SESSION.cocID#">CoC Settings</a></li>
          <li><label>Banner Images</label></li>
          <li <cfif URL.action EQ "new">class="active"</cfif>><a href="#CurrentPage#?action=new">Add Image</a></li>
          <li <cfif URL.action EQ "list">class="active"</cfif>><a href="#CurrentPage#?action=list">Manage Images</a></li>
          <li class="divider"></li>
        </cfif>
        <!---/ Manage Images --->
      </ul>
      <!--- img Navigation --->
    </cfoutput>
  </div>
  <div class="medium-10 columns">
    <cfif URL.action EQ "list">
      <!--- List --->
      <!--- Get Agencies --->
      <cfinvoke component="knex.img" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getimg"
            whatFields = "*"
            Where = "ThisCoC"
            Order = "cocID, imgName ASC">
      <!---/ Get Agencies --->
      <cfoutput><h1>#SESSION.cocCity# Images</h1></cfoutput>
      <hr>
      <table width="100%">
        <thead>
          <th>img</th>
          <th></th>
          <cfif SESSION.authLevel LTE 5>
            <th class="text-right" width="80">Edit</th>
          </cfif>
        </thead>
        <tbody>
          <cfoutput query="getimg"  startrow="#startRow#" maxrows="#maxrows#">
            <tr>
              <td width="200"><img src="#absoluteURL#img/upload/t_#getimg.imgID#.jpg"></td>
              <td><b>#getimg.imgName#</b></td>
              <cfif SESSION.authLevel LTE 5>
                <td class="text-right">
                    <div class="tableLink">
                      <a href="#CurrentPage#?img=#getimg.imgID#">
                         <i class="fi-pencil"></i>
                      </a>

                      <cfif SESSION.authLevel LTE 1>
                        &nbsp; | &nbsp;
                        <a href="#CurrentPage#?img=#getimg.imgID#&action=delete">
                           <i class="fi-trash"></i>
                        </a></cfif>
                    </div>
                </td>
              </cfif>
            </tr>
          </cfoutput>
        </tbody>
      </table>
        <!--- Pagination --->
          <cfset pageRecordCount = getimg.RecordCount>
          <cfinclude template="#AbsoluteURL#legos/pagination.cfm">    
        <!---/ Pagination --->
      <!---/ List --->
    <cfelseif URL.action EQ "delete" AND URL.img NEQ "" AND SESSION.authLevel LTE 1>
      <!--- Get Image --->
      <cfinvoke component="knex.img" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getimg"
            whatFields = "imgID"
            Where = "ThisImage">
      <!---/ Get Image --->
      <div class="row">
        <div class="large-12 columns">
          <br><br>
          <div class="panel BGOrange text-center">
            <h1 class="MakeWhite">WARNING!</h1>
            <p class="MakeWhite">You are about to delete this banner imgage. This cannot be undone. Are you sure?</b>
            <cfoutput>
              <form action="#CurrentPageVar#" method="post">
                <input type="hidden" value="delete" name="action">
                <input type="hidden" value="#getimg.imgID#" name="imgID">
                <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
                <input type="submit" value="Delete Image" name="submit" class="button alert">
              </form>
            </cfoutput>
          </div>
        </div>
      </div>
    <cfelse>
      <!--- img Profile Form --->
      <!--- Get Image --->
      <cfinvoke component="knex.img" 
            method="get"
            DataSource = "#DataSource#"
            returnVariable = "getimg"
            whatFields = "*"
            Where = "ThisImage">
      <!---/ Get Image --->
          <div class="row">
        <div class="large-12 columns">
          <cfif URL.img EQ 0>
            <h1>Upload Banner Image</h1>
          <cfelse>
            <h1>Update Banner Image Info</h1>
          </cfif>
          <hr>
        </div>
      </div>
      <cfoutput>
        <form method="post" action="#CurrentPage#" enctype="multipart/form-data" data-abide>
           <div class="row">
            <div class="medium-12 columns">
                <div class="panel">
                     <label>Select File</label>
                      <cfset required = "">
                      <cfif URL.img EQ 0><cfset required = "required"></cfif>
                      <input type="file" accept=".jpg, .jpeg" 
                             name="file" 
                             placeholder="GrandOpening.jpg"
                             maxlength="128"
                             #required#>
                      <small class="form-error">Select an image to upload</small>
                      <small>Choose an image that is at least 3840px wide and 1200px tall. The image must be in .jpg or .jpeg format. Need a picture? <a href="https://www.flickr.com/search/?text=#URLEncodedFormat("#SESSION.cocCity#, #SESSION.cocState#")#&license=1%2C2%2C9%2C10&dimension_search_mode=min&height=3840&width=1024" target="_blank">Start your search here</a>.</small>
                </div>
            </div>
          </div>
          <div class="row">
            <div class="medium-8 columns">
              <label>Image Title</label>
              <input type="text" 
                     name="imgName" 
                     value="#getimg.imgName#" 
                     placeholder="Springfield Vista Apartments"
                     maxlength="256"
                     required>
              <small class="form-error">Enter a title for the image</small>
            </div>
            <div class="medium-4 columns">
              <label>Color Theme</label>
              <select name="colorTheme" requied>
                <!--- White Text; Clear BKG --->
                <cfif getimg.colorTheme EQ "none">
                  <cfset selected = " selected">
                <cfelse>
                  <cfset selected ="">
                </cfif>
                <option value="none"#selected#>White Text</option>
                    
                <!--- White Text; Darken BKG --->
                <cfif getimg.colorTheme EQ "darken">
                  <cfset selected = " selected">
                <cfelse>
                  <cfset selected ="">
                </cfif>
                <option value="darken"#selected#>White Text; Darken Image</option>
                    
                

              </select>
              <small class="form-error">Enter a color theme for the image title</small>
            </div>
          </div>
          <div class="row">
            <div class="medium-9 columns">
                  <!--- Get CoC List --->
                  <cfinvoke component="knex.cocs" 
                        method="get"
                        DataSource = "#DataSource#"
                        returnVariable = "getCoC"
                        whatFields = "cocID, cocLongName"
                        Where = "Active"
                        Order = "cocName ASC">
                  <!---/ Get CoC List --->

                <label>Associate image with a CoC</label>
                <input type="hidden" value="#SESSION.cocID#" name="cocID">
                <input type="hidden" value="0" name="projectID">
                      <select name="cocID" disabled>
                  <option value="0"<cfif SESSION.cocID EQ 0>selected</cfif>>
                    Global
                  </option>
                  <cfloop query="getCoC">
                    <option value="#getCoC.cocID#"<cfif SESSION.cocID EQ getCoC.cocID>selected</cfif>>
                      #getCoC.cocLongName#
                    </option>
                  </cfloop>
                </select>

            </div>
            <div class="medium-3 columns">
              <label>Allow image on front page?</label>
              <select name="frontPage" required>
                <option value="0" <cfif getimg.frontPage EQ 0>selected</cfif>>No</option>
                <option value="1" <cfif getimg.frontPage EQ 1>selected</cfif>>Yes</option>     
              </select>
             </div>
          </div>
        
          <div class="row">
            <div class="medium-6 columns">
              <label>Image Credit (Text)</label>
              <input type="text" 
                     name="imgCredit" 
                     value="#getimg.imgCredit#" 
                     placeholder="Lisa Simpson"
                     maxlength="256">
            </div>
            <div class="medium-6 columns">
              <label>Image Credit (URL)</label>
              <input type="text" 
                     name="imgCreditURL" 
                     value="#getimg.imgCreditURL#"
                     placeholder="https://lisasimpsonphotography.com"
                     pattern="url"
                     maxlength="128">
              <small class="form-error">Enter a valid URL</small>
            </div>
          </div>
           <div class="row">
            <div class="medium-12 columns">
              <label>Image Caption</label>
              <textarea name="imgDesc" placeholder="Mayor Quimby joins Springfield Housing Coalition Executive Director Ned Flanders for the grand opening of Springfield Vista Apartments.">#getimg.imgDesc#</textarea>
            </div>
          </div>
          <div class="row">
            <div class="large-12 columns text-right">
              <input type="hidden" value="#URL.img#" name="imgID">
              <input type="hidden" value="process" name="action">
              <input type="hidden" value="#SESSION.goldenTicket#" name="goldenTicket">
              <cfif URL.img EQ 0>
                <input type="submit" value="upload" name="submit" class="small button secondary">
              <cfelse>
                <input type="submit" value="update" name="submit" class="small button secondary">
              </cfif>
                
            </div>
          </div>
        </form>
      </cfoutput>
      <!---/ img Profile Form --->
    </cfif>
</div>
  </div>
</div>