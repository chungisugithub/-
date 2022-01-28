<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%! String custName= "noName"; %>
<%

	request.setCharacterEncoding("UTF-8");
	String action = request.getParameter("action");

	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = 
		DriverManager.getConnection(url, "system", "1234");
	
	String sql = "insert into member_tbl_02 "+
	"values(sys.member_seq.nextval,?,?,?,TO_DATE(?,'YYYY-MM-DD'),?,?)";
	Long custId = null;
	
	PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "custno" });
	pstmt.setString(1, request.getParameter("custname"));
	pstmt.setString(2, request.getParameter("phone"));
	pstmt.setString(3, request.getParameter("address"));
	pstmt.setString(4, request.getParameter("joindate"));
	pstmt.setString(5, request.getParameter("custgrade"));
	pstmt.setString(6, request.getParameter("city"));
	
%>
<%= custName= request.getParameter("custname") %>
	
<%	//pstmt.executeQuery();
	if (pstmt.executeUpdate() > 0) {
		ResultSet generatedKeys = pstmt.getGeneratedKeys();
		if (null != generatedKeys && generatedKeys.next()) {
			custId = generatedKeys.getLong(1);
			}
	}
%>


<html>
<script>
	alert( "<%=custName %> (<%=custId %> )을 회원으로 등록하였습니다.");
	location.replace("./SelectCustomer.jsp");
</script>
</html>