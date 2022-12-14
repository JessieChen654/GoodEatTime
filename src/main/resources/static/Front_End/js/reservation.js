// dateTimePicker
$(function weekDay() {
  $.ajax({
    url: "../reservation/restaurant/date",
    type: "GET",
    dataType: "json",
    success: function (arr) {
      console.log(arr);
      const array1 = arr;
      const weekdays = array1.map((x) => x - 1);
      console.log(weekdays);

      $("#reserveDate")
        .datepicker({
          dateFormat: "yy-mm-dd",
          minDate: +1,
          maxDate: "+1m",
          beforeShowDay: function (dt) {
            return [weekdays.includes(dt.getDay()), ""];
          },
        })
        .val();
    },
  });
});

// google map
var restaurantAddr = "台南火車站";
function initMap() {
  geocoder = new google.maps.Geocoder();
  var myLatLng = new google.maps.LatLng(25.04, 121.512);
  var mapOptions = {
    center: myLatLng,
    zoom: 16,
  };
  map = new google.maps.Map(document.getElementById("map"), mapOptions);
  codeAddress(restaurantAddr);
}
function codeAddress(address) {
  geocoder.geocode({ address: address }, function (results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location); //center the map over the result
      //place a marker at the location
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
      });
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}

// submit訂位資訊
$("#btn_reserve").on("click", function (e) {
  e.preventDefault();
  var send_data = {};
  // input格式判斷
  let reserveNum = $("#reserveNum").val();
  let reserveDate = $("#reserveDate").val();
  let reserveTime = $("#reserveTime").val();

  if (reserveDate != "") {
    send_data.reserveDate = reserveDate;
  } else {
    alert("請輸入想要訂位日期");
    return;
  }

  if (reserveNum > 0 && !isNaN(reserveNum)) {
    send_data.reserveNum = reserveNum;
  } else {
    alert("請輸入人數");
    return;
  }

  if (reserveTime != "") {
    send_data.reserveTime = reserveTime;
  } else {
    alert("請輸入想要訂位時段");
    return;
  }

  send_data.reserveDate = $("#reserveDate").val();
  send_data.reserveTime = $("#reserveTime").val();
  if ($("#remark").val() != "") {
    send_data.remark = $("#remark").val();
  }
  send_data.memberNo = 2;
  send_data.tel = "0921399718";
  send_data.restaurantNo = 2;
  // console.log(send_data);
  sessionStorage.setItem("reservation_inf", JSON.stringify(send_data));
  location.href = "./reservation_confirm.html";
});

// Session資料
var reserve_data = function () {
  if (sessionStorage.getItem("reservation_inf") != null) {
    const reservation_inf = JSON.parse(
      sessionStorage.getItem("reservation_inf")
    );
    console.log(reservation_inf);
    reservation_inf.reserveNum = $("#reserveNum").val();
    reservation_inf.reserveDate = $("#reserveDate").val();
    reservation_inf.reserveTime = $("#reserveTime").val();
    reservation_inf.remark = $("#remark").val();
    reservation_inf.tel = "0921399718";
    reservation_inf.memberNo = 2;
    reservation_inf.restaurantNo = 2;
  }
};
reserve_data();

// Session資料
// const data = {};
// data.name = $("#name").val();
// data.tel = $("#tel").val();
// data.people = $("#reserveNum").val();
// data.date = $("#reserveDate").val();
// data.time = $("#reserveTime").val();
// data.remark = $("#remark").val();
// sessionStorage.setItem("reservation_inf", JSON.stringify(data));
// const sendButton = document.querySelector("#btn_reserve");
// sendButton.addEventListener('click', () => history.replaceState(data, null, "reservation_confirm.html"));

// let pass = false;
// if(data.name.length === 0) {
//     alert()

// } else

// submit -> preventDefault(); window.location.href="xxx";
