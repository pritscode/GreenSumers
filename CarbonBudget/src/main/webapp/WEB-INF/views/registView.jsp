<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function changeStyleDisplay(){
		var hiddenDiv = document.getElementById("hiddenDiv");
		if (hiddenDiv.style.display === "none") {
	        hiddenDiv.style.display = "";
	    }
		memEmail = $("#memEmail").val()
		alert(memEmail)
		$.ajax({
			url : "<c:url value='sendVerifMailDo' />",
			type : 'post',
			data : {
				memEmail: memEmail // 여기에 이메일 값을 넣으세요.
			},
			success : function(res) { // controllor에서 list를 return 받았음
		    			console.log(res)
		                
		     },
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	function checkVerification(){
		let email = $("#memEmail").val();
		let code = $("#verifCode").val();
		if(code == ''){
			alert("코드를 입력하세요");
			return false;
		}
		
		$.ajax({
			url : "<c:url value='/verify'/>",
			type : 'post',
			data : {
				email: email,
				code: code
			},
			success: function(res){
				console.log(res);
				if(res ==='Y'){
					alert("인증 되었습니다.");
				}else{
					alert("번호를 확인해 주세요");
					$("#verifCode").val('');
					$("#verifCode").focus();
				}
			},
			error: function(e){
				console.log(e);
			}
		});
	}
	
</script>

<!-- 우편번호 찾기 함수 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var kornRoadNm = ''; // 주소 변수
                    var lotnoAddr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
                    var bun_ge = '';
                    var bun = '';
                    var ge = '';
                    var address_id = ''; //address 테이블에 사용되는 pk값

                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        kornRoadNm = data.roadAddress;
                    	lotnoAddr = data.jibunAddress;
                    	bun_ge = data.jibunAddressEnglish.split(',')[0]
                        bun = bun_ge.split('-')[0].padStart(3, '0');
                        ge = bun_ge.split('-')[1].padStart(3, '0');
                    	address_id= data.bcode+bun+ge
                        alert(address_id)
                    } else { // 사용자가 지번 주소를 선택했을 경우
                    	lotnoAddr = data.jibunAddress;
                        kornRoadNm = data.roadAddress;
                        bun_ge = data.jibunAddressEnglish.split(',')[0]
                        bun = bun_ge.split('-')[0].padStart(3, '0');
                        ge = bun_ge.split('-')[1].padStart(3, '0');
                        address_id= data.bcode+bun+ge
                        alert(address_id)
                    }

                    // 우편번호와 주소 정보를 입력란에 넣는다.
                    document.getElementById('memAddrId').value = address_id;
                    document.getElementById("memKornRoadNm").value = kornRoadNm;
                    document.getElementById("memLotnoAddr").value = lotnoAddr;

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 설정한다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        document.getElementById("memExtAddr").value = extraAddr;

                    // 상세주소 입력란에 포커스를 설정한다.
                    document.getElementById("memDtlAddr").focus();
                }
            }).open();
        }
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
			<div class="page-heading">
				<section id="multiple-column-form">
					<div class="row match-height">
						<div class="col-6" id="sign-up-form">
							<div class="card">
								<div class="card-header">
									<h2 class="card-title">Sign up</h2>
								</div>
								<div class="card-content">
									<div class="card-body">
										<form class="form form-vertical" data-parsley-validate
											action="<c:url value='registDo' />">
											<div class="form-body">
												<div class="row">

													<!-- 버튼이 포함된 input -->
													<div class="col-12">
														<div class="form-group">
															<label for="memId" class="form-label"><i
																class="bi bi-person"></i> ID</label>
															<div class="input-group mb-3">
																<input type="text" class="form-control" id="memId"
																	name="memId" placeholder="4~12글자"
																	data-parsley-required="true">
																<button
																	class="btn btn-outline-primary col-lg-2 col-xs-4">체크</button>
															</div>
														</div>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="memNm" class="form-label"><i
																class="bi bi-lock"></i> name</label> <input type="text"
																class="form-control" id="memNm" name="memNm"
																placeholder="이름" data-parsley-required="true">
														</div>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="memAls" class="form-label"><i
																class="bi bi-lock"></i> alias</label> <input type="text"
																class="form-control" id="memAls" name="memAls"
																placeholder="별명" data-parsley-required="true">
														</div>
													</div>

													<div class="col-12">
														<form class="form form-vertical" data-parsley-validate
															action="<c:url value='/VerificationDo'/>">
															<div class="form-group">
																<label for="memEmail" class="form-label"><i
																	class="bi bi-envelope"></i> Email</label>
																<div class="input-group mb-3">
																	<input type="email" class="form-control" id="memEmail"
																		name="memEmail" placeholder="email"
																		data-parsley-required="true">
																	<button type="submit"
																		class="btn btn-outline-primary col-lg-2 col-xs-4"
																		onclick="changeStyleDisplay()">
																		<i class="bi bi-send"></i>
																	</button>
																</div>
																<div class="input-group mb-3" id="hiddenDiv" style="display:none;">
																	<input type="text" class="form-control" id="verifCode"
																		name="verifCode" placeholder="code"
																		data-parsley-required="true">
																	<button type="submit"
																		class="btn btn-outline-primary col-lg-2 col-xs-4"
																		onclick="checkVerification()">
																		<i class="bi bi-check2"></i>
																	</button>
																</div>
															</div>
														</form>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="memKornRoadNm" class="form-label"><i
																class="bi bi-house-check"></i> address</label>
															<div class="input-group mb-3">
																<input type="text" class="form-control"
																	id="memKornRoadNm" name="memKornRoadNm"
																	placeholder="카카오 주소찾기" data-parsley-required="true">
																<button
																	class="btn btn-outline-primary col-lg-2 col-xs-4"
																	onclick="sample6_execDaumPostcode()">
																	<i class="bi bi-search"></i>
																</button>
															</div>
															<div class="input-group mb-3">
																<input type="text" class="form-control"
																	id="memAddrId" name="memAddrId"
																	placeholder="주소아이디">
															</div>
															<div class="input-group mb-3">
																<input type="text" class="form-control"
																	id="memLotnoAddr" name="memLotnoAddr"
																	placeholder="지번 주소">
															</div>
															<div class="input-group mb-3">
																<input type="text" class="form-control"
																	id="memDtlAddr" name="memDtlAddr"
																	placeholder="세부 주소">
															</div>
															<div class="input-group mb-3">
																<input type="text" class="form-control"
																	id="memExtAddr" name="memExtAddr"
																	placeholder="기타 주소">
															</div>
														</div>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="memTel" class="form-label"><i
																class="bi bi-phone"></i> phone</label> <input type="text"
																class="form-control" id="memTel" name="memTel"
																placeholder="숫자만 입력해주세요" >
														</div>
													</div>

													<!-- 단독 input -->
													<div class="col-12">
														<div class="form-group">
															<label for="memPw" class="form-label"><i
																class="bi bi-lock"></i> Password</label> <input type="password"
																class="form-control" id="memPw" name="memPw"
																placeholder="영어와 숫자를 포함한 4~12글자"
																data-parsley-required="true">
														</div>
													</div>

													<div class="col-12">
														<div class="form-group">
															<label for="pwCheck" class="form-label"><i
																class="bi bi-clipboard-check"></i> pw check</label> <input
																type="password" class="form-control" id="pwCheck"
																name="pwCheck" placeholder="비밀번호 체크"
																data-parsley-required="true">
														</div>
													</div>

													<div class="row agree">
														<div class="row agree_detail">
															<strong>개인정보 수집 이용에 동의</strong>
															<ul style="list-style-type: none;">
																<li>① 수집 항목: 아이디, 비밀번호, 이름, 전화번호</li>
																<li>② 수집 이용목적 : 회원제 서비스 이용에 따른 본인 식별 절차에 이용</li>
																<li>③ 보유 및 이용기간 : 제휴 시 서비스 이용 종료 까지</li>
																<li>④ 동의 거부시 서비스 이용 신청 불가</li>
															</ul>
															<div class="form-group">
																<span class="inp_chk"> <input type="checkbox"
																	data-parsley-required="true" id="ck_agree"> <label
																	for="ck_agree">위의 '개인정보 수집 이용'에 동의 합니다.</label> <label
																	class="form-label" style="display: none;">개인정보
																		동의</label>
																</span>
															</div>
														</div>
													</div>

													<div class="col-12 d-flex justify-content-end">
														<button type="submit" class="btn btn-primary me-1 mb-1">회원가입</button>
														<button type="reset"
															class="btn btn-light-secondary me-1 mb-1">Reset</button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>

			<!-- footer 영역 -->
			<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		</div>
	</div>
	<script src="resources/assets/compiled/js/app.js"></script>
</body>
</html>
