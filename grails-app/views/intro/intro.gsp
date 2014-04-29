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
        <li class="active"><g:remoteLink action="showTab" update="organizationTab" style="cursor:pointer;" onComplete="showOptionsAdminpanel()">Organizations</g:remoteLink></li>
        <li class="active"><g:remoteLink action="showSelected" update="organizationsList" style="cursor:pointer;" onComplete="showSelectedOrganizations()">My selected organizations</g:remoteLink></li>
        <li id="contact_resp" style="display:none;">${responseMsg}
        </li>
    </ul>
</div>


<div id="organizationTab" class="toSlide">

</div>

<div id="organizationsList" class="toSlide">

</div>

<script>
    function showOptionsAdminpanel() {
        $('#organizationsList').hide()
        $('#organizationTab').slideToggle("fast");
    }
    function showSelectedOrganizations() {
        $('#organizationTab').hide()
        $('#organizationsList').slideToggle("fast");
    }
</script>

</body>
</html>