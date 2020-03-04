<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



		<section id="inner-headline">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div class="inner-heading">
							<h2>Write Review</h2>
						</div>
					</div>
					<div class="span8">
						<ul class="breadcrumb">
							<li><a href="#"><i class="icon-home"></i></a><i
								class="icon-angle-right"></i></li>
							<li><a href="#">Review</a><i class="icon-angle-right"></i></li>
							<li class="active">Write Review</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
		
		
		
		<section id="content">
		
			<div class="container">
        <div class="row">
          <div class="span12">
<p>이용하신 공간에 대한 <strong>평점과 내용을 </strong>작성해주세요.</p><br>
 <form:form commandName="reviewCommand" method="post" role="form" class="contactForm"  align="center">
              <div id="sendmessage">Your message has been sent. Thank you!</div>
              <div id="errormessage"></div>

              <div class="row">
                <div class="span4 form-group">
					<p class="star_rating">
    					<a href="#" class="on" id="1">★</a>
    					<a href="#" id="2">★</a>
    					<a href="#" id="3">★</a>
    					<a href="#" id="4">★</a>
    					<a href="#" id="5">★</a>
			  		</p>
                </div>
                
                <div class="span4 form-group">
	                <form:input type="text" path="review.rate" class="form-control"  placeholder="평점"  value="1" style="display:none"/>
	                <input type="text" id="rate" class="form-control"  placeholder="평점"  value="1" readonly/>
                  	<div class="validation"></div>
                </div>
            
                <div class="span12 margintop10 form-group">
                  <form:textarea class="form-control" path="review.content" rows="8" data-rule="required" placeholder="내용"/>
                  <div class="validation"></div>
                  <p class="text-center" style="margin-top:15px">
                    <button class="btn btn-blue btn-large bigbutton" type="submit">작성!</button>
                  </p>
                </div>
              </div>             
              </div>
              

			<script>
				$( ".star_rating a" ).click(function() {
    				$(this).parent().children("a").removeClass("on");
   	 				$(this).addClass("on").prevAll("a").addClass("on"); 	 	
   	 				var rate = $(this).attr('id');
   	 				document.getElementById("review.rate").value = rate;
   	 				document.getElementById("rate").value = rate;
    				return false;
				});

		   </script>

 
        
</form:form>                  
                   
</div>
</div>
</div>
		</section>





