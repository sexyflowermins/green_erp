<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="row">
		<h1 class="h3 mb-3">
			<strong>게시글 수정</strong>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<form action="/board/updateProc" method="post">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">제목</label>
					<input type="text" class="form-control form-control-lg"
						id="exampleFormControlInput1" name="title" value="${board.title}">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">게시글 내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						name="content" rows="5">${board.content}</textarea>
					<input type="hidden" name="id" value="${board.id}">
				</div>
				<div class="d-md-flex justify-content-md-end">
					<!-- class="d-md-flex justify-content-md-end" -->
					<button type="submit"
						class="btn btn-primary m-1">수정</button>
					<button onclick="location.href='/board/delete/${board.id}'" type="button"
						class="btn btn-danger m-1">삭제</button>
				</div>
			</form>
		</div>
	</div>

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>