<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<resource:include components="map"
	key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E" />
<g:javascript library="jquery" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		<richui:map markers="${mark }" />
	</div>
	<table>
		<tr>
			<td><i></i><font color="red">Είναι σε σωστή τοποθεσία το
					σημείο ${mark[0].description }; </i>
			</font></td>
			<td><g:remoteLink action="geo_approved" id="${geo_id}"
					update="next">Έγκριση</g:remoteLink> <g:remoteLink
					action="geo_disapproved" id="${geo_id}" update="next">Απόρριψη</g:remoteLink></td>
		</tr>
	</table>
	<div id="next"></div>
</body>
</html>