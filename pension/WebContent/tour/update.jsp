<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<c:if test="${userid == null}">
  <c:redirect url="../login/login.jsp"/>
</c:if>
<%@page import="pension.tour.TourDao" %>
<%@page import="pension.tour.TourDto" %>    
<%
     // 하나의 레코드를 읽어와서 폼태그에 넣기
     TourDao tdao=new TourDao();
     TourDto tdto=tdao.update(request);
     
     request.setAttribute("tdto", tdto);
%>
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
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
    	  $(".fname").eq(size-1).remove();
    	  size--;
        }
    }
    function check(form)
    {
    	var chk=document.getElementsByClassName("chk"); 
    	var str=""; // 체크가 안된 그림파일명만 저장하기 위한 변수
    	var del="";
    	for(i=0;i<chk.length;i++)
    	{
    		if(!chk[i].checked)
    		{
    			str=str+chk[i].value+",";  // "b1.jpg , b2.jpg ,"
    		}
    		else
    		{   // 체크가 된 file의 이름
    			del=del+chk[i].value+",";
    		}	
    	}
    	//alert(str);
    	form.imsi.value=str;
    	form.del.value=del;
    	return true;
    }
    
    function hideimg(tt,n)
    {
    	if(tt.checked)
    	{
    		document.getElementsByClassName("img")[n].style.opacity="0.3";
    	}	
    	else
    	{
    		document.getElementsByClassName("img")[n].style.opacity="1";
    	}
    }
    function chk_check(n)
    {
    	
    	document.getElementsByClassName("chk")[n].checked=true;
    	if(document.getElementsByClassName("chk")[n].checked)
    	{
    		document.getElementsByClassName("img")[n].style.opacity="0.3";
    	}	
    	else
    	{
    		document.getElementsByClassName("img")[n].style.opacity="1";
    	}	
    }
 </script>
  <div id="section">
   <form onsubmit="return check(this)" method="post" action="update_ok.jsp" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${tdto.id}">
    <input type="hidden" name="imsi">
    <input type="hidden" name="del">
    <table width="500" align="center">
      <caption> <h3> 여 행 후 기 수정 </h3></caption>
      <tr>
        <td> 제 목 </td>
        <td> <input type="text" name="title" size="40" value="${tdto.title}"> </td>
      </tr>
      <tr>
        <td> 내용 </td>
        <td> <textarea cols="40" rows="7" name="content">${tdto.content}</textarea> </td>
      </tr>
      <tr>
        <td> 사진 </td>
        <td> 
         <!-- 기존 사진 출력 -->
         <c:set var="i" value="0"/>
         <c:forEach items="${tdto.fname2}" var="fname">
         <c:if test="${fname !=''}">
          <img src="img/${fname}" width="60" class="img" onclick="chk_check(${i})">
          <input type="checkbox" onclick="hideimg(this,${i})" name="chk" value="${fname}" class="chk">
          <c:set var="i" value="${i+1}"/>
         </c:if>
         </c:forEach>
         <div id="image">  
          <input type="button" onclick="add()" value="사진추가">
          <input type="button" onclick="del()" value="사진삭제">  
          <p class="fname"> <input type="file" name="fname1"> </p>
         </div> 
        </td>
      </tr>
      <tr align="center">
        <td colspan="2"> <input type="submit" value="수정"> </td>
      </tr>
    </table>
   </form>
  
  </div>
  
<%@ include file="../bottom.jsp"%>