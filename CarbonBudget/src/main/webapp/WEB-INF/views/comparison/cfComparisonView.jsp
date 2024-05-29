<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statistics</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
@media (max-width: 386px) {
  .card {
    /* 자손 태그에 대한 스타일 정의 */
    * {
      font-size: 10px;
    }
  }
}
</style>
<script>
	
</script>
</head>
<body>
	<div id="app">
		<!-- 탑 영역  -->
		<jsp:include page="/WEB-INF/inc/top.jsp"></jsp:include>

		<div id="main">
			<!-- 반응형 메뉴바 -->
			<header class="mb-3">
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>
			<!-- 메뉴 끝 -->

			<!-- content -->
			
			<c:if test="${not empty msg}">
    			<div class="alert alert-warning">${msg}</div>
			</c:if>	
			
			<div class="page-heading">
				<h3>Carbon Emissions Statistics</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="col-12 col-lg-4">
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-header">
										<div class="d-flex align-items-center">
											<h4 class="mb-0 ms-3">${sessionScope.login.memNm}님</h4>
										</div>
									</div>
									
									
									<c:set var="size" value="${checkIn.size()}" />
									<c:set var="lastIndex" value="${size - 1}" />
									<c:set var="secondToLastIndex" value="${size - 2}" />
									<c:set var="useYm" value="${checkIn[lastIndex].useYm}" />
									<c:set var="useYmDate" value="${fn:substring(useYm, 0, 7)}" />
									<c:set var="lastGasUsageValue" value="${checkIn[lastIndex].gasUsage}" />
									<c:set var="lastElctrUsageValue" value="${checkIn[lastIndex].elctrUsage}" />
									<c:set var="secondToLastGasUsageValue" value="${checkIn[secondToLastIndex].gasUsage}" />
									<c:set var="secondToLastElctrUsageValue" value="${checkIn[secondToLastIndex].elctrUsage}" />
						            <%-- JSP 스크립틀릿을 사용하여 계산 수행 --%>
						            <%
						                double lastGasUsage = Double.parseDouble((String) pageContext.getAttribute("lastGasUsageValue"));
						                double lastElctrUsage = Double.parseDouble((String) pageContext.getAttribute("lastElctrUsageValue"));
						                double lastGasResult = lastGasUsage * 2.176;
						                double lastElctrResult = lastElctrUsage * 0.4781;
						                double lastCalculationResult = lastGasResult + lastElctrResult;
						                
						                double secondToLastGasUsage = Double.parseDouble((String) pageContext.getAttribute("secondToLastGasUsageValue"));
						                double secondToLastElctrUsage = Double.parseDouble((String) pageContext.getAttribute("secondToLastElctrUsageValue"));
						                double secondToLastGasResult = secondToLastGasUsage * 2.176;
						                double secondToLastElctrResult = secondToLastElctrUsage * 0.4781;
						                double secondToLastCalculationResult = secondToLastGasResult + secondToLastElctrResult;
						                
						             	// DecimalFormat을 사용하여 소수점 첫째 자리까지만 포맷
						                java.text.DecimalFormat df = new java.text.DecimalFormat("#.0");
						             	
						                String lastFormattedGas = df.format(lastGasResult);
						                String lastFormattedElctr = df.format(lastElctrResult);
						                String lastFormattedResult = df.format(lastCalculationResult);
						                String secondToLastFormattedResult = df.format(secondToLastCalculationResult);

						                pageContext.setAttribute("lastFormattedGas", lastFormattedGas);
						                pageContext.setAttribute("lastFormattedElctr", lastFormattedElctr);
						                pageContext.setAttribute("lastCalculationResult", lastFormattedResult);
						                pageContext.setAttribute("secondToLastCalculationResult", secondToLastFormattedResult);
						                
						            %>
											<div class="card-body">
												<div class="row" style="margin-bottom: 12px">
													<div class="col-4">
														<div class="d-flex align-items-center">
															<h5 class="mb-0 ms-3">Date</h5>
														</div>
													</div>
													<div class="col-8">
														<h5 class="mb-0 text-end">${useYmDate}</h5>
													</div>
												</div>
												<div class="row" style="margin-bottom: 12px">
													<div class="col-7">
														<div class="d-flex align-items-center">
															<svg class="bi text-primary" width="32" height="32"
																fill="blue" style="width: 10px">
																<use
																	xlink:href="assets/static/images/bootstrap-icons.svg#circle-fill" />
		                                                    </svg>
															<h6 class="mb-0 ms-3">금월 배출량</h5>
														</div>
													</div>
													<div class="col-5">
														<h6 class="mb-0 text-end">${lastCalculationResult}kg</h5>
													</div>
												</div>
												<div class="row" style="margin-bottom: 12px">
													<div class="col-7">
														<div class="d-flex align-items-center">
															<svg class="bi text-primary" width="32" height="32"
																fill="blue" style="width: 10px">
																<use
																	xlink:href="assets/static/images/bootstrap-icons.svg#circle-fill" />
		                                                    </svg>
															<h6 class="mb-0 ms-3">전월 배출량</h5>
														</div>
													</div>
													<div class="col-5">
														<h6 class="mb-0 text-end">${secondToLastCalculationResult}kg</h5>
													</div>
												</div>
											</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card" name="Compare to others">
									<div class="card-header">
										<h4>Compare to others</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12">
												<canvas id="myChart" style="display: inline;"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card" name="Monthly Carbon Emissions">
									<div class="card-header">
										<h4>Monthly Carbon Emissions</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12">
												<canvas id="lineChart" style="display: inline;"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-8">
						<div class="row">
							<div class="col-12">
								<div class="card" name="Compared to last year">
									<div class="card-header">
										<h4>Compared to last year</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12">
												<canvas id="twoChart" style="display: inline;"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card" name="Details">
									<div class="card-header">
										<h4>Details</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12 col-md-4">
												<canvas id="doughnutChart" style="display: inline;"></canvas>
											</div>
											<div class="col-12 col-md-8">
												<section>
													<header>
														<table class="table">
															<thead>
																<tr>
																	<th>전기</th>
																	<th>가스</th>
																	<th>수도</th>
																	<th>교통</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>${lastFormattedElctr}kg</td>
																	<td>${lastFormattedGas}kg</td>
																	<td>-</td>
																	<td>-</td>
																</tr>
																<tr>
																	<td>4.5%↓</td>
																	<td>2.6%↓</td>
																	<td>3.2%↑</td>
																	<td>8.1%↓</td>
																</tr>
															</tbody>
														</table>
													</header>
													<p>
														${sessionScope.login.memNm}님의 ${useYmDate} 이산화탄소(CO₂) 발생량 통계입니다.<br />
														${sessionScope.login.memNm}님 가정은 이산화탄소 배출량은 총 ${lastCalculationResult}kg이며, 비슷한
														다른 가정 평균 --kg 보다 약 --% -- 배출하고 있습니다. 그래프를 보고 어느
														부분에서 이산화탄소를 많이 발생하고 있는지 비교해 보세요.
													</p>
												</section>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>

		<!-- footer 영역 -->
		<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	</div>
	<script src="resources/assets/compiled/js/app.js"></script>


	<!-- 지역별 월 평균 에너지 사용량 -->
	<script>
		// 차트 생성
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '사용자 평균', '내 사용량' ],
				datasets : [ {
					label : '전기',
					data : [ 30, 40 ],
					backgroundColor : 'rgba(255, 99, 132, 0.5)'
				}, {
					label : '가스',
					data : [ 55, 65 ],
					backgroundColor : 'rgba(54, 162, 235, 0.5)'
				}, {
					label : '수도',
					data : [ 35, 45 ],
					backgroundColor : 'rgba(75, 192, 192, 0.2)'
				}, {
					label : '교통',
					data : [ 25, 30 ],
					backgroundColor : 'rgba(153, 102, 255, 0.2)'
				} ]
			},
			options : {
				scales : {
					x : {
						stacked : true
					},
					y : {
						stacked : true
					}
				},
				indexAxis : 'y'
			}
		});

		const lineCtx = document.getElementById('lineChart').getContext('2d');
		const lineChart = new Chart(lineCtx, {
			type : 'line',
			data : {
				labels : [ '1월', '2월', '3월', '4월' ],
				datasets : [ {
					label : '탄소배출량',
					data : [ 10, 23, 4, 25 ],
					fill : false,
					tension : 0.2
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true,
						max : 30
					}
				}
			}
		});

		const twoctx = document.getElementById('twoChart').getContext('2d');
		const twoChart = new Chart(twoctx, {
			type : 'bar',
			data : {
				labels : [ ${useYmDate}, ${useYmDate} ],
				datasets : [ {
					label : '전기',
					data : [ 20, ${lastFormattedElctr} ]
				}, {
					label : '가스',
					data : [ 31, ${lastFormattedGas} ]
				}, {
					label : '수도',
					data : [ 29, 38 ]
				}, {
					label : '교통',
					data : [ 29, 29 ]
				} ]
			},
			options : {
				indexAxis : 'x',
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		const doughnut = document.getElementById('doughnutChart').getContext(
				'2d');
		const doughnutChart = new Chart(doughnut, {
			type : 'doughnut',
			data : {
				labels : [ '전기', '가스', '수도', '교통' ],
				datasets : [ {
					label : '탄소배출량 세부 항목',
					data : [ 20, 10, 15, 23 ]
				} ]
			}

		});
	</script>
</body>
</html>
