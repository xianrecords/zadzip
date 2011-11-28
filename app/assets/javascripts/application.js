// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
  $(".loginbox").ezpz_hint();
  $(".signupbox").ezpz_hint();
  $('#slider').nivoSlider({
        effect: 'fold',
		animSpeed: 500, // Slide transition speed
		pauseTime: 6000});
});

// EZPZ Hint v1.1.1; Copyright (c) 2009 Mike Enriquez, http://theezpzway.com; Released under the MIT License
(function($){
	$.fn.ezpz_hint = function(options){
		var defaults = {
			hintClass: 'ezpz-hint',
			hintName: 'ezpz_hint_dummy_input'
		};
		var settings = $.extend(defaults, options);

		return this.each(function(i){
			var id = settings.hintName + '_' + i;
			var hint;
			var dummy_input;

			// grab the input's title attribute
			text = $(this).attr('title');

			// create a dummy input and place it before the input
			$('<input type="text" id="' + id + '" value="" />')
				.insertBefore($(this));

			// set the dummy input's attributes
			hint = $(this).prev('input:first');
			hint.attr('class', $(this).attr('class'));
			hint.attr('size', $(this).attr('size'));
			hint.attr('autocomplete', 'off');
			hint.attr('tabIndex', $(this).attr('tabIndex'));
			hint.addClass(settings.hintClass);
			hint.val(text);

			// hide the input
			$(this).hide();

			// don't allow autocomplete (sorry, no remember password)
			$(this).attr('autocomplete', 'off');

			// bind focus event on the dummy input to swap with the real input
			hint.focus(function(){
				dummy_input = $(this);
				$(this).next('input:first').show();
				$(this).next('input:first').focus();
				$(this).next('input:first').unbind('blur').blur(function(){
					if ($(this).val() == '') {
						$(this).hide();
						dummy_input.show();
					}
				});
				$(this).hide();
			});

			// swap if there is a default value
			if ($(this).val() != ''){
				hint.focus();
			};
		});

	};
})(jQuery);