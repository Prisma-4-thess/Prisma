<%--
  Created by IntelliJ IDEA.
  User: giannis
  Date: 22/4/2014
  Time: 4:47 μμ
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:javascript library="jquery"/>
    <g:set var="entityName"
           value="${message(code: 'organization.label', default: 'Organization')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <ul>
        <li class="active"><a style="cursor:pointer;" onclick="showOptionsAdminpanel()">Organizations</a></li>
    </ul>
</div>


<div id="organizationTab">
<div class="pagination">
    <g:each in="${firstChar}">
        <g:remoteLink controller="intro" action="show" id="${it}"
                      update="organizations">
            ${it}
        </g:remoteLink>
    </g:each>
</div>


<div id="organizations"></div>
</div>
<div id="organizationsList"></div>
<script>
    $('#organizationTab').hide()
    function showOptionsAdminpanel() {
        $('#organizationTab').slideToggle("fast");
    }
</script>

</body>
</html>