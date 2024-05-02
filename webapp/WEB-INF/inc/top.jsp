<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- Header -->
<header id="header">
    <div class="inner">

        <!-- Logo -->
            <a href="#" class="logo">
                <span class="symbol"><img src="assets/img/logo.png" alt="logo" />
            </a>

        <!-- Nav -->
            <nav>
                <ul>
                    <li><a href="#menu">Menu</a></li>
                </ul>
            </nav>

            
    </div>
</header>
<!-- Menu -->
<nav id="menu">
    <h2>메뉴</h2>
    <ul>
        <li><a href="#">캘린더</a></li>
        <li><a href="#">가계부</a></li>
        <li><a href="statistics.html">탄소배출 통계</a></li>
        <li><a href="board.html">게시판</a></li>
        <li><a href="mypage.html">마이페이지</a></li>
        <li><a href="<c:url value="/loginView" />">로그인</a></li>
        <li><a href="<c:url value="/registView" />">회원가입</a></li>
    </ul>
</nav>