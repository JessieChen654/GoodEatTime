<%@page import="java.util.GregorianCalendar"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.tibame.tga104.coupon.vo.*"%>
<%@ page import="com.tibame.tga104.coupon.service.*"%>


<%
CouponVO couponVO = (CouponVO) request.getAttribute("couponVO");
%>
--<%=couponVO == null%>--${couponVO.couponNo}--
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�u�f���Ʒs�W - addCoupon.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
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

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>�u�f���Ʒs�W - addCoupon.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp"><img src="images/tomcat.png"
						width="100" height="100" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="AddCoupon" name="form1">
		<table>
			<tr>
				<td>�u�f��s���G</td>
				<td><input type="TEXT" name="couponNo" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getCouponNo()%>" /></td>
			</tr>
			<tr>
				<td>�\�U�s���G</td>
				<td><input type="TEXT" name="restaurantNo" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getRestaurantNo()%>" /></td>
			</tr>
			<tr>
				<td>�޲z���s���G</td>
				<td><input type="TEXT" name="adminNo" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getAdminNo()%>" /></td>
			</tr>
			<tr>
				<td>�ӽФ���G</td>
				<td><input name="CouoponApplyDate" id="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>�u�f��W�١G</td>
				<td><input type="TEXT" name="CouponName" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getCouponName()%>" /></td>
			</tr>
			<tr>
				<td>�u�f��}�l�ɶ��G</td>
				<td><input name="CouponStartTime" id="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>�u�f�鵲���ɶ��G</td>
				<td><input name="CouponEndTime" id="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>�f�֪��A�G</td>
				<td><input name="verified" type="text"
					value="<%=(couponVO == null) ? " " : couponVO.getVerified()%>" /></td>
			</tr>
			<tr>
				<td>�u�f�餺�e�G</td>
				<td><input type="TEXT" name="couponContent" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getCouponContent()%>" /></td>
			</tr>
			<tr>
				<td>�q����B���h�֥i�H�ϥΡG</td>
				<td><input type="TEXT" name="usageLimitation" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getUsageLimitation()%>" /></td>
			</tr>
			<tr>
				<td>���B / ��ơG</td>
				<td><input type="TEXT" name="amountOrFold" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getAmountOrFold()%>" /></td>
			</tr>
			<tr>
				<td>���� : ��� / ����G</td>
				<td><input type="TEXT" name="couponType" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getCouponType()%>" /></td>
			</tr>
			<tr>
				<td>�o��i�ƤW���G</td>
				<td><input type="TEXT" name="maxIssueQty" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getMaxIssueQty()%>" /></td>
			</tr>
			<tr>
				<td>�w�o��i�ơG</td>
				<td><input type="TEXT" name="issuedQty" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getIssuedQty()%>" /></td>
			</tr>
			<tr>
				<td>�f�ָ�T�G</td>
				<td><input type="text" name="verificationDetail" size="45"
					value="<%=(couponVO == null) ? " " : couponVO.getVerificationDetail()%>" /></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	</FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%
java.sql.Timestamp couponStartTime = null;
try {
	couponStartTime = couponVO.getCouponStartTime();
} catch (Exception e) {
	couponStartTime = new java.sql.Timestamp(new GregorianCalendar().getTimeInMillis());
}
%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=couponStartTime%>
	', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	//startDate:	            '2017/07/10',  // �_�l��
	//minDate:               '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
	});

	// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	//      1.�H�U���Y�@�Ѥ��e������L�k���
	//      var somedate1 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      2.�H�U���Y�@�Ѥ��᪺����L�k���
	//      var somedate2 = new Date('2017-06-15');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});

	//      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
	//      var somedate1 = new Date('2017-06-15');
	//      var somedate2 = new Date('2017-06-25');
	//      $('#f_date1').datetimepicker({
	//          beforeShowDay: function(date) {
	//        	  if (  date.getYear() <  somedate1.getYear() || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//		             ||
	//		            date.getYear() >  somedate2.getYear() || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	//		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	//              ) {
	//                   return [false, ""]
	//              }
	//              return [true, ""];
	//      }});
</script>
</html>