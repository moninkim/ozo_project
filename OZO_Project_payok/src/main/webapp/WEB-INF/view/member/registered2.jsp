<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입 성공</title>

<link rel="shortcut icon" href=" <c:url value='/resources/ico/ozo_icon.ico'/> " />

</head>
<body>
${memberSession.member.name}가입 성공
<ul>

	<li>이름: ${memberSession.member.name}</li>
	<li>타입: ${memberSession.member.memberType}</li>
	<li>전화번호: ${memberSession.member.phone}</li>
	<li>이메일: ${memberSession.member.email}</li>
	<li>평점: ${memberSession.member.grade}</li>
	
</ul>


<br>


<br>



<p><a href="<c:url value='/index' />">Go to index</a></p>
</body>
</html>

