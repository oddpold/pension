package pension.member;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import pension.util.MailSend;

public class MemberDao {
    Connection conn;
	public MemberDao() throws Exception // 생성자
	{
		// DB연결
    	Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/pension";
        conn=DriverManager.getConnection(url,"root","s3cret");		
	}
	
	// 회원가입시 값을 가져와서 member테이블에 저장
	public void member_input_ok(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 저장할 값을 가져오기
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
		String userid=request.getParameter("userid");
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		String phone=request.getParameter("phone");
		
		// 쿼리 생성
		String sql="insert into member(name,userid,email,pwd,phone,writeday) values(?,?,?,?,?,now())";
		
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, userid);
		pstmt.setString(3, email);
		pstmt.setString(4, pwd);
		pstmt.setString(5, phone);
		
		// 쿼리 실행
		pstmt.executeUpdate();
		
		// close
		pstmt.close();
		conn.close();
		
		// 이동
		response.sendRedirect("../main/index.jsp");
	}
	
	// 아이디 중복여부
	public int userid_check(HttpServletRequest request) throws Exception
	{
		String userid=request.getParameter("userid");
		
		// 쿼리 생성
		String sql="select count(*) as chk from member where userid=?";
		
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		
		// 쿼리 실행
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		
		return rs.getInt("chk");
	}
	
	// 회원체크를 하는 메소드
	// 탈퇴신청회원  복귀시키기
	public void login_ok(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception
	{
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		
		// 회원탈퇴신청을 취소하는 체크박스가 체크 되었다면 status=0;
		if(request.getParameter("re") != null)
		{
		  System.out.println("확인");
		  String sql2="update member set status=0 where userid=? and pwd=?";
		  PreparedStatement pstmt2=conn.prepareStatement(sql2);
		  pstmt2.setString(1, userid);
		  pstmt2.setString(2, pwd);
		  pstmt2.executeUpdate();
		}
		// 쿼리 생성
		String sql="select * from member where userid=? and pwd=?";
		
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		
		// 쿼리 실행
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next()) // 레코드가 있으면 true, 없으면 false
		{
		   if(rs.getInt("status")==0)
		   {
			// 세션변수를 만들기
			session.setAttribute("userid", rs.getString("userid"));
			session.setAttribute("name", rs.getString("name"));
			
			// index.jsp로 이동
			response.sendRedirect("../main/index.jsp");
		   }
		   else if(rs.getInt("status")==1)
		        {
			        response.sendRedirect("rejoin.jsp");
		        }
		        else
		        {
		        	response.sendRedirect("login.jsp");
		        }
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}
	// 탈퇴신청,탈퇴회원은 로그인 X
	public void login_ok_old(HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception
	{
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		
		// 쿼리 생성
		String sql="select * from member where userid=? and pwd=? and status=0";
		
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, pwd);
		
		// 쿼리 실행
		ResultSet rs=pstmt.executeQuery();
		
		if(rs.next()) // 레코드가 있으면 true, 없으면 false
		{
			// 세션변수를 만들기
			session.setAttribute("userid", rs.getString("userid"));
			session.setAttribute("name", rs.getString("name"));
			
			// index.jsp로 이동
			response.sendRedirect("../main/index.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}
	
	public void logout(HttpSession session, HttpServletResponse response) throws Exception
	{
		// 세션삭제
		session.invalidate();
		
		// index로 이동
		response.sendRedirect("../main/index.jsp");
	}
	
	// 아이디 찾기
	public void userid_search_ok(HttpServletRequest request,JspWriter out) throws Exception
	{
		//System.out.println("하하하");
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		// 쿼리 생성
		String sql="select userid from member where  name=? and email=?";
		
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		
		System.out.println(pstmt.toString());
		// 쿼리 실행
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) 
		{
			out.print(rs.getString("userid"));
		}
		else
		{
			out.print("0");
		}
	}
	
	// 비밀번호 찾기
	public void pwd_search_ok(HttpServletRequest request,JspWriter out) throws Exception
	{
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		System.out.println(userid+" "+name+" "+email);
		// 쿼리 생성
		String sql="select pwd from member where userid=? and name=? and email=?";
		
		// 심부름꾼 생성
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		
		// 쿼리 실행
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) 
		{
			// 이메일 보내기
			MailSend ms=MailSend.getInstance();
			String subject="현재 사이트의 비밀번호를 보내드립니다";
			String body="당신의 비밀번호는 "+rs.getString("pwd")+" 입니다";
			ms.setEmail("goalki@naver.com", subject, body);
			out.print(rs.getString("pwd"));
		}
		else
		{
			out.print("0");
		}
	}
	
	
	// 회원의 정보가져오기
	public MemberDto mypage(HttpSession session) throws Exception
	{
		String sql="select * from member where userid=?";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
        ResultSet rs=pstmt.executeQuery();
        rs.next();
        // rs => dto
        MemberDto mdto=new MemberDto();
        mdto.setId(rs.getInt("id"));
        mdto.setUserid(rs.getString("userid"));
        mdto.setName(rs.getString("name"));
        mdto.setEmail(rs.getString("email"));
        mdto.setPhone(rs.getString("phone"));
        mdto.setWriteday(rs.getString("writeday"));
        
        return mdto;
	}
	
	public void pwd_change(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception
	{
		String sql="update member set pwd=? where userid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("pwd"));
		pstmt.setString(2, session.getAttribute("userid").toString());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		session.invalidate(); // 세션을 지우고 로그인으로 이동
		response.sendRedirect("../login/login.jsp");
	}
	
	// 회원정보 수정하기
	public void my_update_ok(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String sql="update member set name=?,email=?,phone=? where userid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("email"));
		pstmt.setString(3, request.getParameter("phone"));
		pstmt.setString(4, session.getAttribute("userid").toString());
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
		response.sendRedirect("mypage.jsp");
	}
	
	
	// 전체 회원 레코드를 가져오기
	public ArrayList<MemberDto> getmember() throws Exception
	{
		String sql="select * from member order by name asc";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		ArrayList<MemberDto> list=new ArrayList<MemberDto>();
		
		while(rs.next())
		{
			MemberDto mdto=new MemberDto();
			mdto.setId(rs.getInt("id"));
			mdto.setName(rs.getString("name"));
			mdto.setUserid(rs.getString("userid"));
			mdto.setEmail(rs.getString("email"));
			mdto.setPhone(rs.getString("phone"));
			mdto.setWriteday(rs.getString("writeday"));
			mdto.setStatus(rs.getInt("status"));
			
			list.add(mdto);
		}
		
		return list;
	}
	
	// 회원탈퇴신청
	public void member_out(HttpSession session,HttpServletResponse response) throws Exception
	{
		String sql="update member set status=1 where userid=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		
		pstmt.executeUpdate();
		
		session.invalidate();
		
		pstmt.close();
		conn.close();
		
		response.sendRedirect("../main/index.jsp");
	}
	
	// 탈퇴신청 => 탈퇴로 변경
	public void member_chg(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		String sql="update member set status=2 where id=?";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		
		pstmt.executeUpdate();
		
		response.sendRedirect("member_view.jsp");
	}
}

















