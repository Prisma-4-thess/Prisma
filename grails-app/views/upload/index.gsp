<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
	<g:uploadForm controller="fileUploaderController " action="process">
    <div>
        <label for="ada">ΑΔΑ:</label>
        <g:textField name="ada" />
     </div>
   <div>
   <fileuploader:form upload="docs" successAction="success"
			successController="upload" errorAction="error"
			errorController="upload"/>
   </div>
   <g:actionSubmit value="Submit" controller="fileUploaderController " action="process"/>
</g:uploadForm>
	</div>
</body>
</html>