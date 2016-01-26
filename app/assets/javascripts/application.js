// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require iscroll
//= require masonry-docs.min
//= require jquery.nivo.slider.pack
//= repuire_tree ./components
//= require bootstrap
//= require_self

$(document).on('ready page:load', function() {
	$(".dropdown").hover(function() {
		$(this).addClass("on");
	}, function(){
		$(this).removeClass("on");
	});
	//$('.collapse').collapsing();

	var $grid = $(".cards").masonry({
		itemSelector: '.card'
	});

	$grid.imagesLoaded().progress(function(){
		$grid.masonry('layout');
	});

	!function(e){if("function"==typeof bootstrap)bootstrap("flippant",e);else if("object"==typeof exports)module.exports=e();else if("function"==typeof define&&define.amd)define(e);else if("undefined"!=typeof ses){if(!ses.ok())return;ses.makeFlippant=e}else"undefined"!=typeof window?window.flippant=e():global.flippant=e()}(function(){var define,ses,bootstrap,module,exports;return function(e,t,n){function i(n,s){if(!t[n]){if(!e[n]){var o=typeof require=="function"&&require;if(!s&&o)return o(n,!0);if(r)return r(n,!0);throw new Error("Cannot find module '"+n+"'")}var u=t[n]={exports:{}};e[n][0].call(u.exports,function(t){var r=e[n][1][t];return i(r?r:t)},u,u.exports)}return t[n].exports}var r=typeof require=="function"&&require;for(var s=0;s<n.length;s++)i(n[s]);return i}({1:[function(require,module,exports){exports.flip=flip;function flip(flipper,content,type,class_name,timeout){var position,back,style_func;timeout=timeout||400;type=type||"card";if(type==="modal"){class_name=class_name||"flippant-modal-dark";position="fixed";style_func=null_styles}if(type==="card"){class_name=class_name||"flippant-modal-light";position="absolute";style_func=card_styles}back=document.createElement("div");document.body.appendChild(back);set_styles(back,flipper,position);back.innerHTML=content;flipper.classList.add("flippant");back.classList.add("flippant-back");back.classList.add(class_name);if(position=="absolute"){style_func(back)}else{window.setTimeout(function(){style_func(back)},0)}window.setTimeout(function(){back.classList.add("flipper");back.classList.add("flipped");flipper.classList.add("flipped")},0);back.addEventListener("close",close);back.close=close;function close(){set_styles(back,flipper,position);back.classList.remove("flipped");back.classList.remove("flipped");flipper.classList.remove("flipped");window.setTimeout(function(){back.classList.remove(class_name);document.body.removeChild(back)},timeout)}return back}function set_styles(back,front,position){back.style.position=position;back.style.top=front.offsetTop+"px";back.style.left=front.offsetLeft+"px";back.style["min-height"]=front.offsetHeight+"px";back.style.width=front.offsetWidth+"px";back.style["z-index"]=9999}function null_styles(back){back.style.top=null;back.style.left=null;back.style.height=null;back.style.width=null}function card_styles(back){back.style.height="auto"}},{}]},{},[1])(1)});

	var flip = flippant.flip;
	var register = $('#register-form').html();

	document.addEventListener('click', function(e) {
	  if (e.target.classList.contains('btnflip')) {
	    e.preventDefault()
	    var flipper = e.target.parentNode.parentNode.parentNode.parentNode
	    var back
	    var input = ''

	      back = flip(flipper, register)

	    back.addEventListener('click', function(e) {
	      if (e.target.classList.contains('flipme')) {
	        var close_event = new CustomEvent('close')
	        back.dispatchEvent(close_event)
	      }
	    })
	  }
	})
});









