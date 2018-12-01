// Smooth Scrolling Functionality
//

$(function() {
  // Scroll to location Hash
  if (location.hash.length > 0) {
    var target = $(location.hash);
    scrollToElement(target);
  }

  // Scroll on click
  $('a[href*="#"]:not([href="#"])').click(function(event) {
    event.preventDefault();
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        scrollToElement(target);
      }
    }
  });

  // Scroll to element
  function scrollToElement(target) {
    $('html, body').animate({
      scrollTop: target.offset().top
    }, 1000);
    return false;
  }
});


/**
*  JS ScrollFix
*  Fixes an element to the top of a page at a certain scroll height
* *
*  @author      VRG Interactive
*  @copyright   Copyright (c) 2017
*  @since       Version 1.0.0
*
*/

(function( $ ) {
  $.fn.fixedTop = function() {

    return $(this).each(function() {
      // Create scoped variables
      var $element  = $(this),
          position  = $element.offset().top,
          height    = $element.outerHeight();

      // Detect scroll position
      $(window).scroll(function() {
        // Detect distance from top on scroll
        var distance = $(window).scrollTop();

        if (distance >= position) {
          $("body").css("padding-top", height);
          $element.addClass("fixed-top");
        } else {
          $("body").css("padding-top", 0);
          $element.removeClass("fixed-top");
        }
      });
    });
  };
}( jQuery ));

$(function() {
  $(".js-fixed").fixedTop();
});
