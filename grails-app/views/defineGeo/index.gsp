<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Map</title>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
      </script>
</head>
<body>
	<div class="body">
		<div id="map-canvas" style="width: 500px; height: 400px;"></div>
		<g:formRemote name="submitGeoForm" url="[controller:'defineGeo', action:'submitGeo']" >
		
		</g:formRemote>
	
	<script type="text/javascript">

function initializeMap() {
		
		var mapOptions = {
		    zoom: 13,
		    center: new google.maps.LatLng(40.6211925,22.9460273)
	    };
	
		var map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
		placeMarker(new google.maps.LatLng(40.6211925,22.9460273),map);
		/*google.maps.event.addListener(map, 'click', function(event) {
			console.info(event.latLng);
			   placeMarker(event.latLng,map);

			});*/
		}
	
	function placeMarker(location,map) {
	    var marker = new google.maps.Marker({
	        position: location, 
	        map: map,
	        draggable:true,
	    	title : 'Mheeeee'
	    });

	    google.maps.event.addListener(marker,'dragend',function(event) {
	        console.info( event.latLng.lat());
	        console.info( event.latLng.lng());
	    });
	   
	}
	
		initializeMap();
	</script>


	</div>
</body>
</html>


