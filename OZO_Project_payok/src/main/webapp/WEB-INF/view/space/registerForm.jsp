<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

      <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h4>Register Spaces</h4>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="<c:url value="/index" />"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Space</a><i class="icon-angle-right"></i></li>
              <li class="active"><a href="<c:url value="/space/newRegister" />">Space Register</a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      
      <div class="container">
        <div class="row">
          <div class="span12">
            	<p>공간에 대한 <strong>안내, 이용 가능 시설, 예약 주의 사항</strong>은  Enter로 구분 지어주시길 바랍니다.</p><br>

				
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
					<form:select path="space.type" items="${spaceTypeList}" class="form-control"/>
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
                	주소 검색
                </label>
                  		<form:input path="space.area" class="form-control" placeholder="주소를 검색해주세요" onclick="sample5_execDaumPostcode()"/>
                </div>
                
           
                <div class="span12 form-group">
                
                
                
                  		<div id="map" style="width:100%;height:300px;margin-top:10px;display:none"></div>
                  		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2bf1fad0ddbdecbb8be6d551366a0cdc&libraries=services"></script>
	<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        var new_window = new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("space.area").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
        
        new_window.close();
    }
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
                   <input type="file" name="images" class="form-control"  multiple required />
                   
                
                <p class="text-center">
                 <button class="btn btn-inverse btn-rounded margintop10" type="submit" name="submit">Register Space</button>
            	</p>
                
                </div>
            	
			</div>
			
            </form:form>

          </div>
        </div>
      </div>
    </section>
  