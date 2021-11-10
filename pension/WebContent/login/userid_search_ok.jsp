<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>    
<%
    // 이름,이메일을 가져와서 쿼리 실행
    MemberDao mdao=new MemberDao();
    mdao.userid_search_ok(request,out);
%>