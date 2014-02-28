<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<fileuploader:form upload="docs" successAction="success"
			successController="upload" errorAction="error"
			errorController="upload" />
	</div>
</body>
</html>