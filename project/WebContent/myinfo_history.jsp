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

	String sql = "SELECT * FROM user,member where user.user_id=member.user_id and member.user_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
}
catch(Exception e){
e.printStackTrace();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="history">
		<%while(rs.next()) { %>
		<div id="history_parti">
				<p>내가 참여한 목록</p>
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
				</div>
		</div>
		<hr/>
		<%} %>
<%
		String sql1 = "SELECT * FROM user,studygroup where user.user_id=studygroup.user_id and studygroup.user_id = ?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
%>
	<div id="history_king">
			<%while(rs.next()) { %>
		<div id="history_content">
				<p>내가 참여한 목록</p>
				<div id="history_photo2">
				<img src ="<%=rs.getString("group_image")%>" width="100" height="100">
				</div>
				<div id="history_content2">
				<p>모임제목 : <%=rs.getString("meeting_subject")%></p>
				<p>접수기간 : <%=rs.getString("sign_day_start")%><%=rs.getString("sign_time_start") %>
										부터 <%=rs.getString("sign_day_end") %><%=rs.getString("sign_time_end") %></p>
				<p>모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start") %>
										부터 <%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %>
				</p> 
					
				<p>모임장소 : <%=rs.getString("meeting_place") %></p>
				</div>
		</div>
		<hr/>
		<%} %>
	</div>
</div>
</body>
</html>
<%
}
	finally{
	if(rs!=null) try{rs.close();} catch(Exception e){}
	if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
	if(conn!=null) try{conn.close();} catch(Exception e){}
}
%>