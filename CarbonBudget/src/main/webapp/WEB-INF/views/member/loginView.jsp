<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="page-content" style="margin-top: 7%; margin-bottom: 15%;">
                <div class="col-lg-4 login-form">
                    <div class="d-flex justify-content-center">
                        <h1 style="margin-bottom: 8%;">Login</h1>
                    </div>
                    <form method="post" action="<c:url value="loginDo" />">
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input value="${cookie.rememberId.value}" type="text" class="form-control form-control-xl" placeholder="Username" name="memId" id="memId">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" placeholder="Password" name="memPw">
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <div class="form-check form-check-lg d-flex align-items-end">
                            <input ${cookie.rememberId.value==null ? "" : "checked"} class="form-check-input me-2" type="checkbox" name="remember" id="rememberId">
                            <label class="form-check-label text-gray-600" for="rememberId">
                                아이디 기억하기
                            </label>
                        </div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-3">로그인</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <span class ="login-inner"><a class="font-bold" href="auth-forgot-password.html">회원가입</a></span>
                        <div class="vr"></div>
                        <span class ="login-inner"><a class="font-bold" href="auth-forgot-password.html">아이디찾기</a></span>
                        <div class="vr"></div>
                        <span class ="login-inner"><a class="font-bold" href="<c:url value="/findPwView" />">비밀번호찾기</a></span>
                    </div>
                </div>
            </div>

			<!-- footer 영역 -->
			<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
		</div>
	</div>
	<script src="resources/assets/compiled/js/app.js"></script>
</body>
</html>