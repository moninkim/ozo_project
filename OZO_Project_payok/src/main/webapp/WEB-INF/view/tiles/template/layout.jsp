<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
	<title><tiles:getAsString name="title" /></title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
	
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.js" />"></script>
	<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>                                       

	<!-- css -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet" />
	<link href="<c:url value="/resources/css/bootstrap-responsive.css" />" rel="stylesheet" />
	<link href="<c:url value="/resources/css/fancybox/jquery.fancybox.css" />" rel="stylesheet">
	<link href="<c:url value="/resources/css/jcarousel.css" />" rel="stylesheet" />
	<link href="<c:url value="/resources/css/flexslider.css" />" rel="stylesheet" />
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" />
	
	
	<!-- Theme skin -->
	<link href="<c:url value="/resources/skins/default.css" />" rel="stylesheet" />
	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
	<link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
	<link rel="shortcut icon" href=" <c:url value='/resources/ico/ozo_icon.ico'/> " />
	
	
</head>
<body>


	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	
	
	
	


	
	
	<script src="<c:url value="/resources/js/jquery.easing.1.3.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	<script src="<c:url value="/resources/js/jcarousel/jquery.jcarousel.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.fancybox.pack.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.fancybox-media.js" />"></script>
	<script src="<c:url value="/resources/js/google-code-prettify/prettify.js" />"></script>
	<script src="<c:url value="/resources/js/portfolio/jquery.quicksand.js" />"></script>
	<script src="<c:url value="/resources/js/portfolio/setting.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.flexslider.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.nivo.slider.js" />"></script>
	<script src="<c:url value="/resources/js/modernizr.custom.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.ba-cond.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.slitslider.js" />"></script>
	<script src="<c:url value="/resources/js/animate.js" />"></script>

	<!-- Template Custom JavaScript File -->
	<script src="<c:url value="/resources/js/custom.js" />"></script>
</body>
</html>