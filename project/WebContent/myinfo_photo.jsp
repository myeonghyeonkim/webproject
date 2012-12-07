<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"
   import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"
   import="thumbnail.*"
   import="java.util.*"
   import="java.io.*"
%>
<%@ page import="java.sql.*"%>
<%
 String id=(String)session.getAttribute("id");
 String thumbFileName = "";
 String realFolder = "";
 String saveFolder = "image";
 String encType="euc-kr";
 
 String photo="";
 
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
   thumbFileName = realFolder+"\\small"+id + ".jpg"; //���+ ����� �̹������ϸ�

   photo = "image\\small" + id + ".jpg";
   
	  System.out.println("name = " + name);
	  System.out.println("filename = " + filename);
	  System.out.println("orgFileName = " + orgFileName);
   Thumbnail.createImage(orgFileName,thumbFileName,zoom); // ����� �̹�������
 }
  
  
 }catch(IOException e){
  System.out.print(e);
 }catch(Exception e){
  System.out.print(e);
 }
 
	request.setCharacterEncoding("utf-8");
	
	//String photo=(String)thumbFileName;
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
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

		String sql = "SELECT * FROM user WHERE user_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		//rs = pstmt.executeQuery();
		
		
		String sql2 = "UPDATE user SET user.photo=? where user_id=?";		//��� insert
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, photo);
		pstmt.setString(2, id);
		
		pstmt.executeUpdate();
		

	response.sendRedirect("myinfo_main.jsp");
%>
<%
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null) try{rs.close();} catch(Exception e){}
	if(pstmt!=null) try{pstmt.close();} catch(Exception e){}
	if(conn!=null) try{conn.close();} catch(Exception e){}
}
%>





