<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"Member","apple");

Statement stmt = conn.createStatement();

String strSQL = "DELETE FROM calendar WHERE no = " + request.getParameter("no");
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("main.jsp");
%>	
