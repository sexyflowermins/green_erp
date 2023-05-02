

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="/static/img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-up.html" />

<title>Green 컴퍼니</title>

<link href="/static/css/app.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
</head>

<body>
	<main class="d-flex w-100">
	<div class="container d-flex flex-column">
		<div class="row vh-100">
			<div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
				<div class="d-table-cell align-middle">

					<div class="text-center mt-4">
						<h1 class="h2">사원등록</h1>
						
					</div>

					<div class="card">
						<div class="card-body">
							<div class="m-sm-4">
								<form action="/ec/employees-sign-up" method="post" enctype="multipart/form-data">
									<div class="mb-3">
										<label class="form-label">Id</label> <input
											class="form-control form-control-lg" type="text" name="id"
											placeholder="Enter your id" />
									</div>
									<div class="mb-3">
										<label class="form-label">Name</label> <input
											class="form-control form-control-lg" type="text" name="name"
											placeholder="Enter your name" />
									</div>
									<div class="mb-3">
										<label class="form-label">Email</label> <input
											class="form-control form-control-lg" type="email"
											name="email" placeholder="Enter your email" />
									</div>
									<div class="mb-3">
										<label class="form-label">Age</label> <input
											class="form-control form-control-lg" type="text" name="age"
											placeholder="Enter age" />
									</div>
									<div class="mb-3">
										<label class="form-label">Address</label> <input
											class="form-control form-control-lg" type="text"
											name="address" placeholder="Enter address" />
									</div>
									<div class="mb-3">
										<label class="form-label">Hire_date</label> <input
											class="form-control form-control-lg" type="text"
											name="hireDate" placeholder="Enter hirw_date" />
									</div>
									<div class="mb-1">
										<label class="form-label">Department</label>
									</div>
									<select name="department"
										class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">

										<c:forEach var="list" items="${list}">
											<option value="${list.id}">${list.id}. ${list.name}</option>
										</c:forEach>
									</select>
									<div class="mb-1">
										<label class="form-label">Grade</label>
									</div>
									<select name="grade" class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
										<c:forEach var="listgrade" items="${listgrade}">
											<option value="${listgrade.id}">${listgrade.id}. ${listgrade.name}</option>
										</c:forEach>

									</select>
									<div class="mb-3">
										<label for="file" class="form-label">Image</label> <input
											class="form-control" type="file" id="file" name="file">
									</div>

									<div class="text-center mt-3">
										<button type="submit" class="btn btn-lg btn-primary">등록</button>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	</main>

	<script src="js/app.js"></script>

</body>

</html>

