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
<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

<link rel="canonical"
	href="https://demo-basic.adminkit.io/pages-sign-in.html" />

<title>Sign In | AdminKit Demo</title>

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
							<h1 class="h2">Welcome back, Charles</h1>
							<p class="lead">Sign in to your account to continue</p>
						</div>

						<div class="card">
							<div class="card-body">
								<div class="m-sm-4">
									<div class="text-center">
										<img src="/static/img/avatars/avatar.jpg" alt="Charles Hall"
											class="img-fluid rounded-circle" width="132" height="132" />
									</div>
									<form action="/ec/signInProc" method="post">
										<div class="mb-3">
											<label class="form-label">사번</label> <input
												class="form-control form-control-lg" type="text" name="id"
												id="id" placeholder="Enter your id" />
										</div>
										<div class="mb-3">
											<label class="form-label">비밀 번호</label> <input
												class="form-control form-control-lg" type="password"
												name="password" id="password"placeholder="Enter your password" /> 												
										</div>
										<div class="text-center mt-3">
											<button type="submit" class="btn btn-lg btn-primary">로그인</button>
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