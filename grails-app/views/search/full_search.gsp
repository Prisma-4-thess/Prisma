<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div class="body">
    <p><g:message code="search.searchBy.full" /></p>
    <g:formRemote name="full_search"
                  url="[controller: 'search', action: 'searchfull']" update="results">
        <label for="ada"><g:message code="decision.ada.label"/>:</label>
        <g:textField name="ada"/>
        <br/>
        <label for="prot_num"><g:message code="decision.protocolNumber.label"/>:</label>
        <g:textField name="prot_num"/>
        <br/>
        <label for="unit"><g:message code="unit.label"/>:</label>
        <richui:autoComplete name="unit"
                             action="${createLinkTo('dir': 'ajax/unitAJAX')}"
                             onItemSelect="${remoteFunction(controller: 'ajax', action: 'selUn', params: '\'id=\' + id')}"/>
        <br/>
        <label for="org"><g:message code="organization.label"/>:</label>
        <richui:autoComplete name="org"
                             action="${createLinkTo('dir': 'ajax/orgAJAX')}"
                             onItemSelect="${remoteFunction(controller: 'ajax', action: 'selOrg', params: '\'id=\' + id')}"/>
        <br/>
        <label for="signer"><g:message code="signer.label"/>:</label>
        <richui:autoComplete name="signer"
                             action="${createLinkTo('dir': 'ajax/signerAJAX')}"/>
        <br/>
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