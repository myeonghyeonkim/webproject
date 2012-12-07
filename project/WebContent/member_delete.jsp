<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
	String id=null;
	
	if ((session.getAttribute("id")==null) || 
	  (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	}
	
	String delete_id=request.getParameter("id");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";
		Class.forName("com.mysql.jdbc.Driver");//드라이버
  		//Context init = new InitialContext();
  		//DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
  		
			conn=DriverManager.getConnection(url,user,user_pwd);
			String sql="DELETE FROM user WHERE user_id=?";
  		pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,delete_id);
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("location.href='member_list.jsp'");
			out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(Exception e){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
		if(conn!=null) try{conn.close();} catch(Exception e){}
	}
%>
