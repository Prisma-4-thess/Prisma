<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<meta name="layout" content="homepage_main" />
<%--<resource:map key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E"
	type="GoogleMaps" />
--%>
<g:javascript library="jquery" />
<resource:autoComplete skin="default" />
<resource:tooltip  />
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">      
    </script>

</head>

<body>
	<!----start-header---------->
	<div class="header_bg">
		<div class="wrap">
			<div class="header">
				<!--------start-logo------>
				<div class="logo">

					<g:link mapping="rootUrl">
						<img src="${resource(dir: 'images', file: 'site-logo.png')}"
							alt="" />
					</g:link>

				</div>
				<!--------end-logo--------->

				<!----start-nav-------->
				<div class="nav">
					<ul>

						<li class="active"><a href="#home" class="scroll">Home</a></li>
						<li><a href="#portfolio" class="scroll">Αναζητηση</a></li>
						<li><a href="#about" class="scroll">Πληροφοριες</a></li>
						<li><a href="#contact" class="scroll">Eπικοινωνια</a></li>
						<li><a href="#map" class="scroll">Χαρτης</a></li>
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
	<!-- start slider -->
	<div class="video_bg">
	<img id="close_vid" src="${resource(dir: 'images', file: 'clear_button.jpg')}" class="close_vid" onclick="pause()"/>
		<div id="video" class="wrap" >
			<video id="video1" controls>
				<source src="/Prisma/videos/Prisma_vid.mp4" type="video/mp4">
			</video>
		</div>
	</div>
	<div class="slider_bg">

		<div id="toHide" class="wrap">
			<!-------start-da-slider-->
			<div class="da-slide">
				<h2 id="toFadeH">
					<span>Καλωσήρθατε στο </span>Prisma
				</h2>
				<p id="toFadeP">Γνωρίστε τη νέα πύλη διαδικτυακής διακυβέρνησης</p>
				<a id="toFadeA" href="#portfolio" class="da-link scroll">Αναζητηση</a> <a id="apklink" href="/Prisma/apk/com.spydi2kood.prisma.apk"> <span
					id="toFadeS1" class="da-img"> </span>
				</a> <a><span id="toFadeS2" class="da-video" onclick="play()">
				</span></a>
			</div>
			<!---//End-da-slider---->
		</div>
	</div>
	<script type="text/javascript">
var myVideo=document.getElementById("video1"); 

