<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> 일정관리 </TITLE>

<script language="javascript">
<!--
function send(form)
{
	form.submit();
}

function send1(no)
{
	ans = confirm(" 정말 삭제하시겠습니까?");
	if(ans==true){
		location.href="del.jsp?&no="+no
	} else {
		return false;
	} 
}
-->
</script>

</HEAD>

<BODY>

<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String no = request.getParameter("no");
        Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");

String url="jdbc:mysql://localhost:3306/webpro";
String user="admin";
String user_pwd="aldks12";		
conn = DriverManager.getConnection(url, user, user_pwd);

Statement stmt = conn.createStatement();

String strSQL = "SELECT * FROM calendar WHERE no=" + no;
ResultSet rs = stmt.executeQuery(strSQL);

rs.next();       
%>

<center><font size='5'>
<b><%=year%>년 <%=month%>월 <%=day%>일 일정 내용</b></font></p>

<TABLE border='0' width='800' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
<br>

<FORM Name='calendar1' method='post' action='edit.jsp?&year=<%=year%>&month=<%=month%>&day=<%=day%>&no=<%=no%>'>
<TABLE border='1' width='800' cellpadding='0' cellspacing='0'>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
		<input type='hidden' name='cp_type' value='input'>            
		<font size='2'><b>제 목</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=rs.getString("title")%></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>일 자</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'>
         	<b><%=year%>년 <%=month%>월 <%=day%>일</b></font></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>시 간</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=rs.getString("s_time")%> ▶ <%=rs.getString("e_time")%></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>장 소</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=rs.getString("position")%></TD>
    	</TR>
    	<TR>
        	<TD height='118' bgcolor='cccccc'><p align='center'>
        	<font size='2'><b>내 용</b></font></TD>
        	<TD height='118' bgcolor='ededed'><p>
		<font size='2'><b><%=rs.getString("content")%> </TD>
    	</TR>
</TABLE>
<br>

<TABLE border='0' cellpadding='0' cellspacing='0' width='800'>  
    	<TR>    
        	<TD height='40' colspan='2'><p align='center'>
            	<input type='button' value='일정수정' onclick='send(this.form)'>
            	<input type='button' value='일정삭제' onclick="send1('<%=no%>')">
            	<input type='reset' value='돌아가기' onclick='javascript:history.back()'>
                  </TD>
    	</TR>
</TABLE>
</FORM>

<%
rs.close();
stmt.close();
conn.close();
%>

</BODY>
</HTML> 
