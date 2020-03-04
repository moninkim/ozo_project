<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
  <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" />
  <link href="<c:url value="/resources/css/bootstrap-responsive.css" />" rel="stylesheet" />
  <link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" />
  <link href="<c:url value="/resources/skins/default.css" />" rel="stylesheet" />
 <style>
 body { text-align: center; /* Quirks Mode 를 위한 가운데 정렬 */ }
 </style>
 <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2><strong>OZO</strong></h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">찾기</a><i class="icon-angle-right"></i></li>
              <li class="active">비밀번호 / 아이디 결과</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="/resources/css/login_style.css" />" rel="stylesheet" />
<link rel="shortcut icon" href=" <c:url value='/resources/ico/ozo_icon.ico'/> " />
<title>아이디, 비밀번호 찾기</title>
</head>
<body text="center">
<br/> <br />
<h6>${name}님의 아이디, 비밀번호입니다!</h6>
<br/><br/>
	<h4>아이디: ${id}</h4>
	<h4>회원님의 비밀번호는 가입하신 이메일로 보내드렸습니다! 확인 후 로그인 해주세요!</h4>
<br/><br/><br/><br/>
<p class="message">로그인 하러 가자! <a href="<c:url value="/member/login" />">Login</a></p>
<p><a href="<c:url value='/index' />">Go to index</a></p>
</body>
</html>