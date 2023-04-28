<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
<div class="container-fluid p-0">

	<div class="mb-3">
		<h1 class="h3 d-inline align-middle">Profile</h1>
		<a class="badge bg-dark text-white ms-2" href="upgrade-to-pro.html">
			Get more page examples </a>
	</div>
	<div class="row">
		<div class="col-md-4 col-xl-3">
			<div class="card mb-3">
				<div class="card-header">
					<h5 class="card-title mb-0">Profile Details</h5>
				</div>
				<div class="card-body text-center">
					<img src="img/avatars/avatar-4.jpg" alt="Christina Mason"
						class="img-fluid rounded-circle mb-2" width="128" height="128" />
					<h5 class="card-title mb-0">Christina Mason</h5>
					<div class="text-muted mb-2">Lead Developer</div>

					<div>
						<a class="btn btn-primary btn-sm" href="#">Follow</a> <a
							class="btn btn-primary btn-sm" href="#"><span
							data-feather="message-square"></span> Message</a>
					</div>
				</div>
				<hr class="my-0" />

				<hr class="my-0" />
				<div class="card-body">
					<h5 class="h6 card-title">About</h5>
					<ul class="list-unstyled mb-0">
						<li class="mb-1"><span data-feather="bookmark"
							class="feather-sm me-1"></span> 사번 <a href="#">${employees.name}</a></li>
						<li class="mb-1"><span data-feather="briefcase"
							class="feather-sm me-1"></span> 부서 <a href="#">${employees.department}</a></li>
						<li class="mb-1"><span data-feather="award"
							class="feather-sm me-1"></span> 직급 <a href="#">${employees.grade}</a></li>
						<li class="mb-1"><span data-feather="map-pin"
							class="feather-sm me-1"></span> 고향 <a href="#">${employees.address}</a></li>
					</ul>
				</div>
				<hr class="my-0" />
			</div>
		</div>

		<div class="col-md-8 col-xl-9">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title mb-0">Activities</h5>
				</div>
				<div class="card-body h-100">
					<div class="d-flex align-items-start">
						<form action="updatefromadmin" method="post">
							<div class="mb-3">
								<label class="form-label">password</label> <input
									class="form-control form-control-lg" type="text"
									name="password" value="${employees.password}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Name</label> <input
									class="form-control form-control-lg" type="text" name="name"
									value="${employees.name}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input
									class="form-control form-control-lg" type="email" name="email"
									value="${employees.email}" />
							</div>
							<div class="mb-3">
								<label class="form-label">Age</label> <input
									class="form-control form-control-lg" type="text" name="age"
									value="${employees.age}" />
							</div>
							<div class="mb-3">
								<label class="form-label">address</label> <input
									class="form-control form-control-lg" type="text" name="address"
									value="${employees.address}" />
							</div>
							<div class="mb-3">
								<label class="form-label">hire_data</label> <input
									class="form-control form-control-lg" type="text"
									name="hireDate" value="${employees.hireDate}" />
							</div>
							<div class="mb-3">
								<label class="form-label">resign_date</label> <input
									class="form-control form-control-lg" type="text"
									name="resignDate" value="${employees.resignDate}" />
							</div>
							<div class="mb-3">
								<label class="form-label">department</label> 
									<select name="department" class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
										<option selected value="1">인사관리</option>
										<option value="2">영업</option>
										<option value="3">생산</option>
										<option value="4">경영관리</option>
									</select>
							</div>
							<div class="mb-3">
								 <label class="form-label">grade</label> 
									<select name="grade" class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
										<option selected value="1">사원</option>
										<option value="2">대리</option>
										<option value="3">과장</option>
										<option value="4">부장</option>
									</select>
							</div>
							<div class="mb-3">
								<label class="form-label">salary</label> <input
									class="form-control form-control-lg" type="text"
									name="hireDate" value="${employees.hireDate}" />
							</div>
							
							<!-- 현재 연봉 까지 수정 만들어야함  -->
							
							
							
							<div class="mb-3">
								<input class="form-control form-control-lg" type="hidden"
									name="id" value="${employees.id}" />
							</div>
							<div class="text-center mt-3">
								<button type="submit" class="btn btn-lg btn-primary">수정</button>
							</div>
						</form>
					</div>



				</div>
			</div>
		</div>
	</div>

</div>
</main>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>