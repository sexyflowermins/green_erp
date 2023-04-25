<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<form action="/notice/write" method="post">
	<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">Title</label>
		<input type="text" class="form-control" id="exampleFormControlInput1"
			name="title" placeholder="">
	</div>
	<div class="mb-3">
		<label for="exampleFormControlTextarea1" class="form-label">Content</label>
		<textarea class="form-control" id="exampleFormControlTextarea1"
			name="content" rows="3"></textarea>
		<button type="submit" class="btn btn-primary">공지 생성</button>
	</div>
</form>

<%@include file="/WEB-INF/view/layout/footer.jsp"%>