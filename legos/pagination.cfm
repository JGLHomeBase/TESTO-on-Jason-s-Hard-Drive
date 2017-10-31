<!--- Pagination --->
<cfif pageRecordCount GT 0>
    <cfset maxPages = ceiling((pageRecordCount/maxRows))>
    <cfoutput>
        <cfif pageRecordCount GT maxRows>
            <div class="pagination-centered">
              <ul class="pagination">
                <!--- Left Arrow --->
                <cfif URL.page NEQ 1>
                    <cfset prevPage = URL.page-1>
                    <li class="arrow"><a href="#CurrentPage#?page=1&maxrows=#URL.maxrows#&action=#URL.action#">&laquo;</a></li>
                </cfif>
                <!---/ Left Arrow --->

                <!--- Page Links --->
                <cfif maxPages GT 12>
                    <cfset SetStart = URL.page - 8>
                    <cfset SetEnd = URL.page + 8>
                    <cfif SetStart LT 1>
                        <cfset SetEnd = SetEnd + (8-URL.page)>
                        <cfset SetStart = 1>
                    <cfelseif SetEnd GT maxPages>
                        <cfset SetStart = SetStart - (SetEnd-maxPages)>
                        <cfif SetStart LT 1>
                            <cfset SetStart = 1>
                        </cfif>
                        <cfset SetEnd = maxPages>
                    </cfif>
                    <cfif SetEnd GT maxPages>
                        
                    </cfif>
                    <cfloop from="#SetStart#" to="#SetEnd#" index=pageLink>
                        <cfif URL.page EQ pageLink>
                            <li class="current"><a href="#CurrentPage#?page=#pageLink#&maxrows=#URL.maxrows#&action=#URL.action#<cfif IsDefined("URL.table")>&table=#URL.table#</cfif>">#pageLink#</a></li>
                        <cfelse>
                            <li><a href="#CurrentPage#?page=#pageLink#&maxrows=#URL.maxrows#&action=#URL.action#<cfif IsDefined("URL.table")>&table=#URL.table#</cfif>">#pageLink#</a></li>
                        </cfif>
                    </cfloop>
                <cfelse>
                    <cfloop from="1" to="#maxPages#" index=pageLink>
                        <cfif URL.page EQ pageLink>
                            <li class="current"><a href="#CurrentPage#?page=#pageLink#&maxrows=#URL.maxrows#&action=#URL.action#<cfif IsDefined("URL.table")>&table=#URL.table#</cfif>">#pageLink#</a></li>
                        <cfelse>
                            <li><a href="#CurrentPage#?page=#pageLink#&maxrows=#URL.maxrows#&action=#URL.action#<cfif IsDefined("URL.table")>&table=#URL.table#</cfif>">#pageLink#</a></li>
                        </cfif>
                    </cfloop>
                </cfif>
                
                <!---/ Page Links --->

                <!--- Right Arrow --->
                <cfif URL.page LT maxPages>
                    <cfset nextPage = URL.page+1>
                    <li class="arrow"><a href="#CurrentPage#?page=#maxPages#&maxrows=#URL.maxrows#&action=#URL.action#">&raquo;</a></li>
                </cfif>
                <!---/ Right Arrow --->

              </ul>
            </div>
        </cfif>
    </cfoutput>
</cfif>
<!---/ Pagination --->