<%@ page import="prisma.Geo"%>



<div
	class="fieldcontain ${hasErrors(bean: geoInstance, field: 'latitude', 'error')} required">
	<label for="latitude"> <g:message code="geo.latitude.label"
			default="Latitude" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="latitude"
		value="${fieldValue(bean: geoInstance, field: 'latitude')}"
		required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: geoInstance, field: 'label', 'error')} required">
	<label for="label"> <g:message code="geo.label.label"
			default="Label" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="label" required="" value="${geoInstance?.label}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: geoInstance, field: 'longitude', 'error')} required">
	<label for="longitude"> <g:message code="geo.longitude.label"
			default="Longitude" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="longitude"
		value="${fieldValue(bean: geoInstance, field: 'longitude')}"
		required="" />
</div>

