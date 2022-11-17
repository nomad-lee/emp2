<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "java.sql.*" %>
<%
	//1 컨트롤러
	//유효성 검사
	int empNo = Integer.parseInt(request.getParameter("empNo"));
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	
	Employee employee = new Employee();
	employee.setEmpNo(empNo);
	employee.setFirstName(firstName);
	employee.setLastName(lastName);
	
	//2 모델
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost/employees","root","java1234"); //dbUrl, dbUser, dbPw
	
	String sql = "SELECT emp_no empNo, last_name lastName FROM employees WHERE emp_no =? AND first_name =? AND last_name=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	// getter 사용
	stmt.setInt(1, employee.getEmpNo());
	stmt.setString(2, employee.getFirstName());
	stmt.setString(3, employee.getLastName());
	
	ResultSet rs = stmt.executeQuery();
	String targetUrl = "/loginForm.jsp";
	if(rs.next()) {
		// 로그인 성공!
		Employee loginEmp = new Employee();
		loginEmp.setEmpNo(rs.getInt("empNo"));
		loginEmp.setLastName(rs.getString("lastName"));
		session.setAttribute("loginEmp", loginEmp); // 키 : "loginEmp", 값 :Object object = loginEmp;
		targetUrl = "/empList.jsp";
	}
	rs.close();
	stmt.close();
	conn.close();
	response.sendRedirect(request.getContextPath()+targetUrl);
	
	//3 뷰
%>