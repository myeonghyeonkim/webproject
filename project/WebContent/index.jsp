<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.lang.*" %>
  	
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
	
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
	<script src="js/jquery.js"></script>
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
			$("#category1 a").click(function(e){
				e.preventDefault();
				var category = $(this).attr("title");
				$("#newslist li").fadeOut("fast");
				if(category == "all"){$("#newslist li").fadeIn("slow");}
				else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
			});
	});
	$(document).ready(function(){
		$("#category2 a").click(function(e){
			e.preventDefault();
			var category = $(this).attr("title");
			$("#newslist li").fadeOut("fast");
			if(category == "all"){$("#newslist li").fadeIn("slow");}
			else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
		});
});
	$(document).ready(function(){
		$("#category3 a").click(function(e){
			e.preventDefault();
			var category = $(this).attr("title");
			$("#newslist li").fadeOut("fast");
			if(category == "all"){$("#newslist li").fadeIn("slow");}
			else{$("#newslist li[class*="+category+"]").fadeIn("slow");}
		});
});
	$(document).ready(function(){
		$("#category4 a").click(function(e){
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
			<div id="category">
				<div id="category1">
    				<h3>컴퓨터</h3>
        				<ul>
	       		<!--  <li><a href="#" title="all">전체기사</a></li>-->
	        				<li><a href="#" title="pro">프로그래밍</a></li>
    	    	    		<li><a href="#" title="software">소프트웨어</a></li>
        	    			<li><a href="#" title="computer_ja">자격증</a></li>
            				<li><a href="#" title="etc1">기타</a></li>
        				</ul>
    			</div>
				<div id="category2">
    				<h3>영어회화</h3>
        				<ul>
	       		<!--  <li><a href="#" title="all">전체기사</a></li>-->
        					<li><a href="#" title="conversation">영어회화</a></li>
        				    <li><a href="#" title="toeic">토익</a></li>
        				    <li><a href="#" title="toefl">토플</a></li>
        				    <li><a href="#" title="teps">텝스</a></li>
        				</ul>
    			</div>		
				<div id="category3">
    				<h3>사회정치</h3>
        				<ul>
	       		<!--  <li><a href="#" title="all">전체기사</a></li>-->
        					<li><a href="#" title="rule">정치/법</a></li>
            				<li><a href="#" title="social">사회문화</a></li>
           					<li><a href="#" title="admi">행정</a></li>
            				<li><a href="#" title="etc2">기타</a></li>
        				</ul>
    			</div>					
				<div id="category4">
    				<h3>이공계</h3>
        				<ul>
	       		<!--  <li><a href="#" title="all">전체기사</a></li>-->
        					<li><a href="#" title="jeon">전기/전자</a></li>
            				<li><a href="#" title="gun">건축/토목</a></li>
            				<li><a href="#" title="machine">기계/물리</a></li>
            				<li><a href="#" title="chemisty">화학/생명</a></li>
        				</ul>
    			</div>							
			</div>	
			</div>
			<div class="body_5">		
				<div id="newslist">
    				<h3>모임정보 목록</h3>
    					<ul>
    
<%
	String sql = "select * from studygroup where category_1='pro'";
	pstmt = conn.prepareStatement(sql);	
	rs = pstmt.executeQuery();
%>
    	<li class="pro"><br/>
      	<%while(rs.next()) {%>
      	
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      				<div class="meeting_photo_1_1">
      					<img src="<%=rs.getString("group_image") %>">
      					
      				</div>
      				<div class="meeting_photo_1_2">
      					모임제목 : <%=rs.getString("meeting_subject") %><br/>
      					모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      							<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      					모임장소 : <%=rs.getString("meeting_place") %>
      					<hr/>
      				</div>
      		</div>
      	</a>
      </li>
       
   <%} %>
        <%
		String sql1 = "select * from studygroup where category_1='software'";  
		pstmt = conn.prepareStatement(sql1);	
		rs = pstmt.executeQuery();
%>
			<li class="software"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>      		
				<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>
      	</a>
      </li>   
        <%} %>
<%
		String sql2 = "select * from studygroup where category_1='computer_ja'";  
		pstmt = conn.prepareStatement(sql2);	
		rs = pstmt.executeQuery();
%>      
		<li class="computer_ja"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>	
      	</a>
      </li>   
        <%} %> 
<%
		String sql3 = "select * from studygroup where category_1='etc1'";  
		pstmt = conn.prepareStatement(sql3);	
		rs = pstmt.executeQuery();
%>         
    <li class="etc1"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>	
      	</a>
     </li>  
<%} %> 
<%
		String sql4 = "select * from studygroup where category_1='talking'";  
		pstmt = conn.prepareStatement(sql4);	
		rs = pstmt.executeQuery();
%>         
    <li class="talking"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
				<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>  
<%} %> 
<%
		String sql5 = "select * from studygroup where category_1='toeic'";  
		pstmt = conn.prepareStatement(sql5);	
		rs = pstmt.executeQuery();
