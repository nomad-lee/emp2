<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%
	// 유효성 검증 코드
	//1 controller
	Object objLoginEmp = session.getAttribute("loginEmp");
	Employee loginEmp = (Employee)objLoginEmp;
	
	int currentPage = 1;
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	String sort = "ASC";
	if(request.getParameter("sort") !=null && request.getParameter("sort").equals("DESC")) {
		sort = "DESC";
	}
	
	// 2) Model
	int rowPerPage = 10;
	// beginRow 알고리즘 코드
	int beginRow = 0;
	
	// lastPage 알고리즘 코드
	
	// 사원목록
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/employees", "root", "java1234");
	
	String sql = "SELECT emp_no empNo, first_name firstName, last_name lastName FROM employees ORDER BY first_name ASC LIMIT ?,?";
	if(sort.equals("DESC")) {
		sql = "SELECT emp_no empNo, first_name firstName, last_name lastName FROM employees ORDER BY first_name DESC LIMIT ?,?";
	}
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, beginRow);
	stmt.setInt(2, rowPerPage);
	ResultSet rs = stmt.executeQuery();
	ArrayList<Employee> list = new ArrayList<Employee>();
	while(rs.next()) {
		Employee e = new Employee();
		e.setEmpNo(rs.getInt("empNo"));
		e.setFirstName(rs.getString("firstName"));
		e.setLastName(rs.getString("lastName"));
		list.add(e);
	}
	// 3 View
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
		<div>
			<%=loginEmp.getLastName()%>(<%=loginEmp.getEmpNo()%>)님 반갑습니다.
			<a href="<%=request.getContextPath()%>/logout.jsp">로그아웃</a>
		</div>
		<h1>멤버 페이지 입니다</h1>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>이름
					<%
						if(sort.equals("ASC")){
					%>
							<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=currentPage%>&sort=DESC">내림차순</a>
					<%	
						} else {
					%>
							<a href="<%=request.getContextPath()%>/empList.jsp?currentPage=<%=currentPage%>&sort=ASC">오름차순</a>
					<%	
						}
					%>				
				</th>
				<th>성
				</th>
			</tr>
			<%
			for(Employee e : list) {
			%>
				<tr>
					<td><%=e.getEmpNo()%></td>
					<td><%=e.getFirstName()%></td>
					<td><%=e.getLastName()%></td>
				</tr>
			<%
				}
			%>
		</table>	
	</div>
</body>
</html>