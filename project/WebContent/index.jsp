<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.lang.*" %>
  	
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
	String user_id=(String)session.getAttribute("id");
	//int n=LAST_INSERT_ID();
	
  
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	
	String message = "";
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";		
		conn = DriverManager.getConnection(url, user, user_pwd);

		//String sql = "select * from studygroup where meeting_name=?";
		//pstmt = conn.prepareStatement(sql);	
		//pstmt.setString(1,meeting_name);
		//rs = pstmt.executeQuery();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STUDY-MEETING</title>
	<link href="css/base.css" rel="stylesheet" type="text/css">
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
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

	$(document).ready(function(){
			$("#category 1").click(function(e){
				e.preventDefault();
				var category = $(this).attr("title");
				$("#newslist li").fadeOut("fast");
				if(category == "all"){$("#newslist li").fadeIn("slow");}
				else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
			});
	});
	$(document).ready(function(){
		$("#category 2").click(function(e){
			e.preventDefault();
			var category = $(this).attr("title");
			$("#newslist li").fadeOut("fast");
			if(category == "all"){$("#newslist li").fadeIn("slow");}
			else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
		});
});
	$(document).ready(function(){
		$("#category 3").click(function(e){
			e.preventDefault();
			var category = $(this).attr("title");
			$("#newslist li").fadeOut("fast");
			if(category == "all"){$("#newslist li").fadeIn("slow");}
			else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
		});
});
	$(document).ready(function(){
		$("#category 4").click(function(e){
			e.preventDefault();
			var category = $(this).attr("title");
			$("#newslist li").fadeOut("fast");
			if(category == "all"){$("#newslist li").fadeIn("slow");}
			else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
		});
});


</script>
</head>
<body>

	<div id="wrap">
		<div id="top">
			<div id="top_left">
			<h1>우리들의 스터디공간</h1>
			<h1>S T U D Y - M E E T I N G </h1>
			</div>
			<div id="top_right"> 
			</div>
			<div id="top_bottom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="myinfo_main.jsp">내정보관리</a></li>
				</ul>
			</div>
		</div>
		<div id="body">
			<div class="body_1">
			
			</div>
			<div class="body_2">
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
							<h4>study-meeting에 오신걸 환영합니다.</h4>
							<input type="button" class="logout" value="logout"
							onclick="logOut()">
							
							<br/>
							<br/>
							
					</div>
					<div>
								<form action ="meeting_create.jsp" method="post">
								<a href="meeting_create.jsp"><button type="submit" class="btn btn-large btn-block btn-primary">모임 개설하기</button></a>
								</form>
					</div>
					<% 
							
						} else {
					%>
					
					<div id="login_before">
					<form name="loginform" action="loginProcess.jsp" method="post">
						<form class="form-horizontal">
							<div class="control-group">
    							<label class="control-label" for="inputEmail">Email</label>
    						<div class="controls">
     	 						<input type="text" name="id" placeholder="아이디">
     	 					</div>
  						</div>
  						<div class="control-group">
    						<label class="control-label" for="inputPassword">Password</label>
    						<div class="controls">
      							<input type="password" name="pwd" placeholder="비밀번호">
    						</div>
  						</div>
						
						<a href="javascript:loginform.submit()">
							<button type="submit" class="btn btn-large">로그인</button>
						</a>&nbsp;&nbsp;
						<a href="joinForm.jsp">회원가입</a>
						<a href="meeting_create.jsp">모임 개설하기</a>
						
					</form>
				</form>
				</div>
				<%} %>

				</div>
				</div>
				
			<div class="body_3">
				<div id="body3_sub1">
					<div id="category1">
    			<h3>컴퓨터</h3>
        	<ul>
	       		<!--  <li><a href="#" title="all">전체기사</a></li>-->
        		<li><a href="#" title="pro">프로그래밍</a></li>
            <li><a href="#" title="software">소프트웨어</a></li>
            <li><a href="#" title="website">웹사이트제작</a></li>
            <li><a href="#" title="etc1">기타</a></li>
        	</ul>
    			</div>
				
				</div>

				<div id="body3_sub2">
					<div id="category2">
    			<h3>영어회화</h3>
        	<ul>
	       		<!--  <li><a href="#" title="all">전체기사</a></li>-->
        		<li><a href="#" title="conversation">영어회화</a></li>
            <li><a href="#" title="toeic">토익</a></li>
            <li><a href="#" title="toeple">토플</a></li>
            <li><a href="#" title="tebs">텝스</a></li>
        	</ul>
    			</div>
					<div id="body3_sub2_1">
					</div>
					<div id="body3_sub2_2">
					</div>
				</div>
			</div>	
			<div class="body_4"></div>
			<div class="body_5">
			<div id="wrap">

		
		<div id="newslist">
    <h3>뉴스 목록</h3>
    <ul>
    
<%
	String sql = "select * from studygroup where category_1='pro'";
	pstmt = conn.prepareStatement(sql);	
	rs = pstmt.executeQuery();
%>
    	<li class="pro"><br/>
      	<%while(rs.next()) {%>
      	모임정보 : <%= rs.getString("meeting_name")%>
      </li>
      <hr/>   
        <%} %>
        
<%
		String sql1 = "select * from studygroup where category_1='software'";  
		pstmt = conn.prepareStatement(sql1);	
		rs = pstmt.executeQuery();
%>
			<li class="software"><br/>
      	<%while(rs.next()) {%>
      	모임정보 : <%= rs.getString("meeting_name")%>
      </li><hr/>    
        <%} %>
<%
		String sql2 = "select * from studygroup where category_3='website'";  
		pstmt = conn.prepareStatement(sql2);	
		rs = pstmt.executeQuery();
%>      
		<li class="website"><br/>
      	<%while(rs.next()) {%>
      	모임정보 : <%= rs.getString("meeting_name")%>
      </li><hr/>    
        <%} %> 
<%
		String sql3 = "select * from studygroup where category_4='etc1'";  
		pstmt = conn.prepareStatement(sql3);	
		rs = pstmt.executeQuery();
%>         
    <li class="etc1"><br/>
      	<%while(rs.next()) {%>
      	모임정보 : <%= rs.getString("meeting_name")%>
     </li><hr/>    
<%} %> 
            
       
    </ul>
    </div>

</div>
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
			<footer>
        <p>&copy; Company 2012</p>
      </footer>
		</div>
	</div>
</body>
</html>