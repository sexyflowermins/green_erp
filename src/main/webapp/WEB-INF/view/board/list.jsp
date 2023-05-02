<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
<main class="content">

	<div class="container-fluid p-0">

		<nav class="navbar bg-secondary rounded-2 mb-4">
			<div class="container-fluid">
				<a class="navbar-brand">자유게시판</a>
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">${boardViewCount}개</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/board/list?boardViewCount=5">5개</a></li>
						<li><a class="dropdown-item" href="/board/list?boardViewCount=10">10개</a></li>
					</ul>
				</div>
			</div>

		</nav>

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
									<td>${pageCount + vs.index + 1}</td>
									<td class="d-none d-xl-table-cell">${board.title}</td>
									<td class="d-none d-xl-table-cell">${board.dateTime}</td>
									<td>${board.employeesName}</td>
									<td><span class="badge bg-${button} ms-2">${board.categoryName}</span></td>
									<td class="d-none d-md-table-cell">${board.views}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>
		<div class="row">
			<div class="d-md-flex bd-highlight">
				<nav aria-label="Page navigation example"
					class="d-flex justify-content-center flex-grow-1 bd-highlight">
					<ul class="pagination">
						<li class="page-item"><a class="page-link"
							href="/board/list?boardViewCount=${boardViewCount}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:if test="${pageCount - boardViewCount*2 >= 0}">
							<li class="page-item"><a class="page-link"
								href="/board/list?curPage=${pageCount -boardViewCount*2}&page=${pageNumber -2}&boardViewCount=${boardViewCount}">${pageNumber -2}</a></li>
						</c:if>
						<c:if test="${pageCount - boardViewCount >= 0}">
							<li class="page-item"><a class="page-link"
								href="/board/list?curPage=${pageCount -boardViewCount}&page=${pageNumber -1}&boardViewCount=${boardViewCount}">${pageNumber -1}</a></li>
						</c:if>
						
						<li class="page-item"><a class="page-link" href="#">${pageNumber}</a></li>
						
						<c:if test="${boardCountAll/boardViewCount + 1 > pageNumber + 1}">
							<li class="page-item"><a class="page-link"
								href="/board/list?curPage=${pageCount +boardViewCount}&page=${pageNumber +1}&boardViewCount=${boardViewCount}">${pageNumber +1}</a></li>
						</c:if>
						<c:if test="${boardCountAll/boardViewCount + 1 > pageNumber + 2}">
							<li class="page-item"><a class="page-link"
								href="/board/list?curPage=${pageCount +boardViewCount*2}&page=${pageNumber +2}&boardViewCount=${boardViewCount}">${pageNumber +2}</a></li>
						</c:if>
						<li class="page-item"><a class="page-link"
							href="/board/list/?curPage=${lastPageCount}&page=${lastPageNumber}&boardViewCount=${boardViewCount}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
				<c:if test="${isPersonnel}">
					<button onclick="location.href='/board/write'" type="button"
						class="btn  btn-primary">게시글 작성</button>
				</c:if>
			</div>

		</div>
	</div>
</main>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>