<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div class="body">
    <p><g:message code="search.searchBy.ada" /></p>
    <g:formRemote name="ada"
                  url="[controller: 'search', action: 'searchada']" update="results">
        <label for="ada"><g:message code="decision.ada.label" />:</label>
        <g:textField name="ada"/>
        <input name="pageId" type="hidden" value="admin_panel"/>
        <g:submitButton name="search"/>
    </g:formRemote>
    <div id="results"></div>
</div>
</body>
</html>