$(function () {
  $('.custom-file input').change(function (e) {
    $('.custom-file-label').html(e.target.files[0].name);

    $('#preview-image').remove();
    var file = $(this).prop('files')[0];
    var fileReader = new FileReader();
    fileReader.onloadend = function () {
      $('#preview').html('<img src="' + fileReader.result + '" id="preview-image"/>');
      $('#preview-image').addClass('rounded-circle');
    }
    fileReader.readAsDataURL(file);
  });
});