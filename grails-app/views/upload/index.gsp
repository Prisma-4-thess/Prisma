<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Upload Decision</title>
<resource:autoComplete skin="default" />
<<<<<<< HEAD
=======
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
</script>
>>>>>>> 8ef6853b2805e0ccecbdcdd17eaada3b4231e246
<g:javascript library="jquery" />
</head>
<body>
	<div id="upload-body">
		<g:uploadForm controller="upload" action="upload">
			<div class="nav nav-left">
				<ul>
					<li>ΑΔΑ:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<g:textField name="ada" />
			<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Αριθμός Προτωκόλλου:
					</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<g:textField name="prot" />
			<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li class="active">Θέμα:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<g:textField name="subject" />
			<div class="clear"><div class="clear"><br/></div></div>
			<div class="nav nav-left">
				<ul>
					<li>Τύπος Απόφασης:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<richui:autoComplete name="type"
				action="${createLinkTo('dir': 'ajax/typeAJAX')}" />
			<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Θεαμτική Ενότητα:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<richui:autoComplete name="tag"
				action="${createLinkTo('dir': 'ajax/tagAJAX')}" />
				<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Μονάδα:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<richui:autoComplete name="unit"
				action="${createLinkTo('dir': 'ajax/unitAJAX')}"
				onItemSelect="${remoteFunction(controller: 'ajax' , action: 'selUn', params: '\'id=\' + id')}" />
				<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Οργανισμός:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<richui:autoComplete name="org"
				action="${createLinkTo('dir': 'ajax/orgAJAX')}"
				onItemSelect="${remoteFunction(controller: 'ajax' , action: 'selOrg', params: '\'id=\' + id')}" />
				<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Τελικός Υπογράφον:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<richui:autoComplete name="signer"
				action="${createLinkTo('dir': 'ajax/signerAJAX')}" />
			<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Θέση:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<div id="map-canvas" style="width:100%; height:300px;"></div>
			<div class="clear"><br/></div>
			
				<div class="clear"></div>

				<input name="decisionId" type="hidden" value="${params.decisionId}" />

				<g:textField id="lat" name="lat" value="Latitude" class="textbox"
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
				
			
		
		<div class="clear"></div>
		<div id="suggestions"></div>
		
		<div class="clear"></div>
			
			<div class="clear"><br/></div>
			<div class="nav nav-left">
				<ul>
					<li>Ημερομηνία:</li>
				</ul>
			</div>
			<div class="clear"><br/></div>
			<g:datePicker name="date" precision="day" default="none"
				noSelection="[' ':'-No Selection-']"
				years="${Calendar.instance.get(Calendar.YEAR)..2010}" />
			<div class="clear"><br/></div>
			<input type="file" name="myFile">
			<div class="clear"><br/></div>
			<input type="submit" />
			<g:remoteLink controller="upload" action="geoDef" update="geoDef">Προσθήκη Γεωγραφικού Προσδιορισμού</g:remoteLink>
			<div id="geoDef"></div>
		</g:uploadForm>

	</div>
	
	<script type="text/javascript">
	var map;
	var marker;
	function initializeMap() {

		
		
		var centerLatLng = new google.maps.LatLng(40.62644611279105,22.948425953242577)
		var mapOptions = {
			zoom : 13,
			center : centerLatLng
		};

		map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
		placeMarker(centerLatLng, map);
	}

	function placeMarker(location, map) {
		marker = new google.maps.Marker({
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
   						//$("#suggestions").replaceWith($("#suggestions").html(data));
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

	function updateFields(name,lat,lng,addr){
		
		document.getElementById('lat').value = lat;
		document.getElementById('lng').value = lng;
		document.getElementById('address').value = addr;
		document.getElementById('namegrk').value = name;
		marker.setMap(null);
		placeMarker(new google.maps.LatLng(lat,lng),map);
		}
	function pop() {
		$('#responseContainer').fadeIn('slow');
		$('#responseContainer').delay(2000).fadeOut(
				'slow');
	}

	initializeMap();
</script>
	
</body>
</html>