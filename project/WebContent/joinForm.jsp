<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html>
<head>
	<meta charset="utf-8">
	<link href="css/joinForm.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<title>회원관리 시스템 회원가입 페이지</title>
</head>
<body>
	<jsp:include page="share/join_header.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>

  <div id="join">
  <div class="hero-unit">
	<form name="joinform" action="joinProcess.jsp" method="post">
	<table border=1>
		<tr>
			<td colspan="2" align=center>
				<b><font size=5>회원가입 페이지</font></b>
			</td>
		</tr>
		<tr><td>아이디 : </td><td><input type="text" name="id" placeholder="아이디"/></td></tr>
		<tr><td>비밀번호 : </td><td><input type="password" name="pwd" placeholder="비밀번호"/></td></tr>
		<tr><td>이름 : </td><td><input type="text" name="name"placeholder="이름"/></td></tr>
		<tr><td>이메일 : </td><td><input type="text" name="email" placeholder="이메일"/></td></tr>
		<tr><td>핸드폰번호 : </td><td><input type="text" name="call1" size="3"/>&nbsp;-&nbsp; 
								<input type="text" name="call2" size="4" />&nbsp;-&nbsp;
								<input type="text" name="call3" size="4" /></td></tr>
	
		<tr><td>내정보 관리페이지  : </td><td><input type="text" name="mypage_url" size="30"  placeholder="페이지"></td></tr>	
		<tr>
			<td colspan="2" align=center>
				<a href="javascript:joinform.submit()" class="btn btn-primary btn-large">회원가입</a>&nbsp;&nbsp;
				<a href="javascript:joinform.reset()" class="btn btn-primary btn-large">다시작성</a>
				
			</td>
		</tr>
	</table>
	</form>
</div>
</div>
</div>
	<jsp:include page="share/footer.jsp">
  <jsp:param name="current" value="Sign Up"/>
	</jsp:include>
</body>
</html>
