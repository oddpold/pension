<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
     text-align:center;
   }
   input[type=text] {
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
   textarea {
     width:400px;
     height:200px;
     border:1px solid #6799FF;
   }
   #tt {
    font-size:20px;
    color:#6799FF;
   }
</style>
  
  <div id="section">
   <div id="tt"> 공지사항 글쓰기</div> <p>
   <form method="post" action="write_ok.jsp">
     <input type="text" name="title" placeholder="제 목"> <p>
     <textarea cols="40" rows="6" name="content" placeholder="내용 작성"></textarea><p>
     <input type="submit" value="공지사항 저장">
   </form>
  
  </div>
  
<%@ include file="../bottom.jsp"%>