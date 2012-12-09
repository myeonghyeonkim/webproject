<%@ page language="java" contentType="text/html; charset=euc-kr" %>

<HTML>
<HEAD>
<TITLE> 일정관리 </TITLE>

<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

</HEAD>

<BODY>

<%
String user_king=request.getParameter("user_king");
String user_part=request.getParameter("user_part");
String meeting_name=request.getParameter("meeting_name");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
%>

<center><font size='5'><b>일정 등록</b></font></p>

<TABLE border='0' width='800' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
<br>

<FORM Name='calendar1' Method='post' Action='write_ok.jsp?&year=<%=year%>&month=<%=month%>&day=<%=day%>'>

<TABLE border='1' cellpadding='0' cellspacing='0' width='800'>

	<TR>
        	<TD align='center' width='100' height='30' bgcolor='cccccc'>
		<input type='hidden' name='cp_type' value='input'>
		     
		<font size='2'><b>제 목</b></font></TD>
        	<TD bgcolor='ededed'>
        	<input type='text' name='title' maxlength='20' size='38'></TD>
      	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>장 소</b></font></TD >
        	<TD bgcolor='ededed'>
        	<input type='text' name='position' maxlength='40' size='38'></TD>
    	</TR>
    	<TR>
        	<TD bgcolor='cccccc' width='100' height='30'><p align='center'>
        	<font size='2'><b>일 자</b></font></TD>
        	<TD bgcolor='ededed'>
        	<font size='2'>
         	<b><%=year %>년 <%=month%>월 <%=day %>일</b></font></TD>
    	</TR>
    	<TR>
        	<TD height='35' bgcolor='cccccc'><p align="center">
        	<font size='2'><b>시 간</b></font></TD>
        	<TD bgcolor='ededed'>
        	<select name='s_hour'>
            		<option value='0'>0시</option>
            		<option value='1'>1시</option>
           		<option value='2'>2시</option>
            		<option value='3'>3시</option>
            		<option value='4'>4시</option>
            		<option value='5'>5시</option>
            		<option value='6'>6시</option>
            		<option value='7'>7시</option>
            		<option value='8'>8시</option>
            		<option value='9'>9시</option>
           		<option value='10'>10시</option>
        		<option value='11'>11시</option>
    		        <option value='12'>12시</option>
   		        <option value='13'>13시</option>
   		        <option value='14'>14시</option>
  		        <option value='15'>15시</option>
   		        <option value='16'>16시</option>
   		        <option value='17'>17시</option>
            		<option value='18'>18시</option>
           		<option value='19'>19시</option>
         		<option value='20'>20시</option>
     		        <option value='21'>21시</option>
     		        <option value='22'>22시</option>
     		        <option value='23'>23시</option></select> 
            
            	<select name='s_minute'>
          		<option selected value='00'>00</option>
        		<option value='05'>05</option>
            		<option value='10'>10</option>
            		<option value='15'>15</option>
            		<option value='20'>20</option>
           	 	<option value='25'>25</option>
            		<option value='30'>30</option>
            		<option value='35'>35</option>
            		<option value='40'>40</option>
            		<option value='45'>45</option>
            		<option value='50'>50</option>
            		<option value='55'>55</option></select> ▶
            
            	<select name='s_hour1'>
             		<option value='0'>0시</option>
            		<option value='1'>1시</option>
           		<option value='2'>2시</option>
            		<option value='3'>3시</option>
            		<option value='4'>4시</option>
            		<option value='5'>5시</option>
            		<option value='6'>6시</option>
            		<option value='7'>7시</option>
            		<option value='8'>8시</option>
            		<option value='9'>9시</option>
           		<option value='10'>10시</option>
        		<option value='11'>11시</option>
    		        <option value='12'>12시</option>
   		        <option value='13'>13시</option>
   		        <option value='14'>14시</option>
  		        <option value='15'>15시</option>
   		        <option value='16'>16시</option>
   		        <option value='17'>17시</option>
            		<option value='18'>18시</option>
           		<option value='19'>19시</option>
         		<option value='20'>20시</option>
     		        <option value='21'>21시</option>
     		        <option value='22'>22시</option>
     		        <option value='23'>23시</option></select> 
            
            	<select name='s_minute1'>
           		<option selected value='00'>00</option>
        		<option value='05'>05</option>
            		<option value='10'>10</option>
            		<option value='15'>15</option>
            		<option value='20'>20</option>
           	 	<option value='25'>25</option>
            		<option value='30'>30</option>
            		<option value='35'>35</option>
            		<option value='40'>40</option>
            		<option value='45'>45</option>
            		<option value='50'>50</option>
            		<option value='55'>55</option></select></TD>
    	</TR>
    	<TR>
        	<TD height='118' bgcolor='cccccc'><p align='center'>
        	<font size='2'><b>내 용</b></font></TD>
        	<TD height='118' bgcolor='ededed'>
        	<textarea name='content' rows='5' cols='70'></textarea></TD>
    	</TR>
</TABLE>
<br>	
<TABLE border='0' cellpadding='0' cellspacing='0' width='800'>   	
	<TR>
        	<TD height='40' colspan='2'><p align='center'>
            	<input type='button' value='일정 등록' onclick='send(this.form)'> 
            	<input type='reset' value='취소'>
         	</TD>
    	</TR>
</TABLE>
</FORM>

<script language="javascript">
<!--
 function send(form)
 {
 form.submit();
 }
-->
</script>

</BODY>
</HTML> 
