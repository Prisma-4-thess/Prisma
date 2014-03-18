<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="global_main" />

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
</script>
<g:javascript library="jquery" />
</head>
<body>
	<div class="body">
		
		<div id="map-canvas" class="mapViewClass" style="mapView"></div>
		<div class="nav nav-left">
		<ul>
			<li class="active"><a>${params.decisionName}
		</a></li>

		</ul>

	</div>
	<div class="clear"></div>
		<div id="form">
			<g:formRemote name="submitGeoForm"
				url="[controller:'defineGeo', action:'submitGeo']" update="response">

				<input name="decisionId" type="hidden" value="${params.decisionId}" />

				<g:textField id="lat" name="lat" value="Latitude"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Latitude';}" />
				<g:textField id="lng" name="lng" value="Longitude"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Longitude';}" />
				<g:textField id="address" name="address" value="Διεύθυνση"
					onblur="if (this.value == '') {this.value = 'Διεύθυνση';}" />
				<g:textField id="namegrk" name="namegrk" value="Όνομασία Θέσης"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Ονομασία Θέσης';}" />
				<g:submitButton class="search_button" name=" " />
			</g:formRemote>
		</div>
		<div id="suggestions"></div>
		<div id="response"></div>
		
		<script type="text/javascript">
			function initializeMap() {
				var centerLatLng = new google.maps.LatLng(40.62644611279105,22.948425953242577)
				var mapOptions = {
					zoom : 13,
					center : centerLatLng
				};

				var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
				placeMarker(centerLatLng, map);
			}

			function placeMarker(location, map) {
				var marker = new google.maps.Marker({
					position : location,
					map : map,
					draggable : true,
					title : 'Καινούγια Τοποθεσία'
				});

				google.maps.event.addListener(marker, 'dragend',
					function(event) {
						document.getElementById('lat').value = event.latLng.lat();
						document.getElementById('lng').value = event.latLng.lng();
						geocodePosition(marker.getPosition());
						jQuery.ajax({
		    				url: "${createLink(controller: 'defineGeo', action: 'nearGeo')}",
		    				data: "lat=" + event.latLng.lat()+"&lng="+event.latLng.lng(),
		   					success: function (data) {
		   						document.getElementById('suggestions').replaceWith($('#suggestions').html(data));
		    				}
						});
					});
				google.maps.event.addListener(marker, 'drag', function(event) {
					document.getElementById('lat').value = event.latLng.lat();
					document.getElementById('lng').value = event.latLng.lng();
				});

			}

			function geocodePosition(pos) {
				var geocoder = new google.maps.Geocoder();
				geocoder.geocode({
					latLng : pos
					},function(responses) {
						if (responses && responses.length > 0) {
							//console.info(responses[0].formatted_address);
							document.getElementById('address').value = responses[0].formatted_address;
						} else {
							//console.info('Cannot determine address at this location.');
							document.getElementById('address').value = 'Δεν βρέθηκε διεύθυνση';
						}
					});
			}

			initializeMap();
		</script>

	</div>
</body>
</html>


