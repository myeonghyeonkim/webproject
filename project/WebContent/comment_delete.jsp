<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%		
	request.setCharacterEncoding("utf-8");

	String user_id=request.getParameter("user_id");
	String meeting_name=request.getParameter("meeting_name");
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

		String sql="DELETE FROM comment WHERE user_id=? and meeting_name=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1,user_id);
		pstmt.setString(2,meeting_name);
		pstmt.executeUpdate();
		response.sendRedirect("meeting_page.jsp?meeting_name=" + meeting_name+"&user_id"+user_id);


%>
<script language="javascript">
	alert("댓글이 삭제 되었습니다.");
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
<%
	session.invalidate();
%>