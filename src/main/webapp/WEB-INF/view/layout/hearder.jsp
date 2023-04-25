<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="/static/img/icons/icon-48x48.png" />

<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>AdminKit Demo - Bootstrap 5 Admin Template</title>

<link href="/static/css/app.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="/erp/main"> <span class="align-middle">AdminKit</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">Pages</li>

					<li class="sidebar-item active"><a class="sidebar-link" href="/erp/main"> <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>
					<c:choose>
						<c:when test="${principal != null}">
							<li class="sidebar-item"><a class="sidebar-link" href="/ec/profile"> 
							<i class="align-middle" data-feather="user"></i> 
							<span class="align-middle">Profile</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="sidebar-item"><a class="sidebar-link" href="/ec/signIn"> 
							<i class="align-middle" data-feather="log-in"></i> 
							<span class="align-middle">Sign In</span>
							</a></li>
						</c:otherwise>
					</c:choose>

					<!-- 					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-sign-up"> <i class="align-middle"
							data-feather="user-plus"></i> <span class="align-middle">Sign
								Up</span>
					</a></li> -->


					<li class="sidebar-header">관리자</li>
					
					<li class="sidebar-item"><a class="sidebar-link"
						href="/notice/write"> <i class="align-middle"
							data-feather="check-square"></i> <span class="align-middle">공지사항</span>

					</a></li>
				
						<li class="sidebar-item"><a class="sidebar-link" href="/erp/signUp"> 
						<i class="align-middle" data-feather="user-plus"></i> 
						<span class="align-middle">사원 등록</span>
						</a></li>
						<li class="sidebar-item active"><a class="sidebar-link" href="/erp/adminpage"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bar-chart-2 align-middle">
								<line x1="18" y1="20" x2="18" y2="10"></line>
								<line x1="12" y1="20" x2="12" y2="4"></line>
								<line x1="6" y1="20" x2="6" y2="14"></line></svg> <span class="align-middle">Charts</span>
						</a></li>
					<div class="sidebar-cta">
						<div class="sidebar-cta-content">
							<strong class="d-inline-block mb-2">Upgrade to Pro</strong>
							<div class="mb-3 text-sm">Are you looking for more components? Check out our premium version.</div>
							<div class="d-grid">
								<a href="upgrade-to-pro" class="btn btn-primary">Upgrade to Pro</a>
							</div>
						</div>
					</div>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i> <span
										class="indicator">${noticeList.size()}</span>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="alertsDropdown">
								<div class="dropdown-menu-header">공지사항</div>
								<div class="list-group">
									<c:choose>
										<c:when test="${noticeList != null}">
											<c:forEach var="notice" items="${noticeList}">
												<a href="#" class="list-group-item">
													<div class="row g-0 align-items-center">
														<div class="col-2">
															<i class="text-warning" data-feather="bell"></i>
														</div>
														<div class="col-10">
															<div class="text-dark">${notice.title}</div>
															<div class="text-muted small mt-1">${notice.content}</div>
															<!-- 작성자 이름으로 변경 -->
															<div class="text-muted small mt-1">${notice.empId}</div>
															<input type="hidden" value="${notice.id}" name="noticeId">
														</div>
													</div>
												</a>
											</c:forEach>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Show all notifications</a>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="message-square"></i>
								</div>
						</a>
							<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
								<div class="dropdown-menu-header">
									<div class="position-relative">4 New Messages</div>

								</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="/static//img/avatars/avatar-5.jpg" class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Vanessa Tucker</div>
												<div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu tortor.</div>
												<div class="text-muted small mt-1">15m ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="/img/avatars/avatar-2.jpg" class="avatar img-fluid rounded-circle" alt="William Harris">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">William Harris</div>
												<div class="text-muted small mt-1">Curabitur ligula sapien euismod vitae.</div>
												<div class="text-muted small mt-1">2h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="img/avatars/avatar-4.jpg" class="avatar img-fluid rounded-circle" alt="Christina Mason">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Christina Mason</div>
												<div class="text-muted small mt-1">Pellentesque auctor neque nec urna.</div>
												<div class="text-muted small mt-1">4h ago</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<img src="img/avatars/avatar-3.jpg" class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">Sharon Lessman</div>
												<div class="text-muted small mt-1">Aenean tellus metus, bibendum sed, posuere ac, mattis non.</div>
												<div class="text-muted small mt-1">5h ago</div>
											</div>
										</div>
									</a>
								</div>
								<div class="dropdown-menu-footer">
									<a href="#" class="text-muted">Show all messages</a>
								</div>
							</div></li>
						<li class="nav-item dropdown"><a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown"> <i class="align-middle" data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown"> <c:choose>
									<c:when test="${principal != null}">
										<img src="/static/img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" />
										<span class="text-dark">${principal.id}</span>
									</c:when>
									<c:otherwise>
									
									</c:otherwise>
								</c:choose>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile"><i class="align-middle me-1" data-feather="user"></i> Profile</a> <a class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="pie-chart"></i> Analytics</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="index.jsp"><i class="align-middle me-1" data-feather="settings"></i> Settings & Privacy</a> <a class="dropdown-item" href="#"><i class="align-middle me-1"
									data-feather="help-circle"></i> Help Center</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/ec/logout">Log out</a>
							</div></li>
					</ul>
				</div>
			</nav>