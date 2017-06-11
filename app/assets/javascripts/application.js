// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require slider
//= require modernizer
// require turbolinks
//= require_self

var ready, fetch, back;

ready = function(){
  $("a[href='" + window.location.pathname + "']").parent().addClass('active');

  $('#da-slider').cslider({
    autoplay: true,
    interval: 8000
  });

  $(".totop").hide();
  
  $(window).scroll(function(){
    if ($(this).scrollTop() > 300) {
      $('.totop').fadeIn();
    } else {
      $('.totop').fadeOut();
    }
  });

  $(".totop a").click(function(e) {
    e.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
  });

};

fetch = function() {
  $("body").css("opacity", "0.7");
  return $("body").css("cursor", "wait");
};

back = function() {
  return $("body").css("opacity", "1");
};

$(document).ready(ready);

$(document).on('page:load', ready);

$(document).on('page:fetch', fetch);

$(document).on('page:restore', back);

$(document).on('page:receive', back);