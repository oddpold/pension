<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>  
<%@page import="pension.gongji.GongjiDao" %>
<%@page import="pension.gongji.GongjiDto" %>
<%
    GongjiDao gdao=new GongjiDao();
    GongjiDto gdto=gdao.content(request);
    
    request.setAttribute("gdto", gdto);
%>  
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
  
  <div id="section">
    <table width="500" align="center">
      <caption> <h3> 공지사항</h3></caption>
      <tr>
        <td> 제목 </td>
        <td colspan="3"> ${gdto.title} </td>
      </tr>
      <tr height="200">
        <td> 내용 </td>
        <td colspan="3"> ${gdto.content} </td>
      </tr>
      <tr>
        <td> 조회수 </td>
        <td> ${gdto.readnum} </td>
        <td> 작성일 </td>
        <td> ${gdto.writeday} </td>
      </tr>
      <tr>
        <td colspan="4" align="center">
           <a href="list.jsp"> 목록가기 </a>
          <c:if test="${userid == 'admin'}">
           <a href="delete.jsp?id=${gdto.id}"> 삭제 </a>
          </c:if>
        </td>
      </tr>
    </table>
  
  </div>
  
<%@ include file="../bottom.jsp"%>