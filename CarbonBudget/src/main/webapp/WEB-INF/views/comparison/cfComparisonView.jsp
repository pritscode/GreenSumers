<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page
	import="com.greensumers.carbonbudget.commons.utils.CarbonCalculator"%>
<%@ page
	import="com.greensumers.carbonbudget.comparison.vo.ComparisonVO"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Statistics</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
	#myChart {
       min-width: 50%; /* 원하는 최소 너비로 변경하세요 */
       min-height: 80%;
   }
	#lineChart {
       min-width: 60%;
       min-height: 80%;
   }
	#twoChart {
       min-width: 100%;
       min-height: 80%;
   }
	#doughnutChart {
       min-width: 80%;
       min-height: 40%;
   }
</style>

<!-- 사용자 차트 변수 데이터 설정 -->
<!-- 인덱스 -->
<c:set var="checkInSize" value="${checkIn.size()}" />
<c:set var="lastIndex" value="${checkInSize - 1}" />
<c:set var="secondToLastIndex" value="${checkInSize - 2}" />
<c:set var="thirdToLastIndex" value="${checkInSize - 3}" />
<c:set var="fourthToLastIndex" value="${checkInSize - 4}" />
<c:set var="fifthToLastIndex" value="${checkInSize - 5}" />
<c:set var="sixthToLastIndex" value="${checkInSize - 6}" />
<c:set var="seventhToLastIndex" value="${checkInSize - 7}" />
<c:set var="eighthToLastIndex" value="${checkInSize - 8}" />
<c:set var="ninthToLastIndex" value="${checkInSize - 9}" />
<c:set var="tenthToLastIndex" value="${checkInSize - 10}" />
<c:set var="eleventhToLastIndex" value="${checkInSize - 11}" />
<c:set var="twelfthToLastIndex" value="${checkInSize - 12}" />
<c:set var="thirteenthToLastIndex" value="${checkInSize - 13}" />

<!-- 날짜 -->
<c:set var="useYm" value="${checkIn[lastIndex].useYm}" />
<c:set var="lastUseYm" value="${checkIn[secondToLastIndex].useYm}" />
<c:set var="secondToLastUseYm"
	value="${checkIn[thirdToLastIndex].useYm}" />
<c:set var="thirdToLastUseYm"
	value="${checkIn[fourthToLastIndex].useYm}" />
<c:set var="fourthToLastUseYm"
	value="${checkIn[fifthToLastIndex].useYm}" />
<c:set var="fifthToLastUseYm" value="${checkIn[sixthToLastIndex].useYm}" />
<c:set var="sixthToLastUseYm"
	value="${checkIn[seventhToLastIndex].useYm}" />
<c:set var="seventhToLastUseYm"
	value="${checkIn[eighthToLastIndex].useYm}" />
<c:set var="eighthToLastUseYm"
	value="${checkIn[ninthToLastIndex].useYm}" />
<c:set var="ninthToLastUseYm" value="${checkIn[tenthToLastIndex].useYm}" />
<c:set var="tenthToLastUseYm"
	value="${checkIn[eleventhToLastIndex].useYm}" />
<c:set var="eleventhToLastUseYm"
	value="${checkIn[twelfthToLastIndex].useYm}" />
<c:set var="twelfthToLastUseYm"
	value="${checkIn[thirteenthToLastIndex].useYm}" />

<!-- 에너지 데이터 -->
<c:set var="lastGasUsage" value="${checkIn[lastIndex].gasUsage}" />
<c:set var="lastElctrUsage" value="${checkIn[lastIndex].elctrUsage}" />
<c:set var="thirteenthToLastGasUsage"
	value="${checkIn[thirteenthToLastIndex].gasUsage}" />
<c:set var="thirteenthToLastElctrUsage"
	value="${checkIn[thirteenthToLastIndex].elctrUsage}" />

<!-- 탄소배출량 데이터 -->
<c:set var="lastEmissions" value="${checkIn[lastIndex].emissions}" />
<c:set var="secondToLastEmissions"
	value="${checkIn[secondToLastIndex].emissions}" />
<c:set var="thirdToLastEmissions"
	value="${checkIn[thirdToLastIndex].emissions}" />
<c:set var="fourthToLastEmissions"
	value="${checkIn[fourthToLastIndex].emissions}" />
<c:set var="fifthToLastEmissions"
	value="${checkIn[fifthToLastIndex].emissions}" />
<c:set var="sixthToLastEmissions"
	value="${checkIn[sixthToLastIndex].emissions}" />
<c:set var="seventhToLastEmissions"
	value="${checkIn[seventhToLastIndex].emissions}" />
<c:set var="eighthToLastEmissions"
	value="${checkIn[eighthToLastIndex].emissions}" />
<c:set var="ninthToLastEmissions"
	value="${checkIn[ninthToLastIndex].emissions}" />
