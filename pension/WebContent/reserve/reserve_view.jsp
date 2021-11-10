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
  
  <div id="section">
<%@page import="pension.reserve.ReserveDao" %>   
<%
    // 이름과 전화번호를 검색하여 가장 최근의 예약 레코드
    ReserveDao rdao=new ReserveDao();
    request.setAttribute("rdto", rdao.reserve_view(request));
   
%>   
  <table width="800" align="center">
   <caption> <h3> ${rdto.name}님의 예약신청 내용입니다</h3></caption>
   <tr>
    <td> 예약자 </td>
    <td> 전화번호 </td>
    <td> 입실일 </td>
    <td> 퇴실일 </td>
    <td> 인원수 </td>
    <td> 방 </td>
    <td> 숯불세트 </td>
    <td> bbq세트 </td>
    <td> 총결제금액 </td>
   </tr>
   <tr>
    <td> ${rdto.name} </td>
    <td> ${rdto.phone} </td>
    <td> ${rdto.inday} </td>
    <td> ${rdto.outday} </td>
    <td> ${rdto.inwon} </td>
    <td> ${rdto.bang} </td>
    <td> ${rdto.charcoal} </td>
    <td> ${rdto.bbq} </td>
    <td> <fmt:formatNumber value="${rdto.total}"/>원 </td>
   </tr>
  </table>
  
  </div>
  
<%@ include file="../bottom.jsp" %>