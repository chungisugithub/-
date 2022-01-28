<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<html>
<link rel="stylesheet" href="./css/common.css"/>
<div id="topMenu">
<ul>
<li><a href="NewCustomerForm.jsp">신규 고객 등록</a></li>
<li><a href="SelectCustomer.jsp">고객 리스트</a></li>
</ul>
</div>
<h2>고객 리스트</h2>
<table>
<%
 request.setCharacterEncoding("UTF-8");
 String url ="jdbc:oracle:thin:@localhost:1521:xe";
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = DriverManager.getConnection(url,"system","1234");
// ResultSet rs = conn.prepareStatement("select * from member_tbl_02").executeQuery();
 ResultSet rs = conn.prepareStatement("select CUSTNO,CUSTNAME,PHONE,ADDRESS,TO_CHAR(JOINDATE,'YYYY-MM-DD') as joindate,GRADE, CITY from member_tbl_02 order by custno desc").executeQuery();

 while(rs.next()) {
	 %>
	 <tr>
	 <td><a href="./UpdateCustomerForm.jsp?custno=<%= rs.getString("custno")%>"><%= rs.getString("custno")%></a></td>
	 
	 
	 <td><%= rs.getString("custname")%></td>
	 <td><%= rs.getString("phone")%></td>
	 <td><%= rs.getString("address")%></td>
	 <td><%= rs.getString("joindate")%></td>
	 <td><%= rs.getString("grade")%></td>
	 <td><%= rs.getString("city")%></td>
	 <td><a href="DeleteCustomerById.jsp?custno=<%= rs.getString("custno") %>&custname=<%= rs.getString("custname") %>  ">삭제</a></td>
	 </tr>
<% } %>
</table>

</html>
 


