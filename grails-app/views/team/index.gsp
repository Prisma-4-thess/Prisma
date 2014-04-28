<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="global_main"/>

</head>

<body>
<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="team.team.tab" /></a></li>

    </ul>

</div>

<div class="clear"></div>
%{--

<div class="news_slider_bg">

    <div id="toHide" class="wrap">

        <!-------start-da-slider-->
        <div class="da-slide">

            <p id="toFadeP" style="opacity: 0;"></p>
            <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
            <br/>
        </div>
        <!---//End-da-slider---->
    </div>
</div>
--}%

<!--start-mfp -->
<div id="manwlas" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.manwlas.fullname" /></h2>
        <img src="${resource(dir: 'images/heads/', file: 'manwlas.png')}"
             alt=""/>

        <p class="para"><g:message code="team.manwlas.description" /></p>
    </div>
</div>

<div id="mpontomitsidis" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.bontomitsidis.fullname" /></h2>
        <img
                src="${resource(dir: 'images/heads/', file: 'mpontomitsidis.png')}"
                alt=""/>

        <p class="para"><g:message code="team.bontomitsidis.description" /></p>
    </div>
</div>

<div id="mylwnaki" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.mylwnaki.fullname" /></h2>
        <img src="${resource(dir: 'images/heads/', file: 'mylwnaki.png')}"
             alt=""/>

        <p class="para"><g:message code="team.mylwnaki.description" /></p>
    </div>
</div>

<div id="mylwnakis" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.mylwnakis.fullname" /></h2>
        <img src="${resource(dir: 'images/heads/', file: 'mylwnakis.png')}"
             alt=""/>

        <p class="para"><g:message code="team.mylwnakis.description" /></p>
    </div>
</div>

<div id="nikolis" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.nikolis.fullname" /></h2>
        <img src="${resource(dir: 'images/heads/', file: 'nikolis.png')}"
             alt=""/>

        <p class="para"><g:message code="team.nikolis.description" /></p>
    </div>
</div>

<div id="pitsianis" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.pitsianis.fullname" /></h2>
        <img src="${resource(dir: 'images/heads/', file: 'pitsianis.png')}"
             alt=""/>

        <p class="para"><g:message code="team.pitsianis.description" /></p>
    </div>
</div>

<div id="flwros" class="mfp-hide">
    <div class="pop_up">
        <h2><g:message code="team.flwros.fullname" /></h2>
        <img src="${resource(dir: 'images/heads/', file: 'flwros.png')}"
             alt=""/>

        <p class="para"><g:message code="team.flwros.description" /></p>
    </div>
</div>
<!--end-mfp -->

<div class="wrap">
    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#manwlas">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-manwlas">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.manwlas.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.web.desinger" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#mpontomitsidis">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-mpontomitsidis">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.bontomitsidis.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.web.developer" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#mylwnaki">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-mylwnaki">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.mylwnaki.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.legal.advisor" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#mylwnakis">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-mylwnakis">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.mylwnakis.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.server.administrator" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#nikolis">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-nikolis">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.nikolis.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.software.engineer" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#pitsianis">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-pitsianis">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.pitsianis.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.project.advisor" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a class="popup-with-zoom-anim" href="#flwros">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-flwros">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}"/>

                                <h3><g:message code="team.flwros.fullname.caps"/></h3>

                                <p>
                                    <a href="#"><g:message code="team.role.android.developer" /></a>
                                </p>
                            </div>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

</div>

<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="team.awards.tab" /></a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="container">

        <h3><g:message code="team.awards.apps4thess.date" /></h3>

        <p><g:message code="team.awards.apps4thess.description" /></p>

    </div>
</div>

<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="team.supporters.tab" /></a></li>

    </ul>

</div>

<div class="clear"></div>


<div class="wrap">
    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a href="http://www.nbg.gr/" target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-ete">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>
    <%--<div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a href="http://www.gnto.gov.gr/" target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-eot">
                            <div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>

                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>
--%>
</div>


<div class="clear"></div>

<div class="nav nav-left">
    <ul>
        <li class="active"><a><g:message code="team.mme.tab" /></a></li>

    </ul>
</div>

<div class="clear"></div>

<div class="wrap">
    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a href="http://www.tovima.gr/society/article/?aid=584083"
               target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-vima">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a
                    href="http://www.agelioforos.gr/default.asp?pid=7&ct=1&artid=203399"
                    target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-aggelioforos">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a
                    href="http://voria.gr/index.php?module=news&func=display&sid=173637"
                    target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-voria">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a
                    href="http://www.epixeiro.gr/%CE%B5%CE%B9%CE%B4%CE%AE%CF%83%CE%B5%CE%B9%CF%82/%CE%B4%CE%B9%CE%B1%CE%B3%CF%89%CE%BD%CE%B9%CF%83%CE%BC%CE%BF%CE%AF-%CE%B2%CF%81%CE%B1%CE%B2%CE%B5%CF%8D%CF%83%CE%B5%CE%B9%CF%82/15353-%CE%B2%CF%81%CE%AC%CE%B2%CE%B5%CF%85%CF%83%CE%B7-%CF%84%CF%89%CE%BD-%CE%BD%CE%B9%CE%BA%CE%B7%CF%84%CF%8E%CE%BD-%CF%83%CF%84%CE%BF-%CE%B4%CE%B9%CE%B1%CE%B3%CF%89%CE%BD%CE%B9%CF%83%CE%BC%CF%8C-%CE%B5%CF%86%CE%B1%CF%81%CE%BC%CE%BF%CE%B3%CE%AD%CF%82-%CE%B3%CE%B9%CE%B1-%CF%84%CE%B7%CE%BD-%CE%B8%CE%B5%CF%83%CF%83%CE%B1%CE%BB%CE%BF%CE%BD%CE%AF%CE%BA%CE%B7-apps4thessaloniki"
                    target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-epixeirw">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a href="http://www.makthes.gr/news/economy/119743/" target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-makedonia">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>

    <div class="portfolio logo" data-cat="logo">
        <div class="portfolio-wrapper">
            <a
                    href="http://greece.greekreporter.com/2014/04/04/local-winners-in-thessaloniki-app-competition/"
                    target="_blank">
                <ul class="ch-grid">
                    <li>
                        <div class="ch-item ch-img-greekReporter">
                            <%--<div class="ch-info">
                                <img src="${resource(dir: 'images', file: 'zoom-white.png')}" />
                                <h3>Example Title</h3>
                                <p>
                                    <a href="#">Wed Desing</a>
                                </p>
                            </div>
                        --%>
                        </div>
                    </li>
                </ul>
            </a>
        </div>
    </div>
</div>


<div class="clear"></div>
</body>
</html>
