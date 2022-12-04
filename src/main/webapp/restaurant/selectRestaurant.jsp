<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>�n�����\�U�d��</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #F08632;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }

  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>�n�����\�U�d��</h3></td></tr>
</table>

<p>�X�@�\�U��x�޲z</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllRestaurant.jsp'>List All Restaurant</a></li>
  <br>
  
  
  <li>
    <FORM METHOD="post" ACTION="RestaurantServlet" >
        <b>��J�\�U�s��:</b>
        <input type="text" name="restaurantNo">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="svc" scope="page" class="restaurant.service.impl.RestaurantServiceImpl" />
   
  <li>
     <FORM METHOD="post" ACTION="RestaurantServlet" >
       <b>����\�U�s��:</b>
       <select size="1" name="restaurantNo">
         <c:forEach var="restaurantVO" items="${svc.all}" > 
          <option value="${restaurantVO.restaurantNo}">${restaurantVO.restaurantNo}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>

  <li>
     <FORM METHOD="post" ACTION="RestaurantServlet" >
       <b>����\�U�W��:</b>
       <select size="1" name="restaurantNo">
         <c:forEach var="restaurantVO" items="${svc.all}" > 
          <option value="${restaurantVO.restaurantNo}">${restaurantVO.restaurantName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>

</body>
</html>