%>         
    <li class="toeic"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제	목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li> 
<%} %> 
<%
		String sql6 = "select * from studygroup where category_1='toefl'";  
		pstmt = conn.prepareStatement(sql6);	
		rs = pstmt.executeQuery();
%>         
    <li class="toefl"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>
<%} %> 
<%
		String sql7 = "select * from studygroup where category_1='teps'";  
		pstmt = conn.prepareStatement(sql7);	
		rs = pstmt.executeQuery();
%>         
    <li class="teps"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>    
<%} %> 
<%
		String sql8 = "select * from studygroup where category_1='rule'";  
		pstmt = conn.prepareStatement(sql8);	
		rs = pstmt.executeQuery();
%>         
    <li class="rule"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>   
<%} %> 
<%
		String sql9 = "select * from studygroup where category_1='social'";  
		pstmt = conn.prepareStatement(sql9);	
		rs = pstmt.executeQuery();
%>         
    <li class="social"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>
<%} %> 
<%
		String sql10 = "select * from studygroup where category_1='admi'";  
		pstmt = conn.prepareStatement(sql10);	
		rs = pstmt.executeQuery();
%>         
    <li class="admi"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>	
      	</a>
     </li> 
<%} %> 
<%
		String sql11 = "select * from studygroup where category_1='etc2'";  
		pstmt = conn.prepareStatement(sql11);	
		rs = pstmt.executeQuery();
%>         
    <li class="etc2"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>  
<%} %> 
<%
		String sql12 = "select * from studygroup where category_1='jeon'";  
		pstmt = conn.prepareStatement(sql12);	
		rs = pstmt.executeQuery();
%>         
    <li class="jeon"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">      		
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>
<%} %> 
<%
		String sql13 = "select * from studygroup where category_1='gun'";  
		pstmt = conn.prepareStatement(sql13);	
		rs = pstmt.executeQuery();
%>         
    <li class="gun"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>
      	</a>
     </li>  
<%} %> 
<%
		String sql14 = "select * from studygroup where category_1='muchine'";  
		pstmt = conn.prepareStatement(sql14);	
		rs = pstmt.executeQuery();
%>         
    <li class="muchine"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>
<%} %> 
<%
		String sql15 = "select * from studygroup where category_1='chemisty'";  
		pstmt = conn.prepareStatement(sql15);	
		rs = pstmt.executeQuery();
%>         
    <li class="chemisty"><br/>
      	<%while(rs.next()) {%>
      	<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
      		<div id="meeting_photo">
      			<div class="meeting_photo_1_1">
      				<img src="<%=rs.getString("group_image") %>">
      			</div>
      			<div class="meeting_photo_1_2">
      				모임제목 : <%=rs.getString("meeting_subject") %><br/>
      				모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start")%>~
      						<%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %><br/>
      				모임장소 : <%=rs.getString("meeting_place") %>
      				<hr/>
      			</div>
      		</div>		
      	</a>
     </li>   
     <%rs.close(); %>
<%} %>       
        </ul>
        
        </div>
        </div>	
</div>
</div>
	
		<div id="bottom">
			<footer>
        		<p>&copy; Company 2012</p>
      		</footer>
		</div>
</body>
</html>