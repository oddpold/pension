<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
 
  <style>
   #section {
     width:1000px;
     height:600px;                    
     margin:auto;
     margin-top:100px;
     text-align:center;
   }
   input[type=text], input[type=password] {
     width:400px;
     height:40px;
     border:1px solid #6799FF;
     font-size:17px;
     color:#6799FF;
   }
   input[type=submit] , input[type=button]
   {
     width:406px;
     height:42px;
     border:1px solid #6799FF;
     font-size:17px;
     background:#6799FF;
     color:white;
   }
   
   #userid_search,#pwd_search {
     display:none;
   }
</style>
 
  <!-- rejoin.jsp -->
  <div id="section">
    <form method="post" action="login_ok.jsp">
     <input type="checkbox" name="re" value="0"> 회원탈퇴 신청을 취소 하시려면 체크하고 로그인 하세요<p>
     <input type="text" name="userid" placeholder="아이디"> <p>
     <input type="password" name="pwd" placeholder="비밀번호"> <P>
     <input type="submit" value="로그인"> <p>
       </form>
  
  </div>
  
<%@ include file="../bottom.jsp"%>