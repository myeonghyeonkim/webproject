<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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
		Class.forName("com.mysql.jdbc.Driver");//����̹�
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
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ��� ����)</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center><td colspan=2>ȸ�� ���</td></tr>
	<%while(rs.next()){%>
	<tr align=center>
		<td>
			<a href="member_info.jsp?id=<%=rs.getString("id") %>">
				<%=rs.getString("id") %>
			</a>
		</td>
		<td><a href="member_delete.jsp?id=<%=rs.getString("id") %>">����</a></td>
	</tr>
	<%} %>
</table>
</center>
</body>
</html>
