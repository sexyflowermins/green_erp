<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<main class="content">

	<div class="container-fluid p-0">

		<div class="row mb-4">
			<p class="h1 col-6">공지사항 리스트</p>
			<!-- <form class="col-6 d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form> -->
		</div>

		<div class="row">
			<div class="d-flex">
				<div class="card flex-fill">
					<div class="card-header">
						<h5 class="card-title mb-0">Latest Notices</h5>
					</div>
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th class="d-none d-xl-table-cell">작성일</th>
								<th class="d-none d-md-table-cell">작성자</th>
								<th class="d-none d-md-table-cell">조회수</th>
								<th class="d-none d-md-table-cell"></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${noticeList != null}">
									<c:forEach var="notice" items="${noticeList}" varStatus="vs">
										<tr>
											<td>${vs.index+1}</td>
											<td>${notice.title}</td>
											<td class="d-none d-xl-table-cell">${notice.dateTime}</td>
											<td class="d-none d-md-table-cell">${notice.name}</td>
											<td class="d-none d-md-table-cell">${notice.views}</td>
											<td class="d-none d-md-table-cell">
												<button type="button" class="btn btn-primary" onclick=""
													data-bs-toggle="modal"
													data-bs-target="#Modal${vs.index+1}">보기</button> <c:if
													test="${isPersonnel}">
													<button
														onclick="location.href='/notice/delete/${notice.id}'"
														type="button" class="btn btn-danger m-1">삭제</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>

						</tbody>
					</table>
				</div>

			</div>

		</div>
		<div class="row">
				<div class="d-md-flex bd-highlight">
					<nav aria-label="Page navigation example" class="d-flex justify-content-center flex-grow-1 bd-highlight">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
					<c:if test="${isPersonnel}">
						<button onclick="location.href='/notice/write'" type="button"
							class="btn  btn-success">공지 작성</button>
					</c:if>
				</div>

		</div>
	</div>
	
	<!-- Modal -->
			<c:forEach var="notice" items="${noticeList}" varStatus="vs">
				<div class="modal fade" id="Modal${vs.index+1}" tabindex="-1"
					aria-labelledby="ModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header text-break">
								<h5 class="modal-title" id="ModalLabel">${notice.title}</h5>
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

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>