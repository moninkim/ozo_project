<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="hidden-top">
			<div class="hidden-top-inner container">
				<div class="row">
					<div class="span12" style="margin-top:10px">						
							<strong><i class="icon-search"></i>이름 or 제목으로 찾기</strong>
								
								<form action="<c:url value='/space/search' />" method="GET">									
									<select id="condition" name="condition" class="mymihi searchInput form-control" >
    									<option value="title">이름</option>
    									<option value="area">지역</option>
								    </select>
									<input type="text" name="keyword" id="keyword" class="mymihi" placeholder="검색">									
								</form>
							
							<strong><i class="icon-search"></i>유형으로 찾기</strong>
								<table class="table table-bordered collapse transtable" >
						        	<tbody>
						        		<c:forTokens var="item" items="다목적홀,세미나,엠티,스튜디오,연습실,공연장,작업실,스터디룸,회의실,코워킹스페이스,파티룸,레저시설" delims="," varStatus="status">
    										<c:if test="${status.count % 4 eq 1 }">
    											<tr> <td class="nonborder">
    										</c:if>
    										<c:if test="${status.count % 4 ne 1 }">
    											<td>
    										</c:if>
    											<a href="<c:url value='/space/search?condition=type&keyword=${item}'/>">${item}</a></td>
    										<c:if test="${status.count % 4 eq 0 }" >
    											</tr>
    										</c:if>
										</c:forTokens>
                					</tbody>
            					</table>
						
					</div>
				</div>
			</div>
		</div>

<header>
			<div class="container ">
				<!-- hidden top area toggle link -->
				<div id="header-hidden-link">
					<a href="#" class="toggle-link" title="Search" data-target=".hidden-top"><i></i>Search</a>
				</div>
				<!-- end toggle link -->
				<div class="row nomargin">
					<div class="span12">
						<div class="headnav">

							<c:choose>
								<c:when test="${!empty memberSession.member}">
									<ul>
										<li><a><i class="icon-user"></i>${memberSession.member.name}</a></li>
										<li><a href="<c:url value="/member/logout" />">로그아웃</a></li>
										<li><a href="<c:url value="/member/mypage" />">마이페이지</a></li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul>
										<li><a href="<c:url value="/member/login" />">로그인</a></li>
										<li><a href="<c:url value="/member/signup" />">회원가입</a></li>
									</ul>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="span4">
						<div class="logo">
							<a href="<c:url value="/" />"><img src="<c:url value="/resources/img/1.png" />" width="150"class="e_swing"></a>
						</div>
					</div>
					<div class="span8">
						<div class="navbar navbar-static-top">
							<div class="navigation">
								<nav>
									<ul class="nav topnav">
										<li class="dropdown"><a href="<c:url value="/index" />"><i class="icon-home"></i>HOME</a>
										</li>
										<li><a href="<c:url value="/about" />">ABOUT </a></li>
										<li><a href="<c:url value="/space/listspaces" />">ALL SPACE </a></li>
										<c:if test="${memberSession.member.memberType eq 'provider'}">
											<li><a href="<c:url value="/space/newRegister" />">공간등록</a></li>
										</c:if>
									</ul>
								</nav>
							</div>
							<!-- end navigation -->
						</div>
					</div>
				</div>
			</div>
		</header>