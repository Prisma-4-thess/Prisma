<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
 <div class="body">
		<p>Specific search</p>
		<g:formRemote name="specific"
			url="[controller:'search', action:'searchspecific']" update="results">
			<label for="prot_num">Protocol Number:</label>
			<g:textField name="prot_num" />
			<br />
			<label for="unit">Unit:</label>
			<g:textField name="unit" />
			<br />
			<label for="org">Organization:</label>
			<g:textField name="org" />
			<br />
			<label for="signer_first">Signer first name:</label>
			<g:textField name="signer_first" />
			<label for="signer_last">Signer last name:</label>
			<g:textField name="signer_last" />
			<br />
			<label for="fromDate">From Date:</label>
			<g:datePicker name="fromDate" precision="day"
				noSelection="['':'-No Selection-']" />
			<br />
			<label for="toDate">To Date:</label>
			<g:datePicker name="toDate" precision="day"
				noSelection="['':'-No Selection-']" />
			<br />
			<g:submitButton name="search" />
		</g:formRemote>
		<div id="results"
			style='float: right; width: 80%; min-height: 500px; background-color: #c0ffc0;'>
			<p>apotelesmata</p>
		</div>
	</div>
</body>
</html>