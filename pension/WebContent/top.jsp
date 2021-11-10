<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   body {
     margin:0px;
   }
 
   #first {
     width:1000px;
     height:27px;
     background:#6799FF;
     margin:auto;
     color:white;
     text-align:center;
     padding-top:5px;
   }
   #second {
     width:1000px;
     height:50px;
     /* background:yellow; */
     margin:auto;
     font-size:13px;
   }
   #second #main li {
     list-style-type:none;
     display:inline-block;
     width:140px;
     padding-top:10px;
   }
   #second #main li:last-child {  /* 마지막 li태그의 가로크기를 크게 */
     width:220px;
   }
   #second #main > li {
     position:relative;
   }
   #second #main > li > .sub {          /*   :nth-child(1) */
     position:absolute;
     padding-left:0px;
     background:white;
     z-index:10;
     width:80px;
     left:-17px;
     visibility:hidden;
   }
   #second #my > .sub {    /* 마이페이지 */       
     position:absolute;
     padding-left:0px;
     background:white;
     z-index:10;
     width:80px;
     left:-10px;
     visibility:hidden;
   }
   #second #main > li .sub li {
     width:80px;
     text-align:center;
   }
   #second #my {
     display:inline-block;
     position:relative;
   }
   #fifth {
     width:1000px;
     height:100px;
     background:#6799FF;
     margin:auto;
   }
 </style>
 <script>
   function view(n)
   {
	   document.getElementsByClassName("sub")[n].style.visibility="visible";
   }
   function hide(n)
   {
	   document.getElementsByClassName("sub")[n].style.visibility="hidden";
   }
   function member_out()
   {
	   if(confirm("정말 탈퇴하시겠습니까?"))
	   {
		   location="../member/member_out.jsp";
	   }
   }
 </script>
</head>
<body>
   <div id="first"> * 오픈 이벤트로 1박을 예약하시면 2박을 더 드립니다  </div>
   <div id="second">
     <ul id="main">
       <li> <a href="../main/index.jsp"> Channy </a> </li>
       <li onmouseover="view(0)" onmouseout="hide(0)"> 펜션소개 
          <ul class="sub">
            <li> 인사말 </li>
            <li> 오는길 </li>
          </ul>
       </li>
       <li onmouseover="view(1)" onmouseout="hide(1)"> 주변관광지
          <ul class="sub">
            <li> 한라산 </li>
            <li> 백두산 </li>
            <li> 거문도 </li>
            <li> 해운대 </li>
          </ul>
       </li>
       <li onmouseover="view(2)" onmouseout="hide(2)"> 예약관련 
          <ul class="sub">
            <li> 예약안내 </li>
            <li> <a href="../reserve/reserve.jsp"> 실시간예약  </a></li>
          </ul>
       </li>
       <li onmouseover="view(3)" onmouseout="hide(3)"> 커뮤니티 
          <ul class="sub">
            <li> <a href="../gongji/list.jsp"> 공지사항 </a></li>
            <li> <a href="../board/list.jsp"> 자유게시판 </a> </li>
            <li> <a href="../tour/list.jsp"> 여행후기 </a></li>
          </ul>
       </li>
       <li>
          <!-- 로그인을 하지 않았을경우  -->
         <c:if test="${userid == null}">  
          <a href="../login/login.jsp"> 로그인 </a>
          <a href="../member/member_input.jsp"> 회원가입 </a>
         </c:if>
         <c:if test="${userid != null && userid != 'admin'}"> 
          <!-- 로그인을 한 경우 이지만 관리자가 아닐경우 -->
          ${name}님 환영!!  
          <a href="../login/logout.jsp"> 로그아웃 </a> 
          <div id="my" onmouseover="view(4)" onmouseout="hide(4)"> 마이페이지 
            <ul class="sub">
              <li> <a href="../mypage/mypage.jsp"> 회원정보 </a> </li>
              <li> <a href="../mypage/reserve_view.jsp"> 예약정보 </a> </li>
              <li> <a href="javascript:member_out()"> 회원탈퇴 </a> </li>
            </ul>
          </div>
         </c:if>
         <!-- 로그인을 하였고 관리자인 경우 -->
         <c:if test="${userid != null && userid == 'admin'}">
                       관리자!! 안녕!!
         <a href="../login/logout.jsp"> 로그아웃 </a> 
          <div id="my" onmouseover="view(4)" onmouseout="hide(4)"> 관리페이지
            <ul class="sub">
              <li> <a href="../admin/member_view.jsp"> 회원관리 </a> </li>
              <li> <a href="../admin/reserve_view.jsp"> 예약 괸리 </a> </li>
              <li> <a href="../admin/room_view.jsp"> 방 관리 </a> </li>
            </ul>
          </div>
         </c:if>
       </li>
     </ul>
   </div>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   