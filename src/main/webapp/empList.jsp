<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%
	// 유효성 검증 코드
	Object objLoginEmp = session.getAttribute("loginEmp");
	Employee loginEmp = (Employee)objLoginEmp;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩5 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="container">	
		<%=(String)(session.getAttribute("loginMemberId"))%>님 반갑습니다.
		<h1>멤버 페이지 입니다</h1>
		<table class="table">
			<a class="btn btn-info" href="<%=request.getContextPath()%>/memberOne.jsp">내정보</a>
			<a class="btn btn-danger" href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
		</table>	
	</div>
</body>
</html>