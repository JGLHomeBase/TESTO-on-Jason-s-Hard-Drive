<!--- Footer --->
<cfset CopyEndYear = "2015">
<cfif URL.action NEQ "pdf">
    <div class="TinyBox BGWhite"></div>
    <cfoutput>  
        <div class="shoeBox hide-for-print">
            <!--- Mobile --->
            <div class="hide-for-large">
                <div class="row">
                    <div class="large-12 columns">
                      <img src="#AbsoluteURL#img/icons/smallicon.png" alt="Magic Icon" class="float-left" width="32">

                        Powered by <strong><a href="https://www.homebaseccc.org" target="_blank" class="MakeBlack">HomeBase</a></strong><br>
                        <small class="MakeGray">
                               &copy; 2013-#CopyEndYear#  HomeBase | <a href="#AbsoluteURL#pages/terms.cfm">Terms of Use and Privacy</a>
                          </small>
                    </div>
                </div>
            </div>
            <!---/ Mobile --->
            <!--- Desktop/Tablet --->
            <div class="show-for-large">
                <div class="row">
                    <div class="large-6 columns">
                      <img src="#AbsoluteURL#img/icons/smallicon.png" alt="Magic Icon" class="float-left" width="32">
                        Powered by <strong><a href="https://www.homebaseccc.org" target="_blank" class="MakeBlack">HomeBase</a></strong><br>
                        <small>
                            Legal and Technical Assistance | Policy | Advocacy | Planning<br>
                        </small>
                    </div>
                    <div class="large-6 columns text-right">
                           <small class="MakeGray">
                              &copy; 2013-#CopyEndYear# <a href="http://homebaseccc.org" target="_blank">HomeBase/The Center for Common Concerns</a><br>
                          Use of this site signifies your agreement to the <a href="#AbsoluteURL#pages/terms.cfm">Terms of Use and Privacy policies</a>.
                          </small>
                    </div>
                </div>
            </div>
            <!---/ Desktop/Tablet --->
        </div>
        <!--- Print --->
        <div class="show-for-print">
            <div class="row">
                <div class="large-12 columns">
                  <img src="#AbsoluteURL#img/icons/smallicon.png" alt="Magic Icon" class="float-left" width="32">

                    Powered by <strong>HomeBase</strong><br>
                    <small>
                        Legal and Technical Assistance | Policy | Advocacy | Planning<br><br>
                    </small>
                    <span class="MakeGray">
                        <small class="MakeGray">
                            &copy; 2013-#CopyEndYear# HomeBase/The Center for Common Concerns<br>
                      </small>
                        <small>WEB</small> homebaseccc.org | <small>EMAIL</small> info@homebaseccc.org | <small>PHONE</small> 415.788.7961

                    </span>

                </div>
            </div>
        </div>
        <!---/ Print --->
    </cfoutput>
<cfelse>
    <cfoutput>
        <div class="row">
            <div class="large=12 columns">
                <br />
            </div>
        </div>
        <div class="panel">
            <div class="row">
                <div class="large-12 columns">
                  <img src="#AbsoluteURL#img/icons/smallicon.png" alt="Magic Icon" class="left" width="32">

                    Powered by <strong><a href="https://www.homebaseccc.org" target="_blank" class="MakeBlack">HomeBase</a></strong><br>
                    <small>
                        Legal and Technical Assistance | Policy | Advocacy | Planning<br><br>
                    </small>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="large-12 columns">
                <span class="MakeDarkGray">
                    <small class="MakeDarkGray">
                        &copy; 2013-#CopyEndYear# HomeBase/The Center for Common Concerns<br>
                  </small>
                    <small>WEB</small> homebaseccc.org | <small>EMAIL</small> info@homebaseccc.org | <small>PHONE</small> 415.788.7961

                </span>

            </div>
        </div>
    </cfoutput>
</cfif>
<!--- Footer --->
    <cfoutput>
        <script src="#AbsoluteURL#js/app.js"></script>
        <script src="#AbsoluteURL#js/presto.js"></script>
        
        <!---
        <cfparam name="URL.ridin" default="0">
        <cfif URL.ridin EQ "dirty">
          <script src="js/foundation/foundation.joyride.js"></script>
          <script src="js/vendor/jquery.cookie.js"></script>
          <script>
          $(window).load(function() {
            $(document).foundation('joyride', 'start');
          });
          </script>
        </cfif>
        --->
    </cfoutput>
    
    <!--- Google Analytics --->
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      <cfoutput>ga('create', '#GoogleID#'<cfif SESSION.authLevel LT 10>,  { 'userId': 'WONKA-A0#SESSION.UserID#42' }</cfif>);</cfoutput>
      ga('require', 'displayfeatures');
      ga('send', 'pageview');
    </script>
    <!---/ Google Analytics --->

  </body>
</html>

<!--- Variables --->
<cfset SESSION.action = "">
<!---/ Variables --->