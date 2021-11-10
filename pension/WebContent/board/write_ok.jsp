<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.board.BoardDao" %>    
<%
     // 글을 저장하고 list로 이동
     BoardDao bdao=new BoardDao();
     bdao.write_ok(request,response);
%>