<c:set var="tenthToLastEmissions"
	value="${checkIn[tenthToLastIndex].emissions}" />
<c:set var="eleventhToLastEmissions"
	value="${checkIn[eleventhToLastIndex].emissions}" />
<c:set var="twelfthToLastEmissions"
	value="${checkIn[twelfthToLastIndex].emissions}" />
<c:set var="thirteenthToLastEmissions"
	value="${checkIn[thirteenthToLastIndex].emissions}" />

<!-- 전체 사용자 차트 변수 데이터 설정 -->
<c:set var="totalDataSize" value="${totalData.size()}" />
<c:set var="totalDataLastIndex" value="${totalDataSize - 1}" />
<c:set var="totalDataSecondToLastIndex" value="${totalDataSize - 2}" />
<c:set var="totalDataLastGasUsage"
	value="${totalData[totalDataLastIndex].gasUsage}" />
<c:set var="totalDataLastElctrUsage"
	value="${totalData[totalDataLastIndex].elctrUsage}" />
<c:set var="totalDataLastEmissions"
	value="${totalData[totalDataLastIndex].emissions}" />
<c:set var="totalDataSecondToLastGasUsage"
	value="${totalData[totalDataSecondToLastIndex].gasUsage}" />
<c:set var="totalDataSecondToLastElctrUsage"
	value="${totalData[totalDataSecondToLastIndex].elctrUsage}" />
<c:set var="totalDataSecondToLastEmissions"
	value="${totalData[totalDataSecondToLastIndex].emissions}" />

<%-- JSP 스크립틀릿을 사용하여 계산 수행 --%>
<%
	/* 전체 사용자 대비 전기탄소배출비율 */
	double elctrRate = 0;
	try {
		// 세션에서 데이터 가져오기
		List<ComparisonVO> checkIn = (List<ComparisonVO>) session.getAttribute("checkIn");
		List<ComparisonVO> totalData = (List<ComparisonVO>) session.getAttribute("totalData");

		elctrRate = CarbonCalculator.calculateElctrRate(checkIn, totalData);
	} catch (IllegalArgumentException e) {
		// 에러 처리
	}
	pageContext.setAttribute("elctrRate", elctrRate);

	/* 전체 사용자 대비 가스탄소배출비율 */
	double gasRate = 0;
	try {
		// 세션에서 데이터 가져오기
		List<ComparisonVO> checkIn = (List<ComparisonVO>) session.getAttribute("checkIn");
		List<ComparisonVO> totalData = (List<ComparisonVO>) session.getAttribute("totalData");

		gasRate = CarbonCalculator.calculateGasRate(checkIn, totalData);
	} catch (IllegalArgumentException e) {
		// 에러 처리
	}
	pageContext.setAttribute("gasRate", gasRate);

	/* 전체 사용자 대비 탄소배출비율 */
	double carbonRate = 0;
	try {
		// 세션에서 데이터 가져오기
		List<ComparisonVO> checkIn = (List<ComparisonVO>) session.getAttribute("checkIn");
		List<ComparisonVO> totalData = (List<ComparisonVO>) session.getAttribute("totalData");

		carbonRate = CarbonCalculator.calculateCarbonRate(checkIn, totalData);
	} catch (IllegalArgumentException e) {
		// 에러 처리
	}
	pageContext.setAttribute("carbonRate", carbonRate);
