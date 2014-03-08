<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<div class="body">

		<g:formRemote name="ada"
			url="[controller:'search', action:'searchada']" update="results">
			<label for="ada">ADA:</label>
			<g:textField name="ada" />
			<input name="maxToShow" type="hidden" value="10"/>
			<g:submitButton name="search" />
		</g:formRemote>
		<div id="results">
			
		</div>
	</div>
</body>
</html>