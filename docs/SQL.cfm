<!---
Title: DataBase Structure
Filename: DBStructure.cfm
--->

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
        <h1>MySQL CREATE</h1>
        <p><cfoutput>#AppShortName#</cfoutput> stores data within the following <cfoutput>#getTables.RecordCount#</cfoutput> tables:</p>
    </div>
</div>
<!---/ Heading --->

<!--- Detail --->
<span class="code">
    <cfloop query="getTables">
        <cfquery datasource="#DataSource#" name="getFields">
        SELECT *
        FROM fields
        WHERE tableID = <cfqueryparam value="#getTables.tableID#"></cfqueryparam>
        ORDER BY fieldKey DESC, fieldName ASC
        </cfquery>
        <!--- Create SQL --->
        <p>
            <cfoutput>
                CREATE TABLE `#getTables.tableName#`(<br>
                <cfloop query="getFields">
                    `#getFields.fieldName#` #getFields.fieldDataType#<cfif getFields.fieldLength NEQ "">(#getFields.fieldLength#)</cfif><cfif getFields.fieldReq EQ "1"> NOT NULL</cfif><cfif getFields.fieldKey EQ "1"> AUTO_INCREMENT</cfif><cfif getFields.fieldDefault NEQ ""> DEFAULT #getFields.fieldDefault#</cfif>,
                    <cfif getFields.fieldKey EQ "1"><cfset PrimaryKey = getFields.fieldName></cfif>
                    <br>
                </cfloop>
                PRIMARY KEY (`#PrimaryKey#`)<br>
            );
            </cfoutput>
        </p>
        <!---/ Create SQL --->
    </cfloop>
</span>
<!---/ Detail --->