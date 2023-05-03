<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<main class="content">
	<div class="container-fluid p-0">

		<h1 class="h3 mb-3 animate__animated animate__zoomIn animate__fast">
			<strong>Green</strong> Company
		</h1>

		<div class="row animate__animated animate__zoomIn animate__slow">
			<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
				<div class="card flex-fill w-100">
					<div class="card-header">
						<h5 class="card-title mb-0 ">전체 카테고리 비율</h5>
					</div>
					<div class="card-body d-flex">
						<div class="align-self-center w-100">
							<div class="py-3">
								<div class="chart chart-xs">
									<canvas id="chartjs-dashboard-pie"></canvas>
								</div>
							</div>

							<table class="table mb-0">
								<tbody>
									<c:forEach var="list" items="${countList}">
										<tr>
											<td>${list.categoryName}</td>
											<td class="text-end">${list.count}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-12 col-xxl-6 d-flex order-3 order-xxl-2">
				<div class="card flex-fill w-100">
					<div class="card-header">
						<h5 class="card-title mb-0">최근 공지사항</h5>
					</div>
					<div id="carouselExampleCaptions" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="3" aria-label="Slide 4"></button>
						</div>
						<div class="carousel-inner">
							<c:if test="${headerNoticeList[0] != null}">
								<div class="carousel-item active">
									<img src="/static/img/photos/bg-image1.jpg"
										class="d-block w-100" alt="...">
									<div
										class="carousel-caption d-none d-md-block bg-light opacity-50 rounded-1">
										<h5 class="fw-bolder fs-1 text-truncate opacity-100 mb-3">${headerNoticeList[0].title}</h5>
										<p class="fw-bold text-dark text-truncate opacity-100">${headerNoticeList[0].content}</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="/static/img/photos/bg-image2.jpg"
										class="d-block w-100" alt="...">
									<div
										class="carousel-caption d-none d-md-block bg-light opacity-50 rounded-1">
										<h5 class="fw-bolder fs-1 text-truncate opacity-100 mb-3">${headerNoticeList[1].title}</h5>
										<p class="fw-bold text-dark text-truncate">${headerNoticeList[1].content}</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="/static/img/photos/bg-image3.jpg"
										class="d-block w-100" alt="...">
									<div
										class="carousel-caption d-none d-md-block bg-light opacity-50 rounded-1">
										<h5 class="fw-bolder fs-1 text-truncate opacity-100 mb-3">${headerNoticeList[2].title}</h5>
										<p class="fw-bold text-dark text-truncate opacity-100">${headerNoticeList[2].content}</p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="/static/img/photos/bg-image4.jpg"
										class="d-block w-100" alt="...">
									<div
										class="carousel-caption d-none d-md-block bg-light opacity-50 rounded-1">
										<h5 class="fw-bolder fs-1 text-truncate opacity-100 mb-3">${headerNoticeList[3].title}</h5>
										<p class="fw-bold text-dark text-truncate opacity-100">${headerNoticeList[3].content}</p>
									</div>
								</div>
							</c:if>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1">
				<div class="card flex-fill">
					<div class="card-header">

						<h5 class="card-title mb-0 ">
							<a href="/calender/scheduleView" class="text-decoration-none ">일정</a>
						</h5>
					</div>
					<div class="card-body d-flex">
						<div class="align-self-center w-100">
							<div class="chart">
								<div id="datetimepicker-dashboard"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row animate__animated animate__zoomIn animate__slow">
			<div class="col-12 col-lg-8 col-xxl-9 d-flex">
				<div class="card flex-fill">
					<div class="card-header ">
						<h5 class="card-title mb-0 text-primary" onclick="location.href='/board/list'">자유
							게시판</h5>
					</div>
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th>작성자</th>
								<th class="d-none d-xl-table-cell">작성일</th>
								<th class="d-none d-xl-table-cell">제목</th>
								<th>카테고리</th>
								<th class="d-none d-md-table-cell">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList}">
								<c:choose>
									<c:when test="${board.category eq 1}">
										<c:set var="button" value="success"></c:set>
									</c:when>
									<c:when test="${board.category eq 2}">
										<c:set var="button" value="warning"></c:set>
									</c:when>
									<c:when test="${board.category eq 3}">
										<c:set var="button" value="danger"></c:set>
									</c:when>
									<c:when test="${board.category eq 4}">
										<c:set var="button" value="primary"></c:set>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>

								<tr onclick="location.href='/board/detail/${board.id}'">
									<td>${board.employeesName}</td>
									<td class="d-none d-xl-table-cell">${board.dateTime}</td>
									<td class="d-none d-xl-table-cell">${board.title}</td>
									<td><span class="badge bg-${button} ms-2">${board.categoryName}</span></td>
									<td class="d-none d-md-table-cell">${board.views}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
			<div class="col-12 col-lg-4 col-xxl-3 d-flex">

				<div class="card flex-fill w-100 d-flex justify-content-center">
						<div class="p-5" >
							<div class="float-end fs-6">
								<div class="temp_min text-dark m-1" ></div>
								<div class="temp_max text-dark m-1" ></div>
								<div class="humidity text-dark m-1" ></div>
								<div class="wind text-dark m-1" ></div>
								<div class="cloud text-dark m-1" ></div>
							</div>
							<div>
								<div class="current_temp text-dark fs-1"></div>
								<div class="weather_description text-dark fs-4" ></div>
								<div class="city text-dark fs-5"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

</main>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Pie chart
		new Chart(document.getElementById("chartjs-dashboard-pie"), {
			type : "pie",
			data : {
				labels : [ "운동", "음악", "게임", "회사" ],
				datasets : [ {
					data : [ ${countList[0].count}, ${countList[1].count}, ${countList[2].count}, ${countList[3].count} ],
					backgroundColor : [ window.theme.success,
							window.theme.warning, window.theme.danger,
							window.theme.primary ],
					borderWidth : 5
				} ]
			},
			options : {
				responsive : !window.MSInputMethodContext,
				maintainAspectRatio : false,
				legend : {
					display : false
				},
				cutoutPercentage : 75
			}
		});
	});
	
	var weatherIcon = {
		    '01' : 'fas fa-sun',
		    '02' : 'fas fa-cloud-sun',
		    '03' : 'fas fa-cloud',
		    '04' : 'fas fa-cloud-meatball',
		    '09' : 'fas fa-cloud-sun-rain',
		    '10' : 'fas fa-cloud-showers-heavy',
		    '11' : 'fas fa-poo-storm',
		    '13' : 'far fa-snowflake',
		    '50' : 'fas fa-smog'
		};

		// 날씨 api - 부산
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+'seoul'+"&appid="+"b1b7f03c32e5f5f4ac70fb27ed83b55d";
		$.ajax({
		    url: apiURI,
		    dataType: "json",
		    type: "GET",
		    async: "false",
		    success: function(resp) {

		        var $Icon = (resp.weather[0].icon).substr(0,2);
		        var $weather_description = resp.weather[0].main;
		        var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
		        var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
		        var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
		        var $city = '부산';
		        var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
		        var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
		        var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
		        

		        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
		        $('.weather_description').prepend($weather_description);
		        $('.current_temp').prepend($Temp);
		        $('.humidity').prepend($humidity);
		        $('.wind').prepend($wind);
		        $('.city').append($city);
		        $('.cloud').append($cloud);
		        $('.temp_min').append($temp_min);
		        $('.temp_max').append($temp_max);               
		    }
		});

</script>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>
