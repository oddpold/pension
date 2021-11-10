package pension.reserve;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReserveDao {
   Connection conn;
   public ReserveDao() throws Exception // 생성자
   {
		// DB연결
    	Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/pension";
        conn=DriverManager.getConnection(url,"root","s3cret");		
   }
   public ArrayList<RoomDto> getRoom() throws Exception
   {
	   String sql="select * from room order by price asc";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   
	   ResultSet rs=pstmt.executeQuery();
	   
	   ArrayList<RoomDto> list=new ArrayList<RoomDto>();
	   while(rs.next()) 
	   {
		   RoomDto rdto=new RoomDto();
		   rdto.setId(rs.getInt("id"));
		   rdto.setName(rs.getString("name"));
		   rdto.setPrice(rs.getInt("price"));
		   rdto.setMax(rs.getInt("max"));
		   rdto.setMin(rs.getInt("min"));
		   
		   list.add(rdto);
	   }
	   
	   rs.close();
	   pstmt.close();
	   //conn.close();
	   
	   return list;
    }
   
   // 하나의 방의 정보를 읽어오기
   public RoomDto getRoom(HttpServletRequest request) throws Exception
   {
	   String id=request.getParameter("id");
	   
	   String sql="select * from room where id=?";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, id);
	   
	   ResultSet rs=pstmt.executeQuery();
	   rs.next();
	   
	   RoomDto rdto=new RoomDto();
	   rdto.setId(rs.getInt("id"));
	   rdto.setName(rs.getString("name"));
	   rdto.setPrice(rs.getInt("price"));
	   rdto.setMax(rs.getInt("max"));
	   rdto.setMin(rs.getInt("min"));
	   
	   return rdto;
   }
   
 
   
   // 사용자의 전화번호만 전달하기
   public String getphone(HttpSession session) throws Exception
   {
	   String sql="select phone from member where userid=?";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, session.getAttribute("userid").toString());
	   
	   ResultSet rs=pstmt.executeQuery();
	   rs.next();
	   
	   return rs.getString("phone");
   }
   
   
   // 예약 하기
   public void reserve_ok(HttpServletRequest request,HttpServletResponse response,
		   HttpSession session) throws Exception
   {
	   request.setCharacterEncoding("utf-8");
	   
	   String sql="insert into reserve(name,phone,userid,inday,outday,inwon,rid,charcoal,bbq,total,writeday)";
	   sql=sql+" values(?,?,?,?,?,?,?,?,?,?,now())";
	   
	   // userid
	   String userid=null;
	   if(session.getAttribute("userid")==null)
	   {
		   userid="guest";
	   }
	   else
	   {
		   userid=session.getAttribute("userid").toString();
	   }
	   // 입실일, 퇴실일
	   int y=Integer.parseInt(request.getParameter("y"));
	   int m=Integer.parseInt(request.getParameter("m"));
	   int day=Integer.parseInt(request.getParameter("day"));
	   int suk=Integer.parseInt(request.getParameter("suk"));
	   
	   LocalDate xday=LocalDate.of(y, m, day);
	   LocalDate yday=xday.plusDays(suk);
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, request.getParameter("name"));
	   pstmt.setString(2, request.getParameter("phone"));
	   pstmt.setString(3, userid);
	   pstmt.setString(4, xday.toString());
	   pstmt.setString(5, yday.toString());
	   pstmt.setInt(6, Integer.parseInt(request.getParameter("inwon")));
	   pstmt.setInt(7, Integer.parseInt(request.getParameter("rid")));
	   pstmt.setInt(8, Integer.parseInt(request.getParameter("charcoal")));
	   pstmt.setInt(9, Integer.parseInt(request.getParameter("bbq")));
	   pstmt.setInt(10, Integer.parseInt(request.getParameter("total")));
	   
	   pstmt.executeUpdate();
	   
	   pstmt.close();
	   conn.close();
	   
	   String name=URLEncoder.encode(request.getParameter("name"));
	   //System.out.println(name);
	   String phone=request.getParameter("phone");
	   response.sendRedirect("reserve_view.jsp?name="+name+"&phone="+phone);
   }
   
   // reserve에서 하나의 레코드를 읽어와서 리턴
   public ReserveDto reserve_view(HttpServletRequest request) throws Exception
   {
	   request.setCharacterEncoding("utf-8");
	   String name=request.getParameter("name");
	   String phone=request.getParameter("phone");
	   System.out.println(name);
	   String sql="select r1.*, r2.name as bang from reserve as r1, room r2"
	   		+ " where r1.name=? and r1.phone=? and r1.rid=r2.id order by r1.id desc limit 1";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, name);
	   pstmt.setString(2, phone);
	   
	   ResultSet rs=pstmt.executeQuery();
	   rs.next();
	   
	   ReserveDto rdto=new ReserveDto();
	   rdto.setId(rs.getInt("id"));
	   rdto.setName(rs.getString("name"));
	   rdto.setPhone(rs.getString("phone"));
	   rdto.setUserid(rs.getString("userid"));
	   rdto.setInday(rs.getString("inday"));
	   rdto.setOutday(rs.getString("outday"));
	   rdto.setInwon(rs.getInt("inwon"));
	   rdto.setRid(rs.getInt("rid"));
	   rdto.setCharcoal(rs.getInt("charcoal"));
	   rdto.setBbq(rs.getInt("bbq"));
	   rdto.setTotal(rs.getInt("total"));
	   rdto.setWriteday(rs.getString("writeday"));
	   rdto.setBang(rs.getString("bang"));
	   return rdto;
   }
   
   public int getempty(String dday, String rid) throws Exception
   {
	   String sql="select count(*) as chk from reserve ";
	   sql=sql+" where inday <= ?  and  outday > ?  and rid=?";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, dday);
	   pstmt.setString(2, dday);
	   pstmt.setString(3, rid);
	   
	   ResultSet rs=pstmt.executeQuery();
	   rs.next();
	   int chk=rs.getInt("chk");
	   
	   
	   return chk;
   }
   
   // 몇박이 가능한지 값을 리턴해주기
   public int getsuk(int y, int m, int day, String rid) throws Exception
   {
	   LocalDate xday=LocalDate.of(y, m, day);
	   int chk=0;
	   for(int i=1;i<=7;i++)
	   {
		   chk++;
		   
		   // 입실일 다음날짜가 예약 가능한 지 체크 => 예약이 불가능
		   LocalDate dday=xday.plusDays(i);
		   
		   String sql="select * from reserve where inday <= ? and outday > ?";
		   sql=sql+" and rid=?";
		   
		   PreparedStatement pstmt=conn.prepareStatement(sql);
		   pstmt.setString(1, dday.toString());
		   pstmt.setString(2, dday.toString());
		   pstmt.setString(3, rid);
		   
		   ResultSet rs=pstmt.executeQuery();
		   
		   if(rs.next())
			   break;
	   }
	   
	   return chk;
   }
   
   
   // 관리자 예약 현황 보기
   public ArrayList<ReserveDto> admin_reserve_view() throws Exception
   {
	   String sql="select r1.*, r2.name as bang from reserve as r1, room r2"
	   		+ " where r1.rid=r2.id order by r1.id desc";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   
	   ResultSet rs=pstmt.executeQuery();
	   ArrayList<ReserveDto> list=new ArrayList<ReserveDto>();
	   while(rs.next()) 
	   {
	     ReserveDto rdto=new ReserveDto();
	     rdto.setId(rs.getInt("id"));
	     rdto.setName(rs.getString("name"));
	     rdto.setPhone(rs.getString("phone"));
	     rdto.setUserid(rs.getString("userid"));
	     rdto.setInday(rs.getString("inday"));
	     rdto.setOutday(rs.getString("outday"));
	     rdto.setInwon(rs.getInt("inwon"));
	     rdto.setRid(rs.getInt("rid"));
	     rdto.setCharcoal(rs.getInt("charcoal"));
	     rdto.setBbq(rs.getInt("bbq"));
	     rdto.setTotal(rs.getInt("total"));
	     rdto.setWriteday(rs.getString("writeday"));
	     rdto.setBang(rs.getString("bang"));
	     
	     list.add(rdto);
	   }
	   
	   return list;
   }
   
   // 사용자 예약 현황 보기
   public ArrayList<ReserveDto> user_reserve_view(HttpSession session) throws Exception
   {
	   String sql="select r1.*, r2.name as bang from reserve as r1, room r2"
	   		+ " where userid=? and r1.rid=r2.id order by r1.id desc";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, session.getAttribute("userid").toString());
	   //System.out.println(pstmt.toString());
	   ResultSet rs=pstmt.executeQuery();
	   ArrayList<ReserveDto> list=new ArrayList<ReserveDto>();
	   while(rs.next()) 
	   {
	     ReserveDto rdto=new ReserveDto();
	     rdto.setId(rs.getInt("id"));
	     rdto.setName(rs.getString("name"));
	     rdto.setPhone(rs.getString("phone"));
	     rdto.setUserid(rs.getString("userid"));
	     rdto.setInday(rs.getString("inday"));
	     rdto.setOutday(rs.getString("outday"));
	     rdto.setInwon(rs.getInt("inwon"));
	     rdto.setRid(rs.getInt("rid"));
	     rdto.setCharcoal(rs.getInt("charcoal"));
	     rdto.setBbq(rs.getInt("bbq"));
	     rdto.setTotal(rs.getInt("total"));
	     rdto.setWriteday(rs.getString("writeday"));
	     rdto.setBang(rs.getString("bang"));
	     
	     list.add(rdto);
	   }
	   
	   return list;
   }
  
   
   // 관리자 방 추가
   public void room_add(HttpServletRequest request,HttpServletResponse response) throws Exception
   {
	   String sql="insert into room(name,price,min,max) values(?,?,?,?)";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, request.getParameter("name"));
	   pstmt.setString(2, request.getParameter("price"));
	   pstmt.setString(3, request.getParameter("min"));
	   pstmt.setString(4, request.getParameter("max"));
	   
	   pstmt.executeUpdate();
	   
	   pstmt.close();
	   conn.close();
	   
	   response.sendRedirect("room_view.jsp");
   }
   
   // 관리자 방 삭제
   public void room_del(HttpServletRequest request,HttpServletResponse response) throws Exception
   {
	   String sql="delete from room where id=?";
	   
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, request.getParameter("id"));
	 
	   
	   pstmt.executeUpdate();
	   
	   pstmt.close();
	   conn.close();
	   
	   response.sendRedirect("room_view.jsp");
   }
}















