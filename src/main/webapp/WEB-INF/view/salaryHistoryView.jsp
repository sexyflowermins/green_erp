<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>

<main class="content">
	<div class="container-fluid p-0">
		<div class="card">
			<div class="card-header">연봉 조회</div>
			<div class="card-body">
				<blockquote class="blockquote mb-0">
					<c:if test="${not empty id}">
							<div class="overflow-auto">
								<table class="table">
										<thead>
											<tr>
												<th scope="col">ID</th>
												<th scope="col">NAME</th>
												<th scope="col">직급</th>
												<th scope="col">년도</th>
												<th scope="col">호봉</th>
												<th scope="col">직무 평가 등급</th>
												<th scope="col">성과급(%)</th>
												<th scope="col">작년 연봉</th>
												<th scope="col">올해 성과급</th>
												<th scope="col">올해 연봉</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="salaryHistoryDetail"
									items="${salaryHistoryDetail}">
									<tr>
										<td>${salaryHistoryDetail.id}</td>
										<td>${salaryHistoryDetail.name}</td>
										<td>${salaryHistoryDetail.grade}</td>
										<td>${salaryHistoryDetail.toyear}</td>
										<td>${salaryHistoryDetail.salaryId}</td>
										<td>${salaryHistoryDetail.evaluation}</td>
										<td>${salaryHistoryDetail.performancePay}</td>
										<td>${salaryHistoryDetail.lastYearSalary}</td>
										<td>${salaryHistoryDetail.thisYearPfPay}</td>
										<td>${salaryHistoryDetail.thisYearSalary}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						</c:if>
						<button type="submit" class="btn btn-md btn-primary" onclick="location.href='/erp/adminpage'">사원관리</button>
				</blockquote>
			</div>
		</div>

	</div>
</main>
<script src="js/app.js"></script>




<%@include file="/WEB-INF/view/layout/footer.jsp"%>