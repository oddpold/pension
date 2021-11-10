<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="pension.tour.TourDao" %>  
<%@page import="pension.tour.TourDto" %>
<%
    // 하나의 레코드를 읽어와서 출력
    TourDao tdao=new TourDao();
    TourDto tdto=tdao.content(request);
    
    request.setAttribute("tdto", tdto);
 
%>
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
  
  <div id="section">
    <table width="600" align="center">
      <caption> <h3> 여행 후기</h3></caption>
      <tr>
        <td> 제 목 </td>
        <td> ${tdto.title} </td>
      </tr>
      <tr>
        <td> 내 용 </td>
        <td> ${tdto.content} </td>
      </tr>
      <tr>
        <td> 사 진 </td>
        <td>  
         <c:set var="file" value="${fn:split(tdto.fname,',')}"/>
         <c:forEach items="${file}" var="img">
           <img src="img/${img}" width="100">
         </c:forEach>
        </td>
      </tr>
      <tr>
        <td> 작성일 </td>
        <td> ${tdto.writeday} </td>
      </tr>
     
    </table>
  
  </div>
  
<%@ include file="../bottom.jsp"%>













