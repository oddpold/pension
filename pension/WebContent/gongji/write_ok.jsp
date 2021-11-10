<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.gongji.GongjiDao" %>    
<%   // 공지내용을  테이블에 저장한 후 공지사항 list로 이동
     GongjiDao gdao=new GongjiDao();
     gdao.write_ok(request,response);
%>