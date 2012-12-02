/*
 * Input 상자에 달력으로 날짜 넣어주는 소스
 * ========= 구조  ==============================================================================
 * <input type='text' name='date' id='Div_Input'/>  
 * 	//입력박스 : id값을 div의 id값에 '_Input'을 붙인다. 
 * 
 * <input type='button' value='달력' onclick='getCalendar('Div')'/> 
 * 	//달력 가져오는 함수 호출 : 인자값으로 가져온 달력을 넣어줄 Div의 id값을 넣어준다.
 * 
 * <div id='Div' calss='calendar' style='position:absolute;z-index:1;width:200;display:none'></div> 
 * 	//달력이 출력될 Div : 레이어로 페이지에서 띄워주고 화면에 보이지 않게 한다. 
 * 	//class는 같은 페이지에서 여러개를 호출할 때 다른 달력은 보이지 않도록하기 위해 사용됨
 * ===========================================================================================
 */

//환경설정 ======================================================================================

var cell_height = 23;

//템플릿
var color1 = "#90D9FF";
var color2 = "#0060FF";
var color3 = "#E0E8EC";
var color4 = "#2222AF";

var table_border_color = color1; //테이블 테두리
var week_title_style = "background-color:"+color2+";color:white;font-weight:bold;"; //주타이틀 스타일
var year_style = "font-weight:bold;color:"+color4; //년도 스타일
var month_style = "font-weight:bold;color:"+color4; //달 스타일
var left_style = "cursor:hand;color:"+color2; //왼쪽 단추 스타일
var right_style = "cursor:hand;color:"+color2; //오늘쪽 단추 스타일
var onmouse_style = "this.style.backgroundColor='"+color1+"';"; //날짜 마우스 오버 스타일
var day_style = "cursor:hand;"; //날짜 스타일
var current_day_style = "font-weight:bold;border:1px solid "+color4; //이전 선택된 날짜 스타일
var today_style = "cursor:hand;font-weight:bold;color:"+color4; //오늘 스타일
var today_onmouse_style = "this.style.backgroundColor='"+color2+"';this.style.color='"+color1+"';"; //오늘 마우스 오버 스타일
var sunday_style = "cursor:hand;color:red";
var satday_style = "cursor:hand;color:blue";

//==============================================================================================

var date = new Date();
var Today = new Array();
Today['Year']= date.getFullYear();
Today['Month']=date.getMonth()+1;
Today['Day']= date.getDate();

function getCalendar(Div,Year,Month){
	if($("#"+Div).css("display")=="none"){
		$(".calendar").css("display","none");
		$("#"+Div).css("display","block");
	}else{
		$("#"+Div).css("display","none");
		return;
	}
	
	if(!Year) Year = Today['Year'];
	if(!Month) Month =  Today['Month']-1;
	var Day = Today['Day'];
	
	Calendar(Div,Year,Month,Day);
}

