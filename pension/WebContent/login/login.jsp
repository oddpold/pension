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
<script>
  function view_us()
  {
	  document.getElementById("pwd_search").style.display="none";
	  document.getElementById("view_pwd").innerText="";
	  document.pwd_search.userid.value="";
	  document.pwd_search.name.value="";
	  document.pwd_search.email.value="";
	  document.getElementById("userid_search").style.display="block";
  }
  function userid_search_fn() // 이름,이메일을 가지고 서버에가서 아이디를 찾아 오기
  {
	  var name=document.userid_search.name.value;
	  var email=document.userid_search.email.value;
	  var us=new XMLHttpRequest();
	  us.open("get","userid_search_ok.jsp?name="+name+"&email="+email);
	  us.send();
	  us.onreadystatechange=function()
	  {
		  if(us.readyState==4)
		  {
		     if(us.responseText==0)
		     {
		    	 alert("이름 혹은 이메일이 틀립니다.");
		     }	 
		     else
		     {   
		    	 var imsi=us.responseText.trim();
		    	 document.getElementById("userid_search").style.display="none";
		    	 document.getElementById("view_userid").innerText="당신의 아이디는 "+imsi+" 입니다";
		     }
		  }
	  }
  }
 
  function view_ps() // 비밀번호 찾기 창 보이기
  {
	  document.getElementById("userid_search").style.display="none"; // 아이디 찾기 숨기기 
	  document.getElementById("view_userid").innerText="";
	  document.userid_search.name.value="";
	  document.userid_search.email.value="";
	  document.getElementById("pwd_search").style.display="block";
  }
  function pwd_search_fn() // 이름,이메일을 가지고 서버에가서 아이디를 찾아 오기
  {
	  var userid=document.pwd_search.userid.value;
	  var name=document.pwd_search.name.value;
	  var email=document.pwd_search.email.value;
	  var ps=new XMLHttpRequest();
	  ps.open("get","pwd_search_ok.jsp?userid="+userid+"&name="+name+"&email="+email);
	  ps.send();
	  ps.onreadystatechange=function()
	  {
		  if(ps.readyState==4)
		  {
		     if(ps.responseText==0)
		     {
		    	 alert("아이디,이름 혹은 이메일이 틀립니다.");
		     }	 
		     else
		     {   
		    	 var imsi=ps.responseText.trim();
		    	 document.getElementById("pwd_search").style.display="none";
		    	 document.getElementById("view_pwd").innerText="당신의 비밀번호는 "+imsi+" 입니다";
		     }
		  }
	  }
  }
</script>
 
  <div id="section">
    <form method="post" action="login_ok.jsp">
     <input type="text" name="userid" placeholder="아이디"> <p>
     <input type="password" name="pwd" placeholder="비밀번호"> <P>
     <input type="submit" value="로그인"> <p>
     <span onclick="view_us()"> 아이디 찾기 </span> <span onclick="view_ps()"> 비밀번호 찾기 </span>
    </form>
    <div id="view_userid"></div>
    <form name="userid_search" id="userid_search">
      <input type="text" name="name" placeholder="이름 "> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" value="아이디찾기" onclick="userid_search_fn()">
    </form>
    
    <div id="view_pwd"></div>
    <form name="pwd_search" id="pwd_search">
      <input type="text" name="userid" placeholder="아이디"> <p>
      <input type="text" name="name" placeholder="이름 "> <p>
      <input type="text" name="email" placeholder="이메일"> <p>
      <input type="button" value="비밀번호찾기" onclick="pwd_search_fn()">
    </form>
  </div>
  
<%@ include file="../bottom.jsp"%>















