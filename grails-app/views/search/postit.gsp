<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
 <g:if test="${posts}">
		<table border="1">
		<g:each in="${posts}">
		<tr><td>${it.firstName} ${it.lastName} έγραψε:</td><td>${it.text}</td></tr>
		</g:each>
		</table>
		</g:if>
  </div>
</body>
</html>