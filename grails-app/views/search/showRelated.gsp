<head>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'timeliner.js')}"></script>
</head>
<body>
	<div id="timelineContainer" class="timelineContainer">
		<div class="timelineMajor">
			<h2 class="timelineMajorMarker">${dec?.ada}</h2>
			<g:each in="${relDec}">
			<dl class="timelineMinor">
				<dt id="${it?.ada}">
					<a>${it?.ada}</a>
				</dt>
				<dd class="timelineEvent" id="${it?.ada+"EX"}" style="display: none;">
					<p>${it?.subject}</p>
				</dd>
				<!-- /.timelineEvent -->
			</dl>
			</g:each>
			
		</div>
		<script>
			$(document).ready(function() {
				$.timeliner({
					timelineContainer : '#timelineContainer'
				});
			});
		</script>
		<!-- /.timelineMajor -->
	</div>
	<!-- /#timelineContainer -->
</body>