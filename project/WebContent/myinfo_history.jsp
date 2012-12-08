<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
		request.setCharacterEncoding("utf-8");
		String id=(String)session.getAttribute("id");
		
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

	String sql = "SELECT * FROM studygroup,member where studygroup.meeting_name = member.meeting_name and member.user_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
}
catch(Exception e){
e.printStackTrace();
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="css/myinfo_history.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="share/myinfo_header.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>
	
	<div class="hero-unit">
		<p>내가 참여한 목록</p>
		
		<div id="history">
		<%while(rs.next()) { %>
			<div id="history_1">
				<div id="history_photo1">
					<img src ="<%=rs.getString("group_image")%>" width="100" height="100">
				</div>
				<div id="history_content1">
					<p>모임제목 : <%=rs.getString("meeting_subject")%></p>
					<p>접수기간 : <%=rs.getString("sign_day_start")%><%=rs.getString("sign_time_start") %>
											부터 <%=rs.getString("sign_day_end") %><%=rs.getString("sign_time_end") %></p>
					<p>모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start") %>
										부터 <%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %>
					</p> 
					
				<p>모임장소 : <%=rs.getString("meeting_place") %></p>
				
					<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name") %>">
				<button type="submit">페이지로가기</button>
				</a>
				<a href="partperson_minus.jsp?meeting_name=<%=rs.getString("meeting_name")%>&user_id=<%=id%>">
				<button type="submit">참여취소</button>
				</a>
				</div>
			</div>
		<hr/>
		<%} %>
		</div>
</div>
	<jsp:include page="share/footer.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>
</body>
</html>
