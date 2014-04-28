<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="body"><g:message code="upload.success.upload"/> ${documentUrl}
    <a href="${resource(dir: '/pdf/', file: "${documentUrl}")}" target="_blank"><g:message code="upload.show" /></a>
</div>
</body>
</html>