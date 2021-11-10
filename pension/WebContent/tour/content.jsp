<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>  
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
   #img_layer {
     position:fixed;
     left:200px;
     top:100px;
     visibility:hidden;
     width:500px;
     height:350px;
   }
</style>
  <script>
   function img_view(src)
   {
	   // 클릭한 그림을 크게 보여준다 => 레이어를 통해서 
	   //alert(src);
	   document.getElementById("tour").src=src;
	   document.getElementById("img_layer").style.visibility="visible";
   }
   function img_hide()
   {
	   document.getElementById("img_layer").style.visibility="hidden";
   }
  </script>
  <div id="img_layer">
    <img id="tour" width="480" height="340" onclick="img_hide()">
  </div>
  <div id="section">
    <table width="600" align="center">
      <caption> <h3> 여행 후기</h3></caption>
      <tr height="30">
        <td> 제 목 </td>
        <td> ${tdto.title} </td>
      </tr>
      <tr height="200">
        <td> 내 용 </td>
        <td> ${tdto.content} </td>
      </tr>
      <tr height="100">
        <td> 사 진 </td>
        <td>  
        
         <c:forEach items="${tdto.fname2}" var="fname">
          <c:if test="${fname !=''}">
           <img src="img/${fname}" width="100" height="100" onclick="img_view(this.src)">
          </c:if>
         </c:forEach>
        </td>
      </tr>
      <tr height="30">
        <td> 작성일 </td>
        <td> ${tdto.writeday} </td>
      </tr>
       <tr height="30">
        <td colspan="2" align="center">
         <a href="list.jsp"> 목록가기 </a>
       <!-- 현재 로그인한 사람과  글의 작성자가 같을 경우 -->
        <c:if test="${userid == tdto.userid}">  
         <a href="update.jsp?id=${tdto.id}"> 수정 </a>
         <a href="delete.jsp?id=${tdto.id}"> 삭제 </a>
        </c:if> 
        </td>
      </tr>
    </table>
  
  </div>
  
<%@ include file="../bottom.jsp"%>













