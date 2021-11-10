<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>    
<style>
   #section {
     width:1000px;
     height:600px;
     margin:auto;
   }
</style>
  
  <div id="section">
   <form method="post" action="write_ok.jsp">
    <table width="600" align="center">
      <caption> <h3> 게시판 글쓰기</h3></caption>
      <tr>
        <td> 제 목 </td>
        <td> <input type="text" name="title"> </td>
      </tr>
      <tr>
        <td> 작성자 </td>
        <td> <input type="text" name="name"> </td>
      </tr>
      <tr>
        <td> 내 용 </td>
        <td> <textarea cols="40" rows="5" name="content"></textarea> </td>
      </tr>
      <tr>
        <td> 성 별 </td>
        <td>  
           <input type="radio" name="sung" value="0">남자
           <input type="radio" name="sung" value="1">여자
           <input type="radio" name="sung" value="2">선택안함
        </td>
      </tr>
      <tr>
        <td> 생 일 </td>
        <td> 
           <select name="year">
            <c:forEach begin="0" end="100" var="i">
              <option value="${2021-i}"> ${2021-i} </option>
            </c:forEach>
           </select>
           <select name="month">
            <c:forEach begin="1" end="12" var="i">
              <option value="${i}"> ${i} </option>
            </c:forEach>
           </select>
           <select name="day">
            <c:forEach begin="1" end="31" var="i">
              <option value="${i}"> ${i} </option>
            </c:forEach>
           </select>
        </td>
      </tr>
      <tr>
        <td> 취 미 </td>
        <td> 
            <input type="checkbox" name="hobby" value="0">낚시
            <input type="checkbox" name="hobby" value="1">여행
            <input type="checkbox" name="hobby" value="2">운동
            <input type="checkbox" name="hobby" value="3">독서
            <input type="checkbox" name="hobby" value="4">음주
        </td>
      </tr>
      <tr>
        <td> 비밀번호 </td>
        <td> <input type="password" name="pwd"> </td>
      </tr>
      <tr>
        <td> 비밀글 </td>
        <td> <input type="checkbox" name="bimil" value="1"> 비밀글일 경우 체크하세요 </td>
      </tr>
      <tr>
        <td colspan="2" align="center"> <input type="submit" value="저장하기">  </td>
      </tr>
    </table>  
   </form>
  </div>
  
<%@ include file="../bottom.jsp"%>