<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:javascript library="jquery"/>
</head>

<body>
<div class="body">
    <div id="post_win">
        <g:if test="${posts}">
            <table border="1">
                <g:each in="${posts}">
                    <tr><td>${it.firstName} ${it.lastName} έγραψε:</td><td>${it.text}</td></tr>
                </g:each>
            </table>
        </g:if>
    </div>
    <g:formRemote name="form" url="[controller: 'search', action: 'postit']" id="${ada}" update="post_win">
        <input name="ada" type="hidden" value="${ada}"/>
        <label for="first">first name:</label><g:textField name="first"/><br>
        <label for="last">last name:</label><g:textField name="last"/><br>
        <g:textArea name="text" style="width: 90% "></g:textArea><br>
        <g:submitButton name="post"/><br>
    </g:formRemote>
    <r:layoutResources/>
</div>
</body>
</html>