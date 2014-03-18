<html>
<head>
<g:javascript library="jquery" />
<meta name='layout' content='main' />
<title><g:message code="springSecurity.register.title" /></title>
<style type='text/css' media='screen'>
#register {
	margin: 15px 0px;
	padding: 0px;
	text-align: center;
}

#register .inner {
	width: 340px;
	padding-bottom: 6px;
	margin: 60px auto;
	text-align: left;
	border: 1px solid #aab;
	background-color: #f0f0fa;
	-moz-box-shadow: 2px 2px 2px #eee;
	-webkit-box-shadow: 2px 2px 2px #eee;
	-khtml-box-shadow: 2px 2px 2px #eee;
	box-shadow: 2px 2px 2px #eee;
}

#register .inner .fheader {
	padding: 18px 26px 14px 26px;
	background-color: #f7f7ff;
	margin: 0px 0 14px 0;
	color: #2e3741;
	font-size: 18px;
	font-weight: bold;
}

#register .inner .cssform p {
	clear: left;
	margin: 0;
	padding: 4px 0 3px 0;
	padding-left: 105px;
	margin-bottom: 20px;
	height: 1%;
}

#register .inner .cssform input[type='text'] {
	width: 120px;
}

#register .inner .cssform label {
	font-weight: bold;
	float: left;
	text-align: right;
	margin-left: -105px;
	width: 110px;
	padding-top: 3px;
	padding-right: 10px;
}

#register #remember_me_holder {
	padding-left: 120px;
}

#register #submit {
	margin-left: 15px;
	width: 8em;
}

#register #remember_me_holder label {
	float: none;
	margin-left: 0;
	text-align: left;
	width: 200px
}

#register .inner .register_message {
	padding: 6px 25px 20px 25px;
	color: #c33;
}

#register .inner .text_ {
	width: 120px;
}

#register .inner .chk {
	height: 12px;
}

#remember_me_label {
	display: inline;
}
</style>
</head>

<body>
	<div id="proccess"></div>
	<div id='register'>
		<div class='inner'>
			<div class='fheader'>
				<g:message code="springSecurity.register.header" />
			</div>
			<g:formRemote name='insert_form'
				url="[controller:'register' ,action:'insert' ]" class='cssform'
				id='registerForm' update="proccess">
				<p>
					<label for='username'><g:message
							code="springSecurity.register.username" />:</label> <input type='text'
						class='text_' name='username' />
				</p>

				<p>
					<label for='password'><g:message
							code="springSecurity.register.password" />:</label> <input
						type='password' class='text_' name='password' />
				</p>

				<p>
					<label for='password'><g:message
							code="springSecurity.register.repassword" />:</label> <input
						type='password' class='text_' name='repassword' />
				</p>

				<p>
					<label for='mail'><g:message
							code="springSecurity.register.mail" />:</label> <input type='text'
						class='text_' name='mail' />
				</p>

				<p>
					<input id="submit" type='submit' value="Υποβολή" />
				</p>
			</g:formRemote>
		</div>
	</div>
</body>
</html>
