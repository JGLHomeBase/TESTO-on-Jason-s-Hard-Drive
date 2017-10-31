
<cfquery name="getScore">
SELECT Score, ScoreNote
FROM score
INNER JOIN comppanel ON score.compPanelID = comppanel.compPanelID
INNER JOIN users ON comppanel.userID = users.userID
WHERE score.compAppID = <cfqueryparam value="#URL.app#">
        AND comppanel.userID = <cfqueryparam value="#SESSION.userID#">
        AND score.factorID = <cfqueryparam value="#getReportMod.factorID#"> 
</cfquery>
    
<cfoutput>
    
    <script>
    $(document).ready(function () {
        $(".scoreField").on("change", function () {
            $(this).addClass("BGOrange");
            $.post("#AbsoluteURL#takeout/secure/score.cfm", $(this).closest(".scoreForm").serialize(),$(this).removeClass("BGOrange"));
        });
    });
    </script>
    
    <cfquery name="getFactor">
    SELECT * FROM scorefactor
    WHERE factorID = <cfqueryparam value="#getReportMod.factorID#">
    </cfquery>
    <cfif Right(DecimalFormat(getFactor.maxPoints),2) EQ "00">
        <cfset MaxPoints = NumberFormat(getFactor.maxPoints,"0")>
    <cfelseif Right(DecimalFormat(getFactor.maxPoints),1) EQ "0">
        <cfset MaxPoints = NumberFormat(getFactor.maxPoints,"0.0")>
    <cfelse>
       <cfset MaxPoints = getFactor.maxPoints>
    </cfif>
    <!--- Get Score Scales --->
    <cfif getFactor.scaled EQ 1>
        <cfquery name="getScales">
        SELECT * FROM scorescale
        WHERE factorID = <cfqueryparam value="#getReportMod.factorID#">
        ORDER BY minValue ASC
        </cfquery>
    </cfif>
    <!---/ Get Score Scales --->
   <div class="row">
    <div class="small-12 columns">
        <div class="panel">
            <form action="#AbsoluteURL#takeout/secure/score.cfm" method="post" class="scoreForm">
                <div class="row">
                    <cfif getFactor.pmID EQ 0>
                        <div class="medium-10 columns">
                            <h4>#getFactor.factorLongName#</h4>
                            <cfif getFactor.factorDesc NEQ "">
                            #ParagraphFormat(getFactor.factorDesc)#
                            </cfif>
                            <label>Notes:</label>
                            <textarea name="scoreNote" class="scoreField">#getScore.scoreNote#</textarea>
                        </div>
                    <cfelse>
                        <div class="medium-8 columns">
                            <h4>#getFactor.factorLongName#</h4>
                            <cfif getFactor.factorDesc NEQ "">
                            #ParagraphFormat(getFactor.factorDesc)#
                            </cfif>
                             <label>Notes:</label>
                            <textarea name="scoreNote" class="scoreField">#getScore.scoreNote#</textarea>
                        </div>
                        <div class="medium-2 columns text-center">
                           <cfinvoke component="knex.pm"
                                      method="getProject"
                                      apr="#URL.apr#"
                                      project="#URL.project#"
                                      pm="#getFactor.pmID#"
                                      returnvariable="pm">
                            <!---/ Get Data  --->
                            <!---/ Get Results --->
                            <label>Project Performance</label>
                            <h3>#pm.modalLink#</h3>
                            
                            #pm.modal#
                            <!--- Score Scales --->
                            <cfif getFactor.scaled EQ 1>
                                <cfset AppPtScore = 0>
                                <cfloop query="getScales">
                                    <cfif getScales.minValue LTE pm.value>
                                        <cfset AppPtScore = NumberFormat(getScales.ptScore)>
                                    </cfif>    
                                </cfloop>
                                            <cfsavecontent variable="scaleTip">
                                                Points are assigned using a #MaxPoints#-point scale:
                                                        <cfloop query="getScales">
                                                            <cfif getScales.minValue LTE pm.value>
                                                                <cfset ptScore = getScales.ptScore>
                                                            </cfif>
                                                                    <cfif getScales.scaleName EQ "">
                                                                        #getScales.minValue#
                                                                    <cfelse>
                                                                        #getScales.scaleName#
                                                                        (#getScales.minValue#)
                                                                    </cfif>
                                                               =
                                                                    #getScales.ptScore# pts.
                                                             
                                                        </cfloop>
                                            </cfsavecontent>
                                <p>
                                   <small><span data-tooltip aria-haspopup="true" class="has-tip" title="#scaleTip#">(#AppPtScore# Points)</span></small>
                                </p>
                                <!--- Show Scales --->
                                    
                                <!---/ Show Scales --->
                            </cfif>
                            <!---/ Score Scales --->
                        </div>
                    </cfif>
                    <div class="medium-1 columns">
                        <label>Score </label>
                        <cfif getFactor.Forced EQ 1>
                            <cfset readonly = "readonly">
                            <cfset inputClass = "BGLightGray">
                        <cfelse>
                            <cfset readonly = "">
                            <cfset inputClass = "">
                        </cfif>
                        
                        <cfset defaultValue = getScore.Score>
                        <cfif getScore.RecordCount EQ 0>
                            <cfset defaultvalue = "0">
                            <cfif getFactor.scaled EQ 1>
                                <cfparam name="AppPtScore" default="0">
                                <cfset defaultValue = AppPtScore>
                            </cfif>
                             <cfquery name="getID">
                                SELECT compPanelID
                                FROM comppanel 
                                INNER JOIN users ON comppanel.userID = users.userID
                                WHERE comppanel.compID = <cfqueryparam value="#SESSION.compID#">
                                        AND comppanel.userID = <cfqueryparam value="#SESSION.userID#">
                                </cfquery>
                            <cfif getID.RecordCount GT 0>
                                    <cfinvoke component="knex.sortinghat"
                                      method="post"
                                      DataSource = "#DataSource#"
                                      compAppID = "#URL.app#"
                                      compPanelID = "#getID.compPanelID#"
                                      factorID = "#getReportMod.factorID#"
                                      score = "#defaultvalue#">
                            </cfif>
                          
                        </cfif>
                        <cfif Right(NumberFormat(defaultValue,"0.000"),3) EQ "000">
                            <cfset defaultValue = NumberFormat(defaultValue,"0")>
                        <cfelseif Right(DecimalFormat(defaultValue),2) EQ "00">
                            <cfset defaultValue = NumberFormat(defaultValue,"0.00")>
                        <cfelseif Right(DecimalFormat(defaultValue),1) EQ "0">
                            <cfset defaultValue = NumberFormat(defaultValue,"0.0")>
                        </cfif>
                        <input type="number"
                               name="Score"
                               min="0"
                               max="#getFactor.maxPoints#"
                               class="scoreField #inputClass#"
                               value="#defaultValue#"
                               required
                               #readonly#>
                        <input type="hidden"
                               name="compAppID"
                               value="#URL.app#">
                        <input type="hidden"
                               name="factorID"
                               value="#getReportMod.factorID#">
                    </div>
                    <div class="medium-1 columns">
                        <label>Max Pts.</label>
                        <input type="text"
                               name="max"
                               value="#MaxPoints#"
                               readonly
                               class="BGLightGray">
                    </div>
                </div>
            </form>
        </div>
    </div> 
   </div>
</cfoutput>