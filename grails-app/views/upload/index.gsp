<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Insert title here</title>
</head>
<body>
	<div class="body">
		 <g:uploadForm controller="upload" action="upload">
		 <label for="ADA">ADA:</label>
			<g:textField name="ada" /><br />
			<label for="ADA">Protocol Number:</label>
			<g:textField name="prot" /><br />
			<label for="subject">Subject:</label>
			<g:textField name="subject" /><br />
			<label for="type">Type:</label>
			<g:select name="type" from="${typ}"/><br />
			<label for="tag">Tag:</label>
			<g:select name="tag" from="${tag}" noSelection="['':'-no tag-']" /><br />
			<label for="unit">Unit:</label>
			<g:select name="unit" from="${un}"/><br />
			<label for="signer">Signer:</label>
			<g:select name="signer" from="${sign}"/><br />
			<label for="date">Date:</label>
			<g:datePicker name="date" precision="day"
				noSelection="['':'-No Selection-']" /><br />
        <input type="file" name="myFile" />
        <input type="submit" />
    </g:uploadForm>
	</div>
</body>
</html>