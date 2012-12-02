(function($) {
   
 $calendarConfig = function (objName) {
  $( "#"+objName ).datepicker({
     showOn: "button"   // 버튼 이미지 삽입 가능
   , buttonImage: "../asset/img/icon/icon_calendar.gif"  // 버튼 이미지 경로
   , buttonImageOnly: true  // true:버튼 이미지만 표시  false:버튼 안에 이미지 표시(default)
   , changeMonth: true   // 월 선택을 combobox로 표현
   , changeYear: true   // 년 선택을 combobox로 표현
   , showOtherMonths: true  // 다른 월도 보여지도록
   , selectOtherMonths: true // 다른 월의 셀도 선택가능하도록
   , dateFormat: "yy-mm-dd" // 날짜 포맷 설정
   , showAnim: "drop"   // 달력 open, close시의 애니메이션 효과 설정
   , dayNamesMin: ["일","월","화","수","목","금","토"]      //요일 해더 표시 설정
   , monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"] //월 combobox 표시 설정
   //, showWeek: true   // 년간 주(week)를 표현
  });
 };
})(jQuery);
 