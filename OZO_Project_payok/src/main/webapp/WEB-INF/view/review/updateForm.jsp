<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 쓰기</title>
</head>
<body>
<form:form commandName="reviewCommand" method="post" class="reviewform">
<table>
	<tr>
		<td>내용: </td>
		<td><form:input path="reivew.content"	/>
		<form:errors path="reivew.content" class="errorstyle"	/></td>
	</tr>
	<tr>
		<td>평점: </td>
		<td><input type="number" max="5" min="0" name="rate"	/>
		<form:errors path="reivew.rate" class="errorstyle"	/></td>
	</tr>
	<tr>
		<td>작성일자: </td>
	</tr>
	<input type="submit" name="submit" value="제출하기"	/>
</table>
</form:form>
</body>
</html>