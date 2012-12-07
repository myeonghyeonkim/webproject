<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pwd");
	String email=request.getParameter("email");
	String name=request.getParameter("name");
	String phone = request.getParameter("call1") + request.getParameter("call2") + request.getParameter("call3");
	String mypage_url=request.getParameter("mypage_url");
	String photo="image\\2.jpg";
	
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

		String sql = "SELECT * FROM user where user_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if(rs.next()){
			message = request.getParameter("id") + "는 이미 사용중입니다.";
%>

<script type="text/javascript">
	alert("이미 사용 중인 ID입니다.");
	history.back()
</script>

<%		
		}
		
		String sql2 = "INSERT INTO user(user_id,pwd,name,email,phone,mypage_url,photo) VALUES (?,?,?,?,?,?,?)";		//디비 insert
		

		pstmt = conn.prepareStatement(sql2);
		
		pstmt.setString(1, id);				
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		
		pstmt.setString(5, phone);

		pstmt.setString(6, mypage_url);
		pstmt.setString(7, photo);

		pstmt.executeUpdate();
%>

<script language="javascript">
	alert("회원가입이 완료되었습니다.");
	document.location="index.jsp";
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
