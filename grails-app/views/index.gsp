<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
    <meta name="layout" content="homepage_main"/>
    <%--<resource:map key="AIzaSyAtEbm91-pdOstp5VshIrJSreVvxqS3j4E"
        type="GoogleMaps" />
    --%>

    <resource:autoComplete skin="default"/>
    <resource:tooltip/>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAH_oa4EC3VCWeqeMvTFkQC697gcs_ncyk&sensor=false">
    </script>

</head>

<body>
<!----start-header---------->
<div class="home_header_bg">
    <div class="wrap">
        <div class="header">
            <!--------start-logo------>
            <div class="logo">

                <g:link mapping="rootUrl">
                    <img src="${resource(dir: 'images', file: 'site-logo.png')}"
                         alt=""/>
                </g:link>

            </div>
            <!--------end-logo--------->

            <!----start-nav-------->
            <div class="nav">
                <ul>

                    <li class="active"><a href="#home" class="scroll">Home</a></li>
                    <li><g:link controller="search" action="dedicatedSearchPage">Αναζητηση</g:link></li>
                    <li><a href="#map" class="scroll">Χαρτης</a></li>
                    <li><a href="#about" class="scroll">Πληροφοριες</a></li>
                    <li><g:link controller="team">Η ομαδα</g:link></li>
                    <li><g:render template="/common/topbar"/></li>

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
    <img id="close_vid"
         src="${resource(dir: 'images', file: 'clear_button.jpg')}"
         class="close_vid" onclick="pause()"/>

    <div id="video" class="wrap">
        <video id="video1" controls>
            <source src="${resource(dir: 'videos', file: 'Prisma_vid.mp4')}" type="video/mp4">
        </video>
    </div>
</div>

<div class="slider_bg">

    <div id="toHide" class="wrap">
        <!-------start-da-slider-->
        <div class="da-slide">
            <h2 id="toFadeH">
                <span>Καλωσήρθατε στο</span> Prisma
            </h2>

            <p id="toFadeP">Γνωρίστε τη νέα πύλη διαδικτυακής διακυβέρνησης</p>

            <div class="search_form">
                <div class="contact-form">
                    <g:formRemote id="queryForm" name="query_form"
                                  url="[controller: 'contextualSearch', action: 'search']" update="search_results">
                        <input name="query" type="text" class="textbox"
                               value=""/>
                        <span>
                            <g:submitButton name="Submit" type="submit" class=""
                                            value="Αναζητηση"/>
                        </span>

                    </g:formRemote>
                </div>
            </div>
            <a id="apklink" href="${resource(dir: 'apk', file: 'com.spydi2kood.prisma.apk')}"><span
                    id="toFadeS1" class="da-img"></span>
            </a> <a><span id="toFadeS2" class="da-video" onclick="play()">
        </span></a>
        </div>
        <!---//End-da-slider---->
    </div>
</div>

<!-----end-slider-------->

<!---------start-search results------------>
<div id="search_results"></div>
<!-----end-slider-------->

<!---------start-search results------------>
<div id="map">
    <script type="text/javascript">
        <g:remoteFunction controller="map" action="homepage" update="markers"/>
    </script>
    <%--	<div id="mapView"></div>--%>
</div>

<div id="markers"></div>

<div id="map-canvas" class="mapViewClass" style=""></div>
<!---------end-map------------>

<!-----start-about-------->

