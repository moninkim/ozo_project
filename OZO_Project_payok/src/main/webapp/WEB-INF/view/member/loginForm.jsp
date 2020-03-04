<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        	<form:form commandName="loginCommand" class="errorstyle">

				<form:errors element="loginexception"/><br>

				<table class="formtable">
						<tr>
							<th>아이디</th>
							<td>
							<form:input path="memId"/>
								<form:errors path="memId" class="errorstyle" /></td>
						<tr>
						<tr>
							<th>비밀번호</th>
							<td><form:password path="password" showPassword="false"/>
								<form:errors path="password" class="errorstyle"/></td>
						<tr></tr>
				</table>
	
				<button type="submit" >로그인</button>
				<p class="message">회원이 아니신가요? <a href="<c:url value="/member/signup" />">회원가입</a></p>
				<p class="message">아이디를 잊어버리셨나요? <a href="<c:url value="/member/findId" />">아이디/비밀번호 찾기</a></p>
			</form:form>
          
       