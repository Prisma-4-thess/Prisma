<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Upload Decision</title>
<resource:autoComplete skin="default" />
</head>
<body>
	<div class="body">
		<g:uploadForm controler="upload" action="upload">
			<label for="ADA">ADA:</label>
			<g:textField name="ada" />
			<br />
			<label for="ADA">Protocol Number:</label>
			<g:textField name="prot" />
			<br />
			<label for="subject">Subject:</label>
			<g:textField name="subject" />
			<br />
			<label for="type">Type:</label>
			<richui:autoComplete name="type"
				action="${createLinkTo('dir': 'upload/typeAJAX')}" />
			<br />
			<label for="tag">Tag:</label>
			<richui:autoComplete name="tag"
				action="${createLinkTo('dir': 'upload/tagAJAX')}" />
			<br />
			<label for="unit">Unit:</label>
			<richui:autoComplete name="unit"
				action="${createLinkTo('dir': 'upload/unitAJAX')}" />
			<br />
			<label for="signer">Signer:</label>
			<richui:autoComplete name="signer"
				action="${createLinkTo('dir': 'upload/signerAJAX')}" />
			<br />
			<label for="date">Date:</label>
			<g:datePicker name="date" precision="day" default="none"
				noSelection="[' ':'-No Selection-']" />
			<br />
			<input type="file" name="myFile" />
			<input type="submit" />
		</g:uploadForm>
	</div>
</body>
</html>