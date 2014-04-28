<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="upload.uploadDecision.title" /></title>
    <resource:autoComplete skin="default"/>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
    </script>
    <g:javascript library="jquery"/>
</head>

<body>
<div id="upload-body">
    <g:uploadForm controller="upload" action="upload">
        <div class="nav nav-left">
            <ul>
                <li><g:message code="decision.ada.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <g:textField name="ada"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="decision.protocolNumber.label" />:
                </li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <g:textField name="prot"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li class="active"><g:message code="decision.subject.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <g:textField name="subject"/>
        <div class="clear"><div class="clear"><br/></div></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="type.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <richui:autoComplete name="type"
                             action="${createLinkTo('dir': 'ajax/typeAJAX')}"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="tag.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <richui:autoComplete name="tag"
                             action="${createLinkTo('dir': 'ajax/tagAJAX')}"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="unit.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <richui:autoComplete name="unit"
                             action="${createLinkTo('dir': 'ajax/unitAJAX')}"
                             onItemSelect="${remoteFunction(controller: 'ajax', action: 'selUn', params: '\'id=\' + id')}"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="organization.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <g:select id="org" class="dropdownMenu" name="org"
                  from="${prisma.Organization.findAllByToShow(true)}"
                  noSelection="${[null: message(code:"decision.org.selectOrg")]}"
                  onchange="${remoteFunction(controller: 'ajax', action: 'selOrg', params: '\'id=\' + this.value')}"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="signer.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <richui:autoComplete name="signer"
                             action="${createLinkTo('dir': 'ajax/signerAJAX')}"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="geo.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>

        <div id="map-canvas" style="width:100%; height:300px;"></div>

        <div class="clear"><br/></div>

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



        <div class="clear"><br/></div>

        <div id="suggestions"></div>

        <div class="clear"></div>

        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="decision.date.label" />:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <g:datePicker name="date" precision="day" default="none"
                      noSelection="['': message(code:'search.noSelection.Date')]"
                      years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <div class="clear"><br/></div>

        <div class="nav nav-left">
            <ul>
                <li><g:message code="search.showDecision.seePdf"/>:</li>
            </ul>
        </div>

        <div class="clear"><br/></div>
        <input type="file" name="myFile">

        <div class="clear"><br/></div>
        <input type="submit"/>
    </g:uploadForm>

</div>

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

</body>
</html>