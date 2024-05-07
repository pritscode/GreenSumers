<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Find Id</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/main.css" />
    <noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
    <style>
        #errorMsg {
          color: red;
        }
        .errorMsg {
            color: red;
        }
        .errorEmMsg {
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

                <h1 style="text-align: center;">아이디 찾기</h1>

                <!-- Form -->
                <section>
                    <form method="post" action="#">
                        <!-- name값과 value값을 지정하지 않았습니다. spring 하면서 수정해주세요 -->
                        <div class="row gtr-uniform">
                            
                            <!-- 이름 -->
                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <input type="text" name="" id="nm" value="" placeholder="이름"/>
                            </div>
                            <div class="col-3 col-12-xsmall"></div>
                            

                            <!-- 이메일 -->
                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-4 col-12-xsmall">
                                <input type="email" name="" id="email" value="" placeholder="이메일"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <!-- action 입니다. -->
                                <input type="submit" value="이메일 인증" class="button fit">
                            </div>
                            <div class="col-3 col-12-xsmall"></div>

                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-4 col-12-xsmall">
                                <input type="text" name="" id="" value="" placeholder="인증번호"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <!-- action 입니다. -->
                                <input type="submit" value="인증 요청" class="button fit"/>
                            </div>
                            <div class="col-3 col-12-xsmall"></div>

                            <!-- 에러메시지 -->
                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <div class="errorMsg">이름: 필수 정보입니다.</div>
                            </div>
                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <div class="errorEmMsg">이메일 인증에 실패하셨습니다.</div>
                            </div>
                            <div class="col-3 col-12-xsmall"></div>
                            
                            <!-- 아이디 확인 -->
                            <div class="col-3 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <div class="ID verification" style="text-align: center;">회원님의 아이디는 '@@@@@'입니다.</div>
                            </div>
                            <div class="col-3 col-12-xsmall"></div>
                            
                            
                            <div class="col-4 col-12-xsmall"></div>
                            <div class="col-4 col-12-xsmall" style="text-align: center;">
                                <input type="submit" value="아이디 찾기" class="primary fit" style="align-content: center;"/>
                            </div>
                            <div class="col-4 col-12-xsmall"></div>

                            <div class="col-4 col-12-xsmall"></div>
                            <div class="col-4 col-12-xsmall" style="text-align: center;">
                                <a href="#" class="button primary fit">로그인 화면 이동</a>
                            </div>
                            <div class="col-4 col-12-xsmall"></div>
                        </div>
                    </form>
                </section>

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
    <script type="text/javascript">
        
        $(document).ready(function(){
            $('.errorMsg').hide();
            // $('.errorEmMsg').hide();
            $("#nm").blur(function() {
                showErrorMsg($('.errorMsg'));
            });
        });

        function showErrorMsg(obj) {
            if ($("#nm").val().trim() === "") {
                obj.show();
            } else {
                obj.hide();
            }
        }


    </script>
</body>
</html>