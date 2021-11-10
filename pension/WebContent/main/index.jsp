<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
   #third {
     width:1000px;
     height:400px;
     background:white;
     margin:auto;
     position:relative;
     z-index:1;
   }
   #fourth {
     width:1000px;
     height:200px;
 
     margin:auto;
   }
    
   #fourth td {
     font-size:13px;
   }
   #fourth #bimil {
     visibility:hidden;
     position:absolute;
   }
   #fourth a {
     text-decoration:none;
     color:black;
   }
</style>
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
<%@page import="pension.main.MainDao" %>
<%
   MainDao mdao=new MainDao();
   request.setAttribute("list1",mdao.getgongji());
   request.setAttribute("list2",mdao.getboard());
   request.setAttribute("list3",mdao.gettour());
%>
   <div id="third"> <img src="../img/main.jpg" width="1000" height="400"></div>
   <div id="fourth">
     <table width="1000" align="center" >
       <tr>
         <td width="250" align="center"> <!-- 공지사항 -->
           <table width="100%" align="center">
            <caption> <h3> 공지사항 </h3></caption>
           <c:forEach items="${list1}" var="gdto">
             <tr>
               <td> <a href="../gongji/readnum.jsp?id=${gdto.id}"> ${gdto.title} </a></td>
               <td> ${gdto.writeday} </td>
             </tr>
           </c:forEach>  
           <!-- 레코드가 5개가 안되는 경우 빈 행을 출력하기 위해 -->
           <c:forEach begin="1" end="${5-list1.size()}"> 
             <tr> <td colspan="2"> &nbsp; </td> </tr>
           </c:forEach>
           
           </table>
         </td>
         <td width="250" align="center"> <!-- 게시판  -->
           <table width="100%" align="center">
           <caption> <h3> 자유게시판 </h3></caption>
           <c:forEach items="${list2}" var="bdto">
             <tr>
               <td> 
                <c:if test="${bdto.bimil==0}">
                  <a href="../board/readnum.jsp?id=${bdto.id}"> ${bdto.title} </a>
                </c:if>
                <c:if test="${bdto.bimil==1}"> 
                  <a href="#" onclick="bimil_open(${bdto.id})"> ${bdto.title} </a>
                </c:if>
               </td>
               <td> ${bdto.writeday} </td>
             </tr>
           </c:forEach>
           <c:forEach begin="1" end="${5-list2.size()}">
             <tr> <td colspan="2"> &nbsp; </td> </tr>
           </c:forEach>
           </table>
         </td>
         <td width="250" align="center"> <!-- 여행후기 -->
           <table width="100%" align="center">
            <caption> <h3> 여행 후기 </h3></caption>
           <c:forEach items="${list3}" var="tdto">
             <tr>
               <td> <a href="../tour/content.jsp?id=${tdto.id}"> ${tdto.title} </a> </td>
               <td> ${tdto.writeday} </td>
             </tr>
           </c:forEach>
           <c:forEach begin="1" end="${5-list3.size()}">
             <tr> <td colspan="2"> &nbsp; </td> </tr>
           </c:forEach>
           </table>
         </td>
       </tr>
     </table>
    <div id="bimil">
   <form name="bimil" method="post" action="../board/bimil_check.jsp">
     <input type="hidden" name="page" value="1">
     <input type="hidden" name="id">
     <input type="password" name="pwd" placeholder="비밀번호" size="5">
     <input type="submit" value="확인">
   </form>
  </div>
   </div>  <!-- id="fourth"의 끝 -->
 
<%@ include file="../bottom.jsp"%>