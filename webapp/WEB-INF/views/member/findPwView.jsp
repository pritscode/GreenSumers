<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Find Pw</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/main.css" />
    <noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
    <style>
        #errorMsg {
          color: red;
        }
      </style>

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
                    <div class="col-3 col-12-xsmall"></div>
                    <div class="col-6 col-12-xsmall">

                        <h1 style="text-align: center;">비밀번호 찾기</h1>

                        <!-- Form -->
                        <section>
                            <form method="post" action="#">
                                <!-- name값과 value값을 지정하지 않았습니다. spring 하면서 수정해주세요 -->
                                <div class="row gtr-uniform">
                                    
                                    <!-- 아이디 -->
                                    <div class="col-12">
                                        <input type="text" name="" id="id" value="" placeholder="아이디"/>
                                    </div>

                                    <!-- 이메일 -->
                                    <div class="col-8 col-12-xsmall">
                                        <input type="email" name="" id="email" value="" placeholder="이메일"/>
                                    </div>
                                    <div class="col-4 col-12-xsmall">
                                        <!-- action 입니다. -->
                                        <input type="submit" value="이메일 인증" class="button fit">
                                    </div>

                                    <div class="col-8 col-12-xsmall">
                                        <input type="text" name="" id="" value="" placeholder="인증번호"/>
                                    </div>
                                    <div class="col-4 col-12-xsmall">
                                        <!-- action 입니다. -->
                                        <input type="submit" value="인증 요청" class="button fit"/>
                                    </div>
                                    
                                    <!-- 에러메시지 -->
                                    <div class="col-12" id="errorMsg">아이디: 필수 정보입니다.</div>
                                    <div class="col-12" id="errorMsg">이메일 인증에 실패하셨습니다.</div>
                                    
                                    <!-- 비밀번호 확인 -->
                                    <div class="col-12">
                                        <div class="" style="text-align: center;"><p>회원님의 임시 비밀번호를 메일로 보내드렸습니다.</p><p>마이페이지에서 비밀번호를 수정해주세요.</p></p></div>
                                    </div>

                                    <div class="col-12" style="text-align: center;">
                                        <input type="submit" value="비밀번호 찾기" class="primary"/>
                                    </div>
                                    
                                    
                                    <div class="col-12" style="text-align: center;">
                                        <a href="#" class="button primary">로그인 화면 이동</a>
                                    </div>

                                </div>
                            </form>
                        </section>

                    </div>
                    <div class="col-3 col-12-xsmall"></div>
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
