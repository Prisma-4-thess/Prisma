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

                    <li class="active"><a href="#home" class="scroll"><g:message code="homepage.home.label"/></a></li>
                    <li><g:link controller="search" action="dedicatedSearchPage"><g:message
                            code="homepage.search.label"/></g:link></li>
                    <li><a href="#map" class="scroll"><g:message code="homepage.map.label"/></a></li>
                    <li><a href="#about" class="scroll"><g:message code="homepage.info.label"/></a></li>
                    <li><g:link controller="team"><g:message code="homepage.team.label"/></g:link></li>
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
                <span><g:message code="homepage.welcome.message"/></span> <g:message code="app.name"/>
            </h2>

        <p id="toFadeP"><g:message code="homepage.landing.message"/></p>

        <div class="search_form">
                <div class="contact-form">
                    <g:formRemote id="queryForm" name="query_form"
                                  url="[controller: 'contextualSearch', action: 'search']" update="searchResults">
                        <input name="query" type="text" class="textbox"
                               value="${message(code: "homepage.searchHint")}"
                               onfocus="if (this.value == '${message(code:"homepage.searchHint")}') {
                                   this.value = '';
                               }"
                               onblur="if (this.value == '') {
                                   this.value = '${message(code:"homepage.searchHint")}';
                               }"/>
                        <span>
                            <g:submitButton id="submitButton" name="Submit" type="submit" class=""
                                            onclick="scrollTo('contextualSearch',1200)"
                                            value="${message(code: "homepage.search.button.caps")}"/>
                        </span>

                    </g:formRemote>
                </div>
            </div>

        <div align="center" id="bubbles">
            <div id="toFadeS1" class="da-img" onclick="downloadApk();"></div>

            <div id="toFadeS2" class="da-video" onclick="play();"></div>
        </div>
    </div>
        <!---//End-da-slider---->
    </div>
</div>

<!-----end-slider-------->

<!---------start-search results------------>

<div id="contextualSearch" class="container">

    <h2><g:message code="homepage.searchresults.header"/><span id="spinner" class="spinner"
                                                               style="display:none;/* position:inherit;*/"></span></h2>

    <div id="searchResults">
        <p><g:message code="homepage.searchresults.paragraph"/></p>
    </div>

</div>
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
        <h2><g:message code="homepage.about.heading"/></h2>

        <p><g:message code="homepage.about.paragraph"/></p>

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
                    <h3><g:message code="dimos.thessalonikis"/></h3>

                    <p><g:message code="homepage.aboutthessaloniki.moto"/></p>

                    <p id="desc-text"><g:message code="homepage.aboutthessaloniki.paragraph"/></p>
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
                    <h3><g:message code="diaugeia.name"/></h3>

                    <p><g:message code="homepage.aboutdiaugeia.moto"/></p>

                    <p id="desc-text"><g:message code="homepage.aboutdiaugeia.paragraph"/></p>
                </div>
            </div>

            <div class="grid">
                <div class="dc_zoom_css">
                    <span class="roll_css6"></span> <img class="post-person"
                                                         src="${resource(dir: 'images', file: 'logo-about.png')}">
                </div>

                <div class="desc">
                    <h3>Prisma</h3>

                    <p><g:message code="homepage.aboutprisma.moto"/></p>

                    <p id="desc-text"><g:message code="homepage.aboutprisma.paragraph"/></p>
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
        <h2><g:message code="homepage.contact.header"/></h2>
        <h4><g:message code="homepage.contact.landing"/></h4>

        <div class="section group">
            <div class="col span_2_of_3">
                <div class="contact-form">
                    <g:formRemote id="contactForm" name="contact_form"
                                  url="[controller: 'Maincontact', action: 'index']"
                                  onComplete="pop();" update="contact_resp">

                        <input name="name" type="text" class="textbox"
                               value="${message(code: "contact.name.label")}"
                               onfocus="if (this.value == '${message(code:"contact.name.label")}') {
                                   this.value = '';
                               }"
                               onblur="if (this.value == '') {
                                   this.value = '${message(code:"contact.name.label")}';
                               }"/>
                        <input name="email" type="text" class="textbox" value="${message(code: "contact.email.label")}"
                               onfocus="if (this.value == '${message(code:"contact.email.label")}') {
                                   this.value = '';
                               }"
                               onblur="if (this.value == '') {
                                   this.value = '${message(code:"contact.email.label")}';
                               }"/>

                        <div class="clear"></div>

                        <div>
                            <textarea name="message" value="${message(code: "homepage.contact.leaveyourmessage")}"
                                      onfocus="if (this.value == '${message(code: "homepage.contact.leaveyourmessage")}') {
                                          this.value = '';
                                      }"
                                      onblur="if (this.value == '') {
                                          this.value = '${message(code: "homepage.contact.leaveyourmessage")}';
                                      }"><g:message code="homepage.contact.leaveyourmessage"/></textarea>
                        </div>
                    <%--<span><input type="submit" class="" value="Submit"></span>
                    --%>
                        <div>
                            <span id="contact_resp" style="display: none;"></span> <span>
                            <g:submitButton name="Submit" type="submit" class=""
                                            value="${message(code: "homepage.contact.button.caps")}"/>
                        </span>
                        </div>

                        <div class="clear"></div>
                    </g:formRemote>
                </div>
            </div>

            <div class="col span_1_of_3">
                <div class="company_address">
                    <h5><g:message code="homepage.info.label"/></h5>
                    <ul class="list3">
                        <li><img
                                src="${resource(dir: 'images', file: 'location.png')}" alt=""/>

                            <div class="extra-wrap">
                                <p><g:message code="aristoteleio.label"/></p>

                                <p><g:message code="aristoteleio.tk"/></p>

                                <p><g:message code="thessaloniki.label"/>, <g:message code="greece.label"/></p>
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
                                <a href="mailto:info@mycompany.com"><g:message code="spydiko.gmail"/></a>
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