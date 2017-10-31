<!--- Download File --->
  <!--- Set Vars --->
    <cfset theDir = GetDirectoryFromPath(expandPath("#AbsoluteURL#files/"))>
    <cfset Ahora = Now()>
    <cfset theFilename = "#DateFormat(Ahora,"YYYY-MM-DD")#-#SESSION.userFirst#.xls">
    <cfset theFile = theDir & theFilename>

    <!--- Scope --->
      <cfparam name="URL.coc" default="#SESSION.cocID#">
      <cfparam name="URL.comp" default="#SESSION.compID#">
      <cfparam name="URL.agency" default="#SESSION.agencyID#">
      <cfparam name="URL.project" default="#SESSION.projectID#">
      <cfparam name="URL.apr" default="0">
      <!--- Auth --->
      <cfif SESSION.usercocID NEQ 0>
        <cfset URL.coc = SESSION.usercocID>
      </cfif>
      <cfif SESSION.usercompID NEQ 0>
        <cfset URL.comp = SESSION.usercompID>
      </cfif>
      <cfif SESSION.useragencyID NEQ 0>
        <cfset URL.agency = SESSION.useragencyID>
      </cfif>
      <cfif SESSION.userprojectID NEQ 0>
        <cfset URL.project = SESSION.userprojectID>
      </cfif>
      <!---/ Auth --->
    <!---/ Scope --->

    
  <!---/ Set Vars --->

  <!--- Create Spreadsheet --->
  <cfscript> 
    //Create  empty  spreadsheet ---> 
    TheBridget = SpreadsheetNew(); 
  </cfscript>
  <!---/ Create Spreadsheet --->

  <!--- Get List of APR Questions --->
      <cfinvoke component="knex.aprSet" 
            method="getQs"
            DataSource = "#DataSource#"
            returnVariable = "getAPRQList"
            whatFields = "QList"
            Where = "ThisAPR"
            Order = "Any">
  <!--- Get List of APR Questions --->

  <!--- Loop Through Each Question --->
  <cfloop list="#getAPRQList.aprSetQList#" index="question">
    <cfscript>
        //Create a new sheet. 
        SpreadsheetCreateSheet (TheBridget, "Q#numberFormat("#question#","00")#"); 
        //Set the sheet as active. 
        SpreadsheetSetActiveSheet (TheBridget, "Q#numberFormat("#question#","00")#"); 
    </cfscript>
      <!--- Get Fields --->
      <cfinvoke component="knex.field" 
            method="getJoin"
            DataSource = "#DataSource#"
            returnVariable = "getFields"
            APRQ = "#numberFormat("#question#","00")#"
            whatFields = "fieldName, fieldLongName"
            Join = "LTables"
            Where = "APRTable">
      <!---/ Get Fields --->

    <!--- Create Headings --->
    <cfset RowPayload = "Project Name,Program Component">
    <cfset FieldList = "projectLongName, projectComponentName">
    <cfloop query="getFields">
      <cfif ListLen(RowPayload) LT 254>
        <cfset ColumnName = replace("#getFields.fieldLongName#",",","","All")>
        <cfset RowPayload = listAppend(RowPayload, "#ColumnName#")>
        <cfset FieldList = listAppend(FieldList, "#getFields.fieldName#")>
      </cfif>
    </cfloop>

<cfquery datasource="#datasource#" name="SheetPayload">
    SELECT #Replace(FieldList,"projectID","projects.projectID")#
    FROM dataapr#numberFormat("#question#","00")#
    INNER JOIN projects ON dataapr#numberFormat("#question#","00")#.projectID = projects.projectID
    INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
    WHERE
    <cfif SESSION.cocID NEQ 0>
      projects.cocID = <cfqueryparam value="#SESSION.cocID#"> AND
    </cfif>
    <cfif SESSION.useragencyID NEQ 0>
      projects.agencyID = <cfqueryparam value="#SESSION.useragencyID#"> AND
    </cfif>
    <cfif SESSION.userprojectID NEQ 0>
      projects.projectID = <cfqueryparam value="#SESSION.userprojectID#"> AND
    </cfif> 
    0=0
    ORDER BY projectComponentName, projectLongName
</cfquery>               
    <cfscript> 
      SpreadsheetAddRow(TheBridget,"#RowPayload#");
      SpreadsheetAddRows(TheBridget,SheetPayload);
      HeaderFormat = StructNew();
      HeaderFormat.bold="true";
      HeaderFormat.bottomborder="thick";
      HeaderFormat.bottombordercolor="blue_grey";
      HeaderFormat.fgcolor="grey_25_percent";
      HeaderFormat.textwrap="true";
      HeaderFormat.fontsize="10";
      BoldCol = StructNew();
      BoldCol.bold="true";
      SpreadsheetFormatColumn(TheBridget,BoldCol,"1");
      SpreadsheetFormatRow(TheBridget,HeaderFormat,"1");
      SpreadsheetSetRowHeight(TheBridget,"1","50");
      SpreadSheetAddFreezePane(TheBridget,1,1);
    </cfscript>
    <!---/ Create Headings --->
  </cfloop>
   <!---/ Loop Through Each Question --->





  <cfspreadsheet action="write" filename="#theFile#" name="TheBridget" overwrite="true">
  <cflocation url="#AbsoluteURL#files/#theFilename#">
  <!---/ Make Spreadsheet --->
<!--- Download File --->



<cfscript>
</cfscript>

<!---
SAMPLE CODE

<cfquery 
       name="courses" datasource="cfdocexamples" 
       cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#"> 
       SELECT CORNUMBER,DEPT_ID,COURSE_ID,CORNAME 
       FROM COURSELIST 
</cfquery> 
 
<cfscript> 
    ///We need an absolute path, so get the current directory path. 
    theFile=GetDirectoryFromPath(GetCurrentTemplatePath()) & courses.xls"; 
    //Create a new Excel spreadsheet object and add the query data. 
    theSheet = SpreadsheetNew("CourseData"); 
 
    SpreadsheetAddRows(theSheet,courses); 
    //Create a new sheet. 
    SpreadsheetCreateSheet (theSheet, "EvaluationSheet"); 
    //Set the sheet as active. 
    SpreadsheetSetActiveSheet (theSheet, "EvaluationSheet"); 
    //Add a new row to the sheet. 
    SpreadsheetAddRows(theSheet,courses); 
</cfscript> 
 
<!--- Write the spreadsheet to a file, replacing any existing file. ---> 
<cfspreadsheet action="write" filename="#theFile#" name="theSheet"  
    sheet=1 sheetname="courses" overwrite=true>

--->