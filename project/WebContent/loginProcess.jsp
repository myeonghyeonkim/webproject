<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%-- <%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>--%>
<%
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	Connection conn=null; 
	
	//Statement stmt=null; 직접sql문을 수행시킬수 있다.
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	try {
		//Class.forName("com.mysql.jdbc.Driver");//드라이버
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";
		Class.forName("com.mysql.jdbc.Driver");//드라이버
  		//Context init = new InitialContext();
  		//DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
  		
			conn=DriverManager.getConnection(url,user,user_pwd);
			String sql="SELECT * FROM user WHERE id=?";
  		pstmt=conn.prepareStatement(sql);
  		pstmt.setString(1,id);
  		rs=pstmt.executeQuery();//실제 데이터를 추출.결과데이터가 담긴다.
  		
  		
  		if(rs.next()){
  			if(pwd.equals(rs.getString("pwd"))){
  				session.setAttribute("id",id);
  				out.println("<script>");
  		  	out.println("location.href='main.jsp'");
  		  	out.println("</script>");
  			}
  		}
  		
  		out.println("<script>");
  		out.println("location.href='loginForm.jsp'");
  		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
		System.out.println("드라이버 로등실패");
 	}
%>
