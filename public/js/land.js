(function() {
	$('.nav a').click(function(){
		var toggle = $('.navbar-toggle');
		if (toggle.is(':visible'))
			$('.navbar-toggle').click();
	});

	var windowHeight = $(window).height();
	var header = $('header');
	var menu = header.children('.menu');

	header.height(windowHeight + menu.height());
	header.children('.container').height(windowHeight);
	menu.attr('data-offset-top', windowHeight);
	
	$(".public-logo").parallax("50%", 0.4, false);
})();