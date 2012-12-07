<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
 		String user_id=request.getParameter("user_id");
 		String meeting_name=request.getParameter("meeting_name");
 		Connection conn=null;
 		PreparedStatement pstmt=null;
 		ResultSet rs=null;
 		
 		String message = "";
 		
 		try{
 			Class.forName("com.mysql.jdbc.Driver");
 		}
 		catch(ClassNotFoundException e){
 			e.printStackTrace();
 			System.out.println("드라이버 로딩 실패");
 		}	
 		
 		try{
 			String url="jdbc:mysql://localhost:3306/webpro";
 			String user="admin";
 			String user_pwd="aldks12";		
 			conn = DriverManager.getConnection(url, user, user_pwd);
			
 			String sql="DELETE FROM member WHERE user_id=? and meeting_name=?";
 			pstmt=conn.prepareStatement(sql);
 			pstmt.setString(1,user_id);
 			pstmt.setString(2,meeting_name);
 			pstmt.executeUpdate();
 %>
<script language="javascript">
	alert("참여취소되었습니다.");
	document.location="meeting_page.jsp";
</script>
<%
		}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(Exception e){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
		if(conn!=null) try{conn.close();} catch(Exception e){}
	}
%>