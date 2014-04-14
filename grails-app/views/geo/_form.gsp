<%@ page import="prisma.Geo" %>



<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'latitude', 'error')} required">
    <label for="latitude">
        <g:message code="geo.latitude.label" default="Latitude"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="latitude" value="${fieldValue(bean: geoInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'longitude', 'error')} required">
    <label for="longitude">
        <g:message code="geo.longitude.label" default="Longitude"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="longitude" value="${fieldValue(bean: geoInstance, field: 'longitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'address', 'error')} ">
    <label for="address">
        <g:message code="geo.address.label" default="Address"/>

    </label>
    <g:textField name="address" value="${geoInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'tk', 'error')} ">
    <label for="tk">
        <g:message code="geo.tk.label" default="Tk"/>

    </label>
    <g:textField name="tk" value="${geoInstance?.tk}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'newCat', 'error')} ">
    <label for="newCat">
        <g:message code="geo.newCat.label" default="New Cat"/>

    </label>
    <g:textField name="newCat" value="${geoInstance?.newCat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'namegrk', 'error')} ">
    <label for="namegrk">
        <g:message code="geo.namegrk.label" default="Namegrk"/>

    </label>
    <g:textField name="namegrk" value="${geoInstance?.namegrk}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'phone', 'error')} ">
    <label for="phone">
        <g:message code="geo.phone.label" default="Phone"/>

    </label>
    <g:textField name="phone" value="${geoInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'dimos', 'error')} ">
    <label for="dimos">
        <g:message code="geo.dimos.label" default="Dimos"/>

    </label>
    <g:textField name="dimos" value="${geoInstance?.dimos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: geoInstance, field: 'newSubCat', 'error')} ">
    <label for="newSubCat">
        <g:message code="geo.newSubCat.label" default="New Sub Cat"/>

    </label>
    <g:textField name="newSubCat" value="${geoInstance?.newSubCat}"/>
</div>

