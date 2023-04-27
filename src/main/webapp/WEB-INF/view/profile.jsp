<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">Profile</h1>
			<a class="badge bg-dark text-white ms-2" href="upgrade-to-pro.html"> Get more page examples </a>
		</div>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">
						<h5 class="card-title mb-0">Profile Details</h5>
					</div>
					<div class="card-body text-center">
						<img src="img/avatars/avatar-4.jpg" alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128" height="128" />
						<h5 class="card-title mb-0">Christina Mason</h5>
						<div class="text-muted mb-2">Lead Developer</div>

						<div>
							<c:choose>
								<c:when test="${workTime.startTime == null && workTime.endTime == null}">
									<form action="/ec/start-work" method="post">
										<button type="submit" class="btn btn-lg btn-primary">출근</button>
									</form>
								</c:when>
								<c:when test="${workTime.startTime != null && workTime.endTime == null}">
									<form action="/ec/end-work" method="post">
										<button type="submit" class="btn btn-lg btn-primary">퇴근</button>
									</form>
								</c:when>
								<c:when test="${workTime.startTime != null && workTime.endTime != null}">
									<a class="btn btn-lg btn-primary">고생하셨습니다</a>
								</c:when>
							</c:choose>
						</div>
					</div>
					<hr class="my-0" />
					<%-- 					<div class="card-body">
						<h5 class="h6 card-title">Skills</h5>
						<a href="#" class="badge bg-primary me-1 my-1">${principal.id}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.email}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.age}</a>
						<a href="#" class="badge bg-primary me-1 my-1">${principal.address}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.hireDate}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.resignDate}</a>
						<a href="#" class="badge bg-primary me-1 my-1">${principal.department}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.grade}</a> <a href="#" class="badge bg-primary me-1 my-1">UX</a>
					</div> --%>
					<hr class="my-0" />
					<div class="card-body">
						<h5 class="h6 card-title">About</h5>
						<ul class="list-unstyled mb-0">
							<li class="mb-1"><span data-feather="bookmark" class="feather-sm me-1"></span> 사번 <a href="#">${principal.id}</a></li>
							<li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span> 부서 <a href="#">${principal.department}</a></li>
							<li class="mb-1"><span data-feather="award" class="feather-sm me-1"></span> 직급 <a href="#">${principal.grade}</a></li>

							<li class="mb-1"><span data-feather="map-pin" class="feather-sm me-1"></span> 고향 <a href="#">${principal.address}</a></li>
						</ul>
					</div>
					<hr class="my-0" />
					<div class="card-body">
						<form action="/ec/updateInformation" method="post">
							<div class="mb-3">
								<label class="form-label">password</label> <input class="form-control form-control-lg" type="password" name="password" value="${principal.password}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Name</label> <input class="form-control form-control-lg" type="text" name="name" value="${principal.name}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input class="form-control form-control-lg" type="email" name="email" value="${principal.email}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> <input class="form-control form-control-lg" type="text" name="age" value="${principal.age}" />
							</div>
							<div class="mb-3">
								<label class="form-label">address</label> <input class="form-control form-control-lg" type="text" name="address" value="${principal.address}" />
							</div>

							<div class="text-center mt-3">
								<button type="submit" class="btn btn-lg btn-primary">수정</button>
							</div>
						</form>
						<!-- 						<h5 class="h6 card-title">Elsewhere</h5>
						<ul class="list-unstyled mb-0">
							<li class="mb-1"><a href="#">staciehall.co</a></li>
							<li class="mb-1"><a href="#">Twitter</a></li>
							<li class="mb-1"><a href="#">Facebook</a></li>
							<li class="mb-1"><a href="#">Instagram</a></li>
							<li class="mb-1"><a href="#">LinkedIn</a></li>
						</ul> -->
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
							<form action="/ec/first-password" method="post">
								<div class="flex-grow-1">

									<div class="mb-3">
										
										<c:choose>
											<c:when test="${workList != null}">
												<table class="table">
													<thead>
														<tr class="col-md-5">
															<th class="col-md-5">출근 시간</th>
															<th class="col-md-5">퇴근 시간</th>
															<th class="col-md-5">출근 날짜</th>
															<th class="col-md-5">근무 시간</th>
														</tr>
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
							</form>
						</div>
						<hr />
						<div class="d-flex align-items-start">
							<img src="img/avatars/avatar.jpg" width="36" height="36" class="rounded-circle me-2" alt="Charles Hall">
							<div class="flex-grow-1">
								<small class="float-end text-navy">30m ago</small> <strong>Charles Hall</strong> posted something on <strong>Christina Mason</strong>'s timeline<br /> <small class="text-muted">Today
									7:21 pm</small>

								<div class="border text-sm text-muted p-2 mt-1">Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam
									nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</div>

								<a href="#" class="btn btn-sm btn-danger mt-1"><i class="feather-sm" data-feather="heart"></i> Like</a>
							</div>
						</div>

						<hr />
						<div class="d-flex align-items-start">
							<img src="img/avatars/avatar-2.jpg" width="36" height="36" class="rounded-circle me-2" alt="William Harris">
							<div class="flex-grow-1">
								<small class="float-end text-navy">3h ago</small> <strong>William Harris</strong> posted two photos on <strong>Christina Mason</strong>'s timeline<br /> <small class="text-muted">Today
									5:12 pm</small>

								<div class="row g-0 mt-1">
									<div class="col-6 col-md-4 col-lg-4 col-xl-3">
										<img src="img/photos/unsplash-1.jpg" class="img-fluid pe-2" alt="Unsplash">
									</div>
									<div class="col-6 col-md-4 col-lg-4 col-xl-3">
										<img src="img/photos/unsplash-2.jpg" class="img-fluid pe-2" alt="Unsplash">
									</div>
								</div>

								<a href="#" class="btn btn-sm btn-danger mt-1"><i class="feather-sm" data-feather="heart"></i> Like</a>
							</div>
						</div>

						<hr />

						<div class="d-grid">
							<a href="#" class="btn btn-primary">Load more</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</main>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>