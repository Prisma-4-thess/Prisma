<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>The Bak-one Website Template | Home :: w3layouts</title>
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

<g:javascript library="jquery" />
<resource:autoComplete skin="default" />

</head>

<body>
	<!----start-header---------->
	<div class="header_bg">
		<div class="wrap">
			<div class="header">
				<!--------start-logo------>
				<div class="logo">
					<a href="index.html"><img
						src="${resource(dir: 'images', file: 'logo.png')}" alt="" /></a>
				</div>
				<!--------end-logo--------->
				<!----start-nav-------->
				<div class="nav">
					<ul>
						<li><a href="#home" class="scroll">Home</a></li>
						<li class="active"><a href="#portfolio" class="scroll">Αναζητηση</a></li>
						<li><a href="#about" class="scroll">Σχετικα με εμας</a></li>
						<li><a href="#contact" class="scroll">Eπικοινωνια</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<!-----end-nav-------->
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!------end-header------------>
	<!-- start slider -->
	<div class="slider_bg">
		<div class="wrap">
			<!-------start-da-slider-->
			<div class="da-slide">
				<h2>
					<span>Είμαστε το</span>Prisma
				</h2>
				<p>H διαδικτυακή διακυβέρνηση στα καλύτερά της</p>
				<a href="#portfolio" class="da-link scroll">Αναζητηση</a> <a
					href="#portfolio" class="scroll"><span class="da-img"> </span>
				</a>
			</div>
			<!---//End-da-slider---->
		</div>
	</div>
	<!-----end-slider-------->
	<!--start portfolio------>
	<div>
		<div class="wrap" id="portfolio">
			<div class="main">
				<!-- start gallery  -->
				<div class="gallery1">
					<!--start-mfp -->
					<!-- <div id="small-dialog1" class="mfp-hide">
								<div class="pop_up">
									<h2>Lorem ipsum sit amet</h2>
									<img src="web/images/icon1.png" alt=""/>
									<p class="para">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.</p>
								</div>
							</div> -->
					<!--end-mfp -->
					<!---start-content---->
					<div class="gallery">
						<div class="clear"></div>
						<g:formRemote name="full_search"
							url="[controller:'search', action:'searchfull']" update="results">
							<div class="container">
								<h2>Αναζήτηση</h2>
								<p>Πραγματοποιήστε σύνθετες αναζητήσεις, αναλόγως τι
									ψάχνετε.</p>
								<ul id="filters" class="clearfix">
									<li><span class="filter active" data-filter="ada">ΑΔΑ</span></li>
									<li><span class="filter"
										data-filter="unit org signer fromDate toDate">Ειδικη
											Αναζητηση</span></li>
									<li><span class="filter"
										data-filter="subject type tag fromDate toDate">Γενικη
											Αναζητηση</span></li>
									<li><span class="filter"
										data-filter="ada unit org signer subject type tag fromDate toDate">Πληρης
											Αναζητηση</span></li>
								</ul>
								<div id="portfoliolist">

									<div class="portfolio ada" data-cat="ada">
										<label for="ada">ADA:</label>
										<g:textField name="ada" />
									</div>
									<div class="portfolio prot_num" data-cat="prot_num">
										<label for="prot_num">Protocol Number:</label>
										<g:textField name="prot_num" />
									</div>
									<div class="portfolio unit" data-cat="unit">
										<label for="unit">Unit:</label>
										<richui:autoComplete name="unit"
											action="${createLinkTo('dir': 'ajax/unitAJAX')}" />
									</div>
									<div class="portfolio org" data-cat="org">
										<label for="org">Organization:</label>
										<richui:autoComplete name="org"
											action="${createLinkTo('dir': 'ajax/orgAJAX')}" />
									</div>
									<div class="portfolio signer" data-cat="signer">
										<label for="signer">Signer:</label>
										<richui:autoComplete name="signer"
											action="${createLinkTo('dir': 'ajax/signerAJAX')}" />
									</div>
									<div class="portfolio subject" data-cat="subject">
										<label for="subject">Subject:</label>
										<g:textField name="subject" />
									</div>
									<div class="portfolio type" data-cat="type">
										<label for="type">Type:</label>
										<richui:autoComplete name="type"
											action="${createLinkTo('dir': 'ajax/typeAJAX')}" />
									</div>
									<div class="portfolio tag" data-cat="tag">
										<label for="tag">Tag:</label>
										<richui:autoComplete name="tag"
											action="${createLinkTo('dir': 'ajax/tagAJAX')}" />
									</div>
									<div class="portfolio fromDate" data-cat="fromDate">
										<label for="fromDate">From Date:</label>
										<g:datePicker name="fromDate" precision="day"
											noSelection="['':'-No Selection-']" default="none" />
									</div>
									<div class="portfolio toDate" data-cat="toDate">
										<label for="toDate">To Date:</label>
										<g:datePicker name="toDate" precision="day"
											noSelection="['':'-No Selection-']" default="none" />
									</div>
									<input name="maxToShow" type="hidden" value="10" /> 

								</div>

							</div>
							<div>
								<g:submitButton class="search-button" name="search" />
							</div>
						</g:formRemote>
					</div>
					<!-- container -->
					<script type="text/javascript"
						src="${resource(dir: 'js', file: 'fliplightbox.min.js')}"></script>
					<script type="text/javascript">
						$('body').flipLightBox()
					</script>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div id="results"></div>
	</div>
	<!---End-gallery----->
	<!-----start-about-------->

	<div class="about" id="about">
		<div class="wrap">
			<h2>About US</h2>
			<p>Lorem Ipsum is simply dummy text of the printing and
				typesetting industry.</p>
			<div class="about-grids">
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6">
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'img1.jpg')}">
					</div>
					<div class="desc">
						<h3>Lorem Ipsum is Simply</h3>
						<p>project manager</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem,Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem.</p>
					</div>

				</div>
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6">
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'img2.jpg')}">
					</div>
					<div class="desc">
						<h3>Lorem Ipsum is Simply</h3>
						<p>project manager</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem,Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem.</p>
					</div>
				</div>
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6">
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'img3.jpg')}">
					</div>
					<div class="desc">
						<h3>Lorem Ipsum is Simply</h3>
						<p>project manager</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem,Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem.</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!---------end-about------------>
	<div class="contact" id="contact">
		<div class="wrap">
			<h2>Contact Us</h2>
			<h4>Lorem Ipsum is simply dummy text of the printing and
				typesetting industry.</h4>
			<div class="section group">
				<div class="col span_2_of_3">
					<div class="contact-form">
						<form method="post" action="#">

							<input type="text" class="textbox" value="Your Name"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Your  Name';}">
							<input type="text" class="textbox" value="Your Email"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Your Email';}">
							<div class="clear"></div>

							<div>
								<textarea value="Your Message:" onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = 'Your Message';}">Your Message...</textarea>
							</div>
							<span><input type="submit" class="" value="Submit"></span>
							<div class="clear"></div>
						</form>
					</div>
				</div>
				<div class="col span_1_of_3">
					<div class="company_address">
						<h5>INFORMATION</h5>
						<ul class="list3">
							<li><img
								src="${resource(dir: 'images', file: 'location.png')}" alt="" />
								<div class="extra-wrap">
									<p>Lorem ipsum consectetu</p>
									<p>12345-Lorem ipsum consectetu</p>
									<p>Lorem ipsum , consectetu</p>
								</div>
								<div class="clear"></div></li>

							<li><img src="${resource(dir: 'images', file: 'phone.png')}"
								alt="" />
								<div class="extra-wrap">
									<p>+1 800(Phone) 258 2598</p>
								</div>
								<div class="clear"></div></li>
							<li><img src="${resource(dir: 'images', file: 'fax2.png')}"
								alt="" />
								<div class="extra-wrap">
									<p>+1 500(Tax) 6343 8690</p>
								</div>
								<div class="clear"></div></li>
							<li><img src="${resource(dir: 'images', file: 'mail.png')}"
								alt="" />
								<div class="extra-wrap">
									<p>
										<a href="mailto:info@mycompany.com"> info(at)appstore.com</a>
									</p>
								</div>
								<div class="clear"></div></li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="wrap">
			<div class="copy">
				<p class="copy">
					&#169 2014 Template by <a href="http://w3layouts.com"
						target="_blank">w3layouts</a>
				</p>
			</div>
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

</body>
</html>