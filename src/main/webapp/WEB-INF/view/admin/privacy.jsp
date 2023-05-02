<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="container-fluid p-0">

		<div class="mb-3">
			<h1 class="h3 d-inline align-middle">사원정보</h1>

		</div>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">
						<h5 class="card-title mb-0">Profile</h5>
					</div>
					<div class="card-body text-center">
						<!-- 사원 이미지 -->
						<a data-bs-toggle="modal" data-bs-target="#imagemodal"><img src="/admin/privacy/${employees.uploadFileName}" alt="Christina Mason" class="img-fluid rounded-circle mb-2" width="128"
							height="128" /></a>
						<h5 class="card-title mb-0">${employees.name}</h5>
						<!-- Modal -->
						<div class="modal fade" id="imagemodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									
									
										<h5 class="modal-title" id="exampleModalLabel">사진 변경</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">

										<form action="/admin/updateImage" method="post" enctype="multipart/form-data">
										
											<div class="mb-3">
												<input class="form-control" type="file" id="updateimage" name="updateimage">
											</div>
											<div class="mb-3">
												<input class="form-control form-control-lg" type="hidden" name="id" value="${employees.id}" />
											</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary">수정</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<hr class="my-0" />

					<hr class="my-0" />
					<div class="card-body">


						<ul class="list-unstyled mb-0">
							<li class="mb-1"><span data-feather="bookmark" class="feather-sm me-1"></span> 사번 <a href="#" class="text-decoration-none">${employees.id}</a></li>
							<li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span> 부서 <a href="#" class="text-decoration-none">${employees.dname}</a></li>
							<li class="mb-1"><span data-feather="award" class="feather-sm me-1"></span> 직급 <a href="#" class="text-decoration-none">${employees.gname}</a></li>
							<li class="mb-1"><span data-feather="map-pin" class="feather-sm me-1"></span> 주소 <a href="#" class="text-decoration-none">${employees.address}</a></li>
						</ul>
					</div>
					<hr class="my-0" />
				</div>
			</div>

			<div class="col-md-8 col-xl-9">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title mb-0">개인정보</h5>
					</div>
					<div class="card-body h-100">
						<div class="d-flex align-items-start">

							<form class="row g-3" action="/admin/updatefromadmin?id=${employees.id}" method="post">
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label> <input type="email" class="form-control" id="inputEmail4" name="email" value="${employees.email}">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Password</label> <input type="password" class="form-control" id="inputPassword4" name="password" value="${employees.password}">
								</div>
								<div class="col-12">
									<label for="inputAddress" class="form-label">Address</label> <input type="text" class="form-control" id="inputAddress" name="address" value="${employees.address}" placeholder="1234 Main St">
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">NAME</label> <input type="text" class="form-control" id="inputEmail4" name="name" value="${employees.name}">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Age</label> <input type="text" class="form-control" id="inputPassword4" name="age" value="${employees.age}">
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">hire_date</label> <input type="text" class="form-control" id="inputEmail4" name="hireDate" value="${employees.hireDate}">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">resign_date</label> <input type="text" class="form-control" id="inputPassword4" name="resignDate" value="${employees.resignDate}">
								</div>

								<div class="col-md-4">
									<label for="inputState" class="form-label">Department</label> <select id="inputState" class="form-select" name="department">
										<c:forEach var="list" items="${list}">
											<option value="${list.id}">${list.id}.${list.name}</option>
										</c:forEach>
									</select>

								</div>

								<div class="col-md-4">
									<label for="inputState" class="form-label">Grade</label> <select id="inputState" class="form-select" name="grade">
										<c:forEach var="listgrade" items="${listgrade}">
											<option value="${listgrade.id}">${listgrade.id}.${listgrade.name}</option>
										</c:forEach>
									</select>

								</div>



								<div class="mb-3">
									<input class="form-control form-control-lg" type="hidden" name="id" value="${employees.id}" />
								</div>
								<div class="col-12 d-md-flex justify-content-md-end mb-3">
									<button type="submit" class="btn btn-outline-dark ">정보 수정</button>
								</div>
							</form>

						</div>
						<!-- Button trigger modal -->
						<div class="float-end mb-3">
							<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">연봉 수정</button>
						</div>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">연봉 입력</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<!--  연봉 -->
										<form action="/admin/insertSalary" method="post">
											<div class="col-md-3">
												<label for="inputState" class="form-label">년도 </label><input type="text" class="form-control" id="form-select" value="2023" name="toYear">
											</div>

											<div class="col-md-3">
												<label for="inputState" class="form-label">호봉</label> <select id="inputState" class="form-select" name="salaryId">
													<option value="1">사원 1호봉</option>
													<option value="2">사원 2호봉</option>
													<option value="3">대리 1호봉</option>
													<option value="4">대리 2호봉</option>
													<option value="5">과장 1호봉</option>
													<option value="6">과장 2호봉</option>
													<option value="7">과장 3호봉</option>
													<option value="8">부장 1호봉</option>
													<option value="9">부장 2호봉</option>
													<option value="10">부장 3호봉</option>
													<option value="11">대표이사</option>
												</select>
											</div>
											<div class="col-md-3">
												<label for="inputState" class="form-label">평가 등급</label> <select id="inputState" class="form-select" name="ratingId">
													<c:forEach var="ratingList" items="${ratingList}">
														<option value="${ratingList.id}">${ratingList.name}</option>
													</c:forEach>
												</select>
											</div>

											<div class="mb-3">
												<input class="form-control form-control-lg" type="hidden" name="id" value="${employees.id}" />
											</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary">수정</button>
										</form>
									</div>

								</div>

							</div>





						</div>
					</div>
</main>
<script src="js/app.js"></script>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>