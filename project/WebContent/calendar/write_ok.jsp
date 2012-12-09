<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%

String user_king=request.getParameter("user_king");
String user_part=request.getParameter("user_part");
String meeting_name=request.getParameter("meeting_name");
%>
<%if(user_king == user_part){ %>
<% 
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String s_time = request.getParameter("s_hour") + ":" + request.getParameter("s_minute");
String e_time = request.getParameter("s_hour1") + ":" + request.getParameter("s_minute1");
String title = request.getParameter("title");
String position = request.getParameter("position");
String content = request.getParameter("content");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=null;
try{
String url="jdbc:mysql://localhost:3306/webpro";
String user="admin";
String user_pwd="aldks12";		
conn = DriverManager.getConnection(url, user, user_pwd);

Statement stmt = conn.createStatement();

String strSQL = "INSERT INTO calendar (year,month,day,title,s_time,e_time,position,content) VALUES('";
strSQL = strSQL + year + "','";
strSQL = strSQL + month + "','";
strSQL = strSQL + day + "','";
strSQL = strSQL + title + "','";
strSQL = strSQL + s_time + "','";
strSQL = strSQL + e_time + "','";
strSQL = strSQL + position + "','";
strSQL = strSQL + content + "')";

}
catch(Exception e){
	e.printStackTrace();
}

int imonth = Integer.parseInt(month);

response.sendRedirect("main.jsp?year=" + year + "&month=" + (imonth - 1));
%>

<%
}
	else{%>
	<script language="javascript">
	alert("개설자만 쓸 수 있습니다.");
	document.location="index.jsp?meeting_name=<%=meeting_name%>";
	</script>
<%}%>