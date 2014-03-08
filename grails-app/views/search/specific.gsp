<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<div class="body">

		<g:formRemote name="specific"
			url="[controller:'search', action:'searchspecific']" update="results">
			<label for="prot_num">Protocol Number:</label>
			<g:textField name="prot_num" />
			<br />
			<label for="unit">Unit:</label>
			<richui:autoComplete name="unit"
				action="${createLinkTo('dir': 'ajax/unitAJAX')}" />
			<br />
			<label for="org">Organization:</label>
			<richui:autoComplete name="org"
				action="${createLinkTo('dir': 'ajax/orgAJAX')}" />
			<br />
			<label for="signer">Signer:</label>
			<richui:autoComplete name="signer"
				action="${createLinkTo('dir': 'ajax/signerAJAX')}" />
			<br />
			<label for="fromDate">From Date:</label>
			<g:datePicker name="fromDate" precision="day"
				noSelection="['':'-No Selection-']" default="none"/>
			<br />
			<label for="toDate">To Date:</label>
			<g:datePicker name="toDate" precision="day"
				noSelection="['':'-No Selection-']" default="none"/>
			<br />
			<input name="maxToShow" type="hidden" value="10"/>
			<g:submitButton name="search" />
		</g:formRemote>
		<div id="results"></div>
	</div>
	</div>
</body>
</html>