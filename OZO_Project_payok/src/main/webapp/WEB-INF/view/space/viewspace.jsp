<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% pageContext.setAttribute("crcn", "\r\n"); %>

		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>Space detail</h2>
						</div>
					</div>
					<div class="span8">
						<ul class="breadcrumb">
							<li><a href="#"><i class="icon-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li><a href="#">Space</a><i class="icon-angle-right"></i></li>
							<li class="active">Space detail</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<section id="content">
			<div class="container">
				<div class="row aboutfont">
					<div class="span8">
						<article>
							<div class="top-wrapper">
								<div class="post-heading">
									<h4>${space.title}</h4>
								</div>
								<!-- start flexslider -->
								<div class="flexslider">
									<ul class="slides">

										<c:forEach items="${space.image_list}" var="img_list" varStatus="status">
											<li><img src="<c:url value='/resources/img/${img_list}'/>" alt="${img_list}" /></li>
										</c:forEach>

									</ul>
								</div>
								<!-- end flexslider -->
							</div>

							<div class="top-wrapper">

								<ul class="nav nav-tabs">
									<li class="active"><a href="#one" data-toggle="tab">공간소개</a>
									</li>
									<li><a href="#two" data-toggle="tab">시설안내</a></li>
									<li><a href="#three" data-toggle="tab">예약안내</a></li>
									<c:if test="${not empty space.content}">
										<li><a href="#four" data-toggle="tab">기타 사항</a></li>
									</c:if>

								</ul>

								<div class="tab-content">
									<div class="tab-pane active" id="one">
										<label>공간 소개</label>											

										<table class="table table-striped">
											<tbody>											
												<c:set var="introduceArr" value="${fn:split(space.introduce, crcn)}" />
												<c:forEach items="${introduceArr}" var="introduce_list" varStatus="status">
 													<tr> 
														<th>${status.count}</th>
														<td>${introduce_list}</td>
 													</tr> 
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="two">
										<h4>
											시설 안내
										</h4>

										<table class="table table-striped">
											<tbody>
												<c:set var="facilityArr" value="${fn:split(space.facility, crcn)}" />
												<c:forEach items="${facilityArr}" var="facility_list" varStatus="status">
 													<tr> 
														<th>${status.count}</th>
														<td>${facility_list}</td>
 													</tr> 
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="three">

										<h4>
											예약 안내
										</h4>

										<table class="table table-striped">
											<tbody>
												<c:set var="guideArr" value="${fn:split(space.guide, crcn)}" />
												<c:forEach items="${guideArr}" var="guide_list" varStatus="status">
													<tr> 
														<th>${status.count}</th>
														<td>${guide_list}</td>
													</tr> 
												</c:forEach>
											</tbody>
										</table>

									</div>
									<div class="tab-pane" id="four">
										<p>
											<strong>${space.content}</strong> <br>
										</p>
									</div>


								</div>
							</div>
		<!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline2">
            </div>
          </div>
        </div>
        <!-- end divider -->
							<div class="top-wrapper">
								<h4><i class="icon-location-arrow icon-2"></i>위치 정보</h4>

								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2bf1fad0ddbdecbb8be6d551366a0cdc&libraries=services"></script>
								<div id="map" style="width: 100%; height: 350px;"></div>

								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new daum.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};

									// 지도를 생성합니다    
									var map = new daum.maps.Map(mapContainer,
											mapOption);
									map.setDraggable(false);
									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new daum.maps.services.Geocoder();

									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													'${space.area}',
													function(result, status) {

														// 정상적으로 검색이 완료됐으면 
														if (status === daum.maps.services.Status.OK) {

															var coords = new daum.maps.LatLng(
																	result[0].y,
																	result[0].x);

															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new daum.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});

															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new daum.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px;">${space.title}</div>'
																	});
															infowindow
																	.open(map,
																			marker);

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>






							</div>
							
		<!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline2">
            </div>
          </div>
        </div>
        <!-- end divider -->
							
							<!-- 여기는 리뷰 보는 공간 -->
							<div class="top-wrapper">
            					<h4> <i class="icon-comment-alt icon-2"></i> 등록된 리뷰</h4>
            
            					<div class="row">
            					
            						<c:if test="${empty reviewlist}">
            							<div class="span3 wrapper"><span class="info2">등록된 후기가 없습니다 ;(</span></div>
            						</c:if>
            						
            						<c:forEach var="review" items="${reviewlist}" varStatus="status">
            							
            							<div class="span3 wrapper testimonial">
                    						<p class="text">
                      							<i class="icon-quote-left icon-48"></i>
                      							<span style="color:#ffe524">
                      							<c:forEach begin="1" end="${review.rate}" step="1">
       												★
      			  								</c:forEach></span>&nbsp;( ${review.rate} ) 
                      						<br>${review.content}
                    						</p>
                    						<div class="author"> 
                      							<img src="<c:url value='/resources/img/${review.reserve.member.profile}'/>" class="img-circle bordered" alt="" width="60" height="60">
                      							<p class="name">
                        							${review.reserve.member.memId}
                      							</p>
                      							<span class="info">
                      							<fmt:formatDate value="${review.writeDate}" pattern="yyyy-MM-dd E요일"/>
                      							</span>
                    						</div>
                  						</div>
                  						
                					</c:forEach>
                					</div>
					              </div>
				            

						</article>
					</div>
					<div class="span4">
						<aside class="right-sidebar">
							<div class="widget">
								<h5 class="widgetheading">공간정보</h5>
								<ul class="folio-detail">
									<li><label>공간 유형 :</label> ${space.type}</li>
									<li><label>공간 주소 :</label> ${space.area}</li>
									<li><label>최대 인원 :</label> ${space.max_people}</li>
									<li><label>예약 가격 :</label> ${space.cost}</li>
									<li><label>공간 평점 :</label>
										<c:choose>
											<c:when test="${space.total_rate eq 0}">
        										미등록
    										</c:when>
											<c:otherwise>																					
												<c:forEach begin="1" end="${space.total_rate}" step="1">
       												<i class=icon-star icon-2></i>
      			  								</c:forEach> ( ${space.total_rate} )   			  							
    										</c:otherwise>
										</c:choose>		
									</li>
									<li><label>찜 횟수 :</label> <span id="jjim_cnt">${space.jjim_cnt}</span></li>				
								</ul>
							</div>
							<div class="widget">
								<h5 class="widgetheading">호스트 정보</h5>
								<div style="text-align: center;">
								<img src="<c:url value='/resources/img/${space.member.profile}'/>" class="img-circle bordered" alt="" width="60" height="60" >
								
								<ul class="folio-detail">	
								<br>								
									<li><label>${space.member.name} </label> ( ${space.member.memId} )</li>
									<li><label>${space.member.email}</label></li>
									<li style="display:none;"><label>평점 :</label> ${space.member.grade}</li>
									<li style="display:none;"><label>게시물 개수 :</label> ${counting}</li>
                        			<c:choose>
                           				<c:when test="${(space.member.grade >= 4.5) && (counting >= 5)}">
                              				<li><label><i class="icon-rocket"></i> 슈퍼 호스트</label></li>
                           				</c:when>
                           				<c:when test="${((space.member.grade >= 3.5) && (space.member.grade < 4.5)) && ((counting >= 3) && (counting < 5))}">
                            				<li><label><i class="icon-rocket"></i> 열심 호스트</label></li>
                           				</c:when>
                           				<c:otherwise>
                              				<li><label><i class="icon-rocket"></i> 베이비 호스트</label></li>
                           				</c:otherwise>
                        			</c:choose>
								</ul>
								</div>
							</div>
							
							<div class="widget">

										<c:choose>
											<c:when test="${space.member.memId eq memberSession.member.memId}">
					                                <a href="<c:url value='/space/update?space_id=${space.space_id}'/>" class="btn btn-blue btn-large bigbutton ">&nbsp;수정&nbsp;</a>
    										</c:when>
											<c:otherwise>
												<c:if test="${ !empty memberSession and memberSession.member.memberType == 'customer'}">
													
													<div class="btn-wrapper">
														<a href="<c:url value='/space/newReserve?space_id=${space.space_id}'/>" class="btn btn-blue twobutton">&nbsp;예약하기&nbsp;</a>
													</div>
													<div class="btn-wrapper">
														<c:choose>														
															<c:when test="${jjim eq 0}">
					                                			<button id="dojjim" class="btn btn-blue-outline2 twobutton right-btn e_pulse" onclick="updatejjim(this.id,${space.space_id},'${memberSession.member.memId}')">찜하기  <span style="font-size:14pt"><i class="icon-smile"></i></span></button>
    														</c:when>
															<c:otherwise>
																<button id="canclejjim" class="btn btn-blue-outline2 twobutton right-btn e_pulse" onclick="updatejjim(this.id,${space.space_id},'${memberSession.member.memId}')" >찜 취소  <span style="font-size:14pt"><i class="icon-meh icon-2"></i></span></button>
    														</c:otherwise>														
														</c:choose>
													</div>												
												</c:if>
												<c:if test="${ empty memberSession}">
													<a href="<c:url value='/space/newReserve?space_id=${space.space_id}'/>" class="btn btn-blue btn-large bigbutton ">&nbsp;예약하기&nbsp;</a>
												</c:if>
    										</c:otherwise>

										</c:choose>
										

								</div>	
						</aside>
					</div>
				</div>
			</div>
		</section>


<script>

	function updatejjim(jjim_check, space_id, memId){
			
		var jjim = 0;
		
		if (jjim_check == 'dojjim')
			jjim = 1;
		
		var jjimData = {'memId': memId, 'space_id':space_id, 'jjim':jjim};

		$.ajax({
    	  url: "../space/updatejjim",
    	  data: jjimData,
		  type: 'POST',
		  success: function(result){
			  
			jsonResult = JSON.parse(JSON.stringify(result)) ;  
			var jjimCnt = parseInt(document.getElementById("jjim_cnt").innerHTML);
			if ( result == 1 ){
				var jjimBtn = document.getElementById("dojjim");			
				jjimBtn.id = 'canclejjim';
				jjimBtn.innerHTML = "찜 취소   <span style='font-size:14pt'><i class='icon-meh'></i></span>";
				document.getElementById("jjim_cnt").innerHTML = jjimCnt + 1;
			}
			else{
				var jjimBtn = document.getElementById("canclejjim");
				jjimBtn.id = 'dojjim';
				jjimBtn.innerHTML = "찜하기  <span style='font-size:14pt'><i class='icon-smile'></i></span>";
				document.getElementById("jjim_cnt").innerHTML = jjimCnt - 1;
			}
		  }

		});
	}

</script>
