<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<%@page import="pension.member.MemberDao" %>
<%@page import="pension.member.MemberDto" %>
<%
    MemberDao mdao=new MemberDao();
    MemberDto mdto=mdao.mypage(session);
    
    request.setAttribute("mdto", mdto);
%>
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
   
   input[type=text], input[type=password] {
     width:400px;
     height:40px;
     border:1px solid #6799FF;
     font-size:17px;
     color:#6799FF;
   }
   input[type=submit]
   {
     width:406px;
     height:42px;
     border:1px solid #6799FF;
     font-size:17px;
     background:#6799FF;
     color:white;
   }
   input[type=button]
   {
     width:80px;
     height:42px;
     border:1px solid #6799FF;
     font-size:17px;
     background:#6799FF;
     color:white;
   }
   td {
     height:50px;
   }
</style>
 
  
  <div id="section"> 
    <form name="mem" method="post" action="my_update_ok.jsp">
     <table width="600" align="center">
       <caption> <h3> ${mdto.userid}님!! 회 원 정 보 수 정</h3></caption>
       <tr align="center"> 
         <td> <input type="text" name="name" value="${mdto.name}"> </td>
       </tr>
       <tr align="center"> 
         <td> <input type="text" name="email" value="${mdto.email}"> </td>
       </tr>
       <tr align="center"> 
         <td> <input type="text" name="phone" value="${mdto.phone}"> </td>
       </tr>
       <tr align="center"> 
         <td> <input type="submit" value="정보수정"> </td>
       </tr>
     </table>   
    </form>
   </div>
  
<%@ include file="../bottom.jsp"%>