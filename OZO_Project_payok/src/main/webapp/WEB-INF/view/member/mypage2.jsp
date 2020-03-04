<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h4>${memberSession.member.name}님의 Mypage</h4>
						</div>
					</div>
					<div class="span8"></div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row">


					<div class="span4">
						<img  id="userProfile" src="<c:url value='/resources/img/${memberSession.member.profile}'/>" alt="프로필" class="img-polaroid" data-toggle="modal" data-target="#proImgModal"/>						
					</div>

					<div class="span8">
						<h1 class="nolja">${memberSession.member.name}</h1> <hr>
						<ul>
							<c:if test="${memberSession.member.memberType == 'provider'}">
								<li>회원유형: 호스트 </li>
							</c:if>
							<li>전화번호: ${memberSession.member.phone}</li>
							<li>이메일: ${memberSession.member.email}</li>
							<li>내가 등록한 공간: ${fn:length(mySpaceList)}개</li>
							<li>평점: ${memberSession.member.grade}</li>
							<c:choose>
								<c:when test="${memberSession.member.grade >= 4.5 && fn:length(mySpaceList) >= 5}">
									<li>등급: 슈퍼 호스트</li>
								</c:when>
								<c:when test="${(memberSession.member.grade >= 3.5 && memberSession.member.grade < 4.5) && (fn:length(mySpaceList) >= 3 && fn:length(mySpaceList) < 5)}">
									<li>등급: 열심 호스트</li>
								</c:when>
								<c:otherwise>
									<li>등급: 베이비 호스트</li>
								</c:otherwise>
							</c:choose>
						</ul>
						
						<a href="<c:url value='/member/memcheck'/>" class="btn btn-inverse e_tada" style="float:right">회원정보수정</a>
						
					</div>
				</div>

				<div class="row">
					<div class="span12">
                
                <ul class="nav nav-tabs bold">
                  <li class="active"><a href="#myspace" data-toggle="tab">
                  <i class=" icon-home"></i>등록한 공간(${fn:length(mySpaceList)})</a></li> 
                  <li><a href="#reserve" data-toggle="tab"><i class=" icon-calendar"></i>접수된 예약(${fn:length(myReserveList)})</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="myspace">
                    <div class="row">
						<div class="widget text-center">
                					<ul class="recent mypageList clients2">
                						
                						<c:forEach var="space" items="${mySpaceList}">
                						<div class="span3">
                  						<li> 
                  							<a href="<c:url value='/space/viewspace?space_id=${space.space_id}'/>">
                    						<span class="span1" style="margin-left:0px"> 
                    							<img src="<c:url value='/resources/img/${space.image_list[0]}'/>" alt="${space.title}"> 
                    						</span>
                    						
											<span class="btn btn-green btn-mini btn-rounded">${space.type}</span>
                    						<br>
                    						<b>${space.title}</b><br>
                    						<p>${space.area}</p>
                  							</a> 
                  						</li>
                  						</div>
                  						</c:forEach>
                  
                					</ul>
              				</div>
					</div>
                  </div>
                  <div class="tab-pane" id="reserve">
                    	<div class="widget text-center">
                					<ul class="recent mypageList clients2">
                						
                						<c:forEach var="reserve" items="${myReserveList}">
                						<div class="span3">
                  						<li> 
                  							<a href="<c:url value='/reserve/veiwreserve?reserve_id=${reserve.reserve_id}'/>">
                    						<span class="span1" style="margin-left:0px">
                    							<img src="<c:url value='/resources/img/${reserve.space.image_list[0]}'/>" alt="${reserve.space.title}">
                    						</span>

											<c:choose>
												<c:when test="${reserve.state eq 0}">
													<span class="btn btn-warning btn-mini btn-rounded">결제 완료</span>
												</c:when>
												<c:when test="${reserve.state eq 1}"> 
													<span class="btn btn-blue btn-mini btn-rounded" style="border-radius: 12px;">후기 작성 완료</span>
												</c:when>
												<c:when test="${reserve.state eq -1}"> 
													<span class="btn btn-mini btn-rounded">취소 완료</span>
												</c:when>
												<c:otherwise>
													<span class="btn btn-danger btn-mini btn-rounded">반려</span>
												</c:otherwise>
											</c:choose>
											<br>
                    						<b>${reserve.space.title}</b>
                    						<p>
                    						<fmt:formatDate value="${reserve.startDate}" pattern="yyyy-MM-dd HH:mm "/> ~ 
                    						<fmt:formatDate value="${reserve.endDate}" pattern="yyyy-MM-dd HH:mm "/>
                    						</p>
                    						</a>
                  						</li>
                  						</div>
                  						</c:forEach>
                  
                					</ul>
              				</div>
                  </div>
                  
                </div>
              </div>
				
				

				</div>
			</div>
		</section>	
		
		
		<div id="proImgModal" class="modal fade" role="dialog">
  			<div class="modal-dialog">

    
    			<div class="modal-content">
      				<div class="modal-header text-center">
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        					프로필 이미지 변경
      				</div>
      				<div class="modal-body text-center">
         
          				 <img id="profile" src=""  style="display: none;width:100%;height:auto;margin-bottom:20px">
		  				 <input id="getProfile" type="file" accept="image/*" >
             
      				</div>
      				<div class="modal-footer">  
        				<button id="subitbtn" class="btn btn-inverse btn-rounded margintop10" type="button"  style="display: none;" onclick="changeProfile()">등록</button>
      				</div>
    			</div>

  			</div>
		</div>
		
		<script>
		var file = document.querySelector('#getProfile');
		var fileList ="";
		
		file.onchange = function () { 
			document.getElementById("profile").style.display = 'block';
			fileList = file.files ;
		    
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);

		    //로드 한 후
		    reader.onload = function  () {
		        //로컬 이미지를 보여주기
		        document.querySelector('#profile').src = reader.result;
		        document.getElementById("subitbtn").style.display = 'block';
		        };
		    }; 
		 
		
		function  changeProfile() { 
			var formData = new FormData();

		    formData.append("file", fileList[0]);

				$.ajax({
		    	  url: "../member/update/ChangeProfile",
				  enctype: 'multipart/form-data',
		    	  data: formData,
				  dataType:'text',
				  processData: false,
				  contentType: false,
				  type: 'POST',
				  success: function(result){
					  jsonResult = JSON.parse(JSON.stringify(result)) ;  
					alert("프로필 이미지가 변경 되었습니다.");
					document.querySelector('#userProfile').src = "/OZO_Project/resources/img/" + jsonResult;
					$('#proImgModal').modal('hide');
				  }
				})

		}
		</script>