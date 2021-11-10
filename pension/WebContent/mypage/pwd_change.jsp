<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>
<%
    MemberDao mdao=new MemberDao();
    mdao.pwd_change(request,response,session);
%>