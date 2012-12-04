	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%if(session.getAttribute("id")!=null) {%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	
	<script type="text/javascript" src="js/jquery-1.4.1.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>
	<link type="text/css" href="css/demos.css" rel="stylesheet" />
	<link type="text/css" href="css/ui.all.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery-1.3.2.js"></script>
	<script type="text/javascript" src="js/ui.core.js"></script>
	<script type="text/javascript" src="js/ui.datepicker.js"></script>
	<script type="text/javascript" src="js/ui.datepicker-ko.js"></script>


<script type="text/javascript">

	$(function() {
		  $('#datepicker_1').datepicker({
		  changeMonth: true, changeYear: true,
		  yearRange: '2009:2020',
		  showOn: 'button', buttonImage: 'image/datepicker.gif', buttonImageOnly: true,
		  // buttonText:'선택',
		  altField: '#datepicker', altFormat: 'yy-mm-dd (D)',
		  defaultDate: '+0m+0d' ,
		  numberOfMonths: 2,
		  showButtonPanel: true
		 });
		});
	$(function() {
		  $('#datepicker_2').datepicker({
		  changeMonth: true, changeYear: true,
		  yearRange: '2009:2020',
		  showOn: 'button', buttonImage: 'image/datepicker.gif', buttonImageOnly: true,
		  // buttonText:'선택',
		  altField: '#datepicker', altFormat: 'yy-mm-dd (D)',
		  defaultDate: '+0m+0d' ,
		  numberOfMonths: 2,
		  showButtonPanel: true
		 });
		});
	$(function() {
		  $('#datepicker_3').datepicker({
		  changeMonth: true, changeYear: true,
		  yearRange: '2009:2020',
		  showOn: 'button', buttonImage: 'image/datepicker.gif', buttonImageOnly: true,
		  // buttonText:'선택',
		  altField: '#datepicker', altFormat: 'yy-mm-dd (D)',
		  defaultDate: '+0m+0d' ,
		  numberOfMonths: 2,
		  showButtonPanel: true
		 });
		});
	$(function() {
		  $('#datepicker_4').datepicker({
		  changeMonth: true, changeYear: true,
		  yearRange: '2009:2020',
		  showOn: 'button', buttonImage: 'image/datepicker.gif', buttonImageOnly: true,
		  // buttonText:'선택',
		  altField: '#datepicker', altFormat: 'yy-mm-dd (D)',
		  defaultDate: '+0m+0d' ,
		  numberOfMonths: 2,
		  showButtonPanel: true
		 });
		});


	</script>
	
</head>
<body>
	<div id="meeting">
		<form action ="meeting_create_ok.jsp" method="post">
		<div id="meeting_1">
			<table border="1">
				<tr>
				<td>
					<p>제목입력</p>
					<input type="text" name="subject">	
				</td>
				</tr>
			</table>
		</div>
		<hr/>
		<div id="metting_2">
			<table border="1">
				<tr>
					<td><p>관심사</p></td>
					<td><p>세부목록</p></td>
					<td><p>지역별</p></td>
					<td><p>요일</p></td>
				</tr>
				<tr>
					<td>
						<select name="select_1">
							<option value="computer">컴퓨터</option>
							<option value="english">영어</option>
						</select>
					</td>
					<td>
						<select name="select_2">
							<option value="talking">영어</option>
							<option value="software">소프트웨어</option>
						</select>
					</td>
					<td>
						<select name="select_3">
							<option value="gy">경기</option>
							<option value="se">서울</option>
							<option value="in">인천</option>
							<option value="ga">강원</option>
							<option value="cb">충북</option>
							<option value="cn">충남</option>
							<option value="jb">전북</option>
							<option value="js">전남</option>
							<option value="kb">경북</option>
							<option value="kn">경남</option>
						</select>
					</td>
					<td>
						<select name="select_4">
							<option value="weekday">평일</option>
							<option value="weekend">주말</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<hr/>
		<div id="meeting_3">
			<table border="1">
				<tr>
					<td><p>대표 이미지</p></td>
					<td><p>상세내용입력</p></td>
					<td>
				</tr>
				<tr>
					<td><input type="text" name="group_image"></td>
					<td>
						<textarea name="intro" cols="30" rows="10"></textarea>	
					</td>
				</tr>
			</table>
		</div>
		<hr/>
		
		<hr/>
		<div id="meeting_4">
			<table border="1">
				<tr>
					<td>그룹명</td>
					<td>참여인원</td>
				</tr>
				<tr>
					<td><input type="text" name="meeting_name">
					<td><input type="text" name="limit_user_num">
				</tr>
			</table>
		</div>
		<hr/>
		<div id="meeting_5">
			<table border="1">
				<p>모임기간설정</p>
				<tr>
					  <td class="demo">
  					<input type="text" id="datepicker_1" name="meeting_day_start" size="13" readonly>
						</td>
  				
						<td>
						
						<select name="select_5">
							<option value="오전0시0분">오전0시0분</option>
							<option value="오전1시0분">오전1시0분</option>
							<option value="오전2시0분">오전2시0분</option>
							<option value="오전3시0분">오전3시0분</option>
							<option value="오전4시0분">오전4시0분</option>
							<option value="오전5시0분">오전5시0분</option>
							<option value="오전6시0분">오전6시0분</option>
							<option value="오전7시0분">오전7시0분</option>
							<option value="오전8시0분">오전8시0분</option>
							<option value="오전9시0분">오전9시0분</option>
							<option value="오전10시0분">오전10시0분</option>
							<option value="오전11시0분">오전11시0분</option>
							<option value="오후12시0분">오후12시0분</option>
							<option value="오후1시0분">오후1시0분</option>
							<option value="오후2시0분">오후2시0분</option>
							<option value="오후3시0분">오후3시0분</option>
							<option value="오후4시0분">오후4시0분</option>
							<option value="오후5시0분">오후5시0분</option>
							<option value="오후6시0분">오후6시0분</option>
							<option value="오후7시0분">오후7시0분</option>
							<option value="오후8시0분">오후8시0분</option>
							<option value="오후9시0분">오후9시0분</option>
							<option value="오후10시0분">오후10시0분</option>
							<option value="오후11시0분">오후11시0분</option>
						</select>
						</td>
						
						<td><p>부터</p></td>
						<td class="demo">
  					<input type="text" id="datepicker_2" name="meeting_day_end" size="13" readonly>
						</td>
						<td>
						<select name="select_6">
							<option value="오전0시0분">오전0시0분</option>
							<option value="오전1시0분">오전1시0분</option>
							<option value="오전2시0분">오전2시0분</option>
							<option value="오전3시0분">오전3시0분</option>
							<option value="오전4시0분">오전4시0분</option>
							<option value="오전5시0분">오전5시0분</option>
							<option value="오전6시0분">오전6시0분</option>
							<option value="오전7시0분">오전7시0분</option>
							<option value="오전8시0분">오전8시0분</option>
							<option value="오전9시0분">오전9시0분</option>
							<option value="오전10시0분">오전10시0분</option>
							<option value="오전11시0분">오전11시0분</option>
							<option value="오후12시0분">오후12시0분</option>
							<option value="오후1시0분">오후1시0분</option>
							<option value="오후2시0분">오후2시0분</option>
							<option value="오후3시0분">오후3시0분</option>
							<option value="오후4시0분">오후4시0분</option>
							<option value="오후5시0분">오후5시0분</option>
							<option value="오후6시0분">오후6시0분</option>
							<option value="오후7시0분">오후7시0분</option>
							<option value="오후8시0분">오후8시0분</option>
							<option value="오후9시0분">오후9시0분</option>
							<option value="오후10시0분">오후10시0분</option>
							<option value="오후11시0분">오후11시0분</option>
						</select>
						</td>
				</tr>
			</table>
			
		</div>
		<hr/>
		<div id="meeting_6">
			<table border="1">
				<p>모임 등록일 설정</p>
				<tr>
					<td class="demo">
  					<input type="text" id="datepicker_3" name="sign_day_start" size="13" readonly>
					</td>
					
					<td>
						<select name="select_7">
							<option value="오전0시0분">오전0시0분</option>
							<option value="오전1시0분">오전1시0분</option>
							<option value="오전2시0분">오전2시0분</option>
							<option value="오전3시0분">오전3시0분</option>
							<option value="오전4시0분">오전4시0분</option>
							<option value="오전5시0분">오전5시0분</option>
							<option value="오전6시0분">오전6시0분</option>
							<option value="오전7시0분">오전7시0분</option>
							<option value="오전8시0분">오전8시0분</option>
							<option value="오전9시0분">오전9시0분</option>
							<option value="오전10시0분">오전10시0분</option>
							<option value="오전11시0분">오전11시0분</option>
							<option value="오후12시0분">오후12시0분</option>
							<option value="오후1시0분">오후1시0분</option>
							<option value="오후2시0분">오후2시0분</option>
							<option value="오후3시0분">오후3시0분</option>
							<option value="오후4시0분">오후4시0분</option>
							<option value="오후5시0분">오후5시0분</option>
							<option value="오후6시0분">오후6시0분</option>
							<option value="오후7시0분">오후7시0분</option>
							<option value="오후8시0분">오후8시0분</option>
							<option value="오후9시0분">오후9시0분</option>
							<option value="오후10시0분">오후10시0분</option>
							<option value="오후11시0분">오후11시0분</option>
						</select>
					</td>
					<td><p>부터</p></td>
					<td class="demo">
  				<input type="text" id="datepicker_4" name="sign_day_end" size="13" readonly>
					</td>
					
					<td>
						<select name="select_8">
							<option value="오전0시0분">오전0시0분</option>
							<option value="오전1시0분">오전1시0분</option>
							<option value="오전2시0분">오전2시0분</option>
							<option value="오전3시0분">오전3시0분</option>
							<option value="오전4시0분">오전4시0분</option>
							<option value="오전5시0분">오전5시0분</option>
							<option value="오전6시0분">오전6시0분</option>
							<option value="오전7시0분">오전7시0분</option>
							<option value="오전8시0분">오전8시0분</option>
							<option value="오전9시0분">오전9시0분</option>
							<option value="오전10시0분">오전10시0분</option>
							<option value="오전11시0분">오전11시0분</option>
							<option value="오후12시0분">오후12시0분</option>
							<option value="오후1시0분">오후1시0분</option>
							<option value="오후2시0분">오후2시0분</option>
							<option value="오후3시0분">오후3시0분</option>
							<option value="오후4시0분">오후4시0분</option>
							<option value="오후5시0분">오후5시0분</option>
							<option value="오후6시0분">오후6시0분</option>
							<option value="오후7시0분">오후7시0분</option>
							<option value="오후8시0분">오후8시0분</option>
							<option value="오후9시0분">오후9시0분</option>
							<option value="오후10시0분">오후10시0분</option>
							<option value="오후11시0분">오후11시0분</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<hr/>
		<div id="meeting_7">
			<table border="1">
				<tr>
					<td><p>모임장소입력</p>
					<input type="text" name="input_place"></td>
				</tr>
				<tr>
					<td><p>지도</p>
					<input type="text" name="map"><td>
					<!-- 지도연동 ----------------------------------------------------->
				</tr>
			</table>
			
		</div>
		<hr/>
		<div id="meeting_8">
				<input type="submit" value="모임개설하기">
		</div>		
</form>
</div>
</body>
</html>
<%}%>