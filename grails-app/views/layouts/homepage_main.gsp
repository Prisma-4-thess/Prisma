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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <link
            href='http://fonts.googleapis.com/css?family=Ubuntu&subset=latin,greek,greek-ext'
            rel='stylesheet' type='text/css'>
    <link rel="shortcut icon"
          href="${resource(dir: 'images', file: 'favicon.ico')}"
          type="image/x-icon">
    <link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet"
          type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'imgeffect.css')}"/>

    <link rel="stylesheet" type="text/css"
          href="${resource(dir: 'css', file: 'table.css')}"/>

    <r:layoutResources/>

    <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
    <!-- start gallery Script -->
    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'jquery.easing.min.js')}"></script>
    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'jquery.mixitup.min.js')}"></script>
    <script type="text/javascript">
        $(function () {

            var filterList = {

                init: function () {

                    // MixItUp plugin
                    // http://mixitup.io
                    $('#portfoliolist').mixitup({
                        targetSelector: '.portfolio',
                        filterSelector: '.filter',
                        effects: [ 'fade' ],
                        easing: 'snap',
                        // call the hover effect
                        onMixEnd: filterList.hoverEffect()
                    });

                },

                hoverEffect: function () {

                    // Simple parallax effect
                    $('#portfoliolist .portfolio').hover(function () {
                        $(this).find('.label').stop().animate({
                            bottom: 0
                        }, 200, 'easeOutQuad');
                        $(this).find('img').stop().animate({
                            top: 0
                        }, 500, 'easeOutQuad');
                    }, function () {
                        $(this).find('.label').stop().animate({
                            bottom: 0
                        }, 200, 'easeInQuad');
                        $(this).find('img').stop().animate({
                            top: 0
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
        $(document).ready(function () {
            $('.popup-with-zoom-anim').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>
    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'move-top.js')}"></script>
    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'easing.js')}"></script>
    <!----end gallery-------->

    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1200);
            });
        });
    </script>
    <g:javascript library="jquery"/>

    <g:layoutHead/>

</head>

<body>

<g:layoutBody/>


<!----start-footer---------->
<div class="footer-bottom">


        <g:render template="/common/footer"/>

</div>
<!------end-footer------------>

<g:render template="/common/scrollToTop"/>

<g:javascript library="application"/>
<r:layoutResources/>
</body>

</html>
