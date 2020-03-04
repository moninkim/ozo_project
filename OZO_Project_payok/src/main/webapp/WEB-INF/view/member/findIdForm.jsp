<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="/resources/css/login_style.css" />" rel="stylesheet" />
<link rel="shortcut icon" href=" <c:url value='/resources/ico/ozo_icon.ico'/> " />
<title>아아디/비번 찾기</title>
</head>
<body>
	<div class="find-page">
                <div class="form">
                        <h1 class="logo"><a href="<c:url value="/" />"> OZO </a></h1>
                  <form:form commandName="findCommand" method="post" class="findform">

				<table class="formtable">
						<tr>
							<th>이름</th>
							<td><form:input path="memName" /><br>
							</td>
						</tr>

						<tr>
							<th>이메일</th>
							<td>
								<form:input path="memEmail" /><br>
							</td>
						</tr>
						
						<tr>
							<th>전화번호</th>
							<td>
							<form:input path="memPhone" /><br>
							</td>
						</tr>
				</table> 
				
		<button type="submit" name="submit" >찾기</button><br />
		<p class="message">기억나셨습미까?<a href="<c:url value="/member/login" />">로그인</a></p>
	</form:form>
                    
                   
                </div>
        </div>
</body>
</html>