<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
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
<meta charset="UTF-8">
<title>모임페이지</title>
</head>
<body>
	<div id="meeting">
		<div id="meeting_info">
			<div id="meeting_info_before">
				<div id="meeting_info_left">
					<% if(rs.next()){%>
					<img src="" value="모임사진">
					<p>모임기간 : <%=rs.getString("meeting_day_start")%><%=rs.getString("meeting_time_start") %>
										부터 <%=rs.getString("meeting_day_end") %><%=rs.getString("meeting_time_end") %>
					</p> 
					<p>접수기간 : <%=rs.getString("sign_day_start")%><%=rs.getString("sign_time_start") %>
										부터 <%=rs.getString("sign_day_end") %><%=rs.getString("sign_time_end") %></p>
					<p>모임장소 : <%=rs.getString("meeting_place") %></p>
					<p>총 모집인원 : <%=rs.getString("part_person") %> 명 / 현재 참여자 : 명</p>
					<a href="partperson_plus.jsp?user_id=<%=user_id%>&meeting_name=<%=meeting_name%>">참여하기</a>
					<a href="partperson_minus.jsp?user_id=<%=user_id%>&meeting_name=<%=meeting_name%>">참여취소</a>
					
				</div>
				<div id="meeting_info_right">
				  <p>지도가 들어갈 부분</p>
				</div>
			</div>
			<hr/>
			<%--<div id="meeting_info_after">    참여완료 후..............
				<div id="meeting_info_left">
				</div>
				<div id="meeting_info_right">
				</div>
			</div>--%>
			<div id="meeting_explain">
			<p>모임세부설명 : <%=rs.getString("meeting_explain") %>  </p>
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
			<p>모임개설자</p><br/>
			<p><img src="<%=rs.getString("photo") %>"></p>
			<p>핸드폰번호 : <%=rs.getString("phone") %></p>
			<p>이메일  : <%=rs.getString("email") %></p>
		</div>
		<hr/>
		
<%}%>
<%--<%
	try{
	String sql1 = "select * from user,member where user.user_id = member.user_id meeting_name=?";
	pstmt = conn.prepareStatement(sql1);	
	pstmt.setString(1,meeting_name);
	rs = pstmt.executeQuery();
	}
	catch(Exception e){
		e.printStackTrace();
	}

		<div id="meeting_user_list">
		<% while(rs.next()) {%>
			<p>참여자 명단(정원 x명 / x명참여)</p>
			참여자 : <%=rs.getString("photo") %>
		</div>
		<hr/>
<%}%>--%>

		<div id="meeting_comment">
			<p>댓글</p>
			<form action="comment_ok.jsp" name="comment" method="post">
					<input type="text" name="user_content">
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
		<div id="meeting_comment_ok">
	<% while(rs.next()) {%>
				<p>댓글정보</p><br/>
				<p><img src="<%=rs.getString("photo") %>"></p>
				<p><%=rs.getString("user_content") %></p>
		</div>
<%} %>
	
		
		<hr/>	
	</div>
</body>
</html>