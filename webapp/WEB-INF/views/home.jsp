<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>

	<P>  The time on the server is ${serverTime}. </P>

	<a href="<c:url value="/test"/>">테스트용 메일 전송</button>
	<br>
	<a href="<c:url value="/testVerification"/>">테스트용 인증메일 전송</button>

</body>
</html>
