<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn =null;

String url="jdbc:mysql://localhost:3306/webpro";
String user="admin";
String user_pwd="aldks12";		
conn = DriverManager.getConnection(url, user, user_pwd);

Statement stmt = conn.createStatement();

String strSQL = "DELETE FROM calendar WHERE no = " + request.getParameter("no");
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("main.jsp");
%>	
