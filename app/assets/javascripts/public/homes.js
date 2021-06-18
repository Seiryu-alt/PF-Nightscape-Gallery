$(document).on('turbolinks:load', function () {
  $(function () {
    $('.jscroll').jscroll({
      contentSelector: '.jscroll li',
      nextSelector: 'span.next:last a',
      loadingHtml: '<div class="text-center"><div class="spinner-grow text-primary" role="status"></div></div>'
    });
  });
});