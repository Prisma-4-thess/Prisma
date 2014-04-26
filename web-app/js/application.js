if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn().css("display","inline");;
		}).ajaxStop(function() {
			$(this).fadeOut().css("display","inline");;
		});
	})(jQuery);
}
