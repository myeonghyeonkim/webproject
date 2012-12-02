<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
  //스터디그룹아이디
	String user_id=(String)session.getAttribute("id");
  //int studygroup_id=1;
	String meeting_subject=request.getParameter("subject");
	String category_1 =request.getParameter("select_1");
	String category_2 =request.getParameter("select_2");
	String category_3 =request.getParameter("select_3");
	String category_4 =request.getParameter("select_4");
	String meeting_time_start = request.getParameter("select_5");
	String meeting_time_end = request.getParameter("select_6");
	String sign_time_start = request.getParameter("select_7");
	String sign_time_end = request.getParameter("select_8");
	String meeting_day =request.getParameter("meeting_day");
	String sign_day_start=request.getParameter("sign_day_start");
	String sign_day_end = request.getParameter("sign_day_end");
	String group_image =request.getParameter("group_image");
	String meeting_explain =request.getParameter("intro");
	String meeting_name =request.getParameter("meeting_name");
	int part_person =1;
	String meeting_place =request.getParameter("input_place");
	String meeting_map = request.getParameter("map");
	
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

		//String sql = "SELECT * FROM studygroup where studygroup_id=?";
		//pstmt = conn.prepareStatement(sql);
		//pstmt.setInt(1, studygroup_id);
		//rs = pstmt.executeQuery();
		String sql2 = "INSERT INTO studygroup(category_1,category_2,category_3,category_4,meeting_time_start,meeting_time_end" + 
				",sign_time_start,sign_time_end,meeting_day,sign_day_start,sign_day_end,group_image,meeting_explain,meeting_name"+
		",part_person,meeting_place,meeting_map,user_id,meeting_subject) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";		//디비 insert

		pstmt = conn.prepareStatement(sql2);
		
		//pstmt.setInt(1, studygroup_id);				
		pstmt.setString(1, category_1);
		pstmt.setString(2, category_2);
		pstmt.setString(3, category_3);
		pstmt.setString(4, category_4);
		pstmt.setString(5, meeting_time_start);
		pstmt.setString(6, meeting_time_end);
		pstmt.setString(7, sign_time_start);
		pstmt.setString(8, sign_time_end);
		pstmt.setString(9, meeting_day);
		pstmt.setString(10, sign_day_start);
		pstmt.setString(11, sign_day_end);
		pstmt.setString(12, group_image);
		
		pstmt.setString(13, meeting_explain);
		pstmt.setString(14, meeting_name);
		pstmt.setInt(15, part_person);
		pstmt.setString(16, meeting_place);
		pstmt.setString(17, meeting_map);
		pstmt.setString(18, user_id);
		pstmt.setString(19, meeting_subject);

		pstmt.executeUpdate();
%>

<script language="javascript">
	alert("모임개설이 완료되었습니다.");
	document.location="meeting_page.jsp";
</script>
<%
		}
	catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null) try{rs.close();} catch(Exception e){}
		if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
		if(conn!=null) try{conn.close();} catch(Exception e){}
	}
%>
