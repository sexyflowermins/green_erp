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
							<a class="btn btn-primary btn-sm" href="#">Follow</a> <a class="btn btn-primary btn-sm" href="#"><span data-feather="message-square"></span> Message</a>
						</div>
					</div>
					<hr class="my-0" />
					<div class="card-body">
						<h5 class="h6 card-title">Skills</h5>
						<a href="#" class="badge bg-primary me-1 my-1">${principal.id}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.email}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.age}</a>
						<a href="#" class="badge bg-primary me-1 my-1">${principal.address}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.hireDate}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.resignDate}</a>
						<a href="#" class="badge bg-primary me-1 my-1">${principal.department}</a> <a href="#" class="badge bg-primary me-1 my-1">${principal.grade}</a> <a href="#" class="badge bg-primary me-1 my-1">UX</a>
					</div>
					<hr class="my-0" />
					<div class="card-body">
						<h5 class="h6 card-title">About</h5>
						<ul class="list-unstyled mb-0">
							<li class="mb-1"><span data-feather="home" class="feather-sm me-1"></span> Lives in <a href="#">San Francisco, SA</a></li>

							<li class="mb-1"><span data-feather="briefcase" class="feather-sm me-1"></span> Works at <a href="#">GitHub</a></li>
							<li class="mb-1"><span data-feather="map-pin" class="feather-sm me-1"></span> From <a href="#">Boston</a></li>
						</ul>
					</div>
					<hr class="my-0" />
					<div class="card-body">
						<h5 class="h6 card-title">Elsewhere</h5>
						<ul class="list-unstyled mb-0">
							<li class="mb-1"><a href="#">staciehall.co</a></li>
							<li class="mb-1"><a href="#">Twitter</a></li>
							<li class="mb-1"><a href="#">Facebook</a></li>
							<li class="mb-1"><a href="#">Instagram</a></li>
							<li class="mb-1"><a href="#">LinkedIn</a></li>
						</ul>
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
									개인 정보 수정 하기
									<br>
									<div class="mb-3">
									<a type="submit" href="/ec/updateIn" class="btn btn-lg btn-primary">변경하기</a>
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