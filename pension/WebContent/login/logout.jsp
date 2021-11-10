<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>    
<%
    // 현재회원의 세션을 지우고 index.jsp로 이동
    MemberDao mdao=new MemberDao();
    mdao.logout(session,response);
%>