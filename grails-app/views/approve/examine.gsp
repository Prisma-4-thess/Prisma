<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <resource:include components="map"
                      key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E"/>
    <g:javascript library="jquery"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="body">
    <richui:map markers="${mark}"/>
</div>
<table>
    <tr>
        <td><i><font color="red"><g:message code="approve.areusure" /> ${mark[0].description}<g:message code="questionmark" /></font></i>
        </td>
        <td><g:remoteLink action="geo_approved" id="${geo_id}"
                          update="next"><g:message code="approve.approve" /></g:remoteLink> <g:remoteLink
                action="geo_disapproved" id="${geo_id}" update="next"><g:message code="approve.decline" /></g:remoteLink></td>
    </tr>
</table>

<div id="next"></div>
</body>
</html>