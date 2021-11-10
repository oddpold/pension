package pension.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import pension.board.BoardDto;
import pension.gongji.GongjiDto;
import pension.tour.TourDto;

public class MainDao {
	Connection conn;
	public MainDao() throws Exception // 생성자
	{
		// DB연결
    	Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/pension";
        conn=DriverManager.getConnection(url,"root","s3cret");		
	}
	
	public ArrayList<GongjiDto> getgongji() throws Exception
	{
		String sql="select * from gongji order by id desc limit 5";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<GongjiDto> list=new ArrayList<GongjiDto>();
		while(rs.next())
		{
			GongjiDto gdto=new GongjiDto();
		    gdto.setId(rs.getInt("id"));
		    gdto.setTitle(rs.getString("title"));
		    gdto.setWriteday(rs.getString("writeday"));
		    list.add(gdto);
		} 

	    return list;
	}
	
	public ArrayList<BoardDto> getboard() throws Exception
	{
		String sql="select * from board order by id desc limit 5";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<BoardDto> list=new ArrayList<BoardDto>();
		while(rs.next())
		{
			BoardDto bdto=new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setTitle(rs.getString("title"));
			bdto.setBimil(rs.getInt("bimil"));
			bdto.setWriteday(rs.getString("writeday"));
		    list.add(bdto);
		} 

	    return list;
	}
	
	public ArrayList<TourDto> gettour() throws Exception
	{
		String sql="select * from tour order by id desc limit 5";
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet rs=pstmt.executeQuery();
		
		ArrayList<TourDto> list=new ArrayList<TourDto>();
		while(rs.next())
		{
			TourDto tdto=new TourDto();
			tdto.setId(rs.getInt("id"));
			tdto.setTitle(rs.getString("title"));
			tdto.setWriteday(rs.getString("writeday"));
		    list.add(tdto);
		} 

	    return list;
	}
	
	
}
