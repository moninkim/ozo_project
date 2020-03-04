<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>


</head>
<body>

                  <form:form commandName="signupCommand" method="post" class="loginform">
                  <form:errors class="errorstyle" /><br>

               <table class="formtable" id = "load">
                  <tr>
                     <th>아아디</th>
                     <td><form:input path="member.memId" />
                     <form:errors path="member.memId" class="errorstyle"/></td>
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
                     <td>
                        <form:radiobutton path="member.memberType" value="provider" /> 제공자
                        <form:radiobutton path="member.memberType" value="customer" /> 사용자<br>
                        <br><form:errors path="member.memberType"  class="errorstyle"/>
                     </td>
                  </tr>

                  <tr>
                     <th>이메일</th>
                     <td>
                        <form:input path="member.email" /><br>
                        <form:errors path="member.email" class="errorstyle"/>
                     </td>
                  </tr>

                  <tr>
                     <th>전화번호</th>
                     <td>
                     <form:input path="member.phone" /><br>
                     <form:errors path="member.phone" class="errorstyle"/>
                     </td>
                  </tr>
               </table>
      <button type="submit" name="submit" id="formsubmitbutton" onclick="ButtonClicked()">회원가입</button>
      <p class="message">이미 회원이신가요? <a href="<c:url value="/member/login" />">로그인</a></p>
   </form:form>

   <script type="text/javascript">
    function ButtonClicked() {


       document.getElementById("load").style.opacity = "0.2"; // to display
       document.getElementById("buttonreplacement").style.display = ""; // to display
       document.getElementById("formsubmitbutton").style.display = "none"; // to display
       $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
           var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
           $(buttonreplacement).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
       });
    }
</script> 
<img id="buttonreplacement" src="<c:url value='/resources/img/ozo.gif'/>" alt="loading..." style="display: none; position:absolute; width:200px; height:200px; top: 30%; left:40%; margin: 0px; ">   
</body>
</html>
















