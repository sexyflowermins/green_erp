<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<main class="content">
	<div class="container-fluid p-0">

		<h1 class="h3 mb-3">
			<strong>Analytics</strong> Dashboard
		</h1>

		<div class="row">
			<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
				<div class="card flex-fill w-100">
					<div class="card-header">

						<h5 class="card-title mb-0">카테고리 비율</h5>
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
									<tr>
										<td>${boardList[0].categoryName}</td>
										<td class="text-end">${countList[0].count}</td>
									</tr>
									<tr>
										<td>${boardList[1].categoryName}</td>
										<td class="text-end">${countList[1].count}</td>
									</tr>
									<tr>
										<td>${boardList[2].categoryName}</td>
										<td class="text-end">${countList[2].count}</td>
									</tr>
									<tr>
										<td>${boardList[3].categoryName}</td>
										<td class="text-end">${countList[3].count}</td>
									</tr>
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
							<div class="carousel-item active">
								<img src="/static/img/photos/bg-image1.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>${noticeList[0].title}</h5>
									<p>${noticeList[0].content}</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="/static/img/photos/bg-image2.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>${noticeList[1].title}</h5>
									<p>${noticeList[1].content}</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="/static/img/photos/bg-image3.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>${noticeList[2].title}</h5>
									<p>${noticeList[2].content}</p>
								</div>
							</div>
							<div class="carousel-item">
								<img src="/static/img/photos/bg-image4.jpg"
									class="d-block w-100" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>${noticeList[3].title}</h5>
									<p>${noticeList[3].content}</p>
								</div>
							</div>

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

						<h5 class="card-title mb-0">
							<a href="/calender/scheduleView">Calendar</a>
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

		<div class="row">
			<div class="col-12 col-lg-8 col-xxl-9 d-flex">
				<div class="card flex-fill">
					<div class="card-header">

						<h5 class="card-title mb-0">자유 게시판</h5>
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

								<tr>
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
				<div class="card flex-fill w-100">
					<div class="card-header">

						<h5 class="card-title mb-0">Monthly Sales</h5>
					</div>
					<div class="card-body d-flex w-100">
						<div class="align-self-center chart chart-lg">
							<canvas id="chartjs-dashboard-bar"></canvas>
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
</script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>
