<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<g:javascript library="jquery" />
<r:layoutResources />
</head>
<body>
	<div class="body">

		<g:formRemote name="ada"
			url="[controller:'search', action:'searchada']" update="results">
			<label for="ada">ADA:</label>
			<g:textField name="ada" />
			<g:submitButton name="search" />
		</g:formRemote>
		<div id="results">
			
		</div>
	</div>
</body>
</html>