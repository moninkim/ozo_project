<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h4>No Permission !</h4>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="<c:url value="/index" />"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Oops!</a><i class="icon-angle-right"></i></li>
              <li class="active"><a href="<c:url value="/space/newRegister" />">No Permission</a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <h2 class="aligncenter">권한이 없습니다 <i class="icon-meh icon-5"></i></h2>
				<p class="aligncenter">
					${memberSession.member.name}님은 해당 요청에 접근 권한이 없습니다  문제가 있을 경우 관리자에게 문의하세요.
				</p>
			</div>
		</div>
	</div>
	</section>