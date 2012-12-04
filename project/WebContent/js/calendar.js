/*
 * Input ���ڿ� �޷����� ��¥ �־��ִ� �ҽ�
 * ========= ����  ==============================================================================
 * <input type='text' name='date' id='Div_Input'/>  
 * 	//�Է¹ڽ� : id���� div�� id���� '_Input'�� ���δ�. 
 * 
 * <input type='button' value='�޷�' onclick='getCalendar('Div')'/> 
 * 	//�޷� �������� �Լ� ȣ�� : ���ڰ����� ������ �޷��� �־��� Div�� id���� �־��ش�.
 * 
 * <div id='Div' calss='calendar' style='position:absolute;z-index:1;width:200;display:none'></div> 
 * 	//�޷��� ��µ� Div : ���̾�� ���������� ����ְ� ȭ�鿡 ������ �ʰ� �Ѵ�. 
 * 	//class�� ���� ���������� �������� ȣ���� �� �ٸ� �޷��� ������ �ʵ����ϱ� ���� ����
 * ===========================================================================================
 */

//ȯ�漳�� ======================================================================================

var cell_height = 23;

//���ø�
var color1 = "#90D9FF";
var color2 = "#0060FF";
var color3 = "#E0E8EC";
var color4 = "#2222AF";

var table_border_color = color1; //���̺� �׵θ�
var week_title_style = "background-color:"+color2+";color:white;font-weight:bold;"; //��Ÿ��Ʋ ��Ÿ��
var year_style = "font-weight:bold;color:"+color4; //�⵵ ��Ÿ��
var month_style = "font-weight:bold;color:"+color4; //�� ��Ÿ��
var left_style = "cursor:hand;color:"+color2; //���� ���� ��Ÿ��
var right_style = "cursor:hand;color:"+color2; //������ ���� ��Ÿ��
var onmouse_style = "this.style.backgroundColor='"+color1+"';"; //��¥ ���콺 ���� ��Ÿ��
var day_style = "cursor:hand;"; //��¥ ��Ÿ��
var current_day_style = "font-weight:bold;border:1px solid "+color4; //���� ���õ� ��¥ ��Ÿ��
var today_style = "cursor:hand;font-weight:bold;color:"+color4; //���� ��Ÿ��
var today_onmouse_style = "this.style.backgroundColor='"+color2+"';this.style.color='"+color1+"';"; //���� ���콺 ���� ��Ÿ��
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
	//DIV�� �־��� ���̺� �����
	var tags="<table border='0' cellpadding='0' cellspacing='1' width='100%' bgcolor='"+table_border_color+"'>";
	//�� �׺���̼� �����
	tags+="<tr bgcolor='white'><td colspan='7' align='center'><table cellpading=0 cellspacing=0 width=100><tr><td align='center' onclick='pre_month(\""+Div+"\")' style='"+left_style+"'>��</td><td colspan='5' align='center'><span id='"+Div+"_Year' style='"+year_style+"'>"+Year+"</span>&nbsp;/&nbsp;<span id='"+Div+"_Month' style='"+month_style+"'>"+(Month+1)+"</span></td><td align='center' onclick='next_month(\""+Div+"\")' style='"+right_style+"'>��</td></tr></table></td></tr>";
	//���� Ÿ��Ʋ �����
	tags+="<tr height='"+cell_height+"'><td align='center' style='"+week_title_style+"' width='14%'>��</td><td align='center' style='"+week_title_style+"' width='14%'>��</td><td align='center' style='"+week_title_style+"' width='14%'>ȭ</td><td align='center' style='"+week_title_style+"' width='14%'>��</td><td align='center' style='"+week_title_style+"' width='14%'>��</td><td align='center' style='"+week_title_style+"' width='14%'>��</td><td align='center' style='"+week_title_style+"' width='14%'>��</td></tr><tr height='"+cell_height+"'>";
	
	//ǥ���� �⵵�� ���� �־� ��ü ����
	var date = new Date();
	date.setFullYear(Year,Month,1);
	
	//Input ������ ���� ��¥ �� ��������
	var CurDate = $("#"+Div+"_Input").attr("value");
	if(CurDate==""){ //������ ���� ǥ��
		var CurYear= Year;
		var CurMonth=Month;
		var CurDay= Day;
	}else{
		var CurYear= CurDate.substr(0,4);
		var CurMonth=parseInt(CurDate.substr(5,2)-1);
		var CurDay= CurDate.substr(8,2);
	}
	
	//1���� ���� ���ҿ���
	var week = date.getDay();
	
	//1���̵Ǳ� ������ �� ĭ �����
	for(var i =0; i<week;i++){
		tags+="<td bgcolor='#EEEEEE'>&nbsp;</td>";
	}
	//��¥ �����
	while(date.getMonth()==Month){
		//���� �� �����
		if(date.getDate()!=1&&date.getDay()==0){
			tags+="</tr><tr height='"+cell_height+"'>";
		}
		
		
		//Input ������ ������ ��¥�� ǥ���� �ش�.
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
	
	//���� �� ��¥ �� �� �� ĭ �����
	var days=date.getDay();
	if(days!=0){
		var last = 6-days+1;
		for(var i=0;i<last;i++){
			tags+="<td bgcolor='#EEEEEE'>&nbsp;</td>";
		}
	}
	
	//�ϴ� ���� ��¥ ������ֱ�
	var Year = Today['Year'];
	var Month = Today['Month'];
	var Day = Today['Day'];
	if(Month<10)var Month= "0"+Month;
	if(Day<10)var Day= "0"+Day;
	tags+="</tr><tr height='"+cell_height+"'><td colspan='7' align='center' bgcolor='White' onclick=\"$('#"+Div+"_Input').attr('value','"+Year+"-"+Month+"-"+Day+"');$('#"+Div+"').css('display','none');\" style='"+today_style+"' onmouseover=\""+today_onmouse_style+"\" onmouseout=\"this.style.backgroundColor='';this.style.color='black';\">���� : "+Year+"-"+Month+"-"+Day+"</td></tr>";
	
	tags+="</table>";
	$("#"+Div).html(tags);
 }

//Input �ڽ��� ��¥ �־��ֱ�
function getValue(Div,_Day){
	var Year= $("#"+Div+"_Year").html();
	var Month=$("#"+Div+"_Month").html();
	var Day= _Day.innerHTML;

	if(Month<10)Month="0"+Month;
	if(Day<10)Day="0"+Day;
	$("#"+Div+"_Input").attr("value",Year+"-"+Month+"-"+Day);
}

//������ ��������
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

//������ ��������
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
