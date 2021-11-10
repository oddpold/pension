<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>    
<%
     // 아이디,비번을 가져와서 사용자테이블을 검색하여 맞는지 여부를 검사
     // 회원이 맞으면 => 세션변수를 생성 => index.jsp
     // 회원이 틀리면 => 다시 로그인을 할 수있게 => login.jsp
     
     // Dao에 있는 메소드를 통해 처리
     MemberDao mdao=new MemberDao();
     mdao.login_ok(request,session,response);
%>