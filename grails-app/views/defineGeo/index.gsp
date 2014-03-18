<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Map</title>
<resource:autoComplete skin="default" />

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
	
</script>
</head>
<body>
	<div class="body">
		<div id="map-canvas" style="float: left; width: 500px; height: 400px;"></div>
		<div id="form">
			<g:formRemote name="submitGeoForm"
				url="[controller:'defineGeo', action:'submitGeo']">

				<input name="decisionId" type="hidden" value="${params.decisionId}" />
				<g:textField id="lat" name="lat" />
				<g:textField id="lng" name="lng" />
				<g:textField id="address" name="address" />
				<g:textField id="namegrk" name="namegrk" />
				<g:submitButton class="search_button" name="Submit" />
			</g:formRemote>
		</div>

		<script type="text/javascript">
			function initializeMap() {

				var mapOptions = {
					zoom : 13,
					center : new google.maps.LatLng(40.62644611279105,
							22.948425953242577)
				};

				var map = new google.maps.Map(document
						.getElementById('map-canvas'), mapOptions);
				placeMarker(new google.maps.LatLng(40.62644611279105,
						22.948425953242577), map);
				/*google.maps.event.addListener(map, 'click', function(event) {
					console.info(event.latLng);
					   placeMarker(event.latLng,map);

					});*/
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
						});
				google.maps.event.addListener(marker, 'drag', function(event) {
					document.getElementById('lat').value = event.latLng.lat();
					document.getElementById('lng').value = event.latLng.lng();
					
				});

			}

			function geocodePosition(pos) {
				var geocoder = new google.maps.Geocoder();
				  geocoder.geocode({
				    latLng: pos
				  }, function(responses) {
				    if (responses && responses.length > 0) {
				    	//console.info(responses[0].formatted_address);
				    	document.getElementById('address').value = responses[0].formatted_address;
				    } else {
				    	//console.info('Cannot determine address at this location.');
				    	document.getElementById('address').value =  'Δεν βρέθηκε διεύθυνση';
				    }
				  });
				}

			initializeMap();
		</script>


	</div>
</body>
</html>


