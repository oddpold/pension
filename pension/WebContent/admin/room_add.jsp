<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.reserve.ReserveDao" %>    
<%
    ReserveDao rdao=new ReserveDao();
    rdao.room_add(request,response);
%>