<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Prisma | Spydi2kod</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link
	href='http://fonts.googleapis.com/css?family=Ubuntu&subset=latin,greek,greek-ext'
	rel='stylesheet' type='text/css'>
<link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet"
	type="text/css" media="all" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir: 'css', file: 'imgeffect.css')}" />
	
<r:layoutResources />

<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
<!-- start gallery Script -->
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.easing.min.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.mixitup.min.js')}"></script>
<script type="text/javascript">
	$(function() {

		var filterList = {

			init : function() {

				// MixItUp plugin
				// http://mixitup.io
				$('#portfoliolist').mixitup({
					targetSelector : '.portfolio',
					filterSelector : '.filter',
					effects : [ 'fade' ],
					easing : 'snap',
					// call the hover effect
					onMixEnd : filterList.hoverEffect()
				});

			},

			hoverEffect : function() {

				// Simple parallax effect
				$('#portfoliolist .portfolio').hover(function() {
					$(this).find('.label').stop().animate({
						bottom : 0
					}, 200, 'easeOutQuad');
					$(this).find('img').stop().animate({
						top : 0
					}, 500, 'easeOutQuad');
				}, function() {
					$(this).find('.label').stop().animate({
						bottom : 0
					}, 200, 'easeInQuad');
					$(this).find('img').stop().animate({
						top : 0
					}, 300, 'easeOutQuad');
				});

			}

		};

		// Run the show!
		filterList.init();

	});
</script>
<!-- Add fancyBox main JS and CSS files -->
<script src="${resource(dir: 'js', file: 'jquery.magnific-popup.js')}"
	type="text/javascript"></script>
<link href="${resource(dir: 'css', file: 'magnific-popup.css')}"
	rel="stylesheet" type="text/css">
<script>
	$(document).ready(function() {
		$('.popup-with-zoom-anim').magnificPopup({
			type : 'inline',
			fixedContentPos : false,
			fixedBgPos : true,
			overflowY : 'auto',
			closeBtnInside : true,
			preloader : false,
			midClick : true,
			removalDelay : 300,
			mainClass : 'my-mfp-zoom-in'
		});
	});
</script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'move-top.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'easing.js')}"></script>
<!----end gallery-------->

<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1200);
		});
	});
</script>

<g:layoutHead />

</head>
<body>
	<!----start-header---------->
	<div class="header_bg">
		<div class="wrap">
			<div class="header">
				<!--------start-logo------>
				<div class="logo">
					<g:link mapping="rootUrl"><img
						src="${resource(dir: 'images', file: 'logo.png')}" alt="" /></g:link>
				</div>
				<!--------end-logo--------->
				
				<!----start-nav-------->
				<div class="nav">
					<ul>
					
						<li><a href="#home" class="scroll">Home</a></li>
						<li class="active"><a href="#portfolio" class="scroll">Αναζητηση</a></li>
						<li><a href="#about" class="scroll">Σχετικα με εμας</a></li>
						<li><a href="#map" class="scroll">Χαρτης</a></li>
						<li><a href="#contact" class="scroll">Eπικοινωνια</a></li>
						<li><g:render template="/common/topbar" /></li>
						<div class="clear"></div>
					</ul>
					
				</div>
				<!-----end-nav-------->
				
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!------end-header------------>

	<g:layoutBody />
	
	<!----start-footer---------->
	<div class="footer-bottom">
		<div class="wrap">
			<%--<div class="copy">
				<p class="copy">
					&#169 2014 Template by <a href="http://w3layouts.com"
						target="_blank">w3layouts</a>
				</p>
			</div>
			
			
			--%>
			<g:render template="/common/footer" />
			<script type="text/javascript">
				$(document).ready(function() {

					var defaults = {
						containerID : 'toTop', // fading element id
						containerHoverID : 'toTopHover', // fading element hover id
						scrollSpeed : 1200,
						easingType : 'linear'
					};

					$().UItoTop({
						easingType : 'easeOutQuart'
					});

				});
			</script>
			<a href="#" id="toTop" style="display: block;"><span
				id="toTopHover" style="opacity: 1;"> </span></a>
			<script src="${resource(dir: 'js', file: 'jquery.scrollTo.js')}"></script>
		</div>
	</div>
	<!------end-footer------------>
	
	<g:javascript library="application" />	
	<r:layoutResources />
</body>

</html>
