<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
	<title><tiles:getAsString name="title" /></title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="/resources/css/login_style.css" />" rel="stylesheet" />
<link rel="shortcut icon" href=" <c:url value='/resources/ico/ozo_icon.ico'/> " />

</head>
<body>


	<div class="login-page">
        <div class="form">
        	<h1 class="logo"><a href="<c:url value="/" />"> OZO</a></h1> 
        		
        		<tiles:insertAttribute name="body" />
          
        </div>
      </div>



</body>
</html>