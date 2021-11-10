<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
  <%@page import="pension.reserve.ReserveDao" %>
  <%
      ReserveDao rdao=new ReserveDao();
      request.setAttribute("list",rdao.getRoom());
  %>
  <div id="section">
    <table width="600" align="center">
      <caption> <h3> 방 관리 </h3></caption>
      <tr align="center">
        <td width="30%"> 방이름 </td>
        <td width="30%"> 숙박가격(1박) </td>
        <td width="15%"> 최소인원 </td>
        <td width="15%"> 최대인원 </td>
        <td width="10%"> 삭 제 </td>
      </tr>
      <c:forEach items="${list}" var="rdto">
       <tr align="center">
        <td> ${rdto.name} </td>
        <td> <fmt:formatNumber value="${rdto.price}"/>원</td>
        <td> ${rdto.min} </td>
        <td> ${rdto.max} </td>
        <td> <a href="javascript:room_del(${rdto.id})">클릭</a></td>
      </tr>
      </c:forEach>
      <tr>
        <td colspan="5"> &nbsp; </td>
      </tr>
      <tr align="center">
       <form name="chuga" action="room_add.jsp">
        <td> <input type="text" name="name" size="9"> </td>
        <td> <input type="text" name="price" size="9"></td>
        <td> <input type="text" name="min" size="4"></td>
        <td> <input type="text" name="max" size="4"></td>
        <td> <input type="submit" value="추가"> </td>
       </form>
      </tr>
    </table>
   <script>
     function room_del(id)
     {
    	 if(confirm("정말 삭제하시겠습니까?"))
         {
    	    location="room_del.jsp?id="+id;	 
    	 }
     }
   </script>
  </div>
  
<%@ include file="../bottom.jsp"%>