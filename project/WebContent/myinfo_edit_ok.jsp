<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<%		
	request.setCharacterEncoding("utf-8");

	String user_id = (String)session.getAttribute("id");

	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");

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

		String sql = "update user set name=?,pwd=?,phone=?,email=? where user_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3,phone);
		pstmt.setString(4,email);
		pstmt.setString(5,user_id);
		pstmt.executeUpdate();
	

%>
<script language="javascript">
	alert("회원정보가 수정완료되었습니다.");
	document.location="myinfo_main.jsp";
</script>
<%
}catch(Exception e){
	System.out.println("드라이버 로딩 실패");
}
finally{
	if(rs!=null) try{rs.close();} catch(Exception e){}
	if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
	if(conn!=null) try{conn.close();} catch(Exception e){}
}
%>