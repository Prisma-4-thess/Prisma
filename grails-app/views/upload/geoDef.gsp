<head>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
    </script>
    <g:javascript library="jquery"/>
</head>

<body>
<div class="body">

    <div id="map-canvas" class="mapViewClass" style="mapView"></div>

    <div class="addGeo-form" id="form">
        <g:formRemote name="submitGeoForm"
                      url="[controller: 'defineGeo', action: 'submitGeo']" update="response" onComplete="pop();">
            <div class="nav nav-left">
                <ul>
                    <li class="active"><a>${params.decisionName}
                    </a></li>
                    <li><g:submitButton class="search_button" name=" "/></li>
                    <li id="responseContainer" class="active" style="display: none;"><a><span id="response"></span></a></li>

                </ul>

            </div>

            <div class="clear"></div>

            <input name="decisionId" type="hidden" value="${params.decisionId}"/>

            <g:textField id="lat" name="lat" value="${message(code: 'geo.latitude.label')}" class="textbox"
                         onfocus="this.value = '';"
                         onblur="if (this.value == '') {this.value = '${message(code: "geo.latitude.label")}'" />
            <g:textField id="lng" name="lng" value="${message(code: 'geo.longitude.label')}"
                         onfocus="this.value = '';"
                         onblur="if (this.value == '') {this.value = '${message(code: "geo.longitude.label")}';}"/>
            <g:textField id="address" name="address" value="${message(code: 'geo.address.label')}"
                         onblur="if (this.value == '') {this.value = '${message(code: "geo.address.label")}';}"/>
            <g:textField id="namegrk" name="namegrk" value="${message(code: 'geo.namegrk.label')}"
                         onfocus="if (this.value == '${message(code: 'geo.namegrk.label')}') {this.value = '';}"
                         onblur="if (this.value == '') {this.value = '${message(code: "geo.namegrk.label")}';}"/>

        </g:formRemote>
    </div>

    <div class="clear"></div>

    <div id="suggestions"></div>

    <div class="clear"></div>
    <script type="text/javascript">
        var map;
        var marker;
        function initializeMap() {


            var centerLatLng = new google.maps.LatLng(40.62644611279105, 22.948425953242577)
            var mapOptions = {
                zoom: 13,
                center: centerLatLng
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            placeMarker(centerLatLng, map);
        }

        function placeMarker(location, map) {
            marker = new google.maps.Marker({
                position: location,
                map: map,
                draggable: true,
                title: '<g:message code="defineGeo.newPosition" />'
            });

            google.maps.event.addListener(marker, 'dragend',
                    function (event) {
                        document.getElementById('lat').value = event.latLng.lat();
                        document.getElementById('lng').value = event.latLng.lng();
                        geocodePosition(marker.getPosition());
                        jQuery.ajax({
                            url: "${createLink(controller: 'defineGeo', action: 'nearGeo')}",
                            data: "lat=" + event.latLng.lat() + "&lng=" + event.latLng.lng(),
                            success: function (data) {
                                document.getElementById('suggestions').replaceWith($('#suggestions').html(data));
                                //$("#suggestions").replaceWith($("#suggestions").html(data));
                            }
                        });
                    });
            google.maps.event.addListener(marker, 'drag', function (event) {
                document.getElementById('lat').value = event.latLng.lat();
                document.getElementById('lng').value = event.latLng.lng();
            });

        }

        function geocodePosition(pos) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({
                latLng: pos
            }, function (responses) {
                if (responses && responses.length > 0) {
                    //console.info(responses[0].formatted_address);
                    document.getElementById('address').value = responses[0].formatted_address;
                } else {
                    //console.info('Cannot determine address at this location.');
                    document.getElementById('address').value = '<g:message code="defineGeo.noAddressfound" />';
                }
            });
        }

        function updateFields(name, lat, lng, addr) {

            document.getElementById('lat').value = lat;
            document.getElementById('lng').value = lng;
            document.getElementById('address').value = addr;
            document.getElementById('namegrk').value = name;
            marker.setMap(null);
            placeMarker(new google.maps.LatLng(lat, lng), map);
        }
        function pop() {
            $('#responseContainer').fadeIn('slow');
            $('#responseContainer').delay(2000).fadeOut(
                    'slow');
        }

        initializeMap();
    </script>

</div>
</body>
