<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<link href="/static/css/schedulePopup.css" rel='stylesheet' />
<!-- 팝업창 날짜 선택 부분 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="
https://cdn.jsdelivr.net/npm/fullcalendar@6.1.6/index.global.min.js
"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#ok-button").on("click", function() {
			// 이벤트 등록 처리 
			let data = {
				empId : $("#empId").val(),
				title : $("#title").val(),
				startDate : $("#startDate").val(),
				endDate : $("#endDate").val(),
				content : $("#content").val(),
			}
			// 유효성 검사 
			if(data.title == null || data.title == "") {
				alert('제목을 입력해주세요!');
				$('#title').focus();
				return false;
			}
			if(data.content == null || data.content == "") {
				alert('내용을 입력해주세요!');
				$('#content').focus();
				return false;
			}
			console.log(data);
			let jsonData = JSON.stringify(data);
			console.log(jsonData);
			$.ajax({
				data : jsonData,
				url : "/api/addSchedule",
				type : "POST",

				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log("resultData : " + data);
					location.reload();
					$("#exampleModal").hide();
				},
				error : function(err) {
					//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
					console.log(err);
				}
			});

		});

	});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#delete-button").on("click", function(event) {
		let id = document.getElementById("id").value;
		let empId = document.getElementById("empId").value;
		let startDate = document.getElementById("startDate").value;
		let endDate = document.getElementById("endDate").value;
		let title = document.getElementById("title").value
		let content = document.getElementById("content").value
		
		let json = {
			"id": id,
			"emp_id": empId,
			"startDate": startDate,
			"endDate": endDate,
			"title": title,
			"content": content
		}
		$.ajax({
			url : '/api/deleteSchedule/' + id,
			dataType : 'json',
			data : JSON.stringify(json),
			type : "DELETE",
			contentType : "application/json; charset=UTF-8",
			success : function(res) {
				if(res == "1") {
					window.location.reload();
				} else {
					alert("반영실패");
				} 
			}
		})
	});
		

});
</script>
<script type="text/javascript">
$(document).ready(function() {
	$("#update-button").on("click", function(event) {
		
		let id = $("#id").val();
		let empId = $("#empId").val();
		let startDate = $(".s-date").val();
		let endDate = $(".e-date").val();
		let title = $(".s--title").val();
		let content = $(".c-content").val();
		console.log(id);
		let json = {
			"id": id,
			"emp_id": empId,
			"startDate": startDate,
			"endDate": endDate,
			"title": title,
			"content": content
		}
		console.log(json);
		$.ajax({
			url : '/api/updateSchedule/' + id,
			type : "POST",
			dataType : 'json',
			data : JSON.stringify(json),
			contentType : "application/json; charset=UTF-8",
			success : function(res) {
				console.log(res);
				if(res == "1") {
					window.location.reload();
				} else {
					alert("반영실패");
				}
			}
			
		}		);
	});

});
</script>
<script type="text/javascript">
	$(function() {
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			showOtherMonths : true,
			showMonthAfterYear : true,
			changeYear : true,
			changeMonth : true,
			yearSuffix : "년",
			monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'10', '11', '12' ],
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일' ]
		});
		$('#startDate').datepicker();
		$('#endDate').datepicker();

		$('#startDate').datepicker('setDate', 'today');
		$('#endDate').datepicker('setDate', 'today');
		
	});
