<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="row">
		<h1 class="h3 mb-3">
			<strong>게시판 글</strong>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-8">
			<form action="" method="post">
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">제목</label>
					<input class="form-control" type="text" value="${board.title}"
						aria-label="Disabled input example" disabled readonly>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">내용</label>
					<input class="form-control" type="text" value="${board.content}"
						aria-label="Disabled input example" disabled readonly>
				</div>
				<c:choose>
					<c:when test="${board.empId eq principal.id}">
						<div class="d-md-flex justify-content-md-end">
							<button type="button"
								onclick="location.href='/board/update/${board.id}'"
								class="btn btn-primary m-1">수정</button>
							<button onclick="location.href='/board/delete/${board.id}'"
								type="button" class="btn btn-danger m-1">삭제</button>
						</div>
					</c:when>
					<c:otherwise></c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8">
			<label for="exampleFormControlTextarea1" class="form-label">댓글</label>
			<textarea class="form-control" id="exampleFormControlTextarea1"
				name="content" rows="5"></textarea>
		</div>
	</div>

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>