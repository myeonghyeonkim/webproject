<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<title>STUDY-MEETING</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="top_left">
			<p>우리들의 스터디공간</p>
			<p>STUDY-MEETING</p>
			</div>
			<div id="top_right"> 
				<br/>
				<br/>
				<br/>
				<p>내정보관리	QNA</p>

			</div>
		</div>
		<div id="body">
			<div id="body_1"></div>
			<div id="body_2">
				<form name="loginform" action="loginProcess.jsp" method="post">
				<center>
				<table border=1>
				<tr>
		<td colspan="2" align=center>
			<b><font size=5>로그인 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" name="id"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="pwd"/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
			<a href="joinForm.jsp">회원가입</a>
		</td>
	</tr>
</table>
</center>
</form>
				</div>
			<div id="body_3"></div>
			<div id="body_4"></div>
			<div id="body_5"></div>
		</div>
		<div id="bottom">
			<h1>COPY RIGHT</h1>
			우리사이트의 copyriht는 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx입니다.
		</div>
	</div>
</body>
</html>