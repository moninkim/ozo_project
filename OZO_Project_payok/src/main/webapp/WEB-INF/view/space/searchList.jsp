<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2><strong>SEARCH</strong> SPACE</h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Space</a><i class="icon-angle-right"></i></li>
              <li class="active">Search Space</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
          
          	<form class="contactForm"  action="<c:url value='/space/search' />" method="POST">																				                            	
				<label><b>주소 이름 같이 검색 </b></label>	
				<div class="row">
				
				<div class="form-group span5">
  						<input type="text" name="area" id="area" class="form-control" placeholder="지역">
				</div>
				<div class="form-group span5">
  						<input type="text" name="title" id="title" class="form-control" placeholder="장소">
				</div>

				<input type="submit" class="btn btn-blue" style="margin-left:10px; height:40px; width:100px;font-family: 'S-CoreDream-3Light';" value="검색">
				</div>
			</form>
          	
          </div>
          
          
          <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->
          
          <div class="span12">
          	<H4>
          		<c:if test="${empty keyword}"> 
          			<blue>${keyword1}</blue> 그리고 <blue>${keyword2}</blue>
				</c:if>    
				
				<c:if test="${!empty keyword}"> 
          			<blue>${keyword}</blue>
				</c:if>    
          	
          		으로 검색한 결과
          	</H4>
          	
          	<c:if test="${empty spaceList}"> <p>검색 결과가 없습니다 <i class="icon-meh"></i></p> </c:if>        
          	
          	<c:if test="${!empty spaceList}"> 
          	
            <ul class="portfolio-categ filter">
              <li class="all active"><a href="#">All</a></li>
              <c:forEach var="spaceType" items="${spaceTypeList}">
              	<li class="${spaceType}"><a href="#" title="">${spaceType}</a></li>
              </c:forEach>
              
                   
            </ul>
            <div class="clearfix">
            </div>
            <div class="row">
              <section id="projects">
                <ul id="thumbs" class="portfolio">
                
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

                </ul>
              </section>
            </div>
            
            </c:if>        
          </div>
        </div>
      </div>
    </section>