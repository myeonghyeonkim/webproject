<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%		
	request.setCharacterEncoding("utf-8");

	String drop_id = (String)session.getAttribute("id");
			
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	String message = "";

	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}	
	
	try{
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";		
		conn = DriverManager.getConnection(url, user, user_pwd);

		String sql="DELETE FROM user WHERE user_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,drop_id);
		pstmt.executeUpdate();

		}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}		
		conn.close();
	}
%>
<%
	session.invalidate();
%>
<script>
window.opener.location="index.jsp";
</script>
