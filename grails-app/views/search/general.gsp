<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<div class="body">
		<p>General search</p>
		<g:formRemote name="general"
			url="[controller:'search', action:'searchgeneral']" update="results">
			<label for="subject">Subject:</label>
			<g:textField name="subject" />
			<br />
			<label for="type">Type:</label>
			<g:textField name="type" />
			<br />
			<label for="tag">Tag:</label>
			<g:textField name="tag" />
			<br />
			<label for="fromDate">From Date:</label>
			<g:datePicker name="fromDate" precision="day"
				noSelection="['':'-No Selection-']" default="none"/>
			<br />
			<label for="toDate">To Date:</label>
			<g:datePicker name="toDate" precision="day"
				noSelection="['':'-No Selection-']" default="none"/>
			<br />
			<g:submitButton name="search" />
		</g:formRemote>
		<div id="results">
			
		</div>
	</div>
	</div>
</body>
</html>