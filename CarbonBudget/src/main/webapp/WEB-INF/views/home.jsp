<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
       min-width: 60%;
	   max-width: 90%;
       min-height: 80%;
   }
	#doughnutChart {
       min-width: 80%;
       min-height: 40%;
   }
</style>
<!-- 데이터 리스트 설정 -->
<!-- 인덱스 -->
<c:set var="totalDataSize" value="${totalData.size()}" />
<c:set var="lastIndex" value="${totalDataSize - 1}" />
<c:set var="secondToLastIndex" value="${totalDataSize - 2}" />
<c:set var="thirdToLastIndex" value="${totalDataSize - 3}" />
<c:set var="fourthToLastIndex" value="${totalDataSize - 4}" />
<c:set var="fifthToLastIndex" value="${totalDataSize - 5}" />
<c:set var="sixthToLastIndex" value="${totalDataSize - 6}" />
<c:set var="seventhToLastIndex" value="${totalDataSize - 7}" />
<c:set var="eighthToLastIndex" value="${totalDataSize - 8}" />
<c:set var="ninthToLastIndex" value="${totalDataSize - 9}" />
<c:set var="tenthToLastIndex" value="${totalDataSize - 10}" />
<c:set var="eleventhToLastIndex" value="${totalDataSize - 11}" />
<c:set var="twelfthToLastIndex" value="${totalDataSize - 12}" />
<c:set var="thirteenthToLastIndex" value="${totalDataSize - 13}" />

<!-- 날짜 -->
<c:set var="useYm" value="${totalData[lastIndex].useYm}" />
<c:set var="lastUseYm" value="${totalData[secondToLastIndex].useYm}" />
<c:set var="secondToLastUseYm"
	value="${totalData[thirdToLastIndex].useYm}" />
<c:set var="thirdToLastUseYm"
	value="${totalData[fourthToLastIndex].useYm}" />
<c:set var="fourthToLastUseYm"
	value="${totalData[fifthToLastIndex].useYm}" />
<c:set var="fifthToLastUseYm" value="${totalData[sixthToLastIndex].useYm}" />
<c:set var="sixthToLastUseYm"
	value="${totalData[seventhToLastIndex].useYm}" />
<c:set var="seventhToLastUseYm"
	value="${totalData[eighthToLastIndex].useYm}" />
<c:set var="eighthToLastUseYm"
	value="${totalData[ninthToLastIndex].useYm}" />
<c:set var="ninthToLastUseYm" value="${totalData[tenthToLastIndex].useYm}" />
<c:set var="tenthToLastUseYm"
	value="${totalData[eleventhToLastIndex].useYm}" />
<c:set var="eleventhToLastUseYm"
	value="${totalData[twelfthToLastIndex].useYm}" />
<c:set var="twelfthToLastUseYm"
	value="${totalData[thirteenthToLastIndex].useYm}" />

<!-- 전체 사용자 차트 변수 데이터 설정 -->
<c:set var="lastGasUsage" value="${totalData[lastIndex].gasUsage}" />
<c:set var="lastElctrUsage" value="${totalData[lastIndex].elctrUsage}" />
<c:set var="thirteenthToLastGasUsage"
	value="${totalData[thirteenthToLastIndex].gasUsage}" />
<c:set var="thirteenthToLastElctrUsage"
	value="${totalData[thirteenthToLastIndex].elctrUsage}" />

<!-- 탄소배출량 데이터 -->
<c:set var="lastEmissions" value="${totalData[lastIndex].emissions}" />
<c:set var="secondToLastEmissions"
	value="${totalData[secondToLastIndex].emissions}" />
<c:set var="thirdToLastEmissions"
	value="${totalData[thirdToLastIndex].emissions}" />
<c:set var="fourthToLastEmissions"
	value="${totalData[fourthToLastIndex].emissions}" />
<c:set var="fifthToLastEmissions"
	value="${totalData[fifthToLastIndex].emissions}" />
<c:set var="sixthToLastEmissions"
	value="${totalData[sixthToLastIndex].emissions}" />
<c:set var="seventhToLastEmissions"
	value="${totalData[seventhToLastIndex].emissions}" />
<c:set var="eighthToLastEmissions"
	value="${totalData[eighthToLastIndex].emissions}" />
<c:set var="ninthToLastEmissions"
	value="${totalData[ninthToLastIndex].emissions}" />
<c:set var="tenthToLastEmissions"
	value="${totalData[tenthToLastIndex].emissions}" />
<c:set var="eleventhToLastEmissions"
	value="${totalData[eleventhToLastIndex].emissions}" />
<c:set var="twelfthToLastEmissions"
	value="${totalData[twelfthToLastIndex].emissions}" />
<c:set var="thirteenthToLastEmissions"
	value="${totalData[thirteenthToLastIndex].emissions}" />

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
				<h3>전체 탄소 배출량 통계</h3>
			</div>
			<div class="page-content" style="margin-bottom: 0PX;">
				<section class="row">
					<div class="col-12 col-lg-4">
						<div class="row">
							<div class="col-12">
								<div class="card" style="height: 175px; display: flex; flex-direction: column;">
									<div class="card-header">
										<div class="d-flex align-items-center">
											<h4 class="mb-0 ms-3">전체 사용자</h4>
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
								<div class="card" name="Compare to others" style="height: 280px; display: flex; flex-direction: column;">
									<div class="card-header">
										<h4>평균 배출량</h4>
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
															</tbody>
														</table>
													</header>
													<p>
														가정당 평균 배출량은 ${lastEmissions}kg 입니다.
														그래프를 통해 각 항목별 이산화탄소 배출량을 비교하여, 
														어떤 부분에서 더 많은 배출이 발생하고 있는지 확인해 보시기 바랍니다.
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
				labels : [ '사용자 평균' ],
				datasets : [ {
					label : '전기',
					data : [ ${lastElctrUsage} ],
					backgroundColor : 'rgba(0, 26, 193, 0.4)'
				}, {
					label : '가스',
					data : [ ${lastGasUsage} ],
					backgroundColor : 'rgba(76, 0, 211, 0.3)'
				}, {
					label : '수도',
					data : [ 4000 ],
					backgroundColor : 'rgba(16, 237, 255, 0.3)'
				}, {
					label : '교통',
					data : [ 7000 ],
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
					data : [ 4000, 4100 ],
					backgroundColor : 'rgba(16, 237, 255, 0.3)'
				}, {
					label : '교통',
					data : [ 7000, 7100 ],
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
					data : [ ${lastElctrUsage}, ${lastGasUsage}, 4000, 7000 ],
					backgroundColor : ['rgba(0, 26, 193, 0.4)', 'rgba(76, 0, 211, 0.3)', 'rgba(16, 237, 255, 0.3)', 'rgba(93, 177, 236, 0.5)']
				} ]
			}

		});
	</script>
</body>
</html>
