<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"
   import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
   import="thumbnail.*"
   import="java.util.*"
   import="java.io.*"
%>
<%@ page import="java.sql.*"%>
<%
 String thumbFileName = "";
 String photoplace="";
 String realFolder = "";
 String saveFolder = "image";
 String encType="euc-kr";
 int maxSize = 5*1024*1024;
 ServletContext context = getServletContext();
 realFolder = context.getRealPath(saveFolder);
 try{
  MultipartRequest multi = null;
  // ������ ����� ���۳�Ʈ�� �����ϰ� ������ ������
  multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
  Enumeration files = multi.getFileNames();
  int zoom=5;
  // ���� ������ ������ ����
  while(files.hasMoreElements()){ 
   String name = (String)files.nextElement(); // input type=file �� �Ķ���� �̸�
   String filename = multi.getFilesystemName(name); // ������ ����� �����̸�
   String orgFileName = realFolder+"\\"+filename; //���+ ���� �̹��� ���ϸ�
   thumbFileName = realFolder+"\\small"+filename; //���+ ����� �̹������ϸ�
   Thumbnail.createImage(orgFileName,thumbFileName,zoom); // ����� �̹�������
   photoplace=thumbFileName;
%>
   ���� ���� ���� ��� �� ���ϸ� : <%= orgFileName %>
   <img src="<%= orgFileName %>" border="0" /><br /><br />
   ����� �̹��� ���� ��� �� ���ϸ� : <%= thumbFileName %>
   <img src="<%= thumbFileName %>" border="0" />
   <img src="image/sm_<%=filename %>">
<%
  }
  
  
 }catch(IOException e){
  System.out.print(e);
 }catch(Exception e){
  System.out.print(e);
 }
 
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String pass=request.getParameter("pwd");
	String email=request.getParameter("email");
	String name=request.getParameter("name");
	String phone = request.getParameter("call1") + request.getParameter("call2") + request.getParameter("call3");
	String mypage_url=request.getParameter("mypage_url");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String photo=thumbFileName;
	
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
		String sql2 = "INSERT INTO user(photo) VALUES (?)";		//��� insert

		pstmt = conn.prepareStatement(sql2);
		
		pstmt.setString(1, photo);				
		
		pstmt.executeUpdate();

}
catch(Exception e){
System.out.print(e);
}
%>
%>

