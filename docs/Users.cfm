<cfoutput>
    <!--- Heading --->
    <div class="row">
        <div class="large-12 columns">
            <h1>User Accounts</h1>
        </div>
    </div>
    <!---/ Heading --->
    

    <!--- Sub Nav --->
    <div class="row">
        <div class="large-12 columns">
            <hr>
            <div data-magellan-expedition="fixed" id="magellan_bar"> 
              <dl class="sub-nav">
                    <dd data-magellan-arrival="Roles"><a href="##Roles">Roles and Access</a></dd>
              </dl>
            </div>
            <hr>
        </div>
    </div>
<!---/ Sub Nav --->

    <!--- Roles and Access --->
    <div class="row">
        <div class="large-12 columns">
            <a name="Roles"></a>
            <h2 data-magellan-destination="Roles">Roles and Access</h2>
            <p>There are a number of levels of access control in #AppShortName#. A user's scope of access can be restricted to a single continuum, competition, agency or program. In addition, administrators can control each users ability to create accounts, manage other users, edit program data, and/or score projects.</p>

            <h3>User Roles</h3>
            <table>
                <thead>
                    <th width="50%">Role</th>
                    <th>Manage Users</th>
                    <th>Edit Data</th>
                    <th>Score Projects</th>
                    <th>View Reports</th>
                    <th>authLevel</th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <b>Super Administrator</b><br>
                            Super admins have full administration over all users and projects within their scope of access.
                        </td>
                        <td class="text-center"><i class="fi-torsos-all"></i></td>
                        <td class="text-center"><i class="fi-pencil"></i></td>
                        <td class="text-center"><i class="fi-like"></i><i class="fi-dislike"></i></td>
                        <td class="text-center"><i class="fi-eye"></i></td>
                        <td class="text-center">1</td>
                    </tr>
                    <tr>
                        <td>
                            <b>Administrator</b><br>
                            Admin users have full administration over all users and projects within their scope of access.
                        </td>
                        <td class="text-center"><i class="fi-torsos-all"></i></td>
                        <td class="text-center"><i class="fi-pencil"></i></td>
                        <td class="text-center"><i class="fi-like"></i><i class="fi-dislike"></i></td>
                        <td class="text-center"><i class="fi-eye"></i></td>
                        <td class="text-center">3</td>
                    </tr>
                    <tr>
                        <td>
                            <b>Editors</b><br>
                            Editors can enter or update data for all projects within their scope of access.
                        </td>
                        <td class="text-center"></td>
                        <td class="text-center"><i class="fi-pencil"></i></td>
                        <td class="text-center"></i></td>
                        <td class="text-center"><i class="fi-eye"></i></td>
                        <td class="text-center">5</td>
                    </tr>
                    <tr>
                        <td>
                            <b>Panelist</b><br>
                            Panelist can review and score all projects within their scope of access.
                        </td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"><i class="fi-like"></i><i class="fi-dislike"></i></td>
                        <td class="text-center"><i class="fi-eye"></i></td>
                        <td class="text-center">7</td>
                    </tr>
                    <tr>
                        <td>
                            <b>Viewer</b><br>
                            Viewers have read-only access to all projects within their scope of access.
                        </td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"><i class="fi-eye"></i></td>
                        <td class="text-center">9</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!---/ Roles and Access --->



  
</cfoutput>