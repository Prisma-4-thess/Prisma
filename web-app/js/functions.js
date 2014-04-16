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