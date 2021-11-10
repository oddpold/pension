<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
   #list a {
     text-decoration:none;
     color:black;
   }
   #section #bimil {
     visibility:hidden;
     position:absolute;
   }
</style>
  
  <div id="section">
  <%@page import="pension.board.BoardDao" %>
  <%@page import="pension.board.BoardDto" %>
  <%@page import="java.util.ArrayList" %>
  <%@page import="pension.board.Number" %>  
  <!-- page, pstart, pend, chong , list -->
  <%
     BoardDao bdao=new BoardDao();
     ArrayList<BoardDto> list=bdao.list(request);
     Number num=bdao.getnumber(request);
 
     request.setAttribute("list", list);
     request.setAttribute("num", num);
  %>
  <script>
    function bimil_open(id) // 비밀글을 보기 위해 비밀번호를 입력하여 승인받는 작업
    {
    	document.bimil.id.value=id;
    	document.getElementById("bimil").style.visibility="visible";
    	// 사용자가 클릭한 위치에 가까운곳으로 입력창을 이동
    	var x=event.pageX;
    	var y=event.pageY;  
    	
    	document.getElementById("bimil").style.left=(x+15)+"px";
    	document.getElementById("bimil").style.top=y+"px";
    }
  </script>
  <div id="bimil">
   <form name="bimil" method="post" action="bimil_check.jsp">
     <input type="hidden" name="page" value="${num.page}">
     <input type="hidden" name="id">
     <input type="password" name="pwd" placeholder="비밀번호" size="5">
     <input type="submit" value="확인">
   </form>
  </div>
  <table width="600" align="center" id="list">
    <caption> <h3> 게 시 판 </h3></caption>
    <tr height="30">
      <td> 제목 </td>
      <td> 이름 </td>
      <td> 조회수 </td>
      <td> 작성일 </td>
    </tr>
   <c:forEach items="${list}" var="bdto">
    <tr height="30">
      <td> 
        <c:if test="${bdto.bimil==0}">
         <a href="readnum.jsp?id=${bdto.id}&page=${num.page}"> ${bdto.title} </a>
        </c:if>
        <c:if test="${bdto.bimil==1}"> 
         <a href="#" onclick="bimil_open(${bdto.id})"> ${bdto.title} </a>
        </c:if>
         
      </td>
      <td> ${bdto.name} </td>
      <td> ${bdto.readnum} </td>
      <td> ${bdto.writeday} </td>
    </tr>
   </c:forEach>
   <!-- 페이징 출력 -->
    <tr height="30">
      <td colspan="4" align="center">
        <!-- 10페이지 단위로 이전으로 이동하기 -->
   
      <c:if test="${num.pstart != 1}">
        <a href="list.jsp?page=${num.pstart-1}"> 이전 </a>
      </c:if>
      <c:if test="${num.pstart == 1}">
                이전
      </c:if>
   
     <!-- 현재페이지 이전페이지 => 현재페이지가 1일때 동작하면 X -->     
    
      <c:if test="${num.page != 1}">
        <a href="list.jsp?page=${num.page-1}"> ◀ </a>  
      </c:if>
   
      <c:if test="${num.page == 1}">
                    ◀
      </c:if>
      
        <!-- pstart에서 pend까지 페이지 링크 출력 -->
        <c:forEach begin="${num.pstart}" end="${num.pend}" var="i">
         <c:set var="str" value=""/>
          <c:if test="${num.page == i}">
           <c:set var="str" value="style='color:red'"/>
          </c:if>
           <a href="list.jsp?page=${i}" ${str}> ${i} </a>
        </c:forEach>
       
        <!-- 현재페이지 다음페이지  => 현재페이지가 마지막페이지일때는 동작 X-->
 
        <c:if test="${num.page != num.chong}">
          <a href="list.jsp?page=${num.page+1}"> ▶ </a>
        </c:if>
     
        <c:if test="${num.page == num.chong}">
                            ▶
        </c:if>
     
      <!-- 10페이지 단위로 다음페이지 이동  => 그다음 10개의 출력페이지 중에 현재그룹이랑 가장 가까운 페이지-->

        <c:if test="${num.chong != num.pend}">
          <a href="list.jsp?page=${num.pend+1}"> 다음 </a>
        </c:if>

        <c:if test="${num.chong == num.pend}">
                     다음
        </c:if>
        
      </td>
    </tr>
    <tr>
      <td align="center" colspan="4"> <a href="write.jsp"> 글쓰기 </a> </td> 
    </tr>
  </table>
  </div>
 
<%@ include file="../bottom.jsp" %>








 



