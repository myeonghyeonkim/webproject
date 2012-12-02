<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
	String user_id=(String)session.getAttribute("id");
  
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String message = "";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
		e.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}	
	
	try{
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";		
		conn = DriverManager.getConnection(url, user, user_pwd);

		String sql = "select * from user,studygroup,schedule,comment,member where user.user_id = member.user_id"
				+"and studygroup.studygroup_id = member.studygroup_id and studygroup.studygroup_id = comment.studygroup_id"
				+"studygroup.studygroup_id = schedule.studygroup_id";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
		if(rs.next()){
  				
  	}
}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(Exception e){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
		if(conn!=null) try{conn.close();} catch(Exception e){}
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="meeting_page">
		<div id="meeting_info">
			<div id="meeting_info_before">
				<div id="meeting_info_left">
					<img src="" value="모임사진">
					<p>모임기간 :</p> 
					<p>접수기간 :</p>
					<p>모임장소 :</p>
					<p>총 모집인원 :  명 / 현재 참여자 : 명</p>
					<p>참여하기  / 참여취소</p>
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
		</div>
		<div id="meeting_king_info">
			<p>모임개설자</p><br/>
			<img src="">
			<p>핸드폰번호 : </p>
			<p>이메일  : </p>
		</div>
		<hr/>
		<div id="meeting_explain">
			<p>모임세부설명 : </p>
		</div>
		<hr/>
		<div id="meeting_user_list">
			<p>참여자 명단(정원 x명 / x명참여)</p>
			<img src="">
		</div>
		<hr/>
		<div id="meeting_comment">
			<p>댓글</p><br/>
			<img src="">
			<p>댓글내용</p>
			
		</div>
		<hr/>	
	</div>
</body>
</html>