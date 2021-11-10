<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.reserve.ReserveDao" %>
<%
    ReserveDao rdao=new ReserveDao();
    String phone=rdao.getphone(session);
    out.print(phone);
%>