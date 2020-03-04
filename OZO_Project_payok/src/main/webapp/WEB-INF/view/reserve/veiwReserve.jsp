<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.TimeZone"%>

<jsp:useBean id="now" class="java.util.Date" />





<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h4>Confirm reservation</h4>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="<c:url value="/index" />"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Reserve</a><i class="icon-angle-right"></i></li>
              <li class="active"><a href="<c:url value="/space/newRegister" />">Confirm reservation</a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    
    
    
    <section id="content">
      
      <div class="container">
        <div class="row">
        	
        	<div class="span8">
        		<article>
              		
                  		
                    		<div class="post-heading">
                    			<input type="hidden" id="space_id" value="${reserve.space.space_id}"/>
                      			
                      			
                      			<c:choose>
									<c:when test="${reserve.state eq 0}"> 
										<h6 id="nowstate"><i>#예약 대기중 </i></h6>
									</c:when>
									<c:when test="${reserve.state eq 1}">
										<h6 id="nowstate"><i>#승인 완료</i></h6>
									</c:when>
									<c:when test="${reserve.state eq -1}"> 
										<h6 id="nowstate"><i>#취소 완료</i></h6>
									</c:when>
									<c:when test="${reserve.state eq 2}"> 
										<h6 id="nowstate"><i>#후기 작성 완료</i></h6>
									</c:when>
									<c:otherwise> <!-- 거부됨 (-2) -->
										<h6 id="nowstate" class="deny"><i>#예약 거부됨</i></h6>
									</c:otherwise>
								</c:choose>
                      			
                      			
                      			
                      			
                      			<p id = "reserveId" style="display:none;">${reserve.reserve_id}</p>
                    	</div>
                    	<img src="<c:url value='/resources/img/${reserve.space.image_list[0]}'/>" alt="${reserve.space.image_list[0]}" />
                  	

            
            </article>
        	</div>
        	
        	<div class="span8">
        	
        		


            <table class="reservetable">
              <thead>
                <tr>
                  <th colspan="2">
                  	예약 내용  
                  	<a class="btn btn-mini btn-rounded" style="Vertical-align :bottom;">예약번호 : ${reserve.reserve_id}</a>
                  </th>
                </tr>
              </thead>
              <tbody>
              	<tr>
                  <th>결제 금액</th>
                  <td>${reserve.total_cost}</td>
                </tr>
                <tr>
                  <th>지불 방법</th>
                  <td>
                  	<c:if test="${reserve.payment eq '카카오 페이 머니'}">
                  		<i class="icon-money icon-2"></i>  ${reserve.payment}
                  	</c:if>
                  	<c:if test="${reserve.payment ne '카카오 페이 머니'}">
                  		<i class="icon-credit-card icon-2"></i>  ${reserve.payment}
                  	</c:if>
                  </td>
                </tr>
                <tr>
                  <th>신청일</th> 
                  <td>
                  <fmt:formatDate value="${reserve.create_date}" pattern="yyyy-MM-dd (E) hh:mm " />
                  </td>
                </tr>
                <tr>
                  <th>예약 공간</th>
                  <td><a href="<c:url value='/space/viewspace?space_id=${reserve.space.space_id}'/>" style="color:#656565">${reserve.space.title}</a></td>
                </tr>
                <tr>
                  <th>예약 내용</th>
                  <td><fmt:formatDate value="${reserve.startDate}" pattern="yyyy-MM-dd (E) hh:mm "/>   ~   <fmt:formatDate value="${reserve.endDate}" pattern="yyyy-MM-dd (E) hh:mm "/></td>
                </tr>
                <tr>
                  <th>예약 인원</th>
                  <td>${reserve.peoplenum}</td>
                </tr>
                
              </tbody>
            </table>
            
            <table class="reservetable">
              <c:if test="${memberSession.member.memberType == 'provider'}">
            	<thead>
                	<tr>
                  		<th colspan="2">예약자 정보</th>
                	</tr>
              	</thead>
              	<tbody>
              		<tr>
                  		<th>이름 <br> 아이디</th>
                  			<td>${reserve.member.name} <br> ${reserve.member.memId}</td>
                  			<!-- 내이름 숨기기 --> <span id="hostname">${reserve.space.member.name}</span>
               		</tr>
               		<tr>
                  		<th>이메일</th> 
                  			<td>${reserve.member.email}</td>
                	</tr>
                </tbody>
              </c:if>
              <c:if test="${memberSession.member.memberType == 'customer'}">
            	<thead>
                	<tr>
                  		<th colspan="2">호스트 정보</th>
                	</tr>
              	</thead>
              	<tbody>
              		<tr>
                  		<th>이름 <br> 아이디</th>
                  			<td>${reserve.space.member.name}<br> ${reserve.space.member.memId}</td>
               		</tr>
               		<tr>
                  		<th>이메일</th> 
                  			<td>${reserve.space.member.email}</td>
                	</tr>
                </tbody>
              </c:if>
            </table>
            
            <table class="reservetable">
              <thead>
                <tr>
                  <th colspan="2">${reserve.space.title}</th>
                </tr>
              </thead>
              <tbody>
              	<tr>
                  <th>공간 유형</th>
                  <td>${reserve.space.type}</td>
                </tr>
                <tr>
                  <th>평점 정보</th>
                  <td>${reserve.space.total_rate}</td>
                </tr>
                <tr>
                  <td colspan="2">
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
													'${reserve.space.area}',
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

															

															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>
                  </td>
                </tr>

              </tbody>
            </table>
            
            <table class="reservetable">	
            	<thead>	
            		<tr> 
            			<th colspan="2">이용 규정 안내  </th> 
            		</tr>
            	</thead>
            	<tbody>
            		<tr> 
            			<th> 크레딧 </th>
            			<td> 예약을 취소하더라도 반환되지 않습니다</td>
            		</tr>
            		<tr> 
            			<th> 예약 취소  </th>
            			<td> 3일 전까지만 가능합니다. </td>
            		</tr>
            		<tr> 
            			<th> 후기 작성 </th>
            			<td> 공간 이용 시간 익일부터 7일 후 까지 작성 가능합니다.  </td>
            		</tr>
            	</tbody>
            </table>
            
            <c:if test="${reserve.state eq 2}"> <!-- 후기 작성 완료 상태-->
            	<table class="reservetable">	
            	<thead>	
            		<tr> 
            			<th>작성한 후기  </th> 
            		</tr>
            	</thead>
            	<tbody>
            		<tr style="border-bottom:none">
            			<td style="text-align:center;border-bottom:none">      			
                    		<span style="float:right;color:#ffe524;margin-bottom:20px">
                    		<c:forEach begin="1" end="${reserve.review.rate}" step="1">
       							★
      			  			</c:forEach>&nbsp;( ${reserve.review.rate} ) </span> <br>
            				
            					${reserve.review.content}  
 
            			</td>
            		</tr>
            		<tr style="border:none">
            			<td style="border:none">
            				<span style="float:right;margin-top:20px"> 
            					<fmt:formatDate value="${reserve.review.writeDate}" pattern="yyyy-MM-dd a hh:mm"/>  
            				</span>
            			</td>
            		</tr>

            		<c:if test="${memberSession.member.memId eq reserve.space.member.memId && empty reserve.review.reply}">
            			<tr style="border:none" id="reviewReply">
            				<td style="border:none">
            					<a id="wrtieComment" onclick="ShowCommentForm()" style="float:right;">답글 등록 하기</a>
									<div id="CommentForm" style="display:none;">
										<form class="contactForm"  method="post" id="ReplyForm" name="ReplyForm"  action="<c:url value='/review/comment' />">																				                            	
										
											<div class="form-group">
  												<label for="comment">Comment:</label>
  												<textarea class="form-control" rows="5" name="comment" id="comment"></textarea>
											</div>

												<button class="btn btn-blue" type="button" onclick="CreateReply()" style="float:right;">등록</button>
										</form>
									</div>
            				</td>
            			</tr>
            		</c:if>
            		<c:if test="${not empty reserve.review.reply}">
            			<tr style="border:none" id="reviewReply">
            				<td style="border:none">
            					<div style="border-radius:15px;border: 1.5px solid #f5f5f5;padding:15px">
            					 <h6><i class='icon-reply icon-rotate-180'></i>${reserve.space.member.name}님의 답글 </h6> ${reserve.review.reply}
            					</div>
            				</td>
            			</tr>
            		</c:if>
            	</tbody>
            </table>
						
			</c:if>
            
            
          </div>

          	<div class="span4">
            <aside class="right-sidebar" id="banner">
				
              <div class="widget">
                <h5 class="widgetheading">예약 정보 요약</h5>
                <ul class="recent">
                  
                  
                  <li>
                    <h6><i class="icon-ok icon-2"></i>예약 날짜</h6>
                    <p>
                      <fmt:formatDate value="${reserve.startDate}" pattern="yyyy-MM-dd (E) hh:mm " />   ~   <fmt:formatDate value="${reserve.endDate}" pattern="yyyy-MM-dd (E) hh:mm "/>

                    </p>
                  </li>
                  
                  <li>
                    <h6><i class="icon-comment"></i></i>예약 인원</h6>
                    <p>
                      ${reserve.peoplenum}
                    </p>
                  </li>
                  
                  <li>
                    <h6><i class="icon-ok icon-2"></i>결제 정보</h6>
                    <p>
                      ${reserve.total_cost} ( ${reserve.payment} )
                    </p>
                  </li>
                </ul>
                
               
                
              </div>
              
              
              
              <div id ="statebutton" class="span4">
          	 <c:choose>
          	 	
					<c:when test="${reserve.state eq 0}"> <!-- 예약 대기 상태 -->
					 
					
					
					<fmt:parseNumber value="${reserve.create_date.time/ (24*60*60*1000)}" integerOnly="true" var="createDate"/> 
						<c:if test="${memberSession.member.memId eq reserve.space.member.memId}"> <!-- 나느 호스ㅌ   -->
							<div class="btn-wrapper">
					        	<a class="btn btn-blue twobutton"  onclick="Permit()">예약 승인</a>
					        	
        					</div>
        					<div class="btn-wrapper">
        						<a class="btn btn-blue-outline twobutton right-btn" onclick="Deny()">예약 거부</a>        															
    						</div>								
						</c:if>
						<c:if test="${memberSession.member.memId ne reserve.space.member.memId}"> <!-- 나느 이용자   -->
						
							<fmt:parseNumber value="${now.time / (24*60*60*1000)}" integerOnly="true" var="nowDate"/>
							
							<fmt:parseNumber value="${reserve.startDate.time/ (24*60*60*1000)}" integerOnly="true" var="startDate"/> 
							
							<c:if test="${startDate - nowDate > 3}">
								<a class="btn btn-blue bigbutton" onclick="Cancle()">예약 취소</a>
							</c:if>
							<c:if test="${startDate - nowDate <= 3}">
								<button class="btn btn-blue-outline bigbutton" >예약 취소 불가능</button>
							</c:if>
						</c:if>
						
					</c:when>
					<c:when test="${reserve.state eq 1}"> <!-- 예약 승인 상-->
					
							<fmt:parseNumber value="${now.time / (24*60*60*1000)}" integerOnly="true" var="nowD"/>
							
							<fmt:parseNumber value="${reserve.startDate.time / (24*60*60*1000)}" integerOnly="true" var="startDate"/>
							<fmt:parseNumber value="${reserve.endDate.time / (24*60*60*1000)}" integerOnly="true" var="endDate"/> 
					
						<c:if test="${memberSession.member.memId ne reserve.space.member.memId}"> <!-- 나느 이용자   -->
							
							<c:choose>
								<c:when test="${startDate - nowD > 3}"> <!-- 오늘 사용일 최소 3일 이전   -->
									<a class="btn btn-blue btn-large bigbutton" onclick="Cancle()">예약 취소</a>
								</c:when>
								<c:when test="${startDate - nowD < 3 && startDate - nowD > 0}"> <!-- 오늘 사용일 3일 이하   -->
									<a class="btn btn-blue-outline btn-large bigbutton" href="#">예약 취소 불가능</a>
								</c:when>
								<c:when test="${endDate == nowD}"> <!-- 오늘이 사용일   -->
									<a class="btn btn-blue btn-large bigbutton" href="#">후기는 익일부터 작성 가능</a>
								</c:when>
								<c:when test="${nowD - endDate >= 0 && nowD - endDate <= 7}"> <!-- 오늘 이 사용일 7일이내  -->
									<a  href="<c:url value="/review/write?reserve_id=${reserve.reserve_id}" />" class="btn btn-blue btn-large bigbutton" >후기 작성</a>
								</c:when>
								<c:when test="${nowD - endDate > 7}"> <!-- 오늘 이 사용일 7일이후  -->
									<a class="btn btn-blue btn-large bigbutton" href="#">후기작성 기간 만료</a>
								</c:when>
							</c:choose>
							
							
						</c:if>
						
					</c:when>
					
				</c:choose>
          </div>  
          </div> 
            </aside>
          </div>
          </div> 
          
          
          
          
          
          
          
          
    

  </div>
