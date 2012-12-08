<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
  String meeting_name =request.getParameter("meeting_name");
	String user_id=(String)session.getAttribute("id");
  //int studygroup_id=1;
	String meeting_subject=request.getParameter("subject");
	String category_1 =request.getParameter("select_1");
	
	String meeting_time_start = request.getParameter("select_5");
	String meeting_time_end = request.getParameter("select_6");
	String sign_time_start = request.getParameter("select_7");
	String sign_time_end = request.getParameter("select_8");
	String meeting_day_start =request.getParameter("meeting_day_start");
	String meeting_day_end =request.getParameter("meeting_day_end");
	String sign_day_start=request.getParameter("sign_day_start");
	String sign_day_end = request.getParameter("sign_day_end");
	String group_image =request.getParameter("group_image");
	String meeting_explain =request.getParameter("intro");
	
	int part_person =Integer.parseInt(request.getParameter("limit_user_num"));
	String meeting_place =request.getParameter("input_place");
	String meeting_map = request.getParameter("map");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String message = "";
	String studygroup_n="";
	
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

		//String sql = "SELECT * FROM studygroup where studygroup_id=?";
		//pstmt = conn.prepareStatement(sql);
		//pstmt.setInt(1, studygroup_id);
		//rs = pstmt.executeQuery();
		String sql2 = "INSERT INTO studygroup(category_1,meeting_time_start,meeting_time_end," + 
				" sign_time_start,sign_time_end,meeting_day_start,sign_day_start,sign_day_end,group_image,meeting_explain,meeting_name,"+
		" part_person,meeting_place,meeting_map,user_id,meeting_subject,meeting_day_end) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";		//디비 insert

		pstmt = conn.prepareStatement(sql2);				
		pstmt.setString(1, category_1);
		
		pstmt.setString(2, meeting_time_start);
		pstmt.setString(3, meeting_time_end);
		pstmt.setString(4, sign_time_start);
		pstmt.setString(5, sign_time_end);
		pstmt.setString(6, meeting_day_start);
		pstmt.setString(7, sign_day_start);
		pstmt.setString(8, sign_day_end);
		pstmt.setString(9, group_image);
		
		pstmt.setString(10, meeting_explain);
		pstmt.setString(11, meeting_name);
		pstmt.setInt(12, part_person);
		pstmt.setString(13, meeting_place);
		pstmt.setString(14, meeting_map);
		pstmt.setString(15, user_id);
		pstmt.setString(16, meeting_subject);
		pstmt.setString(17, meeting_day_end);
	
		pstmt.executeUpdate();
	}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(Exception e){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
		
	}
		
		String sql3="select * from studygroup where meeting_name=?";
	  pstmt = conn.prepareStatement(sql3);
	  pstmt.setString(1,meeting_name);
	  rs= pstmt.executeQuery();
	 	
%>
<html>
<head>
	<meta charset="utf-8">
</head>
<body>
	<div>
		<p>
 		<% if(rs.next())
		 {%>	  
		<a href="meeting_page.jsp?meeting_name=<%=rs.getString("meeting_name")%>">
		개설된페이지로가기</a>
		<a href="index.jsp?meeting_name=<%=rs.getString("meeting_name") %>">
		모임정보 추가시키기
		</a>
		<%} %>
		</p>
	</div>
</body>
</html>

		
