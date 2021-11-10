<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  if(session.getAttribute("userid")==null)
	  response.sendRedirect("../login/login.jsp");
%>    
<%@page import="pension.tour.TourDao" %>    
<%
    // 파일을 업로드하고 수정을 한 후 => content로 이동
    TourDao tdao=new TourDao();
    tdao.update_ok(request,response);
%>