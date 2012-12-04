<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.lang.*" %>
  
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STUDY-MEETING</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
	<script src="js/jquery-1.8.2.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
<script language="javascript">
	function logOut() {
		document.location = "logout.jsp";
	}

	function findIdPw() {
		document.location = "find_id.jsp";
	}
</script>
</head>
<body>

	<div id="wrap">
		<div id="top">
			<div id="top_left">
			<h1>우리들의 스터디공간</h1>
			<h1>S T U D Y - M E E T I N G</h1>
			</div>
			<div id="top_right"> 

			</div>
			
			

				<br/>
				<br/>
				<br/>
				<p><a href="myinfo_main.jsp">내정보관리</a></p>
				<p>QNA</p>
			</div>
		</div>
		
		<div id="body">
			<div id="body_1"></div>
			<div id="body_2">
				 <div id="login_state">
					<% 
						if(session.getAttribute("id") != null && ((String)session.getAttribute("id")).equals("admin")) {
					%>
					<div id="login_admin">
						<h3><%=session.getAttribute("id")%> 로 로그인하셨습니다.</h3>
						<a href="member_list.jsp">관리자모드 접속(회원 목록 보기)</a>
						<input type="button" class="logout" value="logout"
							onclick="logOut()">
					</div> 
					
					<% }
						else if (session.getAttribute("id") != null) {
					%>
					<div id="login_after">
							
							<h3><%=session.getAttribute("id")%>
							님 로그인.
							</h3>
							<input type="button" class="logout" value="logout"
							onclick="logOut()">
							
							<br/>
							<br/>
							
					</div>
					<div>
								<form action ="meeting_create.jsp" method="post">
								<a href="meeting_create.jsp">모임 개설하기</a>
								</form>
					</div>
					<% 
							
						} else {
					%>
					
					<div id="login_before">
					<form name="loginform" action="loginProcess.jsp" method="post">
				
						<table border="1">
						<tr>
						<td colspan="2" align=center>
						<b><font size=5>로그인 페이지</font></b>
						</td>
						</tr>
				
						<tr><td>아이디 : </td><td><input type="text" name="id" placeholder="아이디"/></td></tr>
						<tr><td>비밀번호 : </td><td><input type="password" name="pwd" placeholder="비밀번호"/></td></tr>
						<tr>
						<td colspan="2" align=center>
						<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;
						<a href="joinForm.jsp">회원가입</a>
						</td>
						</tr>
						<tr>
						<td colspan="2" align=center>
						<a href="meeting_create.jsp">모임 개설하기</a>
						</td>
						
						</tr>
						</table>
				
				</form>
				</div>
				<%} %>
				</div>
				</div>
				
			<div id="body_3">
				<div id="body3_sub1">
					
				</div>
				<div id="body3_sub2">
					<div id="body3_sub2_1">
					</div>
					<div id="body3_sub2_2">
					</div>
				</div>
			</div>	
			<div id="body_4"></div>
			<div id="body_5">
				<div id="body5_sub1">
				</div>
				<div id="body5_sub2">
					<div id="body5_sub2_1">
					</div>
					<div id="body5_sub2_2">
					</div>
					<div id="body5_sub2_3">
					</div>
										
				</div>
			</div>
			

		</div>
		<div id="bottom">
			<h1>COPY RIGHT</h1>
			우리사이트의 copyriht는 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx입니다.
		</div>
	</div>
</body>
</html>