<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pwd");
	String name=request.getParameter("name");
	String phone = request.getParameter("call1") + request.getParameter("call2") + request.getParameter("call3");
	String mypage_url=request.getParameter("mypage_url");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String message = "";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(ClassNotFoundException e){
		e.printStackTrace();
		System.out.println("����̹� �ε� ����");
	}	
	
	try{
		String url="jdbc:mysql://localhost:3306/webpro";
		String user="admin";
		String user_pwd="aldks12";		
		conn = DriverManager.getConnection(url, user, user_pwd);

		String sql = "SELECT * FROM user where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if(rs.next()){
			message = request.getParameter("id") + "�� �̹� ������Դϴ�.";
%>

<script type="text/javascript">
	alert("�̹� ��� ���� ID�Դϴ�.");
	history.back()
</script>

<%		
		}
		
		String sql2 = "INSERT INTO user VALUES (?,?,?,?,?,?,?)";		//��� insert

		pstmt = conn.prepareStatement(sql2);
		
		pstmt.setString(1, id);				
		pstmt.setString(2, pass);
		pstmt.setString(3, name);
		pstmt.setString(4, phone);
		pstmt.setString(5, phone);
		pstmt.setString(6, phone);
		pstmt.setString(7, mypage_url);

		pstmt.executeUpdate();
%>

<script language="javascript">
	alert("ȸ�������� �Ϸ�Ǿ����ϴ�.");
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
