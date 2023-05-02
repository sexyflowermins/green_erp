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

<link rel="canonical" href="https://demo-basic.adminkit.io/" />

<title>Green 컴퍼니</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js%22%3E"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="/static/css/app.css" rel="stylesheet">


<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />

</head>
<body>
	<div class="wrapper ">
		<nav id="sidebar" class="sidebar js-sidebar ">
			<div class="sidebar-content js-simplebar animate__animated animate__fadeInLeft animate__faster">
				<a class="sidebar-brand text-decoration-none" href="/erp/main">
					<span class="align-middle">Green 컴퍼니</span>
				</a>

				<ul class="sidebar-nav ">
					<li class="sidebar-header">Pages</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="/erp/main"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Main</span>
					</a></li>
					<c:choose>
						<c:when test="${principal != null}">
							<li class="sidebar-item"><a class="sidebar-link"
								href="/ec/profile"> <i class="align-middle"
									data-feather="user"></i> <span class="align-middle">Profile</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="sidebar-item"><a class="sidebar-link"
								href="/ec/signIn"> <i class="align-middle"
									data-feather="log-in"></i> <span class="align-middle">Sign
										In</span>
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
						href="/notice/list"> <i class="align-middle"
							data-feather="check-square"></i> <span class="align-middle">공지사항</span>

					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="/erp/signUp"> <i class="align-middle"
							data-feather="user-plus"></i> <span class="align-middle">사원
								등록</span>
					</a></li>
					<li class="sidebar-item "><a class="sidebar-link"
						href="/erp/adminpage"> <svg xmlns="http://www.w3.org/2000/svg"
								width="24" height="24" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"
								class="feather feather-bar-chart-2 align-middle">
								<line x1="18" y1="20" x2="18" y2="10"></line>
								<line x1="12" y1="20" x2="12" y2="4"></line>
								<line x1="6" y1="20" x2="6" y2="14"></line></svg> <span
							class="align-middle">사원 관리</span>
					</a></li>
					
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="alertsDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="align-middle" data-feather="bell"></i>
									<c:choose>
										<c:when test="${principal != null}">
											<c:choose>
												<c:when test="${headerNoticeList.size() < 4}">
													<c:if test="${headerNoticeList.size() != 0}">														
														<span class="indicator">${headerNoticeList.size()}</span>
													</c:if>
												</c:when>
												<c:otherwise>
													<span class="indicator">4</span>
												</c:otherwise>
											</c:choose>
											
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="alertsDropdown">
								<div class="dropdown-menu-header">최신 공지사항</div>
								<div class="list-group">
									<c:choose>
										<c:when test="${principal != null}">
											<c:choose>
												<c:when test="${headerNoticeList != null}">
													<c:forEach var="notice" items="${headerNoticeList}" begin="0" end="3" step="1"
														varStatus="vs">
														<a href="#" class="list-group-item">
															<div class="row g-0 align-items-center" onclick=""
																data-bs-toggle="modal"
																data-bs-target="#exampleModal${vs.index+1}">
																<div class="col-2">
																	<i class="text-warning" data-feather="bell"></i>
																</div>
																<div class="col-10">
																	<div class="text-dark text-truncate">${notice.title}</div>
																	<div class="text-muted small mt-1 text-truncate">작성자:${notice.name}</div>
																	<input type="hidden" value="${notice.id}"
																		name="noticeId">
																</div>
															</div>
														</a>
													</c:forEach>
												</c:when>
												<c:otherwise>
												
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</div>
								<c:if test="${principal != null}">
									<div class="dropdown-menu-footer">
										<a href="/notice/list" class="text-muted">공지사항 리스트</a>
									</div>
								</c:if>
							</div></li>
						
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="bell"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <c:choose>
									<c:when test="${principal != null}">
										<img src="<c:url value="${principal.setUploadFileName()}"/>"
											class="avatar img-fluid rounded me-1" alt="Charles Hall" />
										<span class="text-dark">${principal.id}</span>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a> <a
									class="dropdown-item" href="#"> </a>
								<div class="dropdown-divider"></div>
								
								<a class="dropdown-item" href="/ec/logout">Log out</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<!-- Modal -->
			<c:forEach var="notice" items="${headerNoticeList}" begin="0" end="3" step="1" varStatus="vs">
				<div class="modal fade" id="exampleModal${vs.index+1}" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header text-break">
								<h5 class="modal-title" id="exampleModalLabel">${notice.title}</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body text-break">${notice.content}</div>
							<div class="modal-footer">
								<c:if test="${isPersonnel}">
									<button onclick="location.href='/notice/update/${notice.id}'"
										type="button" class="btn btn-primary m-1">수정</button>
								</c:if>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>