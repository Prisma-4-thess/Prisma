<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<body>
	<div class="body">
		<p>ADA search</p>
		<g:formRemote name="ada"
			url="[controller:'search', action:'searchada']" update="results">
			<label for="ada">ADA:</label>
			<g:textField name="ada" />
			<input name="pageId" type="hidden" value="admin_panel" />
			<g:submitButton name="search" />
		</g:formRemote>
		<div id="results"></div>
	</div>
</body>
</html>