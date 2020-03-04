<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div id="load">
      <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h4>Make a Reservation</h4>
            </div>
          </div>
          <div class="span8">
            <ul class="breadcrumb">
              <li><a href="<c:url value="/index" />"><i class="icon-home"></i></a><i class="icon-angle-right"></i></li>
              <li><a href="#">Reserve</a><i class="icon-angle-right"></i></li>
              <li class="active"><a href="<c:url value="/space/newRegister" />">Make a Reservation</a></li>
            </ul>
          </div>
        </div>
      </div>
    </section>
    
    <section id="content">
      
      <div class="container">
        <div class="row">
           <div class="span12">
              <article>
                    <div class="row">
                        <div class="post-image text-center">
                          <div class="post-heading">
                             <input type="hidden" id="space_id" value="${space.space_id}"/>
                               <h3><a href="<c:url value='/space/viewspace?space_id=${space.space_id}'/>">[ ${space.title} ]</a></h3>
                       </div>
                       <img src="<c:url value='/resources/img/${space.image_list[0]}'/>" alt="${space.image_list[0]}" />
                     </div>

                  <div class="bottom-article">
                    <ul class="meta-post">
                      <li><i class="icon-user"></i> HOST : ${space.member.name}
                      <li>주소 : ${space.area}</li>
                      <li>공간 유형 : ${space.type}</li>
                      <li>최대 정원 : ${space.max_people}</li>
                      <input type="hidden" id="max_people" value="${space.max_people}" />
                      <input type="hidden" id="spacecost" value="${space.cost}" />
                      <c:choose>
                     <c:when test="${space.total_rate eq 0}">
                          <li>평점 정보 미등록</li>
                      </c:when>
                     <c:otherwise>
                        <li>
                           <c:forEach begin="1" end="${space.total_rate}" step="1">
                                 	<i class="icon-star"></i>
                                </c:forEach> ( ${space.total_rate} )
                        </li>
                      </c:otherwise>
                   </c:choose>
                    </ul>
                  </div>
                
              </div>
            </article>
           </div>
          
          <div class="span12">
            
            <div class="row">
               <div class="span6">
       
                   <div id="datepicker"></div>
 
    	<script>
    	var jsonResult = [];
    	
    	
            
            function recho(){
            	
            	var space_id = $('#space_id').val();
            	var dateText = $('#userdate').val();
            	document.getElementById("StartTime").value = "";
            	document.getElementById("EndTime").value = "";
            	var paramData = JSON.stringify({"select_date":dateText,"space_id": space_id});
        		var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
        		
        		$.ajax({

    				url: "./reserve/getAvailabilityDate", 
    				headers : headers,
    				data : paramData,
    				type : 'POST',
    				dataType : 'json',
    				success: function(result){
    					
    					var clickS = null;
    			        var clickE = null;
    			        var Now = new Date();

    					jsonResult = JSON.parse(JSON.stringify(result)) ;    		                     
    	                var time_list = document.getElementById("myList");    		                   				
    	                var text = "<p><label>예약 가능 시간</label></p><ul class='nostyle'>";
    	                for (i = 9; i <= 24; i++) {
    	                	var tmp = "";
    	                   	if ( i < 10 ){
    	                   		tmp += "0";}
    	                   	
    	                	tmp += String(i);    		                   					
    	                	var flag = -1; 
    	                   					
    	                	$(jsonResult).each(function(){
    	                		if(tmp >= this.start_date && tmp <= this.end_date){
    		                   		flag = 1;}
    		            	});
    	                   					
    	                	if(flag != -1){
    	                		text += "<li class='time andae' value=" + i + ">" + i + " : 00 </li>";
    	                	}else{
    	                   		text += "<li class='time' value=" + i + ">" + i + " : 00 </li>";}   		                   					    		                   				  
    	                }
    	                   				
    	                time_list.innerHTML = text+"</ul>";
    	                var input_time = document.getElementById("input_time") + "";
    	                document.getElementById("input_time").style.display = 'block';
    	                
    	                $('.andae').off("click");
    	                
                        $('.time').click(function(){
                        	
                           if (clickS == null){                               
                              clickS = $(this);
                              
                              console.log( clickS.val() );
                              document.getElementById("StartTime").value = clickS.val();
                              $(this).unbind("click");
                              $(this).prevAll().unbind("click");
                              $(this).prevAll().css('background-color','#e9e9e9');
                              $(this).css('background-color','#bed3f9');
                           }else{
                              clickE = $(this);
                              
                              
                              var tmp = clickS;

                              while(tmp.val() != clickE.val()){ 

                                 if (tmp.attr('class').indexOf('andae') != -1){
                                	 window.alert("시간을 다시 선택해주세요 ;< ");
                                     clickE.prevAll().bind("click");
                                     clickE.prevAll().css('background-color','white');
                                     clickS.css('background-color','#bed3f9');
                                     $('.andae').css('background-color','#e9e9e9');
                                     clickE = null;
                                    return;
                                 }                                   
                                 tmp = tmp.next();    
                              }
                              
                              document.getElementById("EndTime").value = clickE.val();
                              $(this).nextAll().off("click");
                              var tmp = clickS;
                              while(tmp.val() != clickE.val()){                               
                            	tmp.css('background-color','#bed3f9');
                                 tmp = tmp.next();    
                              }
                              tmp.css('background-color','#bed3f9');
                              clickS.nextAll().unbind("click");
                              

                              clickE.nextAll().css('background-color','#e9e9e9');
                              
                              var tt = ( Number(clickE.val()) - Number(clickS.val()) );
                              
                            document.getElementById("usertime").innerHTML = "<i class='icon-ok icon-2'></i> 예약 일시 : " + 
          					document.getElementById("userdate").value + "&nbsp;&nbsp;" +  clickS.val() + " : 00 ~ " + clickE.val() +" : 00  (" + tt + "시간)";
                           
                            var c = document.getElementById("spacecost").value;
            				var cre = document.getElementById("usecredit").value;
            				
            				var total = tt * Number(c) - Number(cre);
            				document.getElementById("total_cost").value = total;
            				console.log(document.getElementById("total_cost").value);
            				
            				document.getElementById("costinfo").innerHTML = "<h5><strong> <i class='icon-krw icon-2'></i>  "+ total + "</strong></h5>"
            				+ "<em>(" + clickE.val() + " - " + clickS.val() + " ) * "+ c + " - " + cre + " = " + total + "</em>";
                           
                           
                           }
                                                        
                        })
                        
    				}
            	
            	
            });
            }   
       

    	function peo() {
    		var p = document.getElementById("peoplenum");
    		if ( Number(p.value) > Number(p.max) ){
    			document.getElementById("peopleerror").innerHTML = "정원 수 초과";
    			return;
    		}
    		else if( Number(p.value) <= Number(0) ){
    			document.getElementById("peopleerror").innerHTML = "인원 수는 0보다 커야 합니다";
    			return;
    		}
    		else{
    			document.getElementById("peopleerror").innerHTML = "";
    		}	
    		document.getElementById("userpeoplenum").innerHTML = "<i class='icon-ok icon-2'></i> 인원 수 : " + p.value ;
    	}

		
		function calcost(){
			var s = document.getElementById("StartTime").value;
			var e = document.getElementById("EndTime").value;
			var c = document.getElementById("spacecost").value;
			var cre = document.getElementById("usecredit");
			
			
			console.log("max" + cre.max); console.log("니가입력"+cre.value);
			if (Number(cre.value) > Number(cre.max) ){
				cre.value = Number(0);
				document.getElementById("credit_info").innerHTML = "<red>크레딧이 부족합니다 <i class='icon-meh icon-2'></i><red>";	
				return;
			}
			else{
				document.getElementById("credit_info").innerHTML = "보유 크레딧 : " + Number(cre.max);				
				document.getElementById("credit_amount").value = cre.value;				
			}
			
			var total = ( Number(e) - Number(s) ) * Number(c) - Number(cre.value);
			document.getElementById("total_cost").value = total;
			
			
			document.getElementById("costinfo").innerHTML = "<h5><strong><i class='icon-krw icon-2'></i>  "+ total + "</strong></h5>"
			+ "<em>(" + e + " - " + s + " ) * "+ c + " - " + cre.value + " = " + total + "</em>";
			
			
		}
		
		function subF(){
			
		    var peoplenum = document.reserveForm.peoplenum;
		    var max_people = document.getElementById('max_people').value;
		    var date = document.getElementById("userdate");
		    var starttime = document.getElementById("StartTime").value;
		    var endtime = document.getElementById("EndTime").value;
		    var timeerror = document.getElementById('timeerror').innerHTML;
		    
		    
		    if (peoplenum.value == "" || peoplenum.value <= Number(0) || Number(peoplenum.value) >Number( max_people)) {
		    	console.log(peoplenum.value);
		    	console.log(max_people);
		        window.alert("입력한 인원수가 올바르지 않습니다 ;( ");
		        return false; 
		    }
		    
		    if(date.value == ''){
		    	window.alert("예약 날짜를 선택해 주세요 ;(");
		    }
		    
		    if (starttime == '' ||endtime == ''){
		    	window.alert("예약 시간을 입력해 주세요  ;(");
		        return false;
		    }
		    
		    document.getElementById('reserveForm').submit();
		    
		    document.getElementById("buttonreplacement").style.display = ""; // to display
	          $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
	              var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
	              $(buttonreplacement).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
	          });
	          document.getElementById("load").style.opacity = "0.3"; // to display


		}


        $(function() {
            $("#datepicker").datepicker({
                dateFormat: 'yy-mm-dd'
                ,showOtherMonths: true 
                ,showMonthAfterYear:true 
                ,changeYear: false 
                ,changeMonth: true                    
                ,yearSuffix: "년" 
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] 
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] 
                ,minDate: "1" 
                ,maxDate: "+1M" 
            	,onSelect: function (dateText, inst) {
            		
            		var Now = new Date();
			        var NowTime = '오늘은  ' + Now.getFullYear();
			        var InterMonth = Number( Now.getMonth() ) + Number(1);
			        NowTime += '년 ' + InterMonth;
			        NowTime += '월 ' + Now.getDate();
			        NowTime += "일 입니다";

            		
            		var con = document.getElementById("clickdate");           		
            		var space_id = $('#space_id').val();
            		$('#userdate').val(dateText);
            		
            		con.style.display = 'block';
            		con.innerHTML  = "<h5>" + dateText + "</h5><em style='float:right'>"+NowTime+"</em><br><hr>";
            		            		            		
            		var paramData = JSON.stringify({"select_date":dateText,"space_id": space_id});
            		var headers = {"Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST"};
            		
            		$.ajax({

    					url: "./reserve/getAvailabilityDate", 
    					headers : headers,
    					data : paramData,
    					type : 'POST',
    					dataType : 'json',
    					success: function(result){
    						
    						var clickS = null;
    				        var clickE = null;

    						jsonResult = JSON.parse(JSON.stringify(result)) ;    		                     
    		                var time_list = document.getElementById("myList");    		                   				
    		                var text = "<p><label>예약 가능 시간</label></p><ul class='nostyle'>";
    		                for (i = 9; i <= 24; i++) {
    		                	var tmp = "";
    		                   	if ( i < 10 ){
    		                   		tmp += "0";}
    		                   	
    		                	tmp += String(i);    		                   					
    		                	var flag = -1; 
    		                   					
    		                	$(jsonResult).each(function(){
    		                		if(tmp >= this.start_date && tmp <= this.end_date){
        		                   		flag = 1;}
        		            	});
    		                   					
    		                	if(flag != -1){
    		                		text += "<li class='time andae' value=" + i + ">" + i + " : 00 </li>";
    		                	}else{
    		                   		text += "<li class='time' value=" + i + ">" + i + " : 00 </li>";}   		                   					    		                   				  
    		                }
    		                   				
    		                time_list.innerHTML = text+"</ul>";
    		                var input_time = document.getElementById("input_time");
    		                document.getElementById("input_time").style.display = 'block';
    		                
    		                $('.andae').off("click");
                            $('.time').click(function(){
                               if (clickS == null){                               
                                  clickS = $(this);
                                  document.getElementById("StartTime").value = clickS.val();
                                  $(this).unbind("click");
                                  $(this).prevAll().unbind("click");
                                  $(this).prevAll().css('background-color','#e9e9e9');
                                  $(this).css('background-color','#bed3f9');
                               }else{
                                  clickE = $(this);
                                  
                                  
                                  var tmp = clickS;
                                  
                                  
                                  
                  
                                  while(tmp.val() != clickE.val()){ 

                                     if (tmp.attr('class').indexOf('andae') != -1){
                                        window.alert("시간을 다시 선택해주세요 ;< ");
                                        clickE.prevAll().bind("click");
                                        clickE.prevAll().css('background-color','white');
                                        clickS.css('background-color','#bed3f9');
                                        $('.andae').css('background-color','#e9e9e9');
                                        clickE = null;
                                        return;
                                     }                                   
                                     tmp = tmp.next();    
                                  }
                                  
                                  document.getElementById("EndTime").value = clickE.val();
                                  $(this).nextAll().off("click");
                                  var tmp = clickS;
                                  while(tmp.val() != clickE.val()){                               
                                	tmp.css('background-color','#bed3f9');
                                     tmp = tmp.next();    
                                  }
                                  tmp.css('background-color','#bed3f9');
                                  clickS.nextAll().unbind("click");
                                  

                                  clickE.nextAll().css('background-color','#e9e9e9');
                                  
                                  var tt = ( Number(clickE.val()) - Number(clickS.val()) );
                                  
                                document.getElementById("usertime").innerHTML = "<i class='icon-ok icon-2'></i> 예약 일시 : " + 
              					document.getElementById("userdate").value + "&nbsp;&nbsp;" +  clickS.val() + " : 00 ~ " + clickE.val() +" : 00  (" + tt + "시간)";
                               
                                var c = document.getElementById("spacecost").value;
                				var cre = document.getElementById("usecredit").value;
                				
                				var total = tt * Number(c) - Number(cre);
                				document.getElementById("total_cost").value = total;
                				console.log(document.getElementById("total_cost").value);
                				
                				document.getElementById("costinfo").innerHTML = "<h5><strong> <i class='icon-krw icon-2'></i> "+ total + "</strong></h5>"
                				+ "<em>(" + clickE.val() + " - " + clickS.val() + " ) * "+ c + " - " + cre + " = " + total + "</em>";
                               
                               
                               }
                                                            
                            });
    		                
    		                
    		                
    		                
    		                
    		                   				
    					}

    					, error: function(error){
    						console.log("에러 : " + error);

    					}

    				});
					
            				

            	}
            	
            });                    
            
            //초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)      
            
        });
        
        
        
        
        
                        
        
		
    </script>
                   
                  </div>
                  <div class="span6">
                     <p id="clickdate" style="display: none;">선택한 날짜</p>
                     <p id="availdate" style="display: none;">선택한 날짜</p>
                     
                     <ul id="myList" style="list-style:none;border:1px soild black">
                       
                  </ul>
                  
                  </div>
               </div>
               <div class="row">
            <form method="post" id="reserveForm" name="reserveForm" action="<c:url value='/space/newReserve?space_id=${space.space_id}' />" onsubmit="return subF();">
               <div class="span6 form-group">
                  <label>인원수 </label> <p id="peopleerror" style="errorStyle"></p>
                           <input type="number" id="peoplenum" name="peoplenum" class="form-control" min="0" max="${space.max_people}" onchange="peo()" required/>
                   </div>
                   <div class="span6 form-group" id="input_time" style="display:none;">
                  <div style="margin-left:25px">
                     <label>예약 시간 </label> <p id="timeerror"></p>
                     <div class="InputTimeBox">
                        <input type="hidden" id="userdate"  name="userdate" />
                              <input type="number" id="StartTime"  name="StartTime" class="form-control span2" placeholder="사용 시작 시간"  readonly required/> 
                        &nbsp;<strong> ~ </strong>&nbsp;
                              <input type="number" id="EndTime"  name="EndTime" class="form-control span2 " placeholder="사용  종료 시간" readonly required/>
                           
                              <span class="btn btn-blue-outline" id="cho" onclick="recho()">날짜 다시 선택</span>
                     </div>
                     
                           <input type="hidden" id="total_cost" name="total_cost" onclick=/>
                        </div>
                   </div>
                      <input type="hidden" id="credit_amount" name="credit_amount"/>
                </form>
                   
                   <div class="span12 form-group">
                      <p class="text-center">
                          <button class="btn btn-inverse btn-rounded margintop10" type="button" data-toggle="modal" data-target="#calcModal" onclick="okok()">Register Reserve</button>
                     </p>
                   </div>
               
               </div>
         
            
        </div>
        </div>
      </div>
    </section>

    
    <div id="calcModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header text-center">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <i class="icon-quote-left"></i>예약 정보를 다시 한번 확인해 주세요 <i class="icon-quote-right"></i>
      </div>
      <div class="modal-body">
         <ul class="clients2">
            <li> 
               <span class="span2"> 
                    <img src="<c:url value='/resources/img/${space.image_list[0]}'/>" alt="${space.title}" />
                </span>
                <span class="span3" style="margin-top:15px">
                   <span class="btn btn-green btn-mini btn-rounded">${space.type}</span><br>            
               <h5><strong>${space.title}</strong></h5>                   
                </span>                                      
            
            </li>
         </ul>
      
        <ul style="list-style:none;">
           <li id="userpeoplenum"></li>
           <li id="usertime"></li>
        </ul>
           <p id="userpeoplenum"></p>
           <p id="usertime"></p>
           
           <hr>
           <div id="costinfo" class="text-center">
           </div>
           
           <div class="form-group text-center" style="float:right;margin-top:15px">
              <div class="span3">
             <label id="credit_info">보유 크레딧 : ${memberSession.member.getTotalCredit()}</label>
             <input type="number" id="usecredit"  name="credit" class="form-control" min="0" max="${memberSession.member.getTotalCredit()}" value="0" onchange="calcost()">
              </div>
           </div>
           
              
           
           
      </div>
      <div class="modal-footer">  
        <button type="button" class="btn btn-inverse btn-rounded margintop10" type="submit" data-dismiss="modal" onclick="subF()" >에약 하기</button>
      </div>
    </div>

  </div>
</div>
</div>
<img id="buttonreplacement" src="<c:url value='/resources/img/ozo.gif'/>" alt="loading..." style="display: none; position:absolute; width:200px; height:200px; top: 90%; left:45%; margin: 0px; background-attachment: fixed;">
