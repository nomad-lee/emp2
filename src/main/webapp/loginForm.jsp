<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//session 유효성 검증 코드 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
	<!-- 부트스트랩5 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<h1 class="text-center mt-3">로그인</h1>	
	<div class="container">
		<form action="<%=request.getContextPath()%>/loginAction.jsp" method="post">
			<table class = "table">
				<tr>
					<td>empNo</td>
					<td><input type="text" class="form-control" name="empNo"></td>
				</tr>
				<tr>
					<td>firstName</td>
					<td><input type="text" class="form-control" name="firstName"></td>
				</tr>	
				<tr>
					<td>lastName</td>
					<td><input type="text" class="form-control" name="lastName"></td>
				</tr>		
			</table>
			<button type="submit" class="btn btn-secondary">로그인</button>
		</form>
	</div>
</body>
</html>