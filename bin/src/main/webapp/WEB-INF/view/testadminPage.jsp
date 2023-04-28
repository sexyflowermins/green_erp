<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

			<main class="content">
				<div class="container-fluid p-0">

					<div class="mb-3">
						<h1 class="h3 d-inline align-middle">Chart.js</h1>
						<a class="badge bg-dark text-white ms-2" href="upgrade-to-pro.html">
      Get more chart examples
  </a>
					</div>
					<div class="row">
						<div class="col-12 col-lg-6">
							<div class="card flex-fill w-100">
								<div class="card-header">
									<!-- 여기에 부서 목록 조회 기능 만들어야함 -->
									<form action="findBydepartment" method="get">
									<div class="mb-3">
											 <input class="form-control form-control-lg" type="text" name=department" placeholder="원하는 부서 검색" />
										</div>
										<div class="text-left mt-3">
											 <a class="btn btn-lg btn-primary"href="http://localhost:8080/findAll">전체검색</a>
											 <button type="submit" class="btn btn-lg btn-primary">선택검색</button>
										</div>
									</form>
									<br>
									
									
									<c:forEach var="list" items="${list}">
										<p><a></a>${list.department}</p>
									</c:forEach>
									
									
									<c:forEach var="list" items="${selectdepartmentlist}">
										<p><a></a>${list.department}</p>
									</c:forEach>
								</div>
								<div class="card-body">
									<div class="chart">
										<canvas id="chartjs-line"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="card">
								<div class="card-header">
									<!-- 부서목록 클릭하면 사원 이름 나오는 기능 -->
								</div>
								<div class="card-body">
									<div class="chart">
										<canvas id="chartjs-bar"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">Doughnut Chart</h5>
									<h6 class="card-subtitle text-muted">Doughnut charts are excellent at showing the relational proportions between data.</h6>
								</div>
								<div class="card-body">
									<div class="chart chart-sm">
										<canvas id="chartjs-doughnut"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12 col-lg-6">
							<div class="card">
								<div class="card-header">
									<h5 class="card-title">Pie Chart</h5>
									<h6 class="card-subtitle text-muted">Pie charts are excellent at showing the relational proportions between data.</h6>
								</div>
								<div class="card-body">
									<div class="chart chart-sm">
										<canvas id="chartjs-pie"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>
	<script src="js/app.js"></script>

	
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Doughnut chart
			new Chart(document.getElementById("chartjs-doughnut"), {
				type: "doughnut",
				data: {
					labels: ["Social", "Search Engines", "Direct", "Other"],
					datasets: [{
						data: [260, 125, 54, 146],
						backgroundColor: [
							window.theme.primary,
							window.theme.success,
							window.theme.warning,
							"#dee2e6"
						],
						borderColor: "transparent"
					}]
				},
				options: {
					maintainAspectRatio: false,
					cutoutPercentage: 65,
					legend: {
						display: false
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Pie chart
			new Chart(document.getElementById("chartjs-pie"), {
				type: "pie",
				data: {
					labels: ["Social", "Search Engines", "Direct", "Other"],
					datasets: [{
						data: [260, 125, 54, 146],
						backgroundColor: [
							window.theme.primary,
							window.theme.warning,
							window.theme.danger,
							"#dee2e6"
						],
						borderColor: "transparent"
					}]
				},
				options: {
					maintainAspectRatio: false,
					legend: {
						display: false
					}
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Radar chart
			new Chart(document.getElementById("chartjs-radar"), {
				type: "radar",
				data: {
					labels: ["Speed", "Reliability", "Comfort", "Safety", "Efficiency"],
					datasets: [{
						label: "Model X",
						backgroundColor: "rgba(0, 123, 255, 0.2)",
						borderColor: window.theme.primary,
						pointBackgroundColor: window.theme.primary,
						pointBorderColor: "#fff",
						pointHoverBackgroundColor: "#fff",
						pointHoverBorderColor: window.theme.primary,
						data: [70, 53, 82, 60, 33]
					}, {
						label: "Model S",
						backgroundColor: "rgba(220, 53, 69, 0.2)",
						borderColor: window.theme.danger,
						pointBackgroundColor: window.theme.danger,
						pointBorderColor: "#fff",
						pointHoverBackgroundColor: "#fff",
						pointHoverBorderColor: window.theme.danger,
						data: [35, 38, 65, 85, 84]
					}]
				},
				options: {
					maintainAspectRatio: false
				}
			});
		});
	</script>
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Polar Area chart
			new Chart(document.getElementById("chartjs-polar-area"), {
				type: "polarArea",
				data: {
					labels: ["Speed", "Reliability", "Comfort", "Safety", "Efficiency"],
					datasets: [{
						label: "Model S",
						data: [35, 38, 65, 70, 24],
						backgroundColor: [
							window.theme.primary,
							window.theme.success,
							window.theme.danger,
							window.theme.warning,
							window.theme.info
						]
					}]
				},
				options: {
					maintainAspectRatio: false
				}
			});
		});
	</script>
	<%@include file="/WEB-INF/view/layout/footer.jsp"%>