<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.board.BoardDao" %>    
<%
     // 비밀번호가 맞으면 content로 ,틀리면 list
     BoardDao bdao=new BoardDao();
     bdao.bimil_check(request,response);
%>