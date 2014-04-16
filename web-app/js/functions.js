/**
 * Created by spiros on 4/16/14.
 */
$(document).ready(function () {

    var defaults = {
        containerID: 'toTop', // fading element id
        containerHoverID: 'toTopHover', // fading element hover id
        scrollSpeed: 1200,
        easingType: 'linear'
    };

    $().UItoTop({
        easingType: 'easeOutQuart'
    });

});

jQuery(document).ready(function ($) {
    $(".scroll").click(function (event) {
        event.preventDefault();
        $('html,body').animate({
            scrollTop: $(this.hash).offset().top
        }, 1200);
    });
});

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