<!-- CoC Check --->
<cfif SESSION.authLevel GTE 3 AND SESSION.cocID EQ 0>
    <cflocation url="#AbsoluteURL#pages/secure/cocs.cfm?action=list">
</cfif>
<!---/ CoC Check --->

<cfsavecontent variable="content">
	<cfoutput>
		<cfinclude template="#absoluteURL#legos/head.cfm">
		<!--- Build Report --->
		<cfinclude template="#absoluteURL#legos/buildReport.cfm">
		<!---/  Build Report --->
		<!--- Footer --->
		<div class="TinyBox BGWhite"></div>
		<div class="shoeBox">
		    <div class="row">
		        <div class="large-6 columns">
		          <img src="https://homebaseccc.org/presto/img/icons/smallicon.png" alt="Magic Icon" class="left">
		         
		            Powered by <strong><a href="https://www.homebaseccc.org" target="_blank" class="MakeBlack">HomeBase</a></strong><br>
		            <small>
		                Legal and Technical Assistance | Policy | Advocacy | Planning<br>
		            </small>
		        </div>
		        <div class="large-6 columns text-left">
		               <small class="MakeGray">
		                  &copy; 2013-2014 HomeBase, The Center for Common Concerns<br>
		                  Use of this site signifies your agreement to the Terms of Use and Privacy policies.
		              </small>
		        </div>
		    </div>
		</div>
		<!--- Footer --->
		    <script src="https://homebaseccc.org/presto/bower_components/foundation/js/foundation.min.js"></script>
		  </body>
		</html>
	</cfoutput>
</cfsavecontent>


<cfdocument format="PDF" filename="file.pdf" overwrite="Yes">
<cfoutput>#content#</cfoutput>
</cfdocument>

<cfheader name="Content-Disposition" value="attachment;filename=file.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\#projectName#.pdf" deletefile="Yes">