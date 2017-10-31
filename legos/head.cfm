<!--- Redirect --->
<cfif InviteOnly EQ "yes" AND SESSION.authLevel GT 1>
    <cfparam name="URL.invite" default="">
    <cfif URL.invite NEQ InviteCode>
        <cfinclude template="#AbsoluteURL#pages/raw/maintenance.cfm">
        <cfabort>
    </cfif>
</cfif>
<!--- Redirects --->

<!--- Variables --->
<cfset SESSION.action = URL.action>
<!---/ Variables --->
    
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <cfoutput>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        
        <title>#AppShortName# <cfif SESSION.cocID NEQ 0>| #SESSION.cocCity# </cfif>| HomeBase</title>
        <link rel="icon" type="image/png" href="#AbsoluteURL#img/icons/magic.png" />
        <link href='https://fonts.googleapis.com/css?family=Lato:400,900|Open+Sans+Condensed:300,700|Open+Sans:300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="#AbsoluteURL#css/#listContainsNoCase('pdf,print,share', url.action) ? 'pdf' : 'app'#.css" />
        <link rel="stylesheet" href="#AbsoluteURL#fonts/foundation-icons.css" />
    </cfoutput>

    <!--- Banner Image --->
    <cfset GoGlobal = 1>
    <cfparam name="URL.coc" default="#SESSION.cocID#">
    <cfquery datasource="#datasource#" name="getIMGCheck">
    SELECT imgID FROM img
    WHERE cocID = <cfqueryparam value="#URL.coc#">
    </cfquery>
    <cfif getIMGCheck.recordCount GT 0>
        <cfset GoGlobal = 0>
    </cfif>
   
    <cfquery datasource="#datasource#" name="getIMG">
    SELECT imgID, colorTheme FROM img
    WHERE cocID = <cfqueryparam value="#URL.coc#">
        <cfif GoGlobal EQ 1> OR frontPage = '1' </cfif>
    </cfquery>
   
    
    
    <style type="text/css">
        <cfif getIMG.RecordCount GT 0>
            <cfset targetRow = RandRange(1,getIMG.RecordCount)>
            <cfoutput query="getIMG" startrow="#targetRow#" maxrows="1">
                <cfif getIMG.ColorTheme EQ "darken">
                    <cfset ImgTint = "linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),">
                <cfelse>
                    <cfset ImgTint = "">
                </cfif>
                .CFTinyBox{
                    height:75px;
                    background-image: #ImgTint#url(#AbsoluteURL#img/upload/tiny#getIMG.imgID#.jpg);
                    background-repeat: no-repeat;
                    display: block;
                    background-color:##2A80B9;
                    background-position: center;
                    background-size: cover;
                }
                .CFSmallBox{
                    height:150px;
                    background-image: #ImgTint#url(#AbsoluteURL#img/upload/small#getIMG.imgID#.jpg);
                    background-repeat: no-repeat;
                    display: block;
                    background-color:##2A80B9;
                    background-position: center;
                    background-size: cover;
                }
                .CFBox{
                    height:250px;
                    background-image: #ImgTint# url(#AbsoluteURL#img/upload/box#getIMG.imgID#.jpg);
                    background-repeat: no-repeat;
                    display: block;
                    background-color:##2A80B9;
                    background-position: center;
                    background-size: cover;
                }
                .CFHotBoxHome{
                    height:400px;
                    background-image: url(#AbsoluteURL#img/upload/home#getIMG.imgID#.jpg);
                    background-repeat: no-repeat;
                    display: block;
                    background-color:##2A80B9;
                    background-position: center;
                    background-size: cover;
                }
                .CFBigBox{
                    height:600px;
                    background-image: url(#AbsoluteURL#img/upload/#getIMG.imgID#.jpg);
                    background-repeat: no-repeat;
                    display: block;
                    background-color:##2A80B9;
                    background-position: center;
                    background-size: cover;
                }
                .CFHeader{
                     color:white !important;
                     font-weight:700 !important;
                    padding-left: 20px;
                    padding-right:20px;
                     display: none;
                }
            </cfoutput>
        <cfelse>
            <cfoutput>
                .CFTinyBox{
                    height:75px;
                    background-color:##2A80B9 !important;
                }
                .CFSmallBox{
                    height:150px;
                    background-color:##2A80B9 !important;
                }
                .CFBox{
                    height:250px;
                    background-color:##2A80B9 !important;
                }
                .CFHotBox{
                    height:420px;
                    background-color:##2A80B9 !important;
                }
                .CFHotBoxHome{
                    height:400px;
                    padding-top:320px;
                    background-color:##5B6470 !important;

                }
                .CFBigBox{
                    height:600px;
                    background-color:##2A80B9 !important;
                }
                .CFHeader{
                    color:white !important;
                    font-weight:100 !important;
                    display: none;
                }
            </cfoutput>
        </cfif>
        @media print{
          .CFHeader{
            color:##E4EDFA !important;
            font-weight:900 !important;
        }
        }
    </style>
    <!---/ Banner Image --->
    
     <cfoutput>
        <script src="#AbsoluteURL#bower_components/jquery/dist/jquery.js"></script>
        <script src="#AbsoluteURL#bower_components/what-input/what-input.js"></script>
        <script src="#AbsoluteURL#js/Chart.js"></script>
        <script src="#AbsoluteURL#bower_components/foundation-sites/dist/foundation.js"></script>
    </cfoutput>
  </head>
  <body>