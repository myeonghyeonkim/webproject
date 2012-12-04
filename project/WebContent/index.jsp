<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STUDY-MEETING</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet">
</head>
<body>
	<div id="wrap">
		<div id="top">
			<div id="top_left">
			<h1>우리들의 스터디공간</h1>
			<h1>S T U D Y - M E E T I N G</h1>
			</div>
			<div id="top_right"> 
			</div>
			<div id="top_bottom">
			<ul class="nav nav-tabs">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">마이페이지</a></li>
				</ul>
			</div>
		</div>
		
		<div id="body">
			<div class="body_1">
				<img src="C:\Users\0\Desktop\연필_S~1.JPG">
			</div>
			<div class="body_2">
				<h1> 로그인</h1>
				<form name="loginform" action="loginProcess.jsp" method="post">
					<form class="form-horizontal">
  						<div class="control-group">
    						<label class="control-label" for="inputEmail">Email</label>
    						<div class="controls">
     	 						<input type="text" id="inputEmail" placeholder="Email">
     	 						
    						</div>
  						</div>
  						<div class="control-group">
    						<label class="control-label" for="inputPassword">Password</label>
    						<div class="controls">
      							<input type="password" id="inputPassword" placeholder="Password">
    						</div>
  						</div>
  						<div class="control-group">
    						<div class="controls">
     							 <label class="checkbox">
        							<input type="checkbox"> Remember me
        							<button type="submit" class="btn btn-large">로그인</button>
        							<button type="submit" class="btn btn-large">회원가입</button>
      							</label>
    						</div>
  						</div>
					</form>
					<a href="javascript:loginform.submit()">로그인</a>&nbsp;&nbsp;	
					<a href="joinForm.jsp">회원가입</a>	
						<br/>
				</form>
				<button class="btn btn-large btn-block" type="button">모임 개설하기</button>
			</div>
			
			<!-- body3 -->
			
			<div class="body_3">
			   <!-- Select Multiple -->
          <label class="control-label"></label>
          <h1>Category</h1>
          	

			</div>
			<div class="body_4">
			<h1>공지사항</h1>
			<div id="boardBox">
				<h3 class="tab01"><a href="#noticeList"></a></h3>
				<div id="noticeList">
					<ul>
						<li><a href="#">asdfasdfasdfasdfasdfadsfaadsfasf</a></li>
						<li><a href="#">asdfasdfasdfasdfasdfadsfaadsfasf</a></li>
						<li><a href="#">asdfasdfasdfasdfasdfadsfaadsfasf</a></li>
						<li><a href="#">asdfasdfasdfasdfasdfadsfaadsfasf</a></li>
						<li><a href="#">asdfasdfasdfasdfasdfadsfaadsfasf</a></li>
					</ul>
					<p class="more"><a href="#">더보기</a></p>
				</div>
			</div>
			</div>
			
			<div class="body_5">
			<h1>모임정보</h1>
			</div>
		
		</div>
		<div id="bottom">
			<h1>COPY RIGHT</h1>
			우리사이트의 copyriht는 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx입니다.
		</div>
	</div>
</body>
</html>