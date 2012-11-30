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
	
	String info_id=request.getParameter("id");
	
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
			String sql="SELECT * FROM user WHERE id=?";
  		pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,info_id);
			rs=pstmt.executeQuery();
			rs.next();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<head>
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
<center>


<table border=1 width=300>
	<tr align=center><td>아이디 : </td><td><%=rs.getString("id") %></td></tr>
	<tr align=center><td>비밀번호 : </td><td><%=rs.getString("pwd") %></td></tr>
	<tr align=center><td>이름 : </td><td><%=rs.getString("name") %></td></tr>
	<tr align=center><td>이메일 : </td><td><%=rs.getString("email") %></td></tr>
	<tr align=center><td>핸드폰 번호 : </td><td><%=rs.getString("call1") %></td></tr>
	
	<tr align=center><td>마이페이지url : </td><td><%=rs.getString("mypage_url") %></td></tr>
	
	<tr align=center>
		<td colspan=2><a href="member_list.jsp">리스트로 돌아가기</a></td>
	</tr>
</table>
</center>
</body>
</html>
