<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<script>
    function drop(){

		var drop_again = confirm("탈퇴 하십니까?");
	
		if(drop_again){
			var url="myinfo_delete_ok.jsp";
		}
	}
</script>
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
	<br/>
	<br/>
	<br/>
	<br/>
	<div>
	<p>회원탈퇴하시면 가지고 계시던 정보는 모두 사라집니다.</p>
	<form action ="myinfo_delete_ok.jsp" method="post">
	<input type="button" value="탈퇴" onclick="drop()">
	</form>
	</div>
		<br/>
	<br/>
	<br/>
	<br/>
	<jsp:include page="share/footer.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>
</body>
</html>