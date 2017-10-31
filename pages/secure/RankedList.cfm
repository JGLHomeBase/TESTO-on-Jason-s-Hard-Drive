<!--- Download a File --->
  <!--- Set Vars --->
    <cfset theDir = GetDirectoryFromPath(expandPath("#AbsoluteURL#files/"))>
    <cfset Ahora = Now()>
    <cfset theFilename = "#DateFormat(Ahora,"YYYY-MM-DD")#-RankedList.xls">
    <cfset theFile = theDir & theFilename>
  <!---/ Set Vars --->
  <cfquery name="getApps">
      SELECT compapp.appName, compapp.compAppID, compapp.projectID, agency.agencyName, compapp.fundAward, compapp.fundReq, compapp.reportID, compapp.score, projectcomponent.projectCompCategory, compapp.rankForce
      FROM compapp
            INNER JOIN projects ON compapp.projectID = projects.projectID
            INNER JOIN agency ON projects.agencyID = agency.agencyID
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
      WHERE compapp.active = '1'
          AND compapp.compID = <cfqueryparam value="#SESSION.compID#">
          ORDER BY compapp.score DESC, projectcomponent.projectCompCategory ASC, agency.agencyLongName ASC, compapp.appName ASC
  </cfquery>
  <!--- Create Spreadsheet --->
  <cfscript> 
    //Create  empty  spreadsheet ---> 
    TheBridget = SpreadsheetNew(); 
  </cfscript>
  <!---/ Create Spreadsheet --->

    <!--- Create Headings --->
    <cfset HeaderRow = "Score, Project, Type, Grant Amount, Tiering Notes">
    <cfscript> 
      SpreadsheetAddRow(TheBridget,"#HeaderRow#");
      HeaderFormat = StructNew();
      HeaderFormat.bold="true";
      HeaderFormat.bottomborder="thick";
      HeaderFormat.bottombordercolor="blue";
      HeaderFormat.textwrap="true";
      HeaderFormat.fontsize="10";
      BoldCol = StructNew();
      BoldCol.bold="true";
      SpreadsheetFormatColumn(TheBridget,BoldCol,"1");
      SpreadsheetFormatRow(TheBridget,HeaderFormat,"1");
      SpreadSheetAddFreezePane(TheBridget,1,1);
    </cfscript>
    <cfloop query="getApps">
       <cfset SheetPayload = "#getApps.score#">
       <cfset SheetPayload = listAppend(SheetPayload, "#getApps.appName#")>
       <cfset SheetPayload = listAppend(SheetPayload, "#getApps.projectCompCategory#")>
       <cfif getApps.fundAward NEQ "" AND getApps.fundAward NEQ 0>
           <cfset SheetPayload = listAppend(SheetPayload, "#FundAward#")>
        <cfelseif getApps.fundReq NEQ "" AND getApps.fundReq NEQ 0>
            <cfset SheetPayload = listAppend(SheetPayload, "#FundReq#")>
        <cfelse>
            <cfset SheetPayload = listAppend(SheetPayload, "Not funded")>
        </cfif>
        <cfif getApps.rankForce NEQ "default">
            <cfset SheetPayload = listAppend(SheetPayload, "#getApps.rankForce#")>
        <cfelse>
            <cfset SheetPayload = listAppend(SheetPayload, "")>
        </cfif>
        
       <cfscript> 
        SpreadsheetAddRow(TheBridget,SheetPayload);
      </cfscript>
    </cfloop>
   
    <!---/ Create Headings --->






  <cfspreadsheet action="write" filename="#theFile#" name="TheBridget" overwrite="true">
  <cflocation url="#AbsoluteURL#files/#theFilename#">
  <!---/ Make Spreadsheet --->
<!--- Download File --->



<cfscript>
</cfscript>
