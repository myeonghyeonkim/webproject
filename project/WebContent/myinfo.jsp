<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String user_id = (String) session.getAttribute("id");

	String user_name= "";
	String user_email= "";
	String user_phone= "";
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException cnfe) {
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/webpro";
		String userId = "admin";
		String userPass = "aldks12";
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

		String sql = "SELECT * FROM user WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user_id);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			//membershipNumber = rs.getString("멤버십번호");
			//name = rs.getString("회원이름");
			//password = rs.getString("비밀번호");
			//mobile = rs.getString("전화번호");
			//email = rs.getString("이메일");
			user_name = rs.getString("name");
			user_email = rs.getString("email");
			user_phone = rs.getString("call");			
		}
%>

<%--<script>
	function check(){
		var check = document.getElementById("myinfo_password_check");
		if(!check.password.value){
			alert("비밀번호를 입력하세요");
			return check.password.focus();
		} else if(check.hidden_password.value != check.password.value){
			alert("비밀번호를 확인해주세요");
			return check.password.focus();
		} else {
			myinfo_password_check.submit();
		}
	}
</script>
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--  <html xmlns="http://www.w3.org/1999/xhtml">-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>MJ Train</title>
<link href="styles.css" rel="stylesheet" type="text/css" />
<!-- <link rel="icon" href="images/icon.ico" />-->

<script type="text/javascript">

</script>
</head>

<body>
	<div id="headWrap">
		<div id="headpanel">
			<div id="logo">
				<h1>MJT</h1>
				<h2>MyongJi Train</h2>
			</div>
			<div id="quots"></div>
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
				<h2>My Information</h2>
			</div>
			</br>
			</br>
			</br>

			<form id="myinfo_password_check" method="post" action="myinfo_ok.jsp">
				<table border="1" width="600" align="center" bordercolor="black">
					<tr>
						<td align="center"><p>
								<br><label>
								<img src="./images/id.png" width="150" height="25" alt="id" /></label>
								&nbsp;&nbsp;<u><%=user_id%></font></u>
								&nbsp;&nbsp;&nbsp;&nbsp;
									<label><img src="./images/pw.png" width="150" height="25" alt="id" /></label>
									&nbsp;&nbsp;<input type="password" name="password"> <br><br></font></td>
						<input type="hidden" name="hidden_password" value="<%=user_email%>">
					</tr>

					<tr>
						<td align="center"><p>
								<br><font face="맑은 고딕" size="2pt"><b><%=user_name%></b>님의
										정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인 합니다.<br>항상 비밀번호는 타인에게
											노출되지 않도록 주의해 주세요. </font><br><br></td>
					</tr>
					<!--< <%=user_name%> <%=user_email%> <%=user_phone%></td>-->
				</table>
				<p>

					<div id="buttons" align="center">
						<input type="button" class="ok" value="확인" onclick="check()">
					</div>
			</form>

			<br><br>
		</div>
	</div>
	<div id="footWrap">
		<div id="footPanel">
			<div id="footNav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="introduce.jsp">About Us</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="#">Newsletter</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="#">MJTrain</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="Unhang.jsp">Reservation</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="#">Solution</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="#">Q&A</a></li>
					<li><div class="blank">|</div></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
			<p>Copyright Information Goes Here. All Rights Reserved.</p>
			<div id="validation"></div>
		</div>
	</div>
</body>
</html>

<%} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}%>