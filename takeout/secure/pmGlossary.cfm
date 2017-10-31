<cfquery name="getPMCat">
SELECT * FROM performcat
WHERE parentID = '0'
      AND active = '1'
ORDER BY pmCatLongName
</cfquery>
<cfparam name="URL.pm" default="0">
    
<cfoutput>
    <h1>#AppShortName# Performance Measure Glossary</h1>
<div class="row">
    <div class="large-9 columns">
        <div class="sections"  id="NavSticky">
            <cfloop query="getPMCat">
                <section id="cat#getPMCat.PMCatID#" data-magellan-target="cat#getPMCat.PMCatID#">
                    <div class="row">
                        <div class="large-12 columns">
                            <h2>#getPMCat.pmCatLongName#</h2>
                            <cfif getPMCat.pmCatDetail EQ "">
                                <p>#getPMCat.pmCatDesc#</p>
                            <cfelse>
                                <p>#getPMCat.pmCatDetail#</p>
                            </cfif>
                        </div>
                    </div>
                    <cfinvoke component="knex.pm" 
                              method="detail"
                              DataSource = "#DataSource#"
                              cat="#getPMCat.pmCatID#"
                              heading="3"
                              highlight="#URL.pm#">
                    <cfquery name="getPMCatKids">
                    SELECT * FROM performcat
                    WHERE parentID = <cfqueryparam value="#getPMCat.pmCatID#">
                          AND active = '1'
                    ORDER BY pmCatLongName
                    </cfquery>
                    <cfloop query="getPMCatKids">
                        <div class="row">
                            <div class="large-12 columns">
                                <h3>#getPMCatKids.pmCatLongName#</h3>
                                <cfif getPMCatKids.pmCatDetail EQ "">
                                    <p>#getPMCatKids.pmCatDesc#</p>
                                <cfelse>
                                    <p>#getPMCatKids.pmCatDetail#</p>
                                </cfif>
                            </div>
                        </div>
                        <cfinvoke component="knex.pm" 
                              method="detail"
                              DataSource = "#DataSource#"
                              cat="#getPMCatKids.pmCatID#"
                              heading="3"
                              highlight="#URL.pm#">
                    </cfloop>
                </section>
            </cfloop>
        </div>
    </div>
    <div class="large-3 columns" data-sticky-container>
      <nav class="sticky" data-sticky data-anchor="NavSticky" data-sticky-on="large">
        <ul class="vertical menu" data-magellan>
          <cfloop query="getPMCat">
              <li><a href="##cat#getPMCat.PMCatID#">#getPMCat.pmCatLongName#</a></li>
            </cfloop>
        </ul>
      </nav>
    </div>    
</div>

</cfoutput>
<script>
    $(".pageNav").hide(1000);
    $(".pageNavButton").show(500);
    $(".pageNavHideButton").hide();
</script>