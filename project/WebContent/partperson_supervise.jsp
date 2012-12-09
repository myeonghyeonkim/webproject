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
	
		String sql="select * from member,studygroup where member.meeting_name = studygroup.meeting_name and member.user_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,user_id);
	
		rs =pstmt.executeQuery();
}
catch(Exception e){
e.printStackTrace();
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/myinfo_main.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
		<jsp:include page="share/myinfo_header.jsp">
  	<jsp:param name="current" value="Sign Up"/>
		</jsp:include>
		<div id="supervise">
		<p>참여자 목록</p>
		
			<%while(rs.next()){ %>
			<table>
			
				<tr>
						<a href=myinfo_main.jsp?user_id=<%=rs.getString("user_id")%>><%=rs.getString("user_id") %></a>
				<tr><br/><br/>
				<%} %>
			</table>
		</div>
</body>
</html>
