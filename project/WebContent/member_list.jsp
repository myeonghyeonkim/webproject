<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>


<%
	String id=null;
	
	if ((session.getAttribute("id")==null) || 
	  (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
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
			String sql="SELECT * FROM user";
  		pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			
			
			
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 목록 보기)</title>
</head>
<body>
<center>
<table border="1" width="300">
	<tr align=center><td colspan=2>회원 목록</td></tr>
	<%while(rs.next()){%>
	<tr align=center>
		<td>
			<a href="member_info.jsp?id=<%=rs.getString("user_id") %>">
				<%=rs.getString("user_id") %>
			</a>
		</td>
		<td><a href="member_delete.jsp?id=<%=rs.getString("user_id") %>">삭제</a></td>
	</tr>
	<%} %>
</table>
</center>
</body>
</html>
