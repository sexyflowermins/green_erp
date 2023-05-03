<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="container-fluid p-0">



		<div class="row">
			<div class="col-12 col-lg-6">
				<div class="card flex-fill w-100">
					<div class="card-header">
						<!-- 여기에 부서 목록 조회 기능 만들어야함 -->

						<form action="/admin/findBydepartment" method="get">
							<div class="mb-3">
								<input class="form-control form-control-lg" type="text" name="name" placeholder="원하는 부서 검색" />
							</div>
							<div class="text-left mt-3">

								<button type="submit" class="btn btn-md btn-primary">부서검색</button>
							</div>
						</form>
						<br>

						<!-- 전체검색 리스트 -->
						<c:forEach var="list" items="${list}">
							<p>
								<a href="/admin/selectdepartment?name=${list.name}">${list.name}</a>
							</p>
						</c:forEach>


					</div>
					<div class="card-body">
						<div class="chart">
							<c:forEach var="selectdepartmentlist" items="${selectdepartmentlist}">
								<p>
									<a href="/admin/selectdepartment?name=${selectdepartmentlist.name}" class="text-decoration-none">${selectdepartmentlist.name}</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-lg-6">
				<div class="card">

					<div class="card-body">
						<div class="chart p-1 ">
							<c:forEach var="employeeslist" items="${employeeslist}">
								<a href="/admin/privacy?id=${employeeslist.id}" class="text-decoration-none">${employeeslist.id}</a>
								<a>${employeeslist.name}</a>
								<a>${employeeslist.address}</a>
								<a>${employeeslist.email}</a>
								<button type="submit" class="btn btn-md btn-primary float-end m-1" onclick="location.href='/admin/workTimeDetail/${employeeslist.id}'">근태 조회</button>
								<button type="submit" class="btn btn-md btn-primary float-end m-1" onclick="location.href='/admin/salaryHistoryDetail/${employeeslist.id}'">연봉 조회</button>
								<div>
									<a href="deleteByEmployees?id=${employeeslist.id}" class="text-decoration-none">사원삭제</a>
								</div>
							</c:forEach>
							<c:if test="${not empty empId}">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">출근 시간</th>
											<th scope="col">퇴근 시간</th>
											<th scope="col">출근 날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="workTimeDetail" items="${workTimeDetail}">
											<tr>
												<td>${workTimeDetail.startTime}</td>
												<td>${workTimeDetail.endTime}</td>
												<td>${workTimeDetail.today}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<canvas id="chartjs-bar"></canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-lg-6">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">부서별 인원</h5>
						<h6 class="card-subtitle text-muted"></h6>
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
						<h5 class="card-title">직급별 인원</h5>
						<h6 class="card-subtitle text-muted"></h6>
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



<!-- 차트 코드 -->

<script>
		document.addEventListener("DOMContentLoaded", function() {
			// Doughnut chart
			new Chart(document.getElementById("chartjs-doughnut"), {
				type: "doughnut",
				data: {
					labels: ["인사관리", "영업", "생산", "경영관리"],
					datasets: [{

						data: [${departmentList[0].count}, ${departmentList[1].count}, ${departmentList[2].count}, ${departmentList[3].count}],

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
					labels: ["사원", "대리", "과장", "부장"],
					datasets: [{
						data: [${gradeCountDto[0].count}, ${gradeCountDto[1].count}, ${gradeCountDto[2].count}, ${gradeCountDto[3].count},${gradeCountDto[4].count}],
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

<%@include file="/WEB-INF/view/layout/footer.jsp"%>