</div>
          
          
          
          
          
          
          
        
      </section>
      
      <script>
      
      $('a[href="#"]').click(function(e) {
    		e.preventDefault();
    	});

	function Permit(){
		var reserve_id = document.getElementById("reserveId").innerHTML;
		console.log("++" + reserve_id);
		var param = JSON.stringify({"reserve_id" : Number(reserve_id), "state" : 1})
		console.log("^^" + param);
		$.ajax({
			type : 'POST',
			url : './updatestaus',
			contentType : "application/json",
			data : param,
			success: function(result){
				document.getElementById("nowstate").innerHTML = "<i>#승인완료</i>";
				document.getElementById("statebutton").innerHTML = "<a class='btn btn-primary btn-large2 bigbigbutton'd>승인 완료</a>";

			}
	
		});
		
	};
	
	function Deny(){
		
		 if (confirm("예약 정말 거부? ;(..") == true){
		 }else{   
		     return false;
		 }
		 
		var reserve_id = document.getElementById("reserveId").innerHTML;
		console.log("++" + reserve_id);
		var param = JSON.stringify({"reserve_id" : Number(reserve_id), "state" : -2})
		console.log("^^" + param);
		$.ajax({
			type : 'POST',
			url : './updatestaus',
			contentType : "application/json",
			data : param,
			success: function(result){
				document.getElementById("nowstate").innerHTML = "<i>#예약 거부됨<i>";
				document.getElementById("statebutton").innerHTML = "<a class='btn btn-large2 bigbigbutton' >거부 완료</a>";

			}
	
		});
		
	};
	
	function Cancle(){
		
		if (confirm("예약 정말 취소? ;ㅇ..") == true){    
		 }else{   
		    return;
		 }
		
		
		var reserve_id = document.getElementById("reserveId").innerHTML;
		console.log("++" + reserve_id);
		var param = JSON.stringify({"reserve_id" : Number(reserve_id), "state" : -1})
		console.log("^^" + param);
		$.ajax({
			type : 'POST',
			url : './updatestaus',
			contentType : "application/json",
			data : param,
			success: function(result){
				document.getElementById("nowstate").innerHTML = "<i>#취소완료</i>";
				document.getElementById("statebutton").innerHTML = "<a class='btn btn-large2 bigbigbutton'>취소 완료</a>";

			}
	
		});
		
	}
	
	 
	function ShowCommentForm(){
		
		document.getElementById("wrtieComment").style.display = 'none';
		document.getElementById("CommentForm").style.display = 'block';
		
	}
	
	function CreateReply(){
		
		var hostname = document.getElementById("hostname").innerHTML;		
		var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
		var reserve_id = document.getElementById("reserveId").innerHTML;
		var reply = document.getElementById("comment").value;
		var param = JSON.stringify({"reserveId" : Number(reserve_id), "comment" : reply})
		
		console.log(hostname);
		$.ajax({
	        url : "../review/reply",
	        type : 'POST',
	        headers : headers,
	        contentType : "application/json",
	        data : param,
	        success : function(data){
	        	console.log(reply);
	        	var trcode = "<td style='border:none'> <div style='border-radius:15px;border: 1.5px solid #f5f5f5;padding:15px'>";
	        	trcode += "<h5><i class='icon-reply icon-rotate-180'> </i>" + hostname + "님의 답글 </h5>";
	        	trcode += reply;
	        	trcode += "</div> </td>";
			
	            document.getElementById("reviewReply").innerHTML = trcode;
	            
	        }
	    });

	}
	

	

</script>