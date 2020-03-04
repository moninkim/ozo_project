<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


                  <form:form commandName="signupCommand" method="post" class="loginform">
                  <form:errors class="errorstyle" /><br>

					<table class="formtable">
						<tr>
							<th>아아디</th> 
							<th><div class="readonly">${signupCommand.member.memId}</div></th>
						</tr>
						<tr>
							<th>이름</th>
							<td><form:input path="member.name" /><br>
							<form:errors path="member.name" class="errorstyle"/></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><form:password path="member.password" /> <br>
							<form:errors path="member.password" class="errorstyle"/></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><form:password path="repeatedPassword" /> <br>
							<form:errors path="repeatedPassword" class="errorstyle"/></td>
						</tr>


						<tr>
							<th>회원 유형</th>
							<th><div class="readonly">${signupCommand.member.memberType}</div></th>
						</tr>

						<tr>
							<th>이메일</th>
							<th><div class="readonly">${signupCommand.member.email}</div></th>
						</tr>

						<tr>
							<th>전화번호</th>
							<td>
							<form:input path="member.phone" /><br>
							<form:errors path="member.phone" class="errorstyle"/>
							</td>
						</tr>
					</table>
					
					<button type="submit" name="submit" >회원 정보 수정</button>
		
	</form:form>
                    
  