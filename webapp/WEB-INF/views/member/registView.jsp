<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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
    </style>

    <!-- 우편번호 찾기 함수 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우
                        addr = data.jibunAddress;
                    }

                    // 우편번호와 주소 정보를 입력란에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 설정한다.
                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 상세주소 입력란에 포커스를 설정한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>

    <!-- 참고 폼 제출 함수 참고 -->
    <!-- <script>
        // 폼 제출 시 실행될 함수
        document.getElementById("signupForm").addEventListener("submit", function(event) {
            event.preventDefault(); // 기본 동작 방지

        // 입력된 값들 가져오기
        var name = document.getElementById("name").value;
        var nickname = document.getElementById("nickname").value;
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value;
        var email = document.getElementById("email").value;
        var postcode = document.getElementById("sample6_postcode").value;
        var address = document.getElementById("sample6_address").value;
        var detailAddress = document.getElementById("sample6_detailAddress").value;
        var extraAddress = document.getElementById("sample6_extraAddress").value;

        // 여기에 데이터를 처리하고 DB에 저장하는 코드를 추가할 수 있습니다.
        // 예를 들어, AJAX를 사용하여 서버에 데이터를 전송하고 서버에서 데이터베이스에 저장하는 등의 작업이 가능합니다.
        
        // 여기에 데이터 처리 및 저장 로직 추가

        // 회원가입 성공 메시지 출력 (임시)
        alert("회원가입이 완료되었습니다!");
    });
    </script> -->

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
                    
                        <h1 style="text-align: center;">회원가입</h1>

                        <!-- Form -->
                        <section>
                            <form method="post" action="#">
                                <!-- name값과 value값을 지정하지 않았습니다. spring 하면서 수정해주세요 -->
                                <div class="row gtr-uniform">
                                    
                                    <!-- ID, PW -->
                                    <div class="col-8 col-12-xsmall">
                                        <input type="text" name="" id="id" value="" placeholder="아이디"/>
                                    </div>
                                    <div class="col-4 col-12-xsmall">
                                        <input type="submit" value="중복체크" class="button fit"/>
                                    </div>
                                    <div class="col-12">
                                        <input type="password" name="" id="pw" value="" placeholder="비밀번호"/>
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

                                    <!-- 에러 메시지 -->
                                    <div class="col-12">
                                        <div class="errorMsg">
                                            아이디: 필수 정보입니다.
                                        </div>
                                    </div>
                                    <div class="col-12-xsmall" id="errorMsg">
                                        <div class="errorMsg">
                                            비밀번호: 필수 정보입니다.
                                        </div>
                                    </div>
                                    <div class="col-12" id="errorMsg">이메일 인증에 실패하셨습니다.</div>
                                    

                                    <!-- 개인정보 -->
                                    <div class="col-12">
                                        <input type="text" name="" id="nm" value="" placeholder="이름"/>
                                    </div>
                                    <div class="col-8 col-12-xsmall">
                                        <input type="text" name="" id="nn" value="" placeholder="닉네임"/>
                                    </div>
                                    <div class="col-4 col-12-xsmall">
                                        <input type="submit" value="중복체크" class="button fit"/>
                                    </div>
                                    
                                    <div class="col-12">
                                        <input type="text" name="" id="" value="" placeholder="전화번호 ( - 없이 입력)"/>
                                    </div>
                                    
                                    
                                    <!-- 주소 -->
                                    <div class="col-8 col-12-xsmall">
                                        <input type="text" id="sample6_postcode" placeholder="우편번호"/>
                                    </div>
                                    <div class="col-4 col-12-xsmall">
                                        <input class="button fit" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
                                    </div>
                                    <div class="col-8 col-12-xsmall">
                                        <input type="text" id="sample6_address" placeholder="주소">
                                    </div>
                                    <div class="col-4 col-12-xsmall">
                                        <input type="text" name="" id="세부주소" value="" placeholder="세부주소"/>
                                    </div>
                                    <div class="col-12">
                                        <input type="text" name="" id="상세주소" value="" placeholder="상세주소"/>
                                    </div>

                                    <!-- 에러메시지 -->
                                    <div class="col-12" id="errorMsg">이름: 필수 정보입니다.</div>
                                    <div class="col-12" id="errorMsg">닉네임: 필수 정보입니다.</div>
                                    <div class="col-12" id="errorMsg">전화번호: 필수 정보입니다.</div>
                                    <div class="col-12" id="errorMsg">주소: 필수 정보입니다.</div>
                                    
                                    <div class="col-12" style="text-align: center;">
                                        <input type="submit" value="가입하기" class="primary"/>
                                    </div>
                                </div>
                            </form>
                        </section>

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
    <script type="text/javascript">
        
        $(document).ready(function(){
            $('.errorMsg').hide();
            $('.errorEmMsg').hide();
            $("#id").blur(function() {
                showErrorMsg($('.errorMsg'));
            });
        });
        
        function showErrorMsg(obj) {
            if ($("#id").val().trim() === "") {
                obj.show();
            } else {
                obj.hide();
            }
        }

    </script>
</body>
</html>
