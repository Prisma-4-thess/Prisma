<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%--<meta name="layout" content="homepage_main" />
--%><link rel="stylesheet"
	href="${resource(dir: 'css', file: 'screen.css')}" type="text/css"
	media="screen">
<%--<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'responsive.css')}" type="text/css"
	media="screen">
	--%>
<%--<script type="text/javascript"
	src="${resource(dir: 'js', file: 'timeliner.js')}"></script>

--%></head>
<body>
	<div id="timelineContainer" class="timelineContainer">
		<div class="timelineMajor">
			<h2 class="timelineMajorMarker">Major Marker</h2>
			<dl class="timelineMinor">
				<dt id="event01">
					<a>Event</a>
				</dt>
				<dd class="timelineEvent" id="event01EX" style="display: none;">
					<p>Content about the event goes here.</p>
				</dd>
				<!-- /.timelineEvent -->
			</dl>
			<!-- /.timelineMinor -->
			<dl class="timelineMinor">
				<dt id="event02">
					<a>Another Event</a>
				</dt>
				<dd class="timelineEvent" id="event02EX" style="display: none;">
					<p>Content about the other event.</p>
				</dd>
				<!-- /.timelineEvent -->
			</dl>
			<!-- /.timelineMinor -->
		</div>
		<!-- /.timelineMajor -->
	</div>
	<!-- /#timelineContainer -->
</body>
</html>