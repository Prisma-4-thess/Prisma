<%@ page import="prisma.Userdefgeo" %>



<div class="fieldcontain ${hasErrors(bean: userdefgeoInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="userdefgeo.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${userdefgeoInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userdefgeoInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="userdefgeo.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: userdefgeoInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userdefgeoInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="userdefgeo.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: userdefgeoInstance, field: 'longitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: userdefgeoInstance, field: 'namegrk', 'error')} ">
	<label for="namegrk">
		<g:message code="userdefgeo.namegrk.label" default="Namegrk" />
		
	</label>
	<g:textField name="namegrk" value="${userdefgeoInstance?.namegrk}"/>
</div>