<div class="about" id="about">
    <div class="wrap">
        <h2>Τι είναι το Prisma</h2>

        <p>Με το Prisma θέλουμε να δώσουμε την δυνατότητα στον πολίτη να
        είναι μέρος της διακυβέρνησης του τόπου του</p>

        <div class="about-grids">
            <%--<div class="grid">
                <div class="dc_zoom_css">
                    <span class="roll_css6"> <div class="social">
                            <ul>
                                <li><a class="sharefacebook" href="#"> </a></li>
                                <li><a class="sharetwitter" href="#"> </a></li>
                                <li><a class="sharetgoogle" href="#"> </a></li>
                                <li><a class="sharedrible" href="#"> </a></li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                    </span> <img class="post-person"
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
            --%>
            <%--<div class="grid">
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
            --%>
            <div class="grid">
                <div class="dc_zoom_css">
                    <span class="roll_css6"><%--<div class="social">
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

                    <p id="desc-text">Το Prisma προσφέρει έναν ευκολότερο τρόπο
                    εύρεσης των επιθυμητών αποφάσεων. Ακόμη, δίνεται ιδιαίτερη έμφαση
                    στο γεωγραφικό προσδιορισμό και τη γεωγραφική συσχέτιση των
                    αποφάσεων μέσω της εφαρμογής κινητού. Ο καθένας έχει δικαίωμα να
                    ενημερώνεται για τις οικονομικές, πολιτικές και κοινωνικές
                    εξελίξεις του τόπου του. Το Prisma είναι ο συνδετικός κρίκος της
                    πολιτείας με τον πολίτη. Είναι η εφαρμογή της δημοκρατίας στη
                    σύγχρονη μορφή της.</p>
                </div>
            </div>

            <div class="grid">
                <div class="dc_zoom_css">
                    <span class="roll_css6"><%--<div class="social">
								<ul>
									<li><a class="sharefacebook" href="#"> </a></li>
									<li><a class="sharetwitter" href="#"> </a></li>
									<li><a class="sharetgoogle" href="#"> </a></li>
									<li><a class="sharedrible" href="#"> </a></li>
									<div class="clear"></div>
								</ul>
							</div>
						--%></span> <img class="post-person"
                                         src="${resource(dir: 'images', file: 'diaugeia_logo.jpg')}">
                </div>

                <div class="desc">
                    <h3>Δι@ύγεια</h3>

                    <p>γνωρίζω</p>

                    <p id="desc-text">Η εφαρμογή Prisma αποτελεί μία καινοτόμο
                    πύλη σε αποφάσεις σχετικές με το Δήμο Θεσσαλονίκης. Όλες οι
                    πληροφορίες αντλούνται απ’ ευθείας από το site της Δι@ύγειας και
                    φέρουν ισότιμης αξιοπιστίας. Κάθε απόφαση απαρτίζεται από το
                    μοναδικό Αριθμό Διαδικτιακής Ανάρτησης (ΑΔΑ), τον αριθμό
                    προτωκόλλου, το θέμα, τον τελικό υπογράφων, τον τύπο και την
                    κατηγορία - με αναλυτικά στοιχεία.</p>
                </div>
            </div>

            <div class="grid">
                <div class="dc_zoom_css">
                    <span class="roll_css6"></span> <img class="post-person"
                                                         src="${resource(dir: 'images', file: 'logo-about.png')}">
                </div>

                <div class="desc">
                    <h3>Prisma</h3>

                    <p>συμμετέχω</p>

                    <p id="desc-text">Σε σύγκριση με το σύστημα της Δι@ύγειας, το
                    Prisma προσφέρει έναν ευκολότερο τρόπο εύρεσης των επιθυμητών
                    αποφάσεων παρέχοντας τέσσερεις τρόπους αναζήτησης. Ακόμη, δίνεται
                    ιδιαίτερη έμφαση στο γεωγραφικό προσδιορισμό και τη γεωγραφική
                    συσχέτιση των αποφάσεων, παρέχοντας τη δυνατότητα οπτικοποίησής
                    τους στο χάρτη της Θεσσαλονίκης. Επιπλέον, δίνεται η δυνατότητα
                    στο χρήστη να συμβάλει στη γεωγραφική συσχέτιση αποφάσεων,
                    προτείνοντας ο ίδιος θέση για κάποια απόφαση.</p>
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
                                  url="[controller: 'Maincontact', action: 'index']"
                                  onComplete="pop();" update="contact_resp">

                        <input name="name" type="text" class="textbox"
                               value="Ονοματεπώνυμο" onfocus="if (this.value == 'Ονοματεπώνυμο') {
                            this.value = '';
                        }"
                               onblur="if (this.value == '') {
                                   this.value = 'Ονοματεπώνυμο';
                               }"/>
                        <input name="email" type="text" class="textbox" value="Email"
                               onfocus="if (this.value == 'Email') {
                                   this.value = '';
                               }"
                               onblur="if (this.value == '') {
                                   this.value = 'Email';
                               }"/>

                        <div class="clear"></div>

                        <div>
                            <textarea name="message" value="Το μήνυμά σας:"
                                      onfocus="if (this.value == 'Το μήνυμά σας...') {
                                          this.value = '';
                                      }"
                                      onblur="if (this.value == '') {
                                          this.value = 'Το μήνυμά σας...';
                                      }">Το μήνυμά σας...</textarea>
                        </div>
                    <%--<span><input type="submit" class="" value="Submit"></span>
                    --%>
                        <div>
                            <span id="contact_resp" style="display: none;"></span> <span>
                            <g:submitButton name="Submit" type="submit" class=""
                                            value="Αποστολη"/>
                        </span>
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
                                src="${resource(dir: 'images', file: 'location.png')}" alt=""/>

                            <div class="extra-wrap">
                                <p>Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης</p>

                                <p>Τ.Κ. 546 21</p>

                                <p>Θεσσαλονίκη , Ελλάδα</p>
                            </div>

                            <div class="clear"></div></li>

                    <%--<li><img src="${resource(dir: 'images', file: 'phone.png')}"
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
                    --%><li><img src="${resource(dir: 'images', file: 'mail.png')}"
                                 alt=""/>

                        <div class="extra-wrap">
                            <p>
                                <a href="mailto:info@mycompany.com">spydiko(at)gmail.com</a>
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
<!---------end-contact------------>

</body>
</html>