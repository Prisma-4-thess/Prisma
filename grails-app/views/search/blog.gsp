<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<g:if test="${posts}">
			${posts.text}
		</g:if>
		<g:form controller="search" action="postit" id="${ada }">
			<g:textField name="first" />
			<g:textField name="last" />
			<richui:richTextEditor name="text" value="${note?.description}"
				width="525"
				html:title="This editor fields also allows formatted text." />
			<input type="submit" />
		</g:form>
	</div>
</body>
</html>