<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="row">
		<h1 class="h3 mb-3">
			<strong>공지사항 글쓰기</strong>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<form action="/notice/write" method="post">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Title</label>
					<input type="text" class="form-control form-control-lg"
						id="exampleFormControlInput1" name="title" placeholder="">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">Content</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						name="content" rows="5"></textarea>
				</div>
				<div class="d-md-flex justify-content-md-end">
					<!-- class="d-md-flex justify-content-md-end" -->
					<button onclick="location.href='/notice/write'" type="submit"
						class="btn  btn-primary">글쓰기</button>
				</div>
			</form>
		</div>
	</div>

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>