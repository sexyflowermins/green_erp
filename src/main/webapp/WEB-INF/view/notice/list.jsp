<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<main class="content">
	<div class="container-fluid p-0">

		<div class="row mb-4">
			<p class="h1 col-6">공지사항 리스트</p>
			<form class="col-6 d-flex">
				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
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
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${noticeList != null}">
									<c:forEach var="notice" items="${noticeList}" varStatus="vs">
										<tr onclick="location.href='/notice/post/${notice.id}'">
											<td>${vs.index+1}</td>
											<td>${notice.title}</td>
											<td class="d-none d-xl-table-cell">${notice.dateTime}</td>
											<td class="d-none d-md-table-cell">${notice.name}</td>
											<td class="d-none d-md-table-cell">${notice.views}</td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>

						</tbody>
					</table>
				</div>

			</div>
			<div class="d-md-flex justify-content-md-end">
				<!-- class="d-md-flex justify-content-md-end" -->
				<button onclick="location.href='/notice/write'" type="button"
					class="btn  btn-success">공지 작성</button>
			</div>
		</div>

	</div>
</main>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>