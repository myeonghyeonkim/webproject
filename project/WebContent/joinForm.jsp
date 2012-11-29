<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>회원관리 시스템 회원가입 페이지</title>
</head>
<body>
<form name="joinform" action="joinProcess.jsp" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>회원가입 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" name="id"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="pwd"/></td></tr>
	<tr><td>이름 : </td><td><input type="text" name="name"/></td></tr>
	
	<tr><td>핸드폰번호 : </td><td><input type="text" name="call1"
							size="4" />&nbsp;-&nbsp; <input type="text" name="call2" size="4" />&nbsp;-&nbsp;
							<input type="text" name="call3" size="4" /></td></tr>
	
	<tr><td>내정보 관리페이지  : </td><td><input type="text" name="mypage_url" size=30/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:joinform.submit()">회원가입</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()">다시작성</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>
