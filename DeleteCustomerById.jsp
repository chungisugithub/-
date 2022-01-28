<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= request.getParameter("custno") %>
	<%
		request.setCharacterEncoding("UTF-8");
		

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager
				.getConnection(url, "system", "1234");

		String sql = "delete from member_tbl_02 "
				//+ " where custno = " + 10112;
				+ " where custno = " + request.getParameter("custno");
		conn.prepareStatement(sql).executeQuery();
		
	%>
<script>
alert( "<%=request.getParameter("custno") %> (<%=request.getParameter("custname") %> )을 회원목록에서 삭제하였습니다.");
location.replace("./SelectCustomer.jsp");
</script>

</body>
</html>