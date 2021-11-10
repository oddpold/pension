<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<%@page import="pension.tour.TourDao" %>
<%@page import="java.util.ArrayList" %>
<%@page import="pension.tour.TourDto" %>
<%
   TourDao tdao=new TourDao();
   ArrayList<TourDto> list=tdao.list();
   
   request.setAttribute("list", list);
%> 
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
  
  <div id="section">
    <table width="700" align="center">
      <caption> <h3> 여 행 후 기 </h3></caption>
      <tr>
        <td> 작성자 </td>
        <td> 제 목 </td>
        <td> 작성이 </td>
      </tr>
      
     <c:forEach items="${list}" var="tdto">
      <tr>
        <td> ${tdto.name} </td>
        <td> <a href="content.jsp?id=${tdto.id}"> ${tdto.title} </a> </td>
        <td> ${tdto.writeday} </td>
      </tr>  
     </c:forEach>
     <c:if test="${userid != null}">
       <tr height="50" align="center">
        <td colspan="3"> <a href="write.jsp"> 여행후기 글쓰기 </a> </td>
       </tr>
     </c:if>  
    </table>
  
  </div>
  
<%@ include file="../bottom.jsp"%>













  