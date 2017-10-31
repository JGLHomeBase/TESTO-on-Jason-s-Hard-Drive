<!--- 
Filename: gopostal.cfc
Version: 1.0
--->


<cfcomponent displayname="postal" hint="Sends email" output="false">
    
    <!--- Send Message --->
	<cffunction name="send" access="public" description="Formats and sends an html email" output="false" >
        <!--- Arguments --->
        <cfargument name="DataSource" hint="ColdFusion DataSource Name" type="string" required="true" >
        <cfargument name="AppShortName" hint="Application Short Name" type="string" required="true" default="PRESTO" >
        <cfargument name="HelpEmail" hint="Help email contact" type="string" required="true" default="presto@homebaseccc.org" >
        <cfargument name="HelpPhone" hint="Help phone contact" type="string" required="false" default="(415) 788-7061">
        <cfargument name="FullURL" hint="Help email contact" type="string" required="true" default="https://homebaseccc.org/app/presto" >
        <cfargument name="emailTo" hint="Destination email address" required="true">
        <cfargument name="emailFrom" hint="From email address" required="true" default="#HelpEmail#">
        <cfargument name="emailSubject" hint="Email subject line" default="#AppShortName# Update">
        <cfargument name="emailSubjectShort" hint="Email subject line" default="Update">
        <cfargument name="emailBody" hint="Email body" default="">
        <cfargument name="force" hint="Override user preferences and send anyway" required="false" default="no">
        <!---/ Arguments --->
        <cfquery name="getUser">
        SELECT * FROM users WHERE userEmail = <cfqueryparam value="#emailTo#"> AND updateEmail = '1'
        </cfquery>
        <cfif getUser.RecordCount GT 0 OR force EQ "yes">
            <cfmail to="#emailTo#"
                    from="#AppShortName# <#emailFrom#>"
                    replyto="#AppShortName# <#emailFrom#>"
                    subject="#emailSubject#" 
                    type="html">
            <!--- EMAIL MESSAGE --->
                <!--- Email Messaage --->
                <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
                <html xmlns="http://www.w3.org/1999/xhtml">
                <head>
                <meta name="viewport" content="width=device-width" />
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>#emailSubject#</title>
                </head>
                <body bgcolor="##FFFFFF">
                    <table bgcolor="##FFFFFF" width="100%">
                        <tr>
                            <td>
                                <table bgcolor="##2DB2FF" width="100%">
                                    <tr>
                                        <td style="padding:5px;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <img src="#FullURL#/img/icons/icon_door_shadow50.png" width="35" />
                                                    </td>
                                                    <td align="left">
                                                        <h2 style="font-family:'Open Sans Light', 'Open Sans', 'Helvetica Light', 'Helvetica', 'Arial Narrow', Arial; color:white;">#AppShortName#</h2>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <h3 style="font-family:'Open Sans', 'Helvetica', Arial; color:white; padding:5px;">#emailSubjectShort#</h3>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                #emailBody#
                            </td>
                        </tr>
                        <tr bgcolor="##EEEFF7">
                            <td align="left">
                                <table>
                                  <tr>
                                    <td>
                                        <img src="#FullURL#/img/icons/smallicon.png" width="32" >  
                                    </td>
                                    <td>
                                        <p><b>Powered by <a href="https://homebaseccc.org">HomeBase</a></b><br>Legal and Technical Assistance | Policy | Advocacy | Planning</p>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td colspan="2">
                                      <small>
                                            Copyright 2013-2015 HomeBase/The Center for Common Concerns<br>
                                            <a href="#FullURL#/pages/terms.cfm">Terms of Use and Privacy Policies.</a>
                                     </small>
                                    </td>  
                                  </tr>
                                </table>
                            </td>
                        </tr>
                          <tr>
                            <td align="center">
                                
                            </td>
                        </tr>
                    </table>
                
              

                <!--- FOOTER --->
                    
            <!--- /FOOTER --->
                </body>
                </html>
                <!---/ Email Messaage --->
            <!--- EMAIL MESSAGE --->
            </cfmail>
            <!--- Log Event --->
            <cfset FORM.userID = SESSION.userID>
            <cfset FORM.emailTo = "#emailTo#">
            <cfset FORM.emailSubject = "#emailSubject#">
            <cfset FORM.shortSubject = "#emailSubjectShort#">
            <cfset FORM.emailBody = "#emailBody#">
            <cfif force EQ "yes">
                <cfset FORM.forced = 1>
            <cfelse>
                 <cfset FORM.forced = 0>
            </cfif>
            <cfinsert tablename="emaillog"
                      datasource="#DataSource#"
                      formfields="userID, emailTo, emailSubject, shortSubject, emailBody, forced">
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "Email" 
                EventDetail = "An email message was sent to #emailTo# (Subject: #emailSubject#)"
                EventDesc = "Password Reset" >
            <!---/ Log Event --->
        <cfelse>
            <!--- Log Event --->
            <cfinvoke component="knex.eventLog" 
                method="newEvent"
                DataSource = "#DataSource#"
                EventType = "Email" 
                EventDetail = "Error: An email message was not sent to #emailTo# (Subject: #emailSubject#) based on their preferences"
                EventDesc = "Password Reset Error" >
            <!---/ Log Event --->
        </cfif>
    </cffunction>
    <!---/ Send Message --->

</cfcomponent>