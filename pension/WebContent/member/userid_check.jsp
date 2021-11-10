<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>    
<%
    // 사용자가 입력한 아이디를 테이블에 검색하여 존재하는지 없는지를 전달
    MemberDao mdao=new MemberDao();
    int chk=mdao.userid_check(request);
    out.print(chk);  
%>