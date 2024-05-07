<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="css/main.css" />
    <noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
    
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
                <h1>마이페이지</h1>
                <!-- Table -->
                <section>
                    <h2>내 정보</h2>
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>항목</th>
                                    <th>내용</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>이름</td>
                                    <td>demo-name</td>
                                </tr>
                                <tr>
                                    <td>닉네임</td>
                                    <td>demo-nickname</td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td>demo-email</td>
                                </tr>
                                <tr>
                                    <td>주소</td>
                                    <td>demo-address</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                    <h2>내 사용량 조회 정보</h2>
                    <div class="table-wrapper">
                        <table>
                            <thead>
                                <tr>
                                    <th>종류</th>
                                    <th>날짜</th>
                                    <th>사용량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>가스</td>
                                    <td>Ante turpis integer aliquet porttitor.</td>
                                    <td>29.99</td>
                                </tr>
                                <tr>
                                    <td>전기</td>
                                    <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                    <td>19.99</td>
                                </tr>
                                <tr>
                                    <td>수도</td>
                                    <td> Morbi faucibus arcu accumsan lorem.</td>
                                    <td>29.99</td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="2"></td>
                                    <td>100.00</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </section>




                <h2>회원정보 수정</h2>

                <!-- Form -->
                <section>
                    <form method="post" action="#">
                        <!-- name값과 value값을 지정하지 않았습니다. spring 하면서 수정해주세요 -->
                        <div class="row gtr-uniform">
                            <div class="col-6 col-12-xsmall">
                                <input type="text" name="" id="nm" value="" placeholder="이름"/>
                            </div>
                            <div class="col-6 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <input type="text" name="" id="nn" value="" placeholder="닉네임"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <input type="submit" value="중복체크" class="button fit"/>
                            </div>
                            <div class="col-4 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <input type="password" name="" id="pw" value="" placeholder="비밀번호"/>
                            </div>
                            <div class="col-6 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <input type="text" name="" id="" value="" placeholder="전화번호 ( - 없이 입력)"/>
                            </div>
                            <div class="col-6 col-12-xsmall"></div>

                            <!-- 이메일 -->
                            <div class="col-6 col-12-xsmall">
                                <input type="email" name="" id="email" value="" placeholder="이메일"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <!-- action 입니다. -->
                                <input type="submit" value="이메일 인증" class="button fit">
                            </div>
                            <div class="col-4 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <input type="text" name="" id="" value="" placeholder="인증번호"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <!-- action 입니다. -->
                                <input type="submit" value="인증 확인" class="button fit"/>
                            </div>
                            <div class="col-4 col-12-xsmall"></div>
                            
                            <!-- 주소 -->
                            <div class="col-6 col-12-xsmall">
                                <input type="text" id="sample6_postcode" placeholder="우편번호"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <input class="button fit" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"/>
                            </div>
                            <div class="col-4 col-12-xsmall"></div>
                            <div class="col-6 col-12-xsmall">
                                <input type="text" id="sample6_address" placeholder="주소">
                            </div>
                            <div class="col-6 col-12-xsmall"></div>
                            <div class="col-4 col-12-xsmall">
                                <input type="text" name="" id="상세주소" value="" placeholder="상세주소"/>
                            </div>
                            <div class="col-2 col-12-xsmall">
                                <input type="text" name="" id="" value="" placeholder="세부주소"/>
                            </div>
                            <div class="col-6 col-12-xsmall"></div>
                            <div class="col-12">
                                <ul class="actions">
                                    <li><input type="submit" value="수정하기" class="primary" /></li>
                                </ul>
                            </div>
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
</body>
</html>