<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.tour.TourDao" %>    
<%
  if(session.getAttribute("userid")==null)
	  response.sendRedirect("../login/login.jsp");
%>
<%
    TourDao tdao=new TourDao();
    tdao.write_ok(request,response,session);
%>