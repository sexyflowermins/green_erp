<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 추가</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>
<!-- 팝업창 날짜 선택 부분 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
   $(function() {
      $.datepicker.setDefaults({
         dateFormat : 'yy-mm-dd',
         showOtherMonths : true,
         showMonthAfterYear : true,
         changeYear : true,
         changeMonth : true,
      yearSuffix: "년",
       monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
       monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
       dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일']   
        });
        $('#startDate').datepicker();
        $('#endDate').datepicker();
        
        $('#startDate').datepicker('setDate', 'today');
        $('#endDate').datepicker('setDate', 'today');
   });
</script>
</head>
<body>
   <div class="schedule">
      <div class="schedule-head">
         <h1 class="h1-css">일정 추가</h1>
      </div>
      <div class="schedule-body">
         <form id = "scheduleData">
            <div class="top">
               <input class="title" id="title" type="text" name="title" placeholder="제목을 입력해주세요">
            </div>
            <div class="domain">
               <h3 class="h3-css">시작</h3>
            </div>
            <div class="domain">
               <input class="date" id="startDate" type="text" name="startDate" id="startDate">
            </div>
            <div class="domain">
               <h3 class="h3-css">종료</h3>
            </div>
            <div class="domain">
               <input class="date" id="endDate" type="text" name="endDate" id="endDate">
            </div>
            <div class="domain">
               <h3 class="h3-css">메모</h3>
            </div>
            <div class="domain">
               <textarea class="content" id="content" name="content" rows="5" cols="30" placeholder="내용을 입력해주세요"></textarea>
            </div>
         </form>
            <button class="ok-button" type="button">등록</button>
      </div>
   </div>
</body>
</html>