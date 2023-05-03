<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="row">
		<h1 class="h3 mb-3">
			<strong>공지사항</strong>
		</h1>
	</div>
	<div class="row">
		<div class="col-md-6">
			<form action="/notice/write" method="post">
				<div class="mb-3">
					<span class="meta"> ${notice.title } Posted by ${notice.name }
					</span>
				</div>
				<div class="mb-3">
					<label for="exampleFormControlTextarea1" class="form-label">Content</label>
					<input class="form-control" type="text" value="${notice.content}" aria-label="Disabled input example" disabled readonly>
				</div>
			</form>
		</div>
		
	</div>

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>