<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<%		
	request.setCharacterEncoding("utf-8");

	String user_id = (String)session.getAttribute("id");

	String membershipNumber="";
	String name = "";
	String password = "";
	String mobile = "";
	String email = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;		
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	catch (ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}	
	
	try{
		String jdbcUrl = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		String userId = "DBP4";
		String userPass = "DBPDBP";			
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

		String sql = "SELECT * FROM 회원 WHERE 멤버십번호 = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);

		rs = pstmt.executeQuery();

		if(rs.next()){
			membershipNumber = rs.getString("멤버십번호");
			name = rs.getString("회원이름");
			password = rs.getString("비밀번호");
			mobile = rs.getString("전화번호");
			email = rs.getString("이메일");
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

		if(!check.mobile.value){
			alert("전화번호를 입력하세요");
			return check.mobile.focus();
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

	function drop(){

		var drop_again = confirm("탈퇴 하십니까?");
	
		if(drop_again){
			var url="user_drop.jsp";
			window.open(url,"post","width=300,height=150");
		}
	}
</script>
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>MJ Train</title>
	<link href="styles.css" rel="stylesheet" type="text/css" />
	<link rel="icon" href="images/icon.ico" />

	<script type="text/javascript">

	</script>
	</head>

	<body>
	<div id="headWrap">
	 <div id="headpanel">
	  <div id="logo"><h1>MJT</h1><h2>MyongJi Train</h2></div>
	  <div id="quots">Neque porro quisquam est qui , consectetur, adipisci velit..."</div>
	  <div id="menu">
	   <ul>
		<li><a href="index.jsp">Home</a></li>
		<li><div class="gap"></div></li>
		<li><a href="Unhang.jsp">Reservation</a></li>
		<li><div class="gap"></div></li>
		<li><a href="station.jsp">Station</a></li>
		<li><div class="gap"></div></li>
		<li><a href="Myinfo_index.jsp">My info</a></li>
	   </ul>
	  </div>
	 </div>
	</div>
	<div id="contentWrap">
	 <div id="contentPanel">
		<!-- contents -->
		
			<div id="title">
				<h2>MyInfo</h2>
			</div>
			</br></br></br>

		<% if(session.getAttribute("id") !=null) { %>
		
		<form id="myinfo_password_check" method="post" action="myinfo_modify.jsp">
			<table border="0" width="600" align="center">
				<tr>
					<td width="200" align="center"><img src="./images/id.png" width="150" height="25" alt="id"/></td>
					<td>&nbsp;&nbsp;&nbsp;<font face="맑은 고딕"><%=membershipNumber%></font></td>
				</tr>
				
				<tr>
					<td width="200" align="center"><img src="./images/name.png" width="150" height="25" alt="name"/></td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="text" name="name" value="<%=name%>" onclick='value=""'></font></td>
				</tr>

				<tr>
					<td width="200" align="center"><img src="./images/pw.png" width="150" height="25" alt="pw"/></td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="password" name="password" value="<%=password%>" onclick='value=""'></font></td>
				</tr>

				<tr>
					<td width="200" align="center"><img src="./images/phonenum.png" width="150" height="25" alt="number"/></td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="text" name="mobile" value="<%=mobile%>" onclick='value=""'></font></td>
				</tr>

				<tr>
					<td width="200" align="center"><img src="./images/email.png" width="150" height="25" alt="mail"/></td>
					<td>&nbsp;&nbsp;<font face="맑은 고딕"><input type="text" name="email" value="<%=email%>" onclick='value=""'></font></td>
				</tr>
					<!--<%=membershipNumber%> <%=name%> <%=password%> <%=mobile%> <%=email%></td>-->				
			</table><p>

			<div align="center">
				<input type="button" value="수정" onclick="check()"> <input type="button" value="탈퇴" onclick="drop()">
			</div>
		</form>

		<% } else { %>
			<div id="loginPanel">
				<h2>Login</h2>
				<form method="post" action="login.jsp" name="loginform">

					<input name="name" type="text" value="Name" onfocus="if(this.value=='Name')this.value=''" onblur="if(this.value=='')this.value='Name'" />
					<div class="blank"></div>
					<input name="password" type="password" value="Password"	onfocus="if(this.value=='Password')this.value=''" onblur="if(this.value=='')this.value='Password'" />
					<p>
						Not yet a Member? <a href="join.jsp">Register Now</a>
						<!--Forgot a MemberID? <a href="IDcheck.jsp">Click here</a>-->
					</p>
					<!--<a href="#" class="login">Login</a>-->
					<input type="submit" class="login" name="login" value="Login">
					<input type="button" class="findId" name="findId" value="Find" onClick="findIdPw();">
				</form>
			</div>

			<div>
				　　　　　　<font face="맑은 고딕">로그인 후 사용하실 수 있습니다.</font>
			</div>
		<% } %>
		
			</br></br>
		
			

		
	 </div>
	</div>
	<div id="footWrap">
	 <div id="footPanel">
	  <div id="footNav">
	   <ul>
		<li><a href="index.jsp">Home</a></li>
		<li><div class="blank">|</div></li>
		<li><a href="Unhang.jsp">Reservation</a></li>
		<li><div class="blank">|</div></li>
		<li><a href="#">Station</a></li>
		<li><div class="blank">|</div></li>
		<li><a href="Myinfo_index.jsp">My info</a></li>
	   </ul>
	  </div>
	  <p>© Copyright Information Goes Here. All Rights Reserved.</p>
	 </div>
	</div>
	</body>
	</html>

<%
	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}		
		conn.close();
	}
%>	