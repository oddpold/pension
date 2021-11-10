<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<%@page import="pension.board.BoardDao" %>
<%@page import="pension.board.BoardDto" %>    
<%
     // 해당 레코드의 조회수를 1증가 시킨후 content로 이동
     BoardDao bdao=new BoardDao();
     BoardDto bdto=bdao.content(request);
     request.setAttribute("bdto", bdto);
     request.setAttribute("page", request.getParameter("page"));
     %>  
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
 <script>
  function del()
  {
	  document.getElementById("del").style.display="table-row";
  }
  function cancel()
  {
	  document.getElementById("del").style.display="none";
  }
 </script>
 <div id="section">
   <table width="700" align="center">
    <caption> <h3> 게시판 내용</h3></caption>
     <tr height="30">
       <td> 작성자 </td>
       <td> ${bdto.name} </td>
       <td> 작성일 </td>
       <td> ${bdto.writeday} </td>
     </tr>
     <tr height="30">
       <td> 제 목 </td>
       <td colspan="3"> ${bdto.title} </td>
     </tr>
     <tr height="200">
       <td> 내용 </td>
       <td colspan="3"> ${bdto.content} </td>
     </tr>
     <tr height="30">
       <td> 조회수 </td>
       <td> ${bdto.readnum} </td>
       <td> 생일 </td>
       <td> ${bdto.birth} </td>
     </tr>
     <tr height="30">
       <td> 취미 </td>
       <td colspan="3"> ${bdto.hobby} </td>
     </tr>
     <tr>
       <td colspan="4" align="center">
         <a href="list.jsp?page=${page}"> 목록가기 </a>
         <a href="update.jsp?id=${bdto.id}&page=${page}"> 수정 </a>
         <a href="javascript:del()"> 삭제 </a>
       </td>
     </tr>
     <tr id="del" style="display:none">
       <td colspan="4" align="center"> 
         <form method="post" action="delete.jsp">
          <input type="hidden" name="id" value="${bdto.id}">
          <input type="hidden" name="page" value="${page}">
          <input type="password" name="pwd" placeholder="비밀번호">
          <input type="submit" value="삭제">
          <input type="button" onclick="cancel()" value="취소">
         </form>
       </td>
     </tr>
   </table>
 </div>
  
<%@ include file="../bottom.jsp"%>
























