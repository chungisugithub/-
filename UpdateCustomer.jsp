<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%! String custNo= "noNo"; %>
<%
	request.setCharacterEncoding("UTF-8");
	custNo = request.getParameter("custno");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = 
		DriverManager.getConnection(url, "system", "1234");
	
	String sql = "update member_tbl_02 "+
	" set custname = ?, phone= ?, address = ?, joindate = to_date(?,'YYYY-MM-DD'), grade = ?, city = ? where custno = " + custNo;

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custname"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setString(4, request.getParameter("joindate"));
	pstmt.setString(5, request.getParameter("grade"));
	pstmt.setString(6, request.getParameter("city"));
%>

	
<%	pstmt.executeQuery(); %>
<html>
<script>
alert( "회원번호(<%=custNo %>)님의 정보를 업데이트 하였습니다.");
location.replace("./SelectCustomer.jsp");
</script>
</html>




