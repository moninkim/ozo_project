<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h4>${memberSession.member.name}님 회원 정보 수정</h4>
						</div>
					</div>
					<div class="span8"></div>
				</div>
			</div>
		</section>
		
		<section id="content">
		<div class="container">
        <div class="row">
          <div class="span12">
         

            
              <form method="get" action="<c:url value='/member/update'/>" class="contactForm">
              	
			  
              	<div class="row well">
              		<c:if test="${!empty errormsg}">
						<p class="errorstyle text-center"><i class="icon-exclamation-sign"></i>${errormsg}</p><br>
			  		</c:if>
              		
                	<p class="text-center">
                		<strong>아이디 : </strong> ${memberSession.member.memId} &nbsp;&nbsp;&nbsp;
                		<strong>비밀번호 : </strong> <input type="password" name="password" class="form-control mymihi2">
                    	<button class="btn btn-inverse" type="submit">확인</button>
                  	</p>
                
              	</div>
              </form>
                  
              
           </div>
         </div>
         </div>
		 </section>
