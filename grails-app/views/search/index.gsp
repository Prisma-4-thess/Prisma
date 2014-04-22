<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Search</title>
    <g:javascript library="jquery"/>
    <resource:autoComplete skin="default"/>
</head>

<body>
<div id="search-body">
    <table>
        <tr>
            <td><g:remoteLink controller="search" action="ada"
                              update="mainContent">ada search</g:remoteLink></td>
            <td><g:remoteLink controller="search" action="specific"
                              update="mainContent">specific  search</g:remoteLink></td>
            <td><g:remoteLink controller="search" action="general"
                              update="mainContent">general  search</g:remoteLink></td>
            <td><g:remoteLink controller="search" action="full_search"
                              update="mainContent">full  search</g:remoteLink></td>
        </tr>
    </table>

    <div id="mainContent" style="background-color: #c0ffc0;">
        <p>Επιλέξτε κατηγορία αναζήτησης.</p>
    </div>
</div>
</body>
</html>