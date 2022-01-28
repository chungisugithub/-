<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>신규 고객 등록</h2>
<form action="./InsertCustomer.jsp" method="post">
	<table>
	<tr><td>고객명</td><td><input type="text" name="custname" value="장사랑"></td></tr>
	<tr><td>전화번호</td><td><input type="text" name="phone" value="010-4989-4747"></td></tr>
	<tr><td>주소</td><td><input type="text" name="address" value="경상시 중방동 50번지"></td></tr>
	<tr><td>가입일</td><td><input type="text" name="joindate" value="2019-09-27"></td></tr>
	<tr><td>등급</td><td><input type="text" name="custgrade" value="A"></td></tr>
	<tr><td>도시</td><td><input type="text" name="city" value="37"></td></tr>
	<tr><td colspan="2"><input type="submit" value="고객등록"></td></tr>
	</table>
</form>
</body>
</html>