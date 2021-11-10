<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
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
<script>
  function check()  // 중복확인을 클릭하면 사용자가 입력한 아이디의 중복여부를 체크하여 알려주는 함수
  {
	  var chk=new XMLHttpRequest();
	  var userid=document.mem.userid.value;
	  chk.open("get","userid_check.jsp?userid="+userid);
	  chk.send();
	  
	  chk.onreadystatechange=function()
	  {
		  if(chk.readyState==4) // 완료된 상태
		  {
			  //alert(chk.responseText); // 서버에서 가져오는 값
			  if(chk.responseText==1)
			  {
				  document.getElementById("uk").innerText="사용 불가능 아이디";
				  document.getElementById("uk").style.color="red";
			  }
			  else
			  {
				  document.getElementById("uk").innerText="사용 가능 아이디";
				  document.getElementById("uk").style.color="blue";
			  }	  
		  }	  
	  }
  }
</script>
  
  <div id="section"> 
    <form name="mem" method="post" action="member_input_ok.jsp">
     <table width="600" align="center">
       <caption> <h3> 회 원 가 입</h3></caption>
       <tr align="center"> 
         <td> <input type="text" name="name" placeholder="이 름"> </td>
         <td width="90"> &nbsp; </td>
       </tr>
       <tr align="center"> 
         <td> <input type="text" name="userid" placeholder="아 이 디"> 
              <br> <span id="uk"></span>
         </td>
         <td> <input type="button" onclick="check()" value="중복확인"> </td>
       </tr>
       <tr align="center"> 
         <td> <input type="password" name="pwd" placeholder="비밀번호"> </td>
         <td> &nbsp; </td>
       </tr>
       <tr align="center"> 
         <td> <input type="password" name="pwd2" placeholder="비밀번호확인"> </td>
         <td> &nbsp; </td>
       </tr>
       <tr align="center"> 
         <td> <input type="text" name="email" placeholder="이 메 일"> </td>
         <td> &nbsp; </td>
       </tr>
       <tr align="center"> 
         <td> <input type="text" name="phone" placeholder="전화번호"> </td>
         <td> &nbsp; </td>
       </tr>
       <tr align="center"> 
         <td> <input type="submit" value="회원가입"> </td>
         <td> &nbsp; </td>
       </tr>
     </table>   
    </form>
   </div>
  
<%@ include file="../bottom.jsp"%>