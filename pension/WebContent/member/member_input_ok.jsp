<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="pension.member.MemberDao" %>    
 <%
 
      // 폼에 입력된 값을 저장(클래스의 메소드를 호출) => request
      MemberDao mdao=new MemberDao();
      mdao.member_input_ok(request,response);
 %>