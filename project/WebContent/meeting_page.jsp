<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	int num=0;
	String image_path="";
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
  String user_id1=request.getParameter("user_id");
	String user_id=(String)session.getAttribute("id");
	//int n=LAST_INSERT_ID();
	String meeting_name=request.getParameter("meeting_name");
	System.out.println(meeting_name);
	
	//int studygroup_id=1;
	String meeting_subject=""; //모임 제목
	String category_1 ="";		 //관심사
	String category_2 ="";     //세부항목
	String category_3 ="";		 //지역별
	String category_4 ="";		//요일별
	String meeting_time_start = ""; //모임시작시간
	String meeting_time_end = "";   //모임마감시간
	String sign_time_start = "";    //접수 시작시간
	String sign_time_end = "";			//접수 마감시간
	String meeting_day_start = "";	//모임시작날짜
	String meeting_day_end = "";		//모임마감날짜
	String sign_day_start= "";			//접수시작날짜
	String sign_day_end = "";				//접수마감날짜
	String group_image = "";				//그룹이미지
	String meeting_explain = "";		//모임상세설명
	int part_person =0;							//모임참여제한인원
	String meeting_place ="";				//모임장소
	String meeting_map = "";				//지도상 모임장소
	
  
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
		
		
		String sql1="SELECT * FROM studygroup WHERE meeting_name=?";
  	pstmt=conn.prepareStatement(sql1);
  	pstmt.setString(1,meeting_name);
  	rs = pstmt.executeQuery();
  	if(rs.next()){
			image_path = rs.getString("group_image");
		}
		

		
  	String sql = "select * from studygroup where meeting_name=?";
		pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1,meeting_name);
		rs = pstmt.executeQuery();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" lang="ko">
	<script type="text/javascript" src="js/jquery-1.4.1.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	
	<link type="text/css" href="css/meeting_page.css" rel="stylesheet" />
	<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="js/ui.core.js"></script>
	<script type="text/javascript" src="js/ui.datepicker.js"></script>
	<script type="text/javascript" src="js/ui.datepicker-ko.js"></script>
<title>모임페이지</title>
</head>
<body>
<div id="wrap">
	<div id="wrap_1">
		<div id="top">
			<div id="top_left">
				<h1>우리들의 스터디공간</h1>
				<h1>S T U D Y - M E E T I N G </h1>
			</div>
			<div id="top_right"> 
			</div>
			<div id="top_bottom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="myinfo_main.jsp">내정보관리</a></li>
				</ul>		
			</div>
		</div>
		<div id="meeting">
			<div id="meeting_info">
				<div id="meeting_info_before">
					<h1>모임정보</h1><hr/>
						<div id="meeting_info_left">
							<% if(rs.next()){%>
						<div class="meeting_info_left_1">
							<img src="<%=image_path %>" width="100" height ="100" class="imgpolaroid"/>
								<form action="meeting_photo.jsp" method="post" enctype="multipart/form-data">
									<input type="file" name="image" value="찾기"><p>
									<input type="submit" class="btn btn-primary btn-large" value="전송">
								</form>
						</div>
						<div class="meeting_info_left_2">
							<p>모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start") %>
										부터 <%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %>
							</p> 
							<p>접수기간 : <%=rs.getString("sign_day_start")%><%=rs.getString("sign_time_start") %>
										부터 <%=rs.getString("sign_day_end") %><%=rs.getString("sign_time_end") %></p>
							<p>모임장소 : <%=rs.getString("meeting_place") %></p>					
								<button class="btn btn-large btn-primary" type="button"><a href="partperson_plus.jsp?user_id=<%=user_id%>&meeting_name=<%=meeting_name%>
					&num=<%=num%>">
						참여하기</a></button>
								<a href="partperson_minus.jsp?user_id=<%=user_id%>&meeting_name=<%=meeting_name%>">
								<button class="btn btn-large" type="button">참여취소</button>
								</a>
							<p>총 모집인원 : <%=rs.getString("part_person") %> 명 / 현재 참여자 : <%=num%>명</p>
						</div>
						</div>
						<div id="meeting_info_right">
				  			<div>지도가 들어갈 부분</div>
						</div>
				</div>
					<hr/>
			<%--<div id="meeting_info_after">    참여완료 후..............
				<div id="meeting_info_left">
				</div>
				<div id="meeting_info_right">
				</div>
			</div>--%>
			<div id="meeting_king">
				<div id="meeting_explain">
					<h1>모임세부설명</h1><hr/><%=rs.getString("meeting_explain") %> 
				</div>
					<hr/>			
			</div>		
<%} %>
<%
	try{
	String sql1 = "select * from user,studygroup where user.user_id=studygroup.user_id and meeting_name=?";
	pstmt = conn.prepareStatement(sql1);	
	pstmt.setString(1,meeting_name);
	rs = pstmt.executeQuery();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>
		<div id="meeting_king_info">
<% if(rs.next()) {%>
			<h1>모임개설자</h1><hr/>
			<div class="meeting_king_info_1">
			<div><img src="<%=rs.getString("photo") %>" width="100" height="100"></div>
			</div>
			<div class="meeting_king_info_2">
				<ul>
					<li>핸드폰번호 : <%=rs.getString("phone") %></li>
					<li>이메일  : <%=rs.getString("email") %></li>
				</ul>
			</div>
			</div>
		<hr/>
<%}%>
<%
	try{
	String sql2 = "select * from user,member where user.user_id = member.user_id and meeting_name=?";
	pstmt = conn.prepareStatement(sql2);	
	pstmt.setString(1,meeting_name);
	rs = pstmt.executeQuery();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
		<div id="meeting_user_list">
		<div class="meeting_user_list_1">
		<div id="2">
			<p>참여자 명단(정원 x명 / x명참여)</p>
				
		<% while(rs.next()) {%>							
		 			<img src ="<%=rs.getString("photo") %>" width="100" height="100">		 	
		 
<%}%>
		</div>
		 	</div>
		</div>
		<hr/>
		<div id="meeting_comment">
			<h1>댓글</h1><hr/>
			<form action="comment_ok.jsp" name="comment" method="post">
					<input type="text" name="user_content" size="80" placeholder="Text input">
					<input type="hidden" name="user_id" value="<%=user_id %>">
					<input type="hidden" name="meeting_name" value="<%=meeting_name %>">
					<input type="submit" value="등록">
			</form>
		</div>		
		<hr/>
		
<%
try{
			String sql3 = "select * from user,comment,studygroup where comment.meeting_name = studygroup.meeting_name"
					+" and user.user_id = comment.user_id and studygroup.meeting_name=?";
			pstmt = conn.prepareStatement(sql3);	
			pstmt.setString(1,meeting_name);
			rs = pstmt.executeQuery();
		}
		catch(Exception e){
			e.printStackTrace();
		}
%>

	<% while(rs.next()) {%>
		<div id="meeting_comment_ok">	
				<h1>댓글정보</h1><hr/>
				<p><img src="<%=rs.getString("photo") %>" width="100" height="100">
				<%=rs.getString("user_content") %></p>
				<a href="comment_delete.jsp?meeting_name=<%=rs.getString("meeting_name")%>&user_id=<%=user_id%>">삭제</a>
		</div>
<%} %>
	</div>
	</div>
	</div>
	</div>
</body>
</html>