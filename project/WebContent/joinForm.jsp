<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>ȸ������ �ý��� ȸ������ ������</title>
</head>
<body>
<form name="joinform" action="joinProcess.jsp" method="post">
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>ȸ������ ������</font></b>
		</td>
	</tr>
	<tr><td>���̵� : </td><td><input type="text" name="id"/></td></tr>
	<tr><td>��й�ȣ : </td><td><input type="password" name="pwd"/></td></tr>
	<tr><td>�̸� : </td><td><input type="text" name="name"/></td></tr>
	
	<tr><td>�ڵ�����ȣ : </td><td><input type="text" name="call1"
							size="4" />&nbsp;-&nbsp; <input type="text" name="call2" size="4" />&nbsp;-&nbsp;
							<input type="text" name="call3" size="4" /></td></tr>
	
	<tr><td>������ ����������  : </td><td><input type="text" name="mypage_url" size=30/></td></tr>
	<tr>
		<td colspan="2" align=center>
			<a href="javascript:joinform.submit()">ȸ������</a>&nbsp;&nbsp;
			<a href="javascript:joinform.reset()">�ٽ��ۼ�</a>
		</td>
	</tr>
</table>
</center>
</form>
</body>
</html>
