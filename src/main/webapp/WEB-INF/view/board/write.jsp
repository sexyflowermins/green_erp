<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="row">
		<h1 class="h3 mb-3">
			<strong>게시판 글쓰기</strong>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<form action="/board/write" method="post">
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">Title</label>
					<input type="text" class="form-control form-control-lg"
						id="exampleFormControlInput1" name="title" placeholder="">
				</div>
				<div class="mb-3">
					<label for="exampleFormControlInput1" class="form-label">category</label>
					<select name="category" class="form-select form-select-lg mb-3"
						aria-label=".form-select-lg example">
						<c:forEach var="category" items="${categoryList}" varStatus="vs">
							<option value="${vs.index+1}">${category.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">Content</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						name="content" rows="5"></textarea>
				</div>
				<div class="d-md-flex justify-content-md-end">
					<!-- class="d-md-flex justify-content-md-end" -->
					<button type="submit" class="btn  btn-primary">글쓰기</button>
				</div>
			</form>
		</div>
	</div>

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>