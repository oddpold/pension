<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.gongji.GongjiDao" %>    
<%
    // 해당 레코드의 조회수만 증가시키고 content로 이동
    GongjiDao gdao=new GongjiDao();
    gdao.readnum(request,response);
%>