%>



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
			<div class="page-heading">
				<h3>탄소 배출량 통계</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="col-md-12 col-lg-4">
						<div class="row">
							<div class="col-12">
								<div class="card" style="height: 175px; display: flex; flex-direction: column;">
									<div class="card-header">
										<div class="d-flex align-items-center">
											<h4 class="mb-0 ms-3">${sessionScope.login.memNm}님</h4>
										</div>
									</div>
									<div class="card-body">
										<div class="row" style="margin-bottom: 12px">
											<div class="col-4">
												<div class="d-flex align-items-center">
													<h5 class="mb-0 ms-3">날짜</h5>
												</div>
											</div>
											<div class="col-8">
												<h5 class="mb-0 text-end">${useYm}</h5>
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
													<h6 class="mb-0 ms-3">
														금월 배출량
														</h5>
												</div>
											</div>
											<div class="col-5">
												<h6 class="mb-0 text-end">${lastEmissions}kg</h5>
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
													<h6 class="mb-0 ms-3">
														전월 배출량
														</h5>
												</div>
											</div>
											<div class="col-5">
												<h6 class="mb-0 text-end">${secondToLastEmissions}kg</h5>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card" name="Compare to others" height="180px" style="height: 280px; display: flex; flex-direction: column;">
									<div class="card-header">
										<h4>유저 평균 배출량</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12" style="height: 180px; text-align: center;">
												<canvas id="myChart" style="display: inline;"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card" name="Monthly Carbon Emissions" style="height: 310px; display: flex; flex-direction: column;">
									<div class="card-header">
										<h4>월 배출량</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12" style="height: 215px; text-align: center;">
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
								<div class="card" name="Compared to last year" style="height: 490px; display: flex; flex-direction: column;">
									<div class="card-header">
										<h4>작년대비 배출량</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-12" style="height: 400px; text-align: center;">
												<canvas id="twoChart" style="display: inline;"></canvas>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-12">
								<div class="card" name="Details" style="height: 310px; display: flex; flex-direction: column;">
									<div class="card-header">
										<h4>세부사항</h4>
									</div>
									<div class="card-body">
										<div class="row">
											<div class="col-3" style="height: 218px; text-align: center; display: flex; justify-content: center; align-items: center;">
												<canvas id="doughnutChart" style="display: inline;"></canvas>
											</div>
											<div class="col-9">
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
																	<td>${lastElctrUsage}kg</td>
																	<td>${lastGasUsage}kg</td>
																	<td>-</td>
																	<td>-</td>
																</tr>
																<tr>
																	<td>${elctrRate}%</td>
																	<td>${gasRate}%</td>
																	<td>-</td>
																	<td>-</td>
																</tr>
															</tbody>
														</table>
													</header>
													<p>
														총 이산화탄소 배출량은 ${lastEmissions}kg으로, 
														이는 다른 가정의 평균 배출량인
														${totalDataLastEmissions}kg 대비 약 ${carbonRate}% 입니다. 
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


	<!-- 에너지 사용량 차트 -->
	<script>
		// 차트 생성
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '사용자 평균', '내 배출량' ],
				datasets : [ {
					label : '전기',
					data : [ ${totalDataLastElctrUsage}, ${lastElctrUsage} ],
					backgroundColor : 'rgba(0, 26, 193, 0.4)'
				}, {
					label : '가스',
					data : [ ${totalDataLastGasUsage}, ${lastGasUsage} ],
					backgroundColor : 'rgba(76, 0, 211, 0.3)'
				}, {
					label : '수도',
					data : [ 6000, 6000 ],
					backgroundColor : 'rgba(16, 237, 255, 0.3)'
				}, {
					label : '교통',
					data : [ 8000, 8000 ],
					backgroundColor : 'rgba(93, 177, 236, 0.5)'
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
				labels : [ "${twelfthToLastUseYm}",
						   "${eleventhToLastUseYm}",
						   "${tenthToLastUseYm}",
						   "${ninthToLastUseYm}",
						   "${eighthToLastUseYm}",
						   "${seventhToLastUseYm}",
						   "${sixthToLastUseYm}",
						   "${fifthToLastUseYm}",
						   "${fourthToLastUseYm}",
						   "${thirdToLastUseYm}",
						   "${secondToLastUseYm}",
						   "${lastUseYm}",
						   "${useYm}" ],
				datasets : [ {
					label : '탄소배출량',
					data : [ ${thirteenthToLastEmissions},
							 ${twelfthToLastEmissions},
							 ${eleventhToLastEmissions},
							 ${tenthToLastEmissions},
							 ${ninthToLastEmissions},
							 ${eighthToLastEmissions},
							 ${seventhToLastEmissions},
							 ${sixthToLastEmissions},
							 ${fifthToLastEmissions},
							 ${fourthToLastEmissions},
							 ${thirdToLastEmissions},
							 ${secondToLastEmissions},
							 ${lastEmissions} ],
					fill : false,
					tension : 0.2
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});

		const twoctx = document.getElementById('twoChart').getContext('2d');
		const twoChart = new Chart(twoctx, {
			type : 'bar',
			data : {
				labels : [ "${twelfthToLastUseYm}", "${useYm}" ],
				datasets : [ {
					label : '전기',
					data : [ ${thirteenthToLastElctrUsage}, ${lastElctrUsage} ],
					backgroundColor : 'rgba(0, 26, 193, 0.4)'
				}, {
					label : '가스',
					data : [ ${thirteenthToLastGasUsage}, ${lastGasUsage} ],
					backgroundColor : 'rgba(76, 0, 211, 0.3)'
				}, {
					label : '수도',
					data : [ 6000, 6000 ],
					backgroundColor : 'rgba(16, 237, 255, 0.3)'
				}, {
					label : '교통',
					data : [ 8000, 8000 ],
					backgroundColor : 'rgba(93, 177, 236, 0.5)'
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
			options : {
				plugins : {
					legend : {
						display : false
					}
				}
			},
			data : {
				labels : [ '전기', '가스', '수도', '교통' ],
				datasets : [ {
					label : '탄소배출량 세부 항목',
					data : [ ${lastElctrUsage}, ${lastGasUsage}, 6000, 8000 ],
					backgroundColor : ['rgba(0, 26, 193, 0.4)', 'rgba(76, 0, 211, 0.3)', 'rgba(16, 237, 255, 0.3)', 'rgba(93, 177, 236, 0.5)']
				} ]
			}

		});
	</script>
</body>
</html>
