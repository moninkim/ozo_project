<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String order =  request.getParameter("order")==null?"":request.getParameter("order"); 
	pageContext.setAttribute("order", order);	
%>



    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2><strong>ALL</strong> SPACE</h2>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="#"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Space</a><i class="icon-angle-right"></i></li>
              <li class="active">All Space</li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    <section id="content">
      <div class="container">
        <div class="row">
          <div class="span12">
            <ul class="portfolio-categ filter">
              <li class="all active"><a href="#">All</a></li>
              <c:forEach var="spaceType" items="${spaceTypeList}">
                 <li class="${spaceType}"><a href="#" title="">${spaceType}</a></li>
              </c:forEach>             
            </ul>
            <ul class="portfolio-categ filter" style="float:right;">
                
               		
               		<c:if test="${order eq 'rate' }">
               			<li><a href="<c:url value='/space/listspaces?order=rate' />"> <blue>평점순</blue> </a> </li>
               			<li> <a href="<c:url value='/space/listspaces?order=jjim' />"> 찜횟수순 </a> </li>
               			<li> <a href="<c:url value='/space/listspaces' />"> 등록순 </a> </li>
               		</c:if>
               		<c:if test="${order eq 'jjim' }">
               			<li><a href="<c:url value='/space/listspaces?order=rate' />"> 평점순 </a> </li>
               			<li> <a href="<c:url value='/space/listspaces?order=jjim' />"> <blue>찜횟수순</blue> </a> </li>
               			<li> <a href="<c:url value='/space/listspaces' />"> 등록순 </a> </li>
               		</c:if>
               		<c:if test="${order eq '' }">
               			<li><a href="<c:url value='/space/listspaces?order=rate' />">평점순 </a> </li>
               			<li> <a href="<c:url value='/space/listspaces?order=jjim' />"> 찜횟수순 </a> </li>
               			<li> <a href="<c:url value='/space/listspaces' />"> <blue>등록순</blue> </a> </li>
               		</c:if>
               		
        
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
          </div>
        </div>
      </div>
    </section>
