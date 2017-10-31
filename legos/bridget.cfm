<!--- Download File --->
  <!--- Set Vars --->
    <cfset theDir = GetDirectoryFromPath("#AbsoluteURL#files")>
    <cfset Ahora = Now()>
    <cfset theFilename = "#DateFormat(Ahora,"YYYY-MM-DD")#-Bridget.xls">
    <cfset theFile = theDir & theFilename>
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
          returnVariable = "getAPRQList">
  <!--- Get List of APR Questions --->

  <!--- Loop Through Each Question --->
  <cfloop list="#getAPRQList.aprSetQList#" index="question">
    <cfscript> 
        //Create a new sheet. 
        SpreadsheetCreateSheet (TheBridget, "APR Q#numberFormat("#question#","00")#"); 
        //Set the sheet as active. 
        SpreadsheetSetActiveSheet (TheBridget, "APR Q#numberFormat("#question#","00")#"); 
    </cfscript> 
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