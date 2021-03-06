<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<div class="body">
    <p>General search</p>
    <g:formRemote name="general"
                  url="[controller: 'search', action: 'searchgeneral']" update="results">
        <label for="subject">Subject:</label>
        <g:textField name="subject"/>
        <br/>
        <label for="type">Type:</label>
        <richui:autoComplete name="type"
                             action="${createLinkTo('dir': 'ajax/typeAJAX')}"/>
        <br/>
        <label for="tag">Tag:</label>
        <richui:autoComplete name="tag"
                             action="${createLinkTo('dir': 'ajax/tagAJAX')}"/>
        <br/>
        <label for="fromDate">From Date:</label>
        <g:datePicker name="fromDate" precision="day"
                      noSelection="['': '-No Selection-']" default="none" years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <br/>
        <label for="toDate">To Date:</label>
        <g:datePicker name="toDate" precision="day"
                      noSelection="['': '-No Selection-']" default="none" years="${Calendar.instance.get(Calendar.YEAR)..2010}"/>
        <br/>
        <input name="pageId" type="hidden" value="admin_panel"/>
        <g:submitButton name="search"/>
    </g:formRemote>
    <div id="results"></div>
</div>
</body>
</html>