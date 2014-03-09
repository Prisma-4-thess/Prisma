<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Map</title>
<resource:include components="map" key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E" />
</head>
<body>
  <div class="body">
  <richui:map markers="${mark}" zoomLevel="11"/>
  </div>
</body>
</html>