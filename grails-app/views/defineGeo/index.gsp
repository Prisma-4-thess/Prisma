<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="global_main"/>

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
                    <li><g:submitButton class="submit_button" name=" "/></li>
                    <li id="responseContainer" class="active" style="display: none;"><a><span id="response"></span></a></li>

                </ul>

            </div>

            <div class="clear"><br/></div>

            <div class="defineGeoInstructions">
                <p>Σύρτε τον marker του χάρτη στο σημείο που θέλετε να αντιστοιχίσετε την απόφαση.</p>

                <p>Στο κάτω μέρος της οθόνης εμφανίζονται ήδη καταχωρημένες σχετικές θέσεις. Επιλέξτε μία από αυτές ή καταχωρήστε νέα επεξεργάζοντας τα παιδία εισαγωγής.</p>
            </div>

            <div class="clear"><br/></div>

            <input name="decisionId" type="hidden" value="${params.decisionId}"/>

            <g:textField id="lat" name="lat" value="Latitude" class="textbox"
                         onfocus="this.value = '';"
                         onblur="if (this.value == '') {this.value = 'Latitude';}"/>
            <g:textField id="lng" name="lng" value="Longitude"
                         onfocus="this.value = '';"
                         onblur="if (this.value == '') {this.value = 'Longitude';}"/>
            <g:textField id="address" name="address" value="Διεύθυνση"
                         onblur="if (this.value == '') {this.value = 'Διεύθυνση';}"/>
            <g:textField id="namegrk" name="namegrk" value="Όνομασία Θέσης"
                         onfocus="this.value = '';"
                         onblur="if (this.value == '') {this.value = 'Ονομασία Θέσης';}"/>

        </g:formRemote>
    </div>

    <div class="clear"><br/></div>

    <div id="suggestions"></div>

    <div class="clear"><br/></div>
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
                title: 'Καινούγια Τοποθεσία'
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
                    document.getElementById('address').value = 'Δεν βρέθηκε διεύθυνση';
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
</html>


