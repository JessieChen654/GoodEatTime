var tbcoupon_update = document.querySelector("#tbcoupon_update");
var couponNo = sessionStorage.getItem("couponNo")
$.ajax({
  url: "../coupon/update",
  type: "GET",
  data: {"couponNo" : couponNo},
  dataType: "json",
  success: function (coupon) {
    console.log(coupon);
    tbcoupon_update.innerHTML = Template(coupon);
  },
});



function onConfirmClick() {
  const couponStartTime = document.querySelector('#couponStartTime').value;
  const couponEndTime = document.querySelector('#couponEndTime').value;
  const couponContent = document.querySelector('#couponContent').value;
  const usageLimitation = document.querySelector('#usageLimitation').value;
  const amountOrFold = document.querySelector('#amountOrFold').value;
  const couponType = Boolean(document.querySelector('input[name="couponType"]:checked').value);
  const couponName = document.querySelector('#couponName').value;
  const maxIssueQty = document.querySelector('#maxIssueQty').value;
  const news_file = document.querySelector('#news_file');

  const fileReader = new FileReader();
  fileReader.onload = event => {
      const couponPicStr = btoa(event.target.result);

      $.ajax({
        url: "../coupon/update",
        type: "POST",
        contentType: 'application/json',
        data:JSON.stringify({
          "couponNo": couponNo,
          "couponStartTime": couponStartTime,
          "couponEndTime": couponEndTime,
          "couponContent": couponContent,
          "usageLimitation": usageLimitation,
          "amountOrFold": amountOrFold,
          "couponType": couponType,
          "couponName": couponName,
          "maxIssueQty": maxIssueQty,
          "couponPicStr": couponPicStr
        }),
        dataType: "json",
        success: function () {
          alert("xxxxxxxxxx");
        }
      })
    };
  fileReader.readAsBinaryString(news_file.files[0]);
}

function Template({couponNo, couponApplyDate, couponStartTime, couponEndTime, couponContent,usageLimitation, amountOrFold,couponType,couponName,maxIssueQty, issuedQty, couponPicStr}) {
  const picUrl = getPicUrl(couponPicStr);
  return `
  <h3>????????????</h3>
  <div class="class__sidebar col-lg-6" style="width:50% ; margin: 0px auto ;float: left;">
    <form>
        <h4>??????????????? : ${couponNo}</h4>
        <span>??????????????? :<input type="text" value="${couponName}" placeholder="${couponName}" id="couponName"></span>
        <span>?????????????????? :<input type="date" value="${couponStartTime}" placeholder="${couponStartTime}" id="couponStartTime"></span>
        <span>?????????????????? :<input type="date" value="${couponEndTime}" placeholder="${couponEndTime}" id="couponEndTime"></span>
        <span>????????????????????????????????? :<input type="text" value="${usageLimitation}" placeholder="${usageLimitation}" id="usageLimitation"></span>
        <span>?????? / ?????? :<input type="text" value="${amountOrFold}" placeholder="${amountOrFold}" id="amountOrFold"></span>
        <span>??????: ?????? / ?????? :<input type="text" value="${couponType}" placeholder="${couponType}" disabled="true"></span>
        <label>??????<input type="radio" value="true" name="couponType" id="amount" checked></label>
        <label>??????<input type="radio" value="false"  id="Fold" name="couponType"></label>
        <p>?????????????????? :<input type="text" value="${maxIssueQty}" placeholder="${maxIssueQty}" id="maxIssueQty"></p>
        <span>??????????????? :${issuedQty}</span>  
      </form>
    </div>
    <div class="class__sidebar col-lg-6" style="width:50% ; margin: 0px auto; float: right;">
      <form>
        <span>????????????????????? :<textarea id="couponContent" style="width:450px ; height:300px" placeholder="${couponContent}"></textarea></span>
        <p>???????????? :</p>
        <img class="updatePic" src="${picUrl}">
        <div class="preview">
          <img id="news_file_preview">
          <label id="updatePicdata" for="news_file">????????????</label>
          <input type="file" id="news_file" accept="image/*" onchange="showPreview(event);/>
        </div>
      </form>
      <label id="updata" for="confirmbtn"></label>
      <button type="button" id="confirmbtn" onclick="onConfirmClick()">??????</button>
    </div>`
}
//==========================????????????=================================

function getPicUrl(base64Str) {
  const binaryStr = atob(base64Str);
  let len = binaryStr.length;
  const uint8Array = new Uint8Array(len);
  while (len--) {
    uint8Array[len] = binaryStr.charCodeAt(len);
  }
  const blob = new Blob([uint8Array]);
  return URL.createObjectURL(blob);
}

//==========================??????????????????=================================
function showPreview(event){
  if(event.target.files.length > 0){
    var src = URL.createObjectURL(event.target.files[0]);
    var preview = document.getElementById("news_file_preview");
    preview.src = src;
    preview.style.display = "block";
  }
}