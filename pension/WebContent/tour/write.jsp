<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  if(session.getAttribute("userid")==null)
	  response.sendRedirect("../login/login.jsp");
%>
<%@ include file="../top.jsp"%>
    
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
 
 <script>
    var size=1;  
    function add()
    {
    	size++;
    	var img=document.getElementById("image");
    	var inner="<p class='fname'> <input type='file' name='fname"+size+"'> </p>";
    	img.innerHTML=img.innerHTML+inner;
    	
    }
    function del()
    {
        if(size>1)
        {	
    	  document.getElementsByClassName("fname")[size-1].remove();
    	  size--;
        }
    }
 </script>
  <div id="section">
   <form method="post" action="write_ok.jsp" enctype="multipart/form-data">
    <table width="500" align="center">
      <caption> <h3> 여 행 후 기 </h3></caption>
      <tr>
        <td> 제 목 </td>
        <td> <input type="text" name="title" size="40"> </td>
      </tr>
      <tr>
        <td> 내용 </td>
        <td> <textarea cols="40" rows="7" name="content"></textarea> </td>
      </tr>
      <tr>
        <td> 사진 </td>
        <td id="image"> 
          <input type="button" onclick="add()" value="사진추가">
          <input type="button" onclick="del()" value="사진삭제">  
          <p class="fname"> <input type="file" name="fname1"> </p>
          
        </td>
      </tr>
      <tr align="center">
        <td colspan="2"> <input type="submit" value="저장"> </td>
      </tr>
    </table>
   </form>
  </div>
  
<%@ include file="../bottom.jsp"%>









