<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%> 
<%@page import="pension.reserve.ReserveDao" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    int y=Integer.parseInt(request.getParameter("y"));
    int m=Integer.parseInt(request.getParameter("m"));
    int day=Integer.parseInt(request.getParameter("day"));
    
    request.setAttribute("y",y);
    request.setAttribute("m",m);
    request.setAttribute("day",day);
    
    // 현재 사용자가 요청한 방의 정보를 가져오기
    ReserveDao rdao=new ReserveDao();
    request.setAttribute("rdto",rdao.getRoom(request));
%>
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
   #section td {
     height:40px;
   }
</style>
 <script>
   function price_cal()
   {
	   // 숙박
	   var suk=document.reserve.suk.value;
	   suk=suk*${rdto.price};
	   // 인원 => 추가요금 : 10000
	   var inwon=document.reserve.inwon.value;
	   inwon=(inwon-${rdto.min})*10000;
	   // 숯불
	   var charcoal=document.reserve.charcoal.value;
	   charcoal=charcoal*15000;
	   // bbq
	   var bbq=document.reserve.bbq.value;
	   bbq=bbq*30000;
	   
	   total=suk+inwon+charcoal+bbq;
	   document.reserve.total.value=total;
	   // ,를 추가
	   total=new Intl.NumberFormat().format(total);
	   document.getElementById("total_price").innerText=total;
	   
   }
   // 로그인을 했을때 동작
  <c:if test="${userid != null}"> 
   window.onload=function()
   {
	   // 현재 로그인한 사용자의 전화번호만 가져와서 폼태그에 출력하기
	   var chk=new XMLHttpRequest();
	   chk.open("get","getphone.jsp");
	   chk.send();
	   
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
			   document.reserve.phone.value=chk.responseText;
		   }
	   }
   }
  </c:if>
  function check()
  {
	  return true;
  }
 </script>
  <div id="section">
   <form name="reserve" method="post" onsubmit="return check()" action="reserve_ok.jsp">
    <input type="hidden" name="total" value="${rdto.price}">
    <input type="hidden" name="y" value="${y}">
    <input type="hidden" name="m" value="${m}">
    <input type="hidden" name="day" value="${day}">
    <input type="hidden" name="rid" value="${rdto.id}"> <!-- room 테이블의 id -->
    <table width="500" align="center">
      <caption> <h3> ${name} 예약 하기 </h3></caption>
      <tr> <!-- 예약자 : 로그인 없이 예약-->
       <td colspan="2">
        <input type="text" name="name" value="${name}" placeholder="예약자">
        <input type="text" name="phone" placeholder="전화번호">
       </td>
      </tr>
      <tr> <!-- 숙박관련 -->
       <td>
                     입실일 : ${y}년 ${m}월 ${day}일
       </td>
       <td>
       <c:set var="rid" value="${rdto.id}"/>
       <%
           // ?년?월?일  방id  => 몇박이 가능한지를 리턴  => end값에 전달
           int chk=rdao.getsuk(y,m,day,pageContext.getAttribute("rid").toString());
           request.setAttribute("chk", chk);
       %>
        <select name="suk" onchange="price_cal()">
         <c:forEach begin="1" end="${chk}" var="i">
          <option value="${i}"> ${i}박 </option>
         </c:forEach>
        </select>
       </td>
      </tr>
      <tr> <!-- 인원관련 -->
       <td>
                     최소인원 : ${rdto.min} 최대인원 : ${rdto.max}
       </td>
       <td>
         <select name="inwon" onchange="price_cal()">
           <c:forEach var="i" begin="${rdto.min}" end="${rdto.max}">
            <option value="${i}"> ${i}명 </option>
           </c:forEach>
         </selec>
       </td> 
      </tr>
      <tr> <!-- 숯불관련 -->
       <td>
                  숯불세트 : 15,000원(세트당) 
       </td>
       <td>
         <select name="charcoal" onchange="price_cal()">
          <option value="0"> 선택 </option>
          <option value="1"> 1세트 </option>
          <option value="2"> 2세트 </option>
          <option value="3"> 3세트 </option>
          <option value="4"> 4세트 </option>
         </select>
       </td>
      </tr>
      <tr> <!-- bbq관련 -->
        <td>
         bbq세트 : 30,000원(세트당)
        </td>
        <td> 
         <select name="bbq" onchange="price_cal()">
          <option value="0"> 선택 </option>
          <option value="1"> 1세트 </option>
          <option value="2"> 2세트 </option>
          <option value="3"> 3세트 </option>
          <option value="4"> 4세트 </option>
         </select>
       </td>
      </tr>
      <tr>
       <td colspan="2" align="right">
                      총 결제금액 : <span id="total_price"><fmt:formatNumber value="${rdto.price}"/></span>원  
       </td>
      </tr>
      <tr>
       <td colspan="2" align="center">
         <input type="submit" value="예약하기">
       </td>
      </tr>
    </table>
   </form>
  </div>
  
<%@ include file="../bottom.jsp"%>