function play(){ 
	console.info("playPause()");
	//if (myVideo.paused){ 
		myVideo.play();
		$('#toFadeH').animate({ opacity: 0 });
		$('#toFadeP').animate({ opacity: 0 });
		$('#toFadeA').animate({ opacity: 0 });
		$('#toFadeS1').animate({ opacity: 0 });
		$('#toFadeS2').animate({ opacity: 0 });
		document.getElementById("toHide").style["display"] = "none";
		//$('#toHide').fadeOut('slow');
		document.getElementById("video").style["display"] = "block";
		document.getElementById("close_vid").style["display"] = "block";
		//$('#video').delay(800).fadeIn('slow');
		
	}
	function pause(){
		//else{ 
		myVideo.pause();
		//$('#video').fadeOut('slow');
		//$('#toFade').fadeIn('slow');
		document.getElementById("toHide").style["display"] = "block";
		document.getElementById("video").style["display"] = "none";
		document.getElementById("close_vid").style["display"] = "none";
		$('#toFadeH').delay(500).animate({ opacity: 1 });
		$('#toFadeP').delay(750).animate({ opacity: 1 });
		$('#toFadeA').delay(1000).animate({ opacity: 1 });
		$('#toFadeS1').delay(1250).animate({ opacity: 1 });
		$('#toFadeS2').delay(1250).animate({ opacity: 1 });
		//document.getElementById("toFadeH").style["visibility"] = "visible";
		//document.getElementById("toFadeP").style["visibility"] = "visible";
		//document.getElementById("toFadeS1").style["visibility"] = "visible";
		//document.getElementById("toFadeS2").style["visibility"] = "visible";
		
	
} 
</script>
	<!-----end-slider-------->
	<!--start portfolio------>
	<div>
		<div class="wrap" id="portfolio">
			<div class="main">
				<!-- start gallery  -->
				<div class="gallery1">
					<!---start-content---->
					<div class="gallery">
						<div class="clear"></div>
						<g:formRemote id="searchForm" name="full_search"
							url="[controller:'search', action:'searchfull']" update="results"
							onComplete="hideDecisionShowResults();">
							<div class="container">
								<h2>Αναζήτηση</h2>
								<p>Επιλέξτε το είδος αναζήτησης που προτιμάτε</p>
								<div class="search_table">
									<script type="text/javascript">
										function clearAll() {
											document.getElementById(
													"searchForm").reset();
											<g:remoteFunction controller="ajax" action="clearGlobal"/>
											document
													.getElementById("portfoliolist").style["display"] = "inline-block";
										}
										function hideResultsShowDecision() {
											document.getElementById("results").style["display"] = "none";
											document.getElementById("decision").style["display"] = "block";
										}

										function hideDecisionShowResults() {
											document.getElementById("results").style["display"] = "block";
											document.getElementById("decision").style["display"] = "none";
										}
									</script>
									<ul id="filters" class="clearfix">
										<li><span class="filter" data-filter="ada"
											onClick="clearAll();">ΑΔΑ</span></li>
										<li><span class="filter"
											data-filter="prot_num unit org signer fromDate toDate"
											onClick="clearAll();">Ειδικη</span></li>
										<li><span class="filter"
											data-filter="subject type tag fromDate toDate"
											onClick="clearAll();">Γενικη</span></li>
										<li><span class="filter"
											data-filter="ada prot_num unit org signer subject type tag fromDate toDate"
											onClick="clearAll();">Πληρης</span></li>
										<li><g:submitButton class="search_button" name=" " /></li>
										<li><input type='reset' class="clear_button" value=' ' /></li>
										<li><div id="spinner" class="spinner"
												style="display: none;">
												<g:message code="spinner.alt" default="Loading&hellip;" />
											</div></li>
									</ul>

								</div>
								<div id=search_params>

									<div id="portfoliolist">
										<ul>
											<li><div class="portfolio ada" data-cat="ada">
													<label for="ada">ΑΔΑ:<br /></label>
													<g:textField name="ada"  title="Πληκτρολογείστε τον Αριθμό Διαδικτυακής Ανάρτησης 
													της απόφασης που αναζητείτε."/>
													<richui:tooltip id="ada" />
													<%--<div class="popup">some text here</div>
												--%>
												</div></li>
											<li><div class="portfolio prot_num" data-cat="prot_num">
													<label for="prot_num">Αριθμός Πρωτοκόλου:<br /></label>
													<g:textField name="prot_num"  title="Πληκρολογείστε τον Αριθμό Πρωτοκόλου της απόφασης που αναζητείτε."/>
													<richui:tooltip id="prot_num" />
												</div></li>
											<li><div class="portfolio unit" data-cat="unit">
													<label for="unit">Μονάδα:</label>
													<richui:autoComplete name="unit"
														title="Αρχίστε να πληκτρολογείτε το όνομα της μονάδας για την οποία επιθυμείτε να πραγματοποιήσετε αναζήτηση 
														και θα εμφανιστούν προτάσεις από τις μονάδες που ανήκουν στον οργανισμό που έχετε επιλέξει. 
														Αν δεν έχετε επιλέξει οργανισμό, εμφανίζονται προτάσεις μονάδων από όλους τους οργανισμούς."
														action="${createLinkTo('dir': 'ajax/unitAJAX')}"
														onItemSelect="${remoteFunction(controller: 'ajax' , action: 'selUn', params: '\'id=\' + id')}" />
														<richui:tooltip id="unit" />
												</div></li>
											<li><div class="portfolio org" data-cat="org">
													<label for="org">Οργανισμός:</label>
													<g:select id="org" class="dropdownMenu" name="org"
														from="${['Δήμος Θεσσαλονίκης','Αποκεντρωμένη Διοίκηση Μακεδονίας – Θράκης']}"
														noSelection="${[null: 'Επιλέξτε Οργανισμό']}"
														onchange="${remoteFunction(controller:'ajax',action:'selOrg',params:'\'id=\' + this.value') }" />
												</div></li>
											<li><div class="portfolio signer" data-cat="signer">
													<label for="signer">Τελικός Υπογράφων:</label>
													<richui:autoComplete name="signer"
														title="Αρχίστε να πληκτρολογείτε το όνομα του τελικού υπογράφων που υπέγραψε την απόφαση που
														αναζητείται και διαλέξτε μία από τις προτάσεις που θα εμφανιστούν. 
														Για καλύτερη αναζήτηση πληκτρολογείστε πρώτα το επίθετο του υπογράφων."
														action="${createLinkTo('dir': 'ajax/signerAJAX')}" />
															<richui:tooltip id="signer" />
												</div></li>
											<li><div class="portfolio subject" data-cat="subject">
													<label for="subject">Θέμα:<br /></label>
													<g:textField name="subject" 
													title="Συμπληρώστε το πεδίο με λέξεις κλειδιά που περιγράφουν 
													την απόφαση που αναζητείτε."/>
													<richui:tooltip id="subject" />
												</div></li>
											<li><div class="portfolio type" data-cat="type">
													<label for="type">Τύπος Απόφασης:</label>
													<richui:autoComplete name="type"
														title="Αρχιστε να πληκτρολογείτε τον τύπο της απόφασης που αναζητείτε 
														και διαλέξτε μία από τις προτάσεις που θα εμφανιστούν."
														action="${createLinkTo('dir': 'ajax/typeAJAX')}" />
															<richui:tooltip id="type" />
												</div></li>
											<li><div class="portfolio tag" data-cat="tag">
													<label for="tag">Θεματική Ενότητα:</label>
													<richui:autoComplete name="tag"
														title="Αρχίστε να πληκτρολογείτε την θεματική ενότητα που ανήκει η απόφαση που αναζητείτε
														και επιλέξτε μία από τις προτάσεις που εμφανίζονται."
														action="${createLinkTo('dir': 'ajax/tagAJAX')}" />
														<richui:tooltip id="tag" />
												</div></li>
											<li><div id="fromDate" class="portfolio fromDate"
													data-cat="fromDate">
													<label for="fromDate">Από Ημερομηνία:<br /></label>
													<g:datePicker id="datePicker" name="fromDate"
														precision="day" noSelection="['':'-No Selection-']"
														default="none"
														years="${Calendar.instance.get(Calendar.YEAR)..2010}" />
												</div></li>
											<li><div id="toDate" class="portfolio toDate"
													data-cat="toDate">
													<label for="toDate">Έως Ημερομηνία<br /></label>
													<g:datePicker id="datePicker" class="dropdownMenu"
														name="toDate" precision="day"
														noSelection="['':'-No Selection-']" default="none"
														years="${Calendar.instance.get(Calendar.YEAR)..2010}" />
												</div></li>
											<li><input name="pageId" type="hidden" value="home" /></li>
										</ul>
									</div>
									<div id="results"></div>
									<div id="decision"></div>
								</div>


							</div>

						</g:formRemote>

					</div>
					<!-- container -->
					<%--<script type="text/javascript"
						src="${resource(dir: 'js', file: 'fliplightbox.min.js')}"></script>
					<script type="text/javascript">
						$('body').flipLightBox()
					</script>

					--%>
					<div class="clear"></div>

				</div>

			</div>

		</div>

	</div>
	<!---End-gallery----->
	<!-----start-about-------->

	<div class="about" id="about">
		<div class="wrap">
			<h2>Τι είναι το Prisma</h2>
			<p>Με το Prisma θέλουμε να δώσουμε την δυνατότητα στον πολίτη να
				είναι μέρος της διακυβέρνησης του τόπου του</p>
			<div class="about-grids">
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6"> <%--<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						--%></span> <img class="post-person"
							src="${resource(dir: 'images', file: 'slider_image_ody.jpg')}">
					</div>
					<div class="desc">
						<h3>Δήμος Θεσσαλονίκης</h3>
						<p>συμβάλλω</p>
						<p id="desc-text">Ο Δήμος Θεσσαλονίκης στην υπηρεσία του
							δημότη. Με στόχο τη διαμόρφωση της σύγχρονης, ευρωπαϊκής
							Θεσσαλονίκης προωθούμε την ανάπτυξη πρωτοβουλιών που ενισχύουν
							την ενεργό συμμετοχή του δημότη στη ζωή της πόλης και στο
							δημοκρατικό διάλογο.</p>
					</div>

				</div>
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6"> <%--
							<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						--%>
						</span> <img class="post-person"
							src="${resource(dir: 'images', file: 'diaugeia_logo.jpg')}">
					</div>
					<div class="desc">
						<h3>Δι@ύγεια</h3>
						<p>γνωρίζω</p>
						<p id="desc-text">Το Πρόγραμμα Δι@ύγεια στοχεύει στην επίτευξη
							της μέγιστης δυνατής δημοσιότητας της κυβερνητικής πολιτικής και
							της διοικητικής δραστηριότητας. Επίσης, έχει σκοπό τη διασφάλιση
							της διαφάνειας και την εμπέδωση της υπευθυνότητας και της
							λογοδοσίας από την πλευρά των φορέων άσκησης της δημόσιας
							εξουσίας.</p>
					</div>
				</div>
				<div class="grid">
					<div class="dc_zoom_css">
						<span class="roll_css6"> <%--<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						--%></span> <img class="post-person"
							src="${resource(dir: 'images', file: 'logo-about.png')}">
					</div>
					<div class="desc">
						<h3>Prisma</h3>
						<p>συμμετέχω</p>
						<p id="desc-text">Το Prisma προσφέρει έναν ευκολότερο τρόπο
							εύρεσης των επιθυμητών αποφάσεων. Ακόμη, δίνεται ιδιαίτερη έμφαση
							στο γεωγραφικό προσδιορισμό και τη γεωγραφική συσχέτιση των
							αποφάσεων μέσω της εφαρμογής κινητού. Γίνε και εσύ μέλος του και
							πάρε τη διακυβέρνηση του δήμου στα χέρια σου.</p>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!---------end-about------------>

	<!---------start-contact------------>
	<div class="contact" id="contact">
		<div class="wrap">
			<h2>Επικοινωνία</h2>
			<h4>Βοηθήστε μας να γίνουμε καλύτεροι. Στείλτε μας τις προτάσεις
				και τα σχόλιά σας.</h4>
			<div class="section group">
				<div class="col span_2_of_3">
					<div class="contact-form">
						<g:formRemote id="contactForm" name="contact_form"
							url="[controller:'Maincontact', action:'index']"
							onComplete="pop();" update="contact_resp">

							<input name="name" type="text" class="textbox"
								value="Ονοματεπώνυμο" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Ονοματεπώνυμο';}" />
							<input name="email" type="text" class="textbox" value="Email"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Email';}" />
							<script type="text/javascript">
								function pop() {
									$('#contact_resp').fadeIn('slow');
									$('#contact_resp').delay(2000).fadeOut(
											'slow');
								}
							</script>

							<%--<g:textField name="email" type="text" class="textbox"
								value="Your Email" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Your Email';}" />
							--%>
							<div class="clear"></div>

							<div>
								<textarea name="message" value="Το μήνυμά σας:"
									onfocus="this.value = '';"
									onblur="if (this.value == '') {this.value = 'Το μήνυμά σας...';}">Το μήνυμά σας...</textarea>
							</div>
							<%--<span><input type="submit" class="" value="Submit"></span>
							--%>
							<div>
								<span id="contact_resp" style="display: none;"></span> <span><g:submitButton
										name="Submit" type="submit" class="" value="Αποστολη" /></span>
							</div>
							<div class="clear"></div>
						</g:formRemote>
					</div>
				</div>
				<div class="col span_1_of_3">
					<div class="company_address">
						<h5>INFORMATION</h5>
						<ul class="list3">
							<li><img
								src="${resource(dir: 'images', file: 'location.png')}" alt="" />
								<div class="extra-wrap">
									<p>Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης</p>
									<p>Τ.Κ. 546 21</p>
									<p>Θεσσαλονίκη , Ελλάδα</p>
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
										<a href="mailto:info@mycompany.com"> spydiko(at)gmail.com</a>
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

	<!---------start-map------------>
	<div id="map">
		<script type="text/javascript">
			<g:remoteFunction controller="map" action="homepage" update="markers"/>
		</script>
		<%--	<div id="mapView"></div>--%>
	</div>

	<div id="markers"></div>
	<div id="map-canvas" class="mapViewClass" style=""></div>
	<!---------end-map------------>

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



</body>
</html>