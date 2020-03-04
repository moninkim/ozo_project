<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

      <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h4>Update Spaces</h4>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="<c:url value="/index" />"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Space</a><i class="icon-angle-right"></i></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      
      <div class="container">
        <div class="row">
          <div class="span12">
            	<p>공간에 대한 <strong>안내, 이용 가능 시설, 예약 주의 사항</strong>은 Enter로 구분 지어주시길 바랍니다.</p><br>
            	
				
			<form:form commandName="spaceCommand" method="post" enctype="multipart/form-data" role="form" class="contactForm">
			
			<div id="errormessage2">
			
					<form:errors class="errorstyle" />
            		<form:errors path="space.type" class="errorstyle"/>
            		<form:errors path="space.max_people" class="errorstyle"/>
            		<form:errors path="space.cost" class="errorstyle"/>
            		<form:errors path="space.title" class="errorstyle"/>
            		<form:errors path="space.area" class="errorstyle"/>
            		<form:errors path="space.introduce" class="errorstyle"/>
            		<form:errors path="space.facility" class="errorstyle"/>
            		<form:errors path="space.guide" class="errorstyle"/>
			</div>
			
			<div class="row">
			
				<div class="span4 form-group">
				<label>공간 유형 : </label>
                  ${spaceCommand.space.type }
                </div>
                
                <div class="span4 form-group">
                <label>정원 : </label>
                  <form:input path="space.max_people" class="form-control"  />
                </div>
                
                <div class="span4 form-group">
               	<label>가격 : </label>
                  <form:input path="space.cost" class="form-control"  />
                </div>
                
                <div class="span12 form-group">
                <label>등록 제목 : </label>
                  <form:input path="space.title" class="form-control" />
                </div>
                
                
                <div class="span12 form-group">
                <label>
                	주소 
                </label>
                  		${spaceCommand.space.area }
                </div>
                
           
                <div class="span12 form-group">
                
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
													'${spaceCommand.space.area}',
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
                
                
                  		
                
               
                </div>
                
                <div class="span12 margintop10 form-group">
                  <form:textarea path="space.introduce" class="form-control" rows="5" placeholder="공간 소개 "/>
            	</div>
            
            	<div class="span12 margintop10 form-group">
                  <form:textarea path="space.facility" class="form-control" rows="5" placeholder="이용 가능 시설"/>
            	</div>
            
            	<div class="span12 margintop10 form-group">
                  <form:textarea path="space.guide" class="form-control" rows="5" placeholder="예약 주의 사항 "/>
            	</div>
            	
            	<div class="span12 form-group">
					         	
                  <form:input path="space.content" class="form-control" placeholder="기타 사항" />
                </div>
                
                <div class="span12 form-group">
                   <input type="file" name="images" class="form-control"  multiple  />
                <p class="text-center">
                 <button class="btn btn-inverse btn-rounded margintop10" type="submit" name="submit">Update Space</button>
            	</p>
                
                </div>
            	
			</div>
			
            </form:form>

          </div>
        </div>
      </div>
    </section>
