<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


  <div id="wrapper">
    <!-- toggle top area -->
    
    <!-- end toggle top area -->
    <!-- start header -->
    
    <!-- end header -->
    
    
    <section id="featured">
      <!-- start slider -->
      <!-- Slider -->
      <div id="nivo-slider">
        <div class="nivo-slider">
          <!-- Slide #1 image -->
          <img src="img/slides/nivo/a.png" alt="" title="#caption-1" />
          <!-- Slide #2 image -->
          <img src="img/slides/nivo/b.png" alt="" title="#caption-2" />
          <!-- Slide #3 image -->
          <img src="img/slides/nivo/c.png" alt="" title="#caption-3" />
          <!-- Slide #4 image -->
          <img src="img/slides/nivo/d.png" alt="" title="#caption-4" />
          <!-- Slide #5 image -->
          <img src="img/slides/nivo/e.png" alt="" title="#caption-5" />
        </div>
        <div class="container">
          <div class="row">
            <div class="span12">
              <!-- Slide #1 caption -->
              <div class="nivo-caption" id="caption-1">
                <div>
                  &nbsp;&nbsp;&nbsp;<strong>공유 주방</strong>
                  <p>
                  	<h2 style="padding-left: 10px;">"가족 모임, 데이트, 생일파티 등 <br> 공유 주방에서 함께 요리해요!"</h2>
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
              <!-- Slide #2 caption -->
              <div class="nivo-caption" id="caption-2">
                <div>
                  &nbsp;&nbsp;&nbsp;<strong>카페 & 공간</strong>
                  <p>
                  	<h2 style="padding-left: 10px;">"친구들과의 추억을 쌓아보세요"</h2>
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
              <!-- Slide #3 caption -->
              <div class="nivo-caption" id="caption-3">
                <div>
                  &nbsp;&nbsp;&nbsp;<strong>파티룸</strong>
                  <p>
                   	<h2 style="padding-left: 30px;">"감성을 담은 우리만의 공간"</h2>
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
              <!-- Slide #4 caption -->
              <div class="nivo-caption" id="caption-4">
                <div>
                  &nbsp;&nbsp;&nbsp;카페 & <strong>코워킹</strong>
                  <p>
                    <h2 style="padding-left: 50px;">"영감이 필요하다면, <br>오늘은 노마드 데이"</h2>
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
              <!-- Slide #5 caption -->
              <div class="nivo-caption" id="caption-5">
                <div>
                  &nbsp;&nbsp;&nbsp;<strong>강연 & 세미나를 위한 공간</strong>
                  <p>
                  	<h2 style="padding-left: 50px;">"기획자들을 위한, <br>행사하기 좋은 통대형 공간"</h2>
                  </p>
                  <a href="#" class="btn btn-theme">Read More</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end slider -->
    </section>
    
    <section id="content">
      <div class="container">
        
        <!-- divider -->
        <div class="row">
          <div class="span12">
            
          </div>
        </div>
        <!-- end divider -->
        
        
        <div class="row">
          <div class="span12">
            <h4 class="heading"> <blue>평점 </blue> TOP4</h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  <!-- Item Project and Filter Name -->
                  <c:forEach var="space" items="${rateList}">
				
					<li class="item-thumbs span3 design" data-id="id-0" data-type="${space.type}">
                    
                    	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="${space.title}" href="<c:url value='/space/viewspace?space_id=${space.space_id}'/>">
							<span class="overlay-img"></span>
							<span class="overlay-img-thumb">
								${space.title} 
								<p class="spacedetail">${space.type}<br> 
								<i class="icon-map-marker"></i> ${space.area}
                        		<i class="icon-smile"></i>${space.jjim_cnt}</p>
							</span>
						</a>
                    
                    	<img src="<c:url value='/resources/img/${space.image_list[0]}'/>" alt="${space.type}, ${space.area}" >
                  	</li>
				
				</c:forEach>
                  <!-- End Item Project -->
                </ul>
              </section>
            </div>
          </div>
        </div>
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->
        <div class="row">
          <div class="span12">
            <h4 class="heading"><blue>찜 횟수  </blue> TOP4 </h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  <!-- Item Project and Filter Name -->
                  <c:forEach var="space" items="${jjimList}">
				
					<li class="item-thumbs span3 design" data-id="id-0" data-type="${space.type}">
                    
                    	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="${space.title}" href="<c:url value='/space/viewspace?space_id=${space.space_id}'/>">
							<span class="overlay-img"></span>
							<span class="overlay-img-thumb">
								${space.title} 
								<p class="spacedetail">${space.type}<br> 
								<i class="icon-map-marker"></i> ${space.area}
                        		<i class="icon-smile"></i>${space.jjim_cnt}</p>
							</span>
						</a>
                    
                    	<img src="<c:url value='/resources/img/${space.image_list[0]}'/>" alt="${space.type}, ${space.area}" >
                  	</li>
				
				</c:forEach>
                  <!-- End Item Project -->
                </ul>
              </section>
            </div>
          </div>
        </div>
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->
        <!-- Portfolio Projects -->
        <div class="row">
          <div class="span12">
            <h4 class="heading"> <blue>최근</blue>에 등록된 공간</strong></h4>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                  <!-- Item Project and Filter Name -->
                  <c:forEach var="space" items="${spaceList}">
				
					<li class="item-thumbs span3 design" data-id="id-0" data-type="${space.type}">
                    
                    	<a class="hover-wrap fancybox" data-fancybox-group="gallery" title="${space.title}" href="<c:url value='/space/viewspace?space_id=${space.space_id}'/>">
							<span class="overlay-img"></span>
							<span class="overlay-img-thumb">
								${space.title} 
								<p class="spacedetail">${space.type}<br> 
								<i class="icon-map-marker"></i> ${space.area}
                        		<i class="icon-smile"></i>${space.jjim_cnt}</p>
							</span>
						</a>
                    
                    	<img src="<c:url value='/resources/img/${space.image_list[0]}'/>" alt="${space.type}, ${space.area}" >
                  	</li>
				
				</c:forEach>
                  <!-- End Item Project -->
                </ul>
              </section>
            </div>
          </div>
        </div>
        
        
      </div>
    </section>
    
    
      
    
    
    
  </div>

