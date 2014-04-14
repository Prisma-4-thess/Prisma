<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>Map</title>
    <%--<resource:include components="map"
        key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E" />
    --%>

    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
    </script>
</head>

<body>
<div class="body">
    <div id="map-canvas" style="width: 500px; height: 400px;"></div>
    <%--<richui:map markers="${mark}" zoomLevel="11" />
--%>
    <script type="text/javascript">


        function initializeMap() {

            var mapOptions = {
                zoom: 13,
                center: new google.maps.LatLng(${mark[0].latitude}, ${mark[0].longitude})
            };

            var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


            var i = 0;

            <g:each in='${mark}'>

            var lat = ${it.latitude};
            var lng = ${it.longitude};
            var serverURL = '${it.serverURL}';
            var geoID = '${it.geoID}';
            var geoName = '${it.geoName}';
            console.log(geoName);
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(lat, lng),
                map: map,
                title: '<a href="' + serverURL + '/map/show_geo/' + geoID + '/?source=map" target="_blank">' + geoName + '</a>'
            });
            var infowindow = new google.maps.InfoWindow(), marker, i;
            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                    infowindow.setContent(marker.title);
                    infowindow.open(map, marker);
                }
            })(marker, i));

            i++;

            </g:each>
        }
        initializeMap();
    </script>

</div>
</body>
</html>


