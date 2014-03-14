<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Insert title here</title>
</head>
<body>
  <div class="body">
  <div>
    <table>
   <tr><td>Περιγραφή Απόφασης</td><td>Τοποθεσία</td></tr>
  <g:each in="${pre }">
  <tr>
  <td>${it.decision.subject }</td>
  <td>${it.geo.namegrk }</td>
  </tr>
  </g:each>
   </table>
  </div>
  </div>
</body>
</html>