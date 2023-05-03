<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="row">
		<div class="col-md-10">
			<form action="" method="post">
				<div class="mb-4">
					<h1>${board.title}</h1>
				</div>
				<div class="mb-3 p-1">
					<p class="border rounded border-2 border-secondary text-justify">${board.content}</p>
				</div>
				<c:choose>
					<c:when test="${board.empId eq principal.id}">
						<div class="d-md-flex justify-content-md-end mb-3">
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
	<div>
		<p class="fst-italic">댓글창</p>
		<div class="card bg-light col-md-10">
			<div class="card-body">
				<form action="/boardReply/write" method="post"
					class="mb-4 d-flex flex-column">
					<textarea class="form-control" id="description" name="content"
						placeholder="Enter your message here..."  rows="4"
						data-sb-validations="required"></textarea>
					<input type="text" style="display: none" name="boardId"
						value="${board.id}" />
					<button class="btn btn-primary text-uppercase" id="submitButton"
						type="submit" style="background-color: #FFA479; margin: 10px 0px;">등록</button>
				</form>
				
				<c:forEach var="list" items="${replyList}">
					<div class="d-flex mb-4" style="display: flex;">
						<div class="flex-shrink-0">
							<img class="rounded-circle"
								src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
						</div>
						<div class="ms-3">
							<div class="fw-bold">${list.employeesName }</div>
							${list.content }
						</div>
						<form action="/boardReply/delete/${list.id}/${board.id}" method="get" class="d-flex justify-content-end">
							<input type="text" style="display: none" name="id"
								value="${list.id }" />
							<c:if test="${list.empId eq principal.id }">
								<button class="btn btn-primary text-uppercase" id="submitButton"
									type="submit"
									style="background-color: #930A13; border-radius: 10px;">삭제</button>
							</c:if>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

</main>


<%@include file="/WEB-INF/view/layout/footer.jsp"%>