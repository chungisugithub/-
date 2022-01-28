<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<body>
<h2>고객정보수정</h2>
	<%
		String custno = request.getParameter("custno");
		if(custno == "" ||custno == null) {
			response.sendRedirect("./SelectCustomer.jsp");
			return;
		}
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager
				.getConnection(url, "system", "1234");

		String sql = "select * from member_tbl_02 where custno = " + custno;
		ResultSet rs = conn.prepareStatement(sql).executeQuery();

		rs.next();
		String custname = rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		String joindate = rs.getString("joindate");
		String grade = rs.getString("grade");
		String city = rs.getString("city");
	%>

	<form action="./UpdateCustomer.jsp" method="post">
		<table>
			<tr>
				<td>고객번호</td>
				<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
			</tr>
			<tr>
				<td>고객이름</td>
				<td><input type="text" name="custname" value="<%=custname %>" ></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="<%=phone %>"></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><input type="text" name="address" value="<%=address %>"></td>
			</tr>


			<tr>
				<td>가입일</td>
				
				<td><input type="text" name="joindate" value="<%=joindate.substring(0,10) %>"></td>
			</tr>

			<tr>
				<td>등급</td>
				
				<td><input type="text" name="grade" value="<%=grade %>"></td>
			</tr>
			<tr>
				<td>도시</td>
				
				<td><input type="text" name="city" value="<%=city %>"></td>
			</tr>
			
		</table>
		<input type="submit" value="고객정보수정">
	</form>
</body>
</html>