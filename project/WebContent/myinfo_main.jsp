<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<%
	request.setCharacterEncoding("utf-8");
	String user_id = (String) session.getAttribute("id");
  //String user_name="";
	//String user_phone1="";
	//String user_phone2="";
	//String user_phone3="";
	//String user_email="";
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	//String image_path = "사진등록안햇을경우 기본적으로 띄워줄 그림 파일 경로";
	String image_path="";
	try {
		Class.forName("com.mysql.jdbc.Driver");//드라이버
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";
		
  		//Context init = new InitialContext();
  		
  		
			conn=DriverManager.getConnection(url,user,user_pwd);
			String sql="SELECT * FROM user WHERE user_id=?";
  		pstmt=conn.prepareStatement(sql);
  		pstmt.setString(1,user_id);
  		
			rs=pstmt.executeQuery();
			if(rs.next()){
				image_path = rs.getString("photo");
			}
			
			
	}catch(Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html>
<head>
<%-- <script language="javascript">
	function logOut() {
		document.location = "logout.jsp";
	}

	function find_id() {
		document.location = "find_id.jsp";
	}
</script>--%>
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
	<div id="mypage_wrap">
		<div id="mypage_photo1">
		<img src="<%=image_path %>"/>
		</div>
		<div id="mypage_photo2">
		<form action="myinfo_photo.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="image" value="찾기"><p>
		<input type="submit" value="전송">
		</form>
		  
		</div>
		<div id="mypage_main">
			
			<h3>	이름 : <%=rs.getString("name") %><br/></h3>
			<h3>	핸드폰 번호 : <%=rs.getString("call1") %><br/></h3>
			<h3>	이메일 : <%=rs.getString("email") %><br/></h3>
				
		</div>
	</div>
	<jsp:include page="share/footer.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>
</body>

</html>
