<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.board.BoardDao" %>    
<%
     // 해당 레코드의 조회수를 1증가 시킨후 content로 이동
     BoardDao bdao=new BoardDao();
     bdao.update_ok(request,response);
%>