</script>
<style type="text/css">
#add-button {
	position: absolute;
	top: 1px;
	right: 230px;
	background: #2C3E50;
	border: 0;
	color: white;
	height: 35px;
	border-radius: 3px;
	width: 157px;
}
</style>
<script>
	document
			.addEventListener(
					'DOMContentLoaded',
					function() {
						var calendarEl = document.getElementById('calendar');
						var calendar = new FullCalendar.Calendar(
								calendarEl,
								{
									// Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
									headerToolbar : {
										left : 'prevYear,prev,next,nextYear today',
										center : 'title',
										right : 'dayGridMonth,dayGridWeek,dayGridDay,'
									},

									selectable : true,
									selectMirror : true,

									navLinks : true, // can click day/week names to navigate views
									editable : true,
									// Create new event
									select : function(arg) {
										Swal.fire(
														{
															html : "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
															icon : "info",
															showCancelButton : true,
															buttonsStyling : false,
															confirmButtonText : "Yes, create it!",
															cancelButtonText : "No, return",
															customClass : {
																confirmButton : "btn btn-primary",
																cancelButton : "btn btn-active-light"
															}
														})
												.then(
														function(result) {
															if (result.value) {
																var title = document
																		.querySelector("input[name=;event_name']").value;
																if (title) {
																	calendar
																			.addEvent({
																				title : title,
																				start : arg.start,
																				end : arg.end,
																				allDay : arg.allDay
																			})
																}
																calendar
																		.unselect()
															} else if (result.dismiss === "cancel") {
																Swal
																		.fire({
																			text : "Event creation was declined!.",
																			icon : "error",
																			buttonsStyling : false,
																			confirmButtonText : "Ok, got it!",
																			customClass : {
																				confirmButton : "btn btn-primary",
																			}
																		});
															}
														});
									},
			
									// Delete event
									eventClick : function(arg) {
										Swal.fire(
														{
															text : "Are you sure you want to delete this event?",
															icon : "warning",
															showCancelButton : true,
															buttonsStyling : false,
															confirmButtonText : "Yes, delete it!",
															cancelButtonText : "No, return",
															customClass : {
																confirmButton : "btn btn-primary",
																cancelButton : "btn btn-active-light"
															}
														})
												.then(
														function(result) {
															if (result.value) {
																arg.event
																		.remove()
															} else if (result.dismiss === "cancel") {
																Swal
																		.fire({
																			text : "Event was not deleted!.",
																			icon : "error",
																			buttonsStyling : false,
																			confirmButtonText : "Ok, got it!",
																			customClass : {
																				confirmButton : "btn btn-primary",
																			}
																		});
															}
														});
									},
									dayMaxEvents : true, // allow "more" link when too many events
									// 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
									 
									events: [
										 <c:forEach var="schedule" items="${scheduleList}" varStatus="vs">
	                                        {
	                                        	id: '${schedule.id}',
	                                        	title: '${schedule.title}',
	                                        	start: '${schedule.startDate}',
	                                        	end: '${schedule.endDate}',
	                                        	color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	                                        },
	                                        
	                                    </c:forEach>
						                    {
						                    title: 'default',
						                    start: '2023-03-01',
						                    end: '2022-03-01'
						                    }
						                ],
						                eventClick:function(event) {
						                	// primarykey 값을 통해서 일정 데이터 출력
						             		let id = parseInt(event.event._def.publicId);
						             		console.log('/api/scheduleDetail/'+id)
						                	// 통신 성공 
						                	$.ajax({
						                		url : '/api/scheduleDetail/'+id,
						                		type : "GET",
						                		dataType : 'json',
						                		success : function(event) {
						                			console.log(event)
						                			$("#id").val(event.id)
						                			$("#title.s--title").val(event.title);
						                			$('#startDate1.s-date').datepicker().val(event.startDate);
						                			$('#endDate1.e-date').datepicker().val(event.endDate);
						                			$(".c-content").val(event.content);
						                			$("#exampleModalDetail").modal("show");
						                		}
						                	});
						                	// DOM 접근해서 값 넣기 -- js, jquery
						                	// value 
						                	// val() <-- input value
						                	// text()
						                	
						                	/* $("#exampleModalDetail").modal("show"); */
						                }
						                
						            });

						            calendar.render();
					});
</script>

<div id='calendar' style="position:relative;">
 <c:if test="${principal.grade>=4}">
	<button type="button" class="btn btn-primary" id="add-button"
		data-bs-toggle="modal" data-bs-target="#exampleModal">일정추가</button>
	</c:if>
</div>
<!-- 일정추가 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="schedule">
					<div class="schedule-head">
						<h1 class="h1-css">일정 추가</h1>
					</div>
					<div class="schedule-body">
						<form id="scheduleData">
							<input type="hidden" name="id" id="id">
							<div class="top">
								<input class="title" id="title" type="text" name="title">
							</div>
							<div class="domain">
								<h3 class="h3-css">시작</h3>
							</div>
							<div class="domain">
								<input class="date" id="startDate" type="text" name="startDate">
							</div>
							<div class="domain">
								<h3 class="h3-css">종료</h3>
							</div>
							<div class="domain">
								<input class="date" id="endDate" type="text" name="endDate">
							</div>
							<div class="domain">
								<h3 class="h3-css">메모</h3>
							</div>
							<div class="domain">
								<input class="empId" id="empId" type="hidden" name="empId"
									id="empId" value="${principal.id}" readonly="readonly">
							</div>
							<div class="domain">
								<textarea class="content" id="content" name="content" rows="5"
									cols="30" placeholder="내용을 입력해주세요"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="ok-button">등
					록</button>
			</div>
		</div>
	</div>
</div>

<!--  -->

<!-- 일정 디테일 Modal -->
<div class="modal fade" id="exampleModalDetail" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<div class="schedule">
					<div class="schedule-head">
						<h1 class="h1-css">일정</h1>
					</div>
					<div class="schedule-body">
						<form id="scheduleData">
							<input type="hidden" id="id" name="id">
							<div class="top">
								<input class="title s--title" id="title" type="text"
									name="title">
							</div>
							<div class="domain">
								<h3 class="h3-css">시작</h3>
							</div>
							<div class="domain">
								<input class="date s-date" id="startDate1" type="text"
									name="startDate">
							</div>
							<div class="domain">
								<h3 class="h3-css">종료</h3>
							</div>
							<div class="domain">
								<input class="date e-date" id="endDate1" type="text"
									name="endDate">
							</div>
							<div class="domain">
								<h3 class="h3-css">메모</h3>
							</div>
							<div class="domain">
								<input class="empId" id="empId" type="hidden" name="empId"
									id="empId" value="${principal.id}" readonly="readonly">
							</div>
							<div class="domain">
								<textarea class="content c-content" id="content" name="content"
									rows="5" cols="30"></textarea>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			<c:if test="${principal.grade>=4}">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal" id="delete-button">삭 제</button>
				<button type="button" class="btn btn-primary" id="update-button">수
					정</button>
					</c:if>
			</div>
		</div>
	</div>
</div>

<!--  -->
<%@include file="/WEB-INF/view/layout/footer.jsp"%>