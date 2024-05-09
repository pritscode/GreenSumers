<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/main.css" />
    <noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
</head>
<body class="is-preload">
    <!-- Wrapper -->
    <div id="wrapper">
        
        <!-- Header -->
        <jsp:include page="/WEB-INF/inc/top.jsp" ></jsp:include>

        <!-- Main -->
        <div id="main">
            <div class="inner">
                <div class="row gtr-uniform">
                    <div class="col-3 col-12-xsmall" style="float: left;"></div>
                    <div class="col-6 col-12-xsmall" style="float: left;">
                    
                        <h1 style="text-align: center;">로그인</h1>

                        <!-- Form -->
                        <section>
                            <form method="post" action="#">
                                <!-- name값과 value값을 지정하지 않았습니다. spring 하면서 수정해주세요 -->
                                <div class="row gtr-uniform">
                                    <div class="col-12">
                                        <input type="text" name="" id="id" value="" placeholder="아이디"/>
                                    </div>
                                    <div class="col-12">
                                        <input type="password" name="" id="pw" value="" placeholder="비밀번호"/>
                                    </div>

                                    <div class="col-6 col-12-small">
                                        <input type="checkbox" id="demo-copy" name="demo-copy">
                                        <label for="demo-copy">아이디 기억하기</label>
                                    </div>
                                    
                                    <div class="col-12" style="text-align: center;">
                                        <input type="submit" value="로그인" class="primary" />
                                    </div>
                                </div>
                            </form>
                        </section>

                        <!-- 아이디, 비번 찾기 -->
                        <section>
                                <div class="col-12-xsmall" style="text-align: center;">
                                        <a href="#" style="text-decoration: none"><span class="label">아이디 찾기</span></a>
                                        <span class="label"> | </span></li>
                                        <a href="#" style="text-decoration: none"><span class="label">비밀번호 찾기</span></a>
                                </div>
                        </section>

		                <!-- 소셜 로그인 -->
		                <!-- 구글 로그인 화면으로 이동 시키는 URL -->
						<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
						<div id="google_id_login" style="text-align:center"><a href="${google_url}"><img width="230" src="assets/img/web_neutral_rd_SI@2x.png"/></a></div>
						
                    </div>
                    <div class="col-3 col-12-xsmall" style="float: left;"></div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/inc/footer.jsp" ></jsp:include>

    </div>

    <!-- Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/browser.min.js"></script>
    <script src="js/breakpoints.min.js"></script>
    <script src="js/util.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
