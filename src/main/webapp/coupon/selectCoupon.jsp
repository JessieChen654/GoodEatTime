<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GoodEatTime Coupon</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

</head>
<body bgcolor="white">
	<table id="table-1">
		<tr>
			<td><h3>GoodEatTime Coupon 優惠券</h3>
				<h4>(Practice )</h4></td>
		</tr>
	</table>

	<h3>查詢我的優惠券 :</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li>
			<form method="post" action="AddCoupon">
				<input type="hidden" name="action" value="getAll"> <input
					type="submit" value="查詢優惠券">
			</form>
		</li>

		<li>
			<form method="post" action="AddCoupon">
				<b>輸入優惠券編號</b> <input type="text" name="couponNo"> <input
					type="hidden" name="action" value="getOne"> <input
					type="submit" value="送出">
			</form>
		</li>

		<jsp:useBean id="couponService" scope="page"
			class="com.tibame.tga104.coupon.service.CouponServiceImpl" />

		<li>
			<form method="post" action="AddCoupon">
				<b>選擇優惠券編號 : </b> <select size="1" name="couponNo">
					<c:forEach var="couponVO" items="${couponService.all}">
						<option value="${couponVO.couponNo}">${couponVO.couponNo}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne"> <input
					type="submit" value="送出">
			</form>
		</li>

	

		<li>
			<form method="post" action="CouponController">
				<b>選擇餐廳編號 : </b> <select size="1" name="restaurantNo">
					<c:forEach var="couponVO" items="${couponService.all}">
						<option value="${couponVO.restaurantNo}">${couponVO.restaurantNo}
					</c:forEach>
				</select> <input type="hidden" name="action" value="gteOne"> <input
					type="submit" value="送出">
			</form>
		</li>
		<li>
			<form method="post" action="memberCouponController">
				<b>選擇會員編號</b> <select size="1" name="memberNo">
					<c:forEach var="memberCouponVO"
						items="${membercouponServiceImpl.all}">
						<option value="${memberCouponVO.all}">${memberCouponVO.all}
					</c:forEach>
				</select> <input type="hidden" name="actipn" value="getmemberCoupon">
				<input type="submit" value="送出">
			</form>
		</li>
	</ul>

	<h3>優惠券管理</h3>

	<ul>
		<li><a href='addCoupon.jsp'>新增優惠券</a></li>
	</ul>

</body>
</html>