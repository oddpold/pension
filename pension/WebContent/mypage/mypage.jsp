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
   tr {
     height:38px;
   }
</style>
  
  <div id="section">
    <table width="400" align="center">
      <caption> <h3> 회원 정보 </h3></caption>
      <tr>
        <td> 이름 </td>
        <td> ${mdto.name} </td>
      </tr>
      <tr>
        <td> 아이디 </td>
        <td> ${mdto.userid} </td>
      </tr>
      <tr>
        <td> 이메일 </td>
        <td> ${mdto.email}</td>
      </tr>
      <tr>
        <td> 전화번호 </td>
        <td> ${mdto.phone}</td>
      </tr>
      <tr>
        <td> 가입일 </td>
        <td> ${mdto.writeday}</td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <a href="my_update.jsp"> 정보수정 </a> &nbsp;&nbsp;
          <a href="javascript:pwd_change()"> 비밀번호변경 </a>
        </td>
      </tr>
      <tr id="pwd_chg" style="display:none;">
        <td colspan="2" align="center">
          <form method="post" action="pwd_change.jsp">
           <input type="text" name="pwd" placeholder="변경 비밀번호">
           <input type="submit" value="변경">
          </form>
        </td>
      </tr>
    </table>
  </div>
  <script>
    function pwd_change()
    {
    	document.getElementById("pwd_chg").style.display="table-row";
    }
  </script>
<%@ include file="../bottom.jsp"%>