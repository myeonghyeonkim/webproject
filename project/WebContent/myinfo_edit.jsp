<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%		
	request.setCharacterEncoding("utf-8");

	String u_id = (String)session.getAttribute("id");

	String id="";
	String name = "";
	String password = "";
	String phone = "";
	String email = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;		
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch (ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}	
	
	try{
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";		
		conn = DriverManager.getConnection(url, user, user_pwd);

		String sql = "SELECT * FROM user WHERE user_id= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u_id);

		rs = pstmt.executeQuery();

		if(rs.next()){
			id = rs.getString("user_id");
			name = rs.getString("name");
			password = rs.getString("pwd");
			phone = rs.getString("phone");
			email = rs.getString("email");
		}
%>    
<script>
	function check(){
		var check = document.getElementById("myinfo_password_check");
		
		if(!check.name.value){
			alert("이름을 입력하세요");
			return check.name.focus();
		} 
		
		if(!check.password.value){
			alert("비밀번호를 입력하세요");
			return check.password.focus();
		} 

		if(!check.phone.value){
			alert("전화번호를 입력하세요");
			return check.phone.focus();
		}

		if(!check.email.value){
			alert("이메일을 입력하세요");
			return check.email.focus();
		}

		var check_again = confirm("수정하시겠습니까?");

		if(check_again){
			myinfo_password_check.submit();
		}		
	}
</script>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
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
	<div>

		<% if(session.getAttribute("id") !=null) { %>
		
		<form id="myinfo_password_check" method="post" action="myinfo_edit_ok.jsp">
			<table border="0" width="600" align="center">
				<tr>
					<td width="200" align="center">id : </td>
					<td>&nbsp;&nbsp;&nbsp;<font face="맑은 고딕"><%=id%></font></td>
				</tr>
				
				<tr>
					<td width="200" align="center">이름  : </td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="text" name="name" value="<%=name%>" onclick='value=""'></font></td>
				</tr>

				<tr>
					<td width="200" align="center">비밀번호  : </td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="password" name="password" value="<%=password%>" onclick='value=""'></font></td>
				</tr>

				<tr>
					<td width="200" align="center">핸드폰 번호  : </td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="text" name="phone" value="<%=phone%>" onclick='value=""'></font></td>
				</tr>

				<tr>
					<td width="200" align="center">이메일  : </td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="text" name="email" value="<%=email%>" onclick='value=""'></font></td>
				</tr>
						
		</table><p>

		<div align="center">
			<input type="button" value="수정" onclick="check()">
		</div>
		</form>

		<% } %>
	</div>
	<jsp:include page="share/footer.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>
	</body>
	</html>

<%
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null) try{rs.close();} catch(Exception e){}
	if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
	if(conn!=null) try{conn.close();} catch(Exception e){}
}
%>