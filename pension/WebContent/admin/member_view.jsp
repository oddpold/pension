<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
   #section #mem {
     display:inline-block;
     width:100px;
     height:24px;
     padding-top:6px;
     text-align:center;
     border:1px solid #6799FF;
   }
</style>
  
  <div id="section">
<%@page import="pension.member.MemberDao" %>   
<%
    MemberDao mdao=new MemberDao();
    request.setAttribute("list",mdao.getmember());
%>  
   <table width="800" align="center">
     <caption> <h3> 회원 정보 </h3></caption>
     <tr>
       <td> 이름 </td>
       <td> 아이디 </td>
       <td> email </td>
       <td> 전화번호 </td>
       <td> 가입일 </td>
       <td> 상태 </td> 
     </tr>
    <c:forEach var="mdto" items="${list}">
     <tr>
       <td> ${mdto.name} </td>
       <td> ${mdto.userid} </td>
       <td> ${mdto.email} </td>
       <td> ${mdto.phone} </td>
       <td> ${mdto.writeday} </td>
       <td> 
         <c:if test="${mdto.status == 0}">
           <span id="mem"> 정상회원 </span>
         </c:if>
         <c:if test="${mdto.status == 1}">
           <span id="mem" onclick="location='member_chg.jsp?id=${mdto.id}'"> 탈퇴신청회원  </span>
         </c:if>
         <c:if test="${mdto.status == 2}">
           <span id="mem">  탈퇴회원</span>
         </c:if>
       </td> 
     </tr>
    </c:forEach>
   </table>
  </div>
  
<%@ include file="../bottom.jsp"%>