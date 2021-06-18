function initMap() {
  var latlng = new google.maps.LatLng(gon.latitude, gon.longitude);
  const mapOptions = {
    scrollwheel: true,
    zoom: 8,
    center: latlng,
  };
  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  var marker = new google.maps.Marker({
    position: latlng,
    map: map,
    title: gon.location_name
  });
}


$(function () {
  $('.custom-file input').change(function (e) {
    $('.custom-file-label').html(e.target.files[0].name);
  });

  $('.tagsinput').tagsinput({
    interactive: true,
    placeholder: 'タグを追加',
    minChars: 2,
    maxChars: 20, // if not provided there is no limit
    limit: 5, // if not provided there is no limit
    width: '100%', // standard option is 'auto'
    height: '100px', // standard option is 'auto'
    hide: true
  });

  $("#geocomplete").geocomplete({
    mapOptions: {
      scrollwheel: true
    },
    map: "#map_canvas",
    details: "form",
    detailsAttribute: "data-geo",
    types: ["geocode", "establishment"],
    location: [gon.latitude, gon.longitude]
  });
});