function Calendar(Div,Year,Month,Day){
	//DIV에 넣어줄 테이블 만들기
	var tags="<table border='0' cellpadding='0' cellspacing='1' width='100%' bgcolor='"+table_border_color+"'>";
	//달 네비게이션 만들기
	tags+="<tr bgcolor='white'><td colspan='7' align='center'><table cellpading=0 cellspacing=0 width=100><tr><td align='center' onclick='pre_month(\""+Div+"\")' style='"+left_style+"'>◀</td><td colspan='5' align='center'><span id='"+Div+"_Year' style='"+year_style+"'>"+Year+"</span>&nbsp;/&nbsp;<span id='"+Div+"_Month' style='"+month_style+"'>"+(Month+1)+"</span></td><td align='center' onclick='next_month(\""+Div+"\")' style='"+right_style+"'>▶</td></tr></table></td></tr>";
	//요일 타이틀 만들기
	tags+="<tr height='"+cell_height+"'><td align='center' style='"+week_title_style+"' width='14%'>일</td><td align='center' style='"+week_title_style+"' width='14%'>월</td><td align='center' style='"+week_title_style+"' width='14%'>화</td><td align='center' style='"+week_title_style+"' width='14%'>수</td><td align='center' style='"+week_title_style+"' width='14%'>목</td><td align='center' style='"+week_title_style+"' width='14%'>금</td><td align='center' style='"+week_title_style+"' width='14%'>토</td></tr><tr height='"+cell_height+"'>";
	
	//표시할 년도와 달을 넣어 객체 생성
	var date = new Date();
	date.setFullYear(Year,Month,1);
	
	//Input 상자의 기존 날짜 값 가져오기
	var CurDate = $("#"+Div+"_Input").attr("value");
	if(CurDate==""){ //없으면 오늘 표시
		var CurYear= Year;
		var CurMonth=Month;
		var CurDay= Day;
	}else{
		var CurYear= CurDate.substr(0,4);
		var CurMonth=parseInt(CurDate.substr(5,2)-1);
		var CurDay= CurDate.substr(8,2);
	}
	
	//1일의 요일 가죠오기
	var week = date.getDay();
	
	//1일이되기 전까지 빈 칸 만들기
	for(var i =0; i<week;i++){
		tags+="<td bgcolor='#EEEEEE'>&nbsp;</td>";
	}
	//날짜 만들기
	while(date.getMonth()==Month){
		//다음 줄 만들기
		if(date.getDate()!=1&&date.getDay()==0){
			tags+="</tr><tr height='"+cell_height+"'>";
		}
		
		
		//Input 상자의 기존의 날짜를 표시해 준다.
		if(Year==CurYear && Month == CurMonth && date.getDate()==CurDay){
			var style=current_day_style;
		}else{
			if(date.getDay()==0){
				var style= sunday_style;
			}else if(date.getDay()==6){
				var style= satday_style;
			}else{
				var style= day_style;
			}
		}
		
		tags+="<td align='center'  bgcolor='white' style='"+style+"' onMouseOver=\""+onmouse_style+"\" onMouseOut=\"this.style.backgroundColor=''\"  onclick=\"getValue('"+Div+"',this);$('#"+Div+"').css('display','none');\">"+date.getDate()+"</td>";
		date.setDate(date.getDate()+1);
	}
	
	//달의 끝 날짜 이 후 빈 칸 만들기
	var days=date.getDay();
	if(days!=0){
		var last = 6-days+1;
		for(var i=0;i<last;i++){
			tags+="<td bgcolor='#EEEEEE'>&nbsp;</td>";
		}
	}
	
	//하단 오늘 날짜 만들어주기
	var Year = Today['Year'];
	var Month = Today['Month'];
	var Day = Today['Day'];
	if(Month<10)var Month= "0"+Month;
	if(Day<10)var Day= "0"+Day;
	tags+="</tr><tr height='"+cell_height+"'><td colspan='7' align='center' bgcolor='White' onclick=\"$('#"+Div+"_Input').attr('value','"+Year+"-"+Month+"-"+Day+"');$('#"+Div+"').css('display','none');\" style='"+today_style+"' onmouseover=\""+today_onmouse_style+"\" onmouseout=\"this.style.backgroundColor='';this.style.color='black';\">오늘 : "+Year+"-"+Month+"-"+Day+"</td></tr>";
	
	tags+="</table>";
	$("#"+Div).html(tags);
 }

//Input 박스에 날짜 넣어주기
function getValue(Div,_Day){
	var Year= $("#"+Div+"_Year").html();
	var Month=$("#"+Div+"_Month").html();
	var Day= _Day.innerHTML;

	if(Month<10)Month="0"+Month;
	if(Day<10)Day="0"+Day;
	$("#"+Div+"_Input").attr("value",Year+"-"+Month+"-"+Day);
}

//지난달 가져오기
function pre_month(Div){
	var Year= $("#"+Div+"_Year");
	var Month=$("#"+Div+"_Month");
	
	if(Month.html()==1){
		Month.html(12);
		Year.html(parseInt(Year.html())-1);
	}else{
		Month.html(parseInt(Month.html())-1);
	}
	Calendar(Div,Year.html(),parseInt(Month.html())-1);
}

//다음달 가져오기
function next_month(Div){
	var Year= $("#"+Div+"_Year");
	var Month=$("#"+Div+"_Month");
	
	if(Month.html()==12){
		Month.html(1);
		Year.html(parseInt(Year.html())+1);
	}else{
		Month.html(parseInt(Month.html())+1);
	}
	Calendar(Div,Year.html(),parseInt(Month.html())-1);
}
