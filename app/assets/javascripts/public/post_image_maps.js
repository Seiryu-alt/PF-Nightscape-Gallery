$(function () {
  const resizeObserver = new ResizeObserver(entries => {
    var height = $("#header").height();
    $("#map-wrap").css("height", `calc(100vh - ${height}px)`);
  });
  resizeObserver.observe(document.getElementById('header'));
});

let map;
let marker = []; // マーカーを複数表示させたいので、配列化
let infoWindow = []; // 吹き出しを複数表示させたいので、配列化
let markerData = gon.post_images; // コントローラーで定義したインスタンス変数を変数に代入

function initMap() {
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('map_canvas'), {
    scrollwheel: true
  });

  var bounds = new google.maps.LatLngBounds();
  // 繰り返し処理でマーカーと吹き出しを複数表示させる
  for (var i = 0; i < markerData.length; i++) {
    let id = markerData[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerData[i]['latitude'],
      lng: markerData[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });

    // 各地点の吹き出しを作成
    infoWindow[i] = new google.maps.InfoWindow({
      // 吹き出しの内容
      content: `<a href="/post_images/${markerData[i]['id']}"><img src="${markerData[i]['image_url']}"></a>`
    });

    // 地図表示領域をマーカー位置に合わせて拡大
    bounds.extend(marker[i].getPosition());

    // マーカーにクリックイベントを追加
    markerEvent(i);
  }

  // マップの表示をすべてのマーカーが収まるように設定
  map.fitBounds(bounds);
}

// マーカーをクリックしたら吹き出しを表示
function markerEvent(i) {
  marker[i].addListener('click', function () {
    infoWindow[i].open(map, marker[i]);
  });
}