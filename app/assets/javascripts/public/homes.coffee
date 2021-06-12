# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.jscroll').jscroll
    contentSelector: '.jscroll li'
    nextSelector: 'span.next a'
    loadingHtml: '<div class="text-center"><div class="spinner-grow text-primary" role="status"></div></div>'
  return