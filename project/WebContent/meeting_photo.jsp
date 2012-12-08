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
 String meeting=request.getParameter("meeting_name");
 String thumbFileName = "";
 String realFolder = "";
 String saveFolder = "meeting_photo";
 String encType="euc-kr";
 
 String group_image="";
 
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

   group_image = "meeting_photo\\small" + meeting + ".jpg";
   
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

		String sql = "SELECT * FROM studygroup WHERE meeting_name=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, meeting);
		//rs = pstmt.executeQuery();
		
		
		String sql2 = "UPDATE studygroup SET studygroup.group_image=? where meeting_name=?";		//��� insert
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, group_image);
		pstmt.setString(2, meeting);
		
		pstmt.executeUpdate();
		

	response.sendRedirect("meeting_page.jsp?"+meeting);
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





