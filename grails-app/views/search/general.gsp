<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div class="body">
    <p><g:message code="search.searchBy.general"</p>
    <g:formRemote name="general"
                  url="[controller: 'search', action: 'searchgeneral']" update="results">
        <label for="subject"><g:message code="decision.subject.label"/>:</label>
        <g:textField name="subject"/>
        <br/>
        <label for="type"><g:message code="type.label"/>:</label>
        <richui:autoComplete name="type"
                             action="${createLinkTo('dir': 'ajax/typeAJAX')}"/>
        <br/>
        <label for="tag"><g:message code="tag.label"/>:</label>
        <richui:autoComplete name="tag"
                             action="${createLinkTo('dir': 'ajax/tagAJAX')}"/>
        <br/>
        <label for="fromDate"><g:message code="search.from.date"/>:</label>
        <g:datePicker name="fromDate" precision="day"
                      noSelection="['': message(code:'search.noSelection.Date')]" default="none" years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <br/>
        <label for="toDate"><g:message code="search.to.date" />:</label>
        <g:datePicker name="toDate" precision="day"
                      noSelection="['': message(code:'search.noSelection.Date')]" default="none" years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <br/>
        <input name="pageId" type="hidden" value="admin_panel"/>
        <g:submitButton name="search"/>
    </g:formRemote>
    <div id="results"></div>
</div>
</body>
</html>