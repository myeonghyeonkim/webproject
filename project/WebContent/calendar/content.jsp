<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> �������� </TITLE>

<script language="javascript">
<!--
function send(form)
{
	form.submit();
}

function send1(no)
{
	ans = confirm(" ���� �����Ͻðڽ��ϱ�?");
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
        
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"Member","apple");

Statement stmt = conn.createStatement();

String strSQL = "SELECT * FROM calendar WHERE no=" + no;
ResultSet rs = stmt.executeQuery(strSQL);

rs.next();       
%>

<center><font size='5'>
<b><%=year%>�� <%=month%>�� <%=day%>�� ���� ����</b></font></p>

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
		<font size='2'><b>�� ��</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=rs.getString("title")%></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>�� ��</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'>
         	<b><%=year%>�� <%=month%>�� <%=day%>��</b></font></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>�� ��</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=rs.getString("s_time")%> �� <%=rs.getString("e_time")%></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>�� ��</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'><b><%=rs.getString("position")%></TD>
    	</TR>
    	<TR>
        	<TD height='118' bgcolor='cccccc'><p align='center'>
        	<font size='2'><b>�� ��</b></font></TD>
        	<TD height='118' bgcolor='ededed'><p>
		<font size='2'><b><%=rs.getString("content")%> </TD>
    	</TR>
</TABLE>
<br>

<TABLE border='0' cellpadding='0' cellspacing='0' width='800'>  
    	<TR>    
        	<TD height='40' colspan='2'><p align='center'>
            	<input type='button' value='��������' onclick='send(this.form)'>
            	<input type='button' value='��������' onclick="send1('<%=no%>')">
            	<input type='reset' value='���ư���' onclick='javascript:history.back()'>
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
