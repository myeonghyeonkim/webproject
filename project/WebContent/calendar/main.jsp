<%@ page isThreadSafe="true" %>
<%@ page session="true" %>
<%@ page buffer="4kb" autoFlush="true" %>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<%@ page import = "java.util.Calendar" %>
<% request.setCharacterEncoding("utf-8"); %> //�ѱ��� �ùٷ� ������� request �⺻��ü �޼ҵ� ȣ��.

<HTML>
<HEAD>
<TITLE> ���� ���� </TITLE>
</HEAD>
<BODY>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

<%
// CalendarŬ������ �ν��Ͻ� cal ���� // �̰� �����ؾ߸� �Ʒ� year,month,date�� ���������� �޾ƿü��ִ°ž�.,
		Calendar cal = Calendar.getInstance();

// JSP �⺻��ü request.getParameter�� ����Ͽ� url�� ���� year, month������ �ε�
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

// ��¥�� �����ϴ� ���� year, month, date�� ���� ��¥�� ����
int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

// url�� ���� �о�� ǥ���ϰ��� �ϴ� ��¥�� ������ ����
if(strYear != null)
{
  	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
}

cal.set(year, month, 1);

int startDay = cal.getMinimum(Calendar.DATE);
// ǥ���ϰ��� �ϴ� ���� ������ ��¥�� ����
int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
// ǥ���ϰ��� �ϴ� ���� ���� ��¥�� ������ ����
int start = cal.get(Calendar.DAY_OF_WEEK);
int newLine = 0;
int j = 0;
%>

<center><font size='5'><b> ���� ���� </b></font></TD>

<TABLE border='0' width='800' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
<br>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
	<TR> 
   	   	<TD> 
        	<%--ǥ���ϰ��� �ϴ� ��¥�� ��, �� ������ ����--%>
        	<a href="main.jsp?year=<%=year-1%>&month=<%=month%>">��</a>
        	<STRONG><%=year%>�� </STRONG> <a href="main.jsp?year=<%=year+1%>&month=<%=month%>">��</a>  
      		</TD>
      		<TD>
        	<DIV align="center">
        	<a href="main.jsp?year=<%=year%>&month=<%=month - 1%>">��</a>  
        	<STRONG><%=month + 1%>�� </STRONG><a href="main.jsp?year=<%=year%>&month=<%=month + 1%>">��</a> 
        	</DIV>
      		</TD>
      		<TD> 
        	<DIV align="right">
        	<a href=main.jsp></a><STRONG><%=year + "-" + (month + 1) + "-" + date%></STRONG>
        	</DIV>
      		</TD> 
    	</TR>
</TABLE>
<BR>

<TABLE width="100%" border="1" cellspacing="0" cellpadding="0">
    	<TR> 
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        	<DIV align="center"><font color="red">��</font></DIV>
     		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        	<DIV align="center">��</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        	<DIV align="center">ȭ</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        	<DIV align="center">��</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        	<DIV align="center">��</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        		<DIV align="center">��</DIV>
      		</TD>
      		<TD width='14%' height='34'align='center' bgcolor='cccccc'> 
        		<DIV align="center"><font color="blue">��</DIV>
      		</TD>
    	</TR>
<%
for(int index = 1; index < start ; index++ )
{
  	out.print("<TD>&nbsp;</TD>");
  	newLine++;
}

for(int index = 1; index <= endDay; index++)
{
  	String color = (newLine == 0)?"RED":"BLACK";
  	// ��¥�� 1�� ������Ű�鼭 ���̺��� �����Ͽ� �޷��� �ϼ�
%>
      <TD width='14%' height='70' align='left' valign='top'>
	  	<font size='2'><b><a href='write.jsp?year=<%=year%>&month=<%=month+1%>&day=<%=index%>'>
	  	<font color = <%=color %>><%=index%></a>
	  
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	String url = "jdbc:odbc:dbMember";
	Connection conn = DriverManager.getConnection(url,"Member","apple");

	Statement stmt = conn.createStatement();

	String strSQL = "SELECT * FROM calendar WHERE year='" + year + "'and month='" + (month + 1) + "' and day='" + index +"'";
	ResultSet rs = stmt.executeQuery(strSQL);  		
  			
while (rs.next()){
%>
<a href=content.jsp?year=<%=year%>&month=<%=month+1%>&day=<%=index%>&no=<%=rs.getInt("no")%> 
   onMouseOver='toggle(document.all.<%="HideShow" + j%>);'
   onMouseOut='toggle(document.all.<%="HideShow" + j%>);'>�� 
<%	
	String strTitle = rs.getString("title");
	out.println(strTitle);
%>

</a><br>
                        
<DIV id='<%= "HideShow" + j%>'style="visibility:hidden;position:
                                absolute;left:369px; top:227px; width:157px; 
                                height:74px; z-index:1"> 
  					
<TABLE height='100' width='200' border='1' cellspacing='1' bgcolor='cccccc'>	
	<TR> 
		<TD colspan='2' bgcolor='cccccc' align='center' height='25'>
		<font size='2'><b>������</b></TD>
	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>�� ��</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=strTitle%></b></TD>

	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>�� ��</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=rs.getString("s_time")%>~<%=rs.getString("e_time")%></b></TD>	
	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>�� ��</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=rs.getString("position")%></b></TD>
	</TR>
	<TR> 
		<TD width='20%'  height='25' bgcolor='cccccc' align='center'>
		<font size='2'><b>�� ��</b></TD>
		<TD bgcolor='cccccc'><font size='2'>
		<b><%=rs.getString("content")%></b></TD>
	</TR>
</TABLE></DIV>
  			
<%
j = j+1;		
}
%>

	  
<%
newLine++;

if(newLine == 7){
	out.print("</TR>");
if(index <= endDay){
	out.print("<TR>");
}
newLine=0;
}
}

while(newLine > 0 && newLine < 7)
{
	out.print("<TD>&nbsp;</TD>");
	newLine++;
}
%>
</TABLE>
  
<SCRIPT LANGUAGE="JavaScript">
<!--
function toggle(e) {
   if(e.style.visibility=="hidden") {
      e.style.top = event.y;
      e.style.left = event.x;
      e.style.visibility="visible";
     }
     else
     {
       e.style.visibility="hidden";
     }
}
-->
</SCRIPT>

</BODY>
</HTML>
