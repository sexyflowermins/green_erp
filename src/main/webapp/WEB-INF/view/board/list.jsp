<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<main class="content">

	<div class="container-fluid p-0">

		<div class="row mb-4">
			<p class="h1 col-6">자유게시판</p>
		</div>

		<div class="row">
			<div class="d-flex">
				<div class="card flex-fill">
					<div class="card-header">
						<h5 class="card-title mb-0">최신글</h5>
					</div>
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th class="d-none d-xl-table-cell">작성일</th>
								<th class="d-none d-md-table-cell">작성자</th>
								<th class="d-none d-md-table-cell">카테고리</th>
								<th class="d-none d-md-table-cell">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList}" varStatus="vs">
								<c:choose>
									<c:when test="${board.category eq 1}">
										<c:set var="button" value="success"></c:set>
									</c:when>
									<c:when test="${board.category eq 2}">
										<c:set var="button" value="warning"></c:set>
									</c:when>
									<c:when test="${board.category eq 3}">
										<c:set var="button" value="danger"></c:set>
									</c:when>
									<c:when test="${board.category eq 4}">
										<c:set var="button" value="primary"></c:set>
									</c:when>
									<c:otherwise></c:otherwise>
								</c:choose>

								<tr onclick="location.href='/board/post/${board.id}'">
									<td>${vs.index+1}</td>
									<td>${board.employeesName}</td>
									<td class="d-none d-xl-table-cell">${board.dateTime}</td>
									<td class="d-none d-xl-table-cell">${board.title}</td>
									<td><span class="badge bg-${button} ms-2">${board.categoryName}</span></td>
									<td class="d-none d-md-table-cell">${board.views}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
			<div class="d-md-flex justify-content-md-end">
				<!-- class="d-md-flex justify-content-md-end" -->
				<button onclick="location.href='/board/write'" type="button"
					class="btn  btn-success">게시글 작성</button>
			</div>
		</div>
	</div>
</main>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>