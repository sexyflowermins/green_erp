<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Profile</h1>
			
		</div>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">
						<h5 class="card-title mb-0">Profile Details</h5>
					</div>
					<div>
					<c:choose>
					<c:when test="${principal != null}">
					<div class="card-body text-center">
					<!-- <div class="d-flex justify-content-center align-item-center mt-3"> -->
						<img src="/employees/profile/${principal.uploadFileName}" alt="" class="img-fluid rounded-circle mb-2" width="128"
							height="128" />
					</div>
					</c:when>
					<c:otherwise>
						<div class="m-profile"></div>
					</c:otherwise>
					</c:choose>
					</div>
					<div class="card-body text-center">
						<div class="text-muted mb-2"><h3>${principal.dname}부 - ${principal.name}</h3></div>

						<div>
							<c:choose>
								<c:when
									test="${workTime.startTime == null && workTime.endTime == null}">
									<form action="/ec/start-work" method="post">
										<button type="submit" class="btn btn-lg btn-primary">출근</button>
									</form>
								</c:when>
								<c:when
									test="${workTime.startTime != null && workTime.endTime == null}">
									<form action="/ec/end-work" method="post">
										<button type="submit" class="btn btn-lg btn-danger">퇴근</button>
									</form>
								</c:when>
								<c:when
									test="${workTime.startTime != null && workTime.endTime != null}">
									<a class="btn btn-lg btn-primary">고생하셨습니다</a>
								</c:when>
							</c:choose>
						</div>
					</div>
					<hr class="my-0" />
					
					<hr class="my-0" />
					<div class="card-body">
						<h5 class="h6 card-title">About</h5>
						<ul class="list-unstyled mb-0">
							<li class="mb-1"><span data-feather="bookmark"
								class="feather-sm me-1"></span> 사번 <a href="#">${principal.id}</a></li>
							<li class="mb-1"><span data-feather="briefcase"
								class="feather-sm me-1"></span> 부서 <a href="#">${principal.dname}</a></li>
							<li class="mb-1"><span data-feather="award"
								class="feather-sm me-1"></span> 직급 <a href="#">${principal.gname}</a></li>

							<li class="mb-1"><span data-feather="map-pin"
								class="feather-sm me-1"></span> 고향 <a href="#">${principal.address}</a></li>
						</ul>
					</div>
					<hr class="my-0" />
					<div class="card-body">
					</div>
				</div>
			</div>

			<div class="col-md-8 col-xl-9">
				<div class="card">
					<div class="card-header">

						<h5 class="card-title mb-0">Activities</h5>
					</div>
					<div class="card-body h-100">
						<div class="d-flex align-items-start">
							<div class="flex-grow-1">

								<div class="mb-3">

									<c:choose>
										<c:when test="${workList != null}">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">출근 시간</th>
														<th scope="col">퇴근 시간</th>
														<th scope="col">근무 날짜</th>
<!-- 														<th scope="col">근무 시간</th>
 -->													</tr>
												</thead>
												<tbody>
													<c:forEach var="workList" items="${workList}">
														<tr>
															<td>${workList.startTime}</td>
															<td>${workList.endTime}</td>
															<td>${workList.today}</td>
															
															<%-- 	<td>${(workList.endTime - workList.startTime)}</td> --%>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</c:when>
										<c:otherwise>
											<p>아직 출근 기록 없습니다</p>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
						<hr />
						<div class="d-flex align-items-start">
							<div class="flex-grow-1">

								<c:choose>
									<c:when test="${mySalaryList != null}">
										<table class="table">
											<thead>
												<tr>
													<th scope="col">사번</th>
													<th scope="col">이름</th>
													<th scope="col">년도</th>
													<th scope="col">직무 평가 등급</th>
													<th scope="col">평가 등급의 성과급(%)</th>
													<th scope="col">작년연봉</th>
													<th scope="col">성과급</th>
													<th scope="col">인상된 연봉</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="mySalaryList" items="${mySalaryList}">
													<tr>
														<td>${mySalaryList.id}</td>
														<td>${mySalaryList.name}</td>
														<td>${mySalaryList.toyear1}</td>
														<td>${mySalaryList.evaluation}</td>
														<td>${mySalaryList.rate}</td>
														<td>${mySalaryList.lastYearSalary}</td>
														<td>${mySalaryList.bonus}</td>
														<td>${mySalaryList.thisYearSalary}</td>
														<%-- 	<td>${(workList.endTime - workList.startTime)}</td> --%>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</c:when>
									<c:otherwise>
										<p>받은 연봉 기록이 없습니다</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>

						<hr />
						<div class="d-flex align-items-start">
							<div class="flex-grow-1">
								<form class="row g-3" action="/ec/updateInformation"
									method="post">
									<div class="col-md-6">
										<label for="inputEmail4" class="form-label">Email</label> <input
											type="email" class="form-control" id="inputEmail4"
											name="email" value="${principal.email}">
									</div>
									<div class="col-md-6">
										<label for="inputPassword4" class="form-label">Password</label>
										<input type="password" class="form-control"
											id="inputPassword4" name="password"
											value="${principal.password}">
									</div>
									<div class="col-12">
										<label for="inputAddress" class="form-label">Address</label> <input
											type="text" class="form-control" id="inputAddress"
											name="address" value="${principal.address}">
									</div>
									<div class="col-md-6">
										<label for="inputEmail4" class="form-label">NAME</label> <input
											type="text" class="form-control" id="inputEmail4" name="name"
											value="${principal.name}">
									</div>
									<div class="col-md-6">
										<label for="inputPassword4" class="form-label">Age</label> <input
											type="text" class="form-control" id="inputPassword4"
											name="age" value="${principal.age}">
									</div>

									<div class="col-12 d-md-flex justify-content-md-end">
										<button type="submit" class="btn btn-primary ">정보수정</button>
									</div>
								</form>
							</div>
						</div>

						<hr />

					</div>
				</div>
			</div>
		</div>

	</div>
</main>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>