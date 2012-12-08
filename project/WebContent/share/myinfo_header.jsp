<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[][] menu = {
		{"./myinfo_main.jsp", "마이페이지홈" },
		{"./myinfo_edit.jsp", "회원정보수정" },
		{"./myinfo_history.jsp", "모임참여내역" },
		{"./myinfo_history1.jsp", "모임개설내역" },
		{"./myinfo_delete.jsp", "회원탈퇴" },
	};
  String currentMenu = request.getParameter("current");
%>    
	<!-- Navbar
  ================================================== -->
  <div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
      <div class="container">
        <a class="brand" href="./index.jsp">메인으로</a>
        <div class="nav-collapse collapse">
          <ul class="nav">
          <%
          	for(String[] menuItem : menu) {
          		if (currentMenu != null && currentMenu.equals(menuItem[1])) {
          			out.println("<li class='active'>");
          		} else {
          			out.println("<li class=''>");
          		}
          		
          		out.println("<a href='"+menuItem[0]+"'>"+menuItem[1]+"</a>");
          		out.println("</li>");
          	}
          %>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="container" style="padding-top:50px">
		<h1></h1>
 	</div>
 	
 	