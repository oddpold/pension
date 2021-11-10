<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@page import="pension.gongji.GongjiDao" %> 
<%@page import="java.util.ArrayList" %>
<%@page import="pension.gongji.GongjiDto" %>   
<%
   GongjiDao gdao=new GongjiDao();
   ArrayList<GongjiDto> list=gdao.list();
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
   <caption> <h3> 공지사항</h3></caption>
     <tr>
       <td> 작성자 </td>
       <td> 제 목 </td>
       <td> 조회수 </td>
       <td> 작성일 </td>
     </tr>
    <c:forEach items="${list}" var="gdto" >
     <tr>
       <td> 관리자 </td>
       <td> <a href="readnum.jsp?id=${gdto.id}"> ${gdto.title} </a> </td>
       <td> ${gdto.readnum} </td>
       <td> ${gdto.writeday} </td>
     </tr>
    </c:forEach> 
   <c:if test="${userid == 'admin'}">
    <tr>
      <td colspan="4" align="center"> <a href="write.jsp"> 글쓰기 </a> </td>
    </tr>
   </c:if>
   </table>  
  </div>
  
<%@ include file="../bottom.jsp"%>















