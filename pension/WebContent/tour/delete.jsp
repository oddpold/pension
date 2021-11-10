<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.tour.TourDao" %>    
<%
     // 해당 레코드 삭제후 list로 이동
     TourDao tdao=new TourDao();
     tdao.delete(request,response);
%>