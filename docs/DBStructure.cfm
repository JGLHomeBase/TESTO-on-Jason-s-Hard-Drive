<!---
Title: DataBase Structure
Filename: DBStructure.cfm
--->

<!--- Set Variables --->
<cfparam name="URL.table" default="0">
<!---/ Set Variables --->

<!--- Get Tables --->
<cfquery datasource="#DataSource#" name="getTables">
SELECT *
FROM tables
ORDER BY projectData DESC, tableName ASC
</cfquery>
<!---/ Get Tables --->


<!--- Heading --->
<div class="row">
    <div class="large-12 columns">
        <h1><cfoutput>#AppShortName#</cfoutput> Database Structure</h1>
        <p><cfoutput>#AppShortName#</cfoutput> stores data within the following <cfoutput>#getTables.RecordCount#</cfoutput> tables:</p>
    </div>
</div>
<!---/ Heading --->

<!--- Sub Nav --->
<div class="row">
    <div class="large-12 columns">
        <hr>
        <cfoutput>
            <form action="#CurrentPage#">
                <select name="table" onchange="this.form.submit()">
                    <option value="0"></option>
                    <cfloop query="getTables">
                        <option value="#getTables.tableID#"  <cfif URL.table EQ getTables.tableID>SELECTED</cfif>>#getTables.tableName#</option>
                    </cfloop>
                </select>
                <input name="doc" value="DBStructure" type="hidden">
            </form>
        </cfoutput>
        <hr>
    </div>
</div>
<!---/ Sub Nav --->

<!--- Get Tables --->
<cfquery datasource="#DataSource#" name="getTable">
SELECT *
FROM tables
WHERE tables.tableID = <cfqueryparam value="#URL.table#">
ORDER BY projectData DESC, tableName ASC
</cfquery>
<!---/ Get Tables --->

<!--- Detail --->
<cfif URL.table EQ 0>
    <div class="row">
        <div class="large-12 columns text-center">
            <h1 class="">Select a Table</h1>
        </div>
    </div>
</cfif>
<cfloop query="getTable">
    <div class="row">
        <div class="large-12 columns">
            <cfoutput>
                    <h2>#getTable.tableName#</h2>
                <cfif getTable.tableNotes NEQ "">
                     <p>#getTable.tableNotes#</p>
                </cfif>
               
            </cfoutput>
            <!--- Table Structure --->
            <cfquery datasource="#DataSource#" name="getFields">
            SELECT *
            FROM fields
            WHERE tableID = <cfqueryparam value="#getTable.tableID#"></cfqueryparam>
            ORDER BY fieldKey DESC, fieldName ASC
            </cfquery>
            <table width="100%">
                <thead>
                    <th width="5"></th>
                    <th>Field (Column Name)</th>
                    <th>Data Type (Length)</th>
                    <th>Default</th>
                    <th>Notes</th>
                </thead>
                <tbody>
                    <cfloop query="getFields">
                        <cfoutput>
                            <tr>
                                <td>
                                    <cfif getFields.fieldKey EQ "1">
                                        <span data-tooltip class="has-tip" title="Primary Key"><i class="fi-key"></i></span>
                                    </cfif>
                                </td>
                                <td>
                                    <b>#getFields.fieldLongName#</b> (#getFields.fieldName#)
                                    <cfif getFields.fieldReq EQ "1"><span data-tooltip class="has-tip" title="Required (Not Null)"><i class="fi-star"></i></span></cfif>
                                </td>
                                <td>#getFields.fieldDataType# <cfif getFields.fieldLength NEQ "">(#getFields.fieldLength#)</cfif></td>
                                <td>#getFields.fieldDefault#</td>
                                <td>#getFields.fieldNotes#</td>
                            </tr>
                        </cfoutput>
                    </cfloop>
                </tbody>
            </table>
            <!---/ Table Structure --->
            <!--- Create SQL --->
            <div class="panel">
            	<h3></h3>
            	<span class="code">
            		<cfoutput>
            			CREATE TABLE `#getTable.tableName#`(<br>
            			<cfloop query="getFields">
            				`#getFields.fieldName#` #getFields.fieldDataType#<cfif getFields.fieldLength NEQ "">(#getFields.fieldLength#)</cfif><cfif getFields.fieldReq EQ "1"> NOT NULL</cfif><cfif getFields.fieldKey EQ "1"> AUTO_INCREMENT</cfif><cfif getFields.fieldDefault NEQ ""> DEFAULT #getFields.fieldDefault#</cfif>,
            				<cfif getFields.fieldKey EQ "1"><cfset PrimaryKey = getFields.fieldName></cfif>
            				<br>
            			</cfloop>
            			PRIMARY KEY (`#PrimaryKey#`)<br>
            		);
            		</cfoutput>
            	</span>
            </div>
            <!---/ Create SQL --->
        </div>
    </div>
</cfloop>
<!---/ Detail --->