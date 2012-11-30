<!-- logout.jsp -->

<%
	session.invalidate();

%>

<script>
	alert("로그아웃");
	document.location="index.jsp";
</script>