$(function () {
  $('.jscroll').jscroll({
    contentSelector: '.jscroll li',
    nextSelector: 'span.next:last a',
    loadingHtml: '<div class="text-center"><div class="spinner-grow text-primary" role="status"></div></div>',
    callback: function () {//新たに読み込まれたページにはjavascriptが当たらないので、ここに追加すれば読み込まれる
      $('.followbutton-followed').hover(
        function () {
          $(this).text('フォロー解除');
          $(this).addClass("btn-danger");
          $(this).removeClass("btn-primary");

        },
        function () {
          $(this).text('フォロー中');
          $(this).addClass("btn-primary");
          $(this).removeClass("btn-danger");
        }
      );
    }
  });
});