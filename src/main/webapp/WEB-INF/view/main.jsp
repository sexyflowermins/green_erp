<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/view/layout/hearder.jsp"%>
			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>Analytics</strong> Dashboard</h1>

					<div class="row">
						<div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Browser Usage</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="py-3">
											<div class="chart chart-xs">
												<canvas id="chartjs-dashboard-pie"></canvas>
											</div>
										</div>

										<table class="table mb-0">
											<tbody>
												<tr>
													<td>Chrome</td>
													<td class="text-end">4306</td>
												</tr>
												<tr>
													<td>Firefox</td>
													<td class="text-end">3801</td>
												</tr>
												<tr>
													<td>IE</td>
													<td class="text-end">1689</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="col-12 col-md-12 col-xxl-6 d-flex order-3 order-xxl-2">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Real-Time</h5>
								</div>
								
							</div>
						</div>
						<div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Calendar</h5>
								</div>
								<div class="card-body d-flex">
									<div class="align-self-center w-100">
										<div class="chart">
											<div id="datetimepicker-dashboard"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-lg-8 col-xxl-9 d-flex">
							<div class="card flex-fill">
								<div class="card-header">

									<h5 class="card-title mb-0">Latest Projects</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>Name</th>
											<th class="d-none d-xl-table-cell">Start Date</th>
											<th class="d-none d-xl-table-cell">End Date</th>
											<th>Status</th>
											<th class="d-none d-md-table-cell">Assignee</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Project Apollo</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Vanessa Tucker</td>
										</tr>
										<tr>
											<td>Project Fireball</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-danger">Cancelled</span></td>
											<td class="d-none d-md-table-cell">William Harris</td>
										</tr>
										<tr>
											<td>Project Hades</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Sharon Lessman</td>
										</tr>
										<tr>
											<td>Project Nitro</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-warning">In progress</span></td>
											<td class="d-none d-md-table-cell">Vanessa Tucker</td>
										</tr>
										<tr>
											<td>Project Phoenix</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">William Harris</td>
										</tr>
										<tr>
											<td>Project X</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Sharon Lessman</td>
										</tr>
										<tr>
											<td>Project Romeo</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-success">Done</span></td>
											<td class="d-none d-md-table-cell">Christina Mason</td>
										</tr>
										<tr>
											<td>Project Wombat</td>
											<td class="d-none d-xl-table-cell">01/01/2021</td>
											<td class="d-none d-xl-table-cell">31/06/2021</td>
											<td><span class="badge bg-warning">In progress</span></td>
											<td class="d-none d-md-table-cell">William Harris</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="col-12 col-lg-4 col-xxl-3 d-flex">
							<div class="card flex-fill w-100">
								<div class="card-header">

									<h5 class="card-title mb-0">Monthly Sales</h5>
								</div>
								<div class="card-body d-flex w-100">
									<div class="align-self-center chart chart-lg">
										<canvas id="chartjs-dashboard-bar"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</main>
<%@include file="/WEB-INF/view/layout/footer.jsp"%>