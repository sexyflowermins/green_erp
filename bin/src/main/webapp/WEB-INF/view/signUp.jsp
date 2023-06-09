<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Sign Up | AdminKit Demo</title>

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
						<h1 class="h2">Get started</h1>
						<p class="lead">Start creating the best possible user
							experience for you customers.</p>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="m-sm-4">
								<form action="/ec/employees-sign-up" method="post">
									<div class="mb-3">
										<label class="form-label">id</label> <input
											class="form-control form-control-lg" type="text" name="id"
											placeholder="Enter your name" />
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
											placeholder="Enter password" />
									</div>
									<div class="mb-3">
										<label class="form-label">address</label> <input
											class="form-control form-control-lg" type="text"
											name="address" placeholder="Enter password" />
									</div>
									<div class="mb-3">
										<label class="form-label">hire_date</label> <input
											class="form-control form-control-lg" type="text"
											name="hireDate" placeholder="Enter password" />
									</div>
									<div class="mb-1">
										<label class="form-label">department</label>
									</div>
									<select name="department" class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
										<option selected value="1">인사관리</option>
										<option value="2">생산</option>
										<option value="3">영업</option>
									</select>
									<div class="mb-1">
										<label class="form-label">grade</label> 
									</div>
									<select name="grade" class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example">
										<option selected value="1">사원</option>
										<option value="2">과장</option>
										<option value="3">부장</option>
									</select>

									<div class="text-center mt-3">
										<button type="submit" class="btn btn-lg btn-primary">Sign</button>
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
