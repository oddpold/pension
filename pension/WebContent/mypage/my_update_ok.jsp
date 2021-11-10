<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>    
<%
    MemberDao mdao=new MemberDao();
    mdao.my_update_ok(request, response,session);
%>