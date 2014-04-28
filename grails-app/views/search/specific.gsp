<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div class="body">
    <p><g:message code="search.searchBy.specific"</p>
    <g:formRemote name="specific"
                  url="[controller: 'search', action: 'searchspecific']" update="results">
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
        <label for="fromDate">From Date:</label>
        <label for="fromDate"><g:message code="search.from.date"/>:</label>
        <g:datePicker name="fromDate" precision="day"
                      noSelection="['': message(code: 'search.noSelection.Date')]" default="none"
                      years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <br/>
        <label for="toDate"><g:message code="search.to.date"/>:</label>
        <g:datePicker name="toDate" precision="day"
                      noSelection="['': message(code: 'search.noSelection.Date')]" default="none"
                      years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <br/>
        <input name="pageId" type="hidden" value="admin_panel"/>
        <g:submitButton name="search"/>
    </g:formRemote>
    <div id="results"></div>
</div>
</div>
</body>
</html>