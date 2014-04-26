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

/******Function for the video at homepage********/

var myVideo = document.getElementById("video1");

function play() {
    console.info("play()");
    myVideo.play();
    $('#toFadeH').animate({ opacity: 0 });
    $('#toFadeP').animate({ opacity: 0 });
    $('#queryForm').animate({ opacity: 0 });
    $('#toFadeS1').animate({ opacity: 0 });
    $('#toFadeS2').animate({ opacity: 0 });
    document.getElementById("toHide").style["display"] = "none";
    document.getElementById("video").style["display"] = "block";
    document.getElementById("close_vid").style["display"] = "block";
}
function pause() {
    myVideo.pause();
    document.getElementById("toHide").style["display"] = "block";
    document.getElementById("video").style["display"] = "none";
    document.getElementById("close_vid").style["display"] = "none";
    $('#toFadeH').delay(500).animate({ opacity: 1 });
    $('#toFadeP').delay(750).animate({ opacity: 1 });
    $('#queryForm').delay(1000).animate({ opacity: 1 });
    $('#toFadeS1').delay(1250).animate({ opacity: 1 });
    $('#toFadeS2').delay(1250).animate({ opacity: 1 });
}

/******END - Function for the video at homepage********/

/******Function clearing the form, and showing the results at homepage ********/

function hideResultsShowDecision() {
    document.getElementById("results").style["display"] = "none";
    document.getElementById("decision").style["display"] = "block";
}

function hideDecisionShowResults() {
    document.getElementById("results").style["display"] = "block";
    document.getElementById("decision").style["display"] = "none";
}

/****** END - Function clearing the form, and showing the results at homepage ********/

/******Contact response popup at homepage ********/

function pop() {
    $('#contact_resp').fadeIn('slow');
    $('#contact_resp').delay(2000).fadeOut(
        'slow');
}

/******END - Contact response popup at homepage ********/
/******START- Slides elements(show-hide)******/
function slideTableRow(id) {
    $(document.getElementById(id)).slideToggle("fast");
}
/*******END-Slides elements(show-hide)******/