$(function () {
  $('.jumbotron-bg').vegas({
    slides: gon.bg_img_urls,
    transition: 'fade', //スライドを遷移させる際のアニメーション
    transitionDuration: 2000, //スライドの遷移アニメーションの時間
    delay: 8000, //スライド切り替え時の遅延時間
    animation: 'kenburns',
    walk: function (index, slideSettings) {
      $("#top-image-link").attr("href", gon.post_image_urls[index])
      console.log("Slide index " + index + " image " + slideSettings.src);
    }
  });

  $('.jscroll').jscroll({
    contentSelector: '.jscroll li',
    nextSelector: 'span.next:last a',
    loadingHtml: '<div class="text-center"><div class="spinner-grow text-primary" role="status"></div></div>'
  });
});