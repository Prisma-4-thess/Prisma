<%@ page contentType="application/pdf;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="application/pdf; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Insert title here</title>
</head>

<body>
<div class="body">
    <g:layoutTitle default="Prisma"/>
    <link href="${resource(dir: 'pdf', file: 'aa.pdf')}">
    <g:javascript library="application"/>
    <r:layoutResources/>
</div>
</body>
</html>