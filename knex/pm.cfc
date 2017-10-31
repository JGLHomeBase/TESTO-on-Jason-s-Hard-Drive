<!--- 
Filename: pm.cfc
Version: 1.0
--->


<cfcomponent displayname="Performance Measures" hint="Retrives information about performance measurements, categories and applicable groups" output="false">
    
    <!--- Update Record --->
	<cffunction name="detail" access="public" description="Displays information about a specified performance measure or group of measures" >
        <!--- Arguements --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="measure" hint="Performance Measure ID" type="numeric" default="0">
        <cfargument name="cat" hint="Performance Measure Cat ID" type="numeric" default="0">
        <cfargument name="heading" hint="Heading Size of Output" type="numeric" default="1">
        <cfargument name="hr" hint="Include Horizontal Rule" type="numeric" default="1">
        <cfargument name="highlight" hint="pmID of measure to be highlighted" type="numeric" default="0">
        <!---/ Arguements --->
        
        <cfquery name="getMeasure">
        SELECT * FROM performmeasure
        INNER JOIN performgroup ON performmeasure.pmGroupID = performgroup.pmGroupID
        WHERE
            <cfif cat EQ "0">
                pmID = <cfqueryparam value="#measure#">
            <cfelse>
                pmCatID = <cfqueryparam value="#cat#">
            </cfif>
            AND (cocID = '0' OR cocID = <cfqueryparam value="#SESSION.cocID#">)
            AND performmeasure.active = '1'
        ORDER BY pmLongName
        </cfquery>
        <cfoutput>
        <cfloop query="getMeasure">
            <cfif getMeasure.pmID EQ #highlight#>
                <cfset HighClass = " Highlight">
            <cfelse>
                <cfset HighClass = "">
            </cfif>
            <div class="row PrintModule#HighClass#">
                <div class="large-12 columns">
                    <a name="#getMeasure.pmID#">
                        <h#heading#>#getMeasure.pmLongName#</h#heading#>
                    </a>
                    <p>
                        <i>
                            <b>Field Name: </b>#getMeasure.pmName# | 
                            <b>Format: </b>
                                <cfif getMeasure.formatType EQ "number">
                                    Number (0.0)
                                <cfelseif getMeasure.formatType EQ "percent">
                                    Percentage (0.0%)
                                <cfelseif getMeasure.formatType EQ "money">
                                    Currency ($0.00)
                                <cfelseif getMeasure.formatType EQ "varchar">
                                    Text (ABC123)
                                </cfif>
                            | 
                            <b>Population: </b> #getMeasure.pmGroupLongName#
                        </i>
                    </p>
                    <p>#getMeasure.pmDesc#</p>
                    <cfif hr NEQ "0">
                        <hr>
                    </cfif>
                </div>
            </div>
        </cfloop>
    </cfoutput>        
    </cffunction>
    <!---/ Update Record --->
                    
    <!--- calcProject --->
	<cffunction name="getProject" 
                access="public" 
                description="Displays a single PM for a single project">
        <!--- Arguements --->
        <cfargument name="apr" type="numeric" hint="APR ID" required="true">
        <cfargument name="project" type="numeric" hint="Project ID" required="true">
        <cfargument name="pm" hint="Performance Measure ID" required="true">
        <!---/ Arguements --->
        
        <!--- Get Data Tables --->
        <cfinvoke component="knex.table" 
                method="getDataTables"
                returnVariable = "getTableList">
        <!---/ Get Get Data Tables --->		
                                    
        <cfquery name="getPMs">
            SELECT pmID, pmName, sourceField, formatType, pmLongName, pmDesc, pmGroupID
            FROM performmeasure
            WHERE pmID = <cfqueryparam value="#pm#">
        </cfquery>
            
        <!--- Get Project Data --->
        <cfquery name="getField">
            SELECT #toString(getPMs.sourceField)# AS measure, projects.projectComponentID, projectcomponent.projectComponentName
            FROM projects
            INNER JOIN coc on projects.cocID = coc.cocID
                AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
            INNER JOIN  agency ON projects.agencyID = agency.agencyID
                AND projects.cocID = <cfqueryparam value="#SESSION.cocID#">
            INNER JOIN projectcomponent ON projects.projectComponentID = projectcomponent.projectComponentID
            <!--- Join Data Tables --->
            <cfloop query="getTableList">
            LEFT JOIN  dataapr#NumberFormat(getTableList.APRQuestion,"00")# ON projects.projectID = dataapr#NumberFormat(getTableList.APRQuestion,"00")#.projectID AND dataapr#NumberFormat(getTableList.APRQuestion,"00")#.aprID = <cfqueryparam value="#apr#">
            </cfloop>
            LEFT JOIN datarfi ON projects.projectID = datarfi.projectID AND datarfi.aprID = <cfqueryparam value="#apr#">
            <!---/ Join Data Tables --->
            WHERE projects.projectID = <cfqueryparam value="#project#">
        </cfquery>
        <!---/ Get Project Data --->
        <!--- Format Measure --->
        <cfif 0 EQ 0>
             <cfif getPMs.formatType EQ "percent">
                 <cfset measure = "#NumberFormat(getField.measure,"0.0")#&##37;">
            <cfelseif getPMs.formatType EQ "money">
                 <cfset measure = "#LSCurrencyFormat(getField.measure)#">
            <cfelseif getPMs.formatType EQ "number" AND IsNumeric(getField.measure)>
                <cfset measure = "#NumberFormat(getField.measure,",.00")#">
                <cfif right(measure,3) EQ ".00">
                    <cfset measure = "#NumberFormat(getField.measure)#">
                </cfif>
            <cfelseif getPMs.formatType EQ "yesno">
                <cfif getField.measure EQ 1>
                    <cfset measure = "Yes">
                <cfelse>
                    <cfset measure = "No">
                </cfif>
            <cfelse>
                <cfset measure = getField.measure>
            </cfif>
        <cfelse>
            <cfset measure = getField.measure>
        </cfif>
        <!---/ Format Measure --->
        
        <cfif SESSION.action NEQ "PDF" AND SESSION.action NEQ "print">
            <!--- Build Modal --->
            <cfsavecontent variable="modal">
                <cfoutput>
                    <div id="pm#getPMs.pmID#"
                         class="reveal small"
                         data-reveal aria-labelledby="modalTitle"
                         aria-hidden="true"
                         role="dialog">
                      <h2>#getPMs.pmLongName#</h2>
                      <p>#getPMs.pmDesc#</p>
                      <cfif getPMs.formatType NEQ "varchar" AND getPMS.formatType NEQ "yesno">
                          <p class="text-center">
                              <a href="lab.cfm?project=#project#&apr=#apr#&type=#getField.projectComponentID#&who=#getPms.pmGroupID#&what=#getPMs.pmID#"
                                 class="button small">Compare Performance to Other #getField.projectComponentName# Programs in #SESSION.cocCity#</a>
                          </p>
                        </cfif>
                      <button class="close-button" data-close aria-label="Close modal" type="button">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                </cfoutput>
            </cfsavecontent>
            <!---/ Build Modal --->

            <!--- Build Modal Link --->
            <cfsavecontent variable="modalLink">
                <cfoutput>
                    <a href="##" data-open="pm#getPMs.pmID#">#measure#</a> 
                </cfoutput>
            </cfsavecontent>
            <!---/ Build Modal Link --->

            <!--- Build Tooltip Link --->
            <cfsavecontent variable="tipLink">
                <cfoutput>
                    <span data-tooltip aria-haspopup="true"
                          class="has-tip"
                          title="#getPMs.pmLongName# | #getPMs.pmDesc#">
                        #measure#
                    </span>
                </cfoutput>
            </cfsavecontent>
            <!---/ Build Tooltip Link --->
        <cfelse>
            <cfset tipLink = measure>
            <cfset modalLink = measure>
            <cfset modal = "">
        </cfif>
            
        <cfset pm = StructNew()>
        <cfif getField.measure EQ "" AND getPMs.formatType NEQ "varchar">
            <cfset pm.value = 0>
        <cfelse>
            <cfset pm.value = getField.measure>
        </cfif>
        <cfset pm.prettyValue = measure>
        <cfset pm.pmName = getPMs.pmName>
        <cfset pm.formatType = getPMs.formatType>
        <cfif SESSION.authLevel LTE 8
              AND getPMs.formatType NEQ "varchar"
              AND getPMs.formatType NEQ "yesno">
            <cfset pm.modal = modal>
            <cfset pm.modalLink = modalLink>
        <cfelseif getPMs.formatType EQ "varchar">
            <cfset pm.modal = "">
            <cfset pm.modalLink = measure>
        <cfelse>
            <cfset pm.modal = "">
            <cfset pm.modalLink = tipLink>    
        </cfif>
       
            
        <cfset pm.tipLink = tipLink>
            
        <cfreturn pm>
    </cffunction>
    <!---/ calcProject --->
    
    <!--- PM Field --->
	<cffunction name="getField" 
                access="public" 
                description="Generates select field for PM">
        <!--- Arguements --->
        <cfargument name="fieldname" type="string" hint="Field Name" required="true">
        <cfargument name="nullOK" type="boolean" default="true" required="false">
        <cfargument name="selected" default="0" required="false">
        <!---/ Arguements --->
            
        <!--- Get PM's --->
        <cfquery name="getPMs">
            SELECT pmID, pmLongName, pmCatName
            FROM performmeasure
            INNER JOIN performcat ON performmeasure.pmCatID = performcat.pmCatID
            WHERE cocID = '0' OR cocID = <cfqueryparam value="#SESSION.cocID#">
             AND formatType <> 'varchar'
            ORDER BY pmCatName, pmLongName
        </cfquery>
        <!---/ Get PM's --->
        <!--- Create Field --->
        <cfsavecontent variable="field">
            <cfoutput>
                <select name="#fieldname#">
                    <cfif nullOK EQ TRUE>
                        <option value="0"<cfif getPMs.pmID EQ selected> selected</cfif>></option>
                    </cfif>
                    <cfloop query="getPMs">
                        <option value="#getPMs.pmID#"<cfif getPMs.pmID EQ "#selected#"> selected</cfif>>#getPMs.pmCatName#: #getPMs.pmLongName#</option>
                    </cfloop>
                </select>
            </cfoutput>
        </cfsavecontent>
        <!---/ Create Field --->
        <cfreturn field>
    </cffunction>
    <!---/ PM Field ---> 
</cfcomponent>