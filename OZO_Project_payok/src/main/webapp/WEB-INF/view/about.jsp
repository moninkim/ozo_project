<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span10">
            <div class="inner-heading">
              <blockquote><br>
              <i class="icon-quote-left icon-2x"></i> 
              	Software System Development (01) Team05 OZO<br>
              	DongDuk Women's University Department of Computer Science
            </blockquote>
            </div>
          </div>
          
        </div>
      </div>
    </section>
    
    <section id="content">
      <div class="container">
        
        <div class="row">
          
          
          
          
          
          
        <div class="row aboutfont">
          
          <div class="span6">
            <h4>Introduction</h4>
            <label>주제:</label>
            
              	<p>공간 대여 서비스</p>
            
            <label>개요 :</label>
            
              	<p>스터디나 회의를 위한 컨퍼런스 룸, 연습실 파티를 위한 소규모 공간 등<br>
				다양한 목적에 맞는 공간을 중개, 알선하는 웹 서비스</p>

            
            <label>특징 :</label>
            
              	<p>이용 용도를 한정해두는 것이 아니라, 목적에 맞는 다양한 성격의 공간을 모아 둠<br>
				시간적 · 경제적 여유가 부족한 직장인 및 대학생을 타겟으로 조금 더 소규모 공간을 대여하는 것에 역점을 둠</p>

            
            
          </div>
          
          <div class="span6">
            <h4>Main function</h4>
            <div class="accordion" id="accordion2">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
							1. 회원가입 및 로그인 </a>
                </div>
                <div id="collapseOne" class="accordion-body collapse in">
                  <div class="accordion-inner">
                    <p>
                      	웹페이지의 회원가입한 회원에게 환영메일을 보낸다.<br>
                      	로그인을 가능하도록 하여, 인증된 사용자만 사이트이용을 할 수 있도록 한다.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
							2. 공간 등록 · 수정 · 조회 · 검색 · 추천 · 찜</a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      	공간 제공자는 공간을 등록, 수정 할 수 있으며 공간 조회 및 검색은 회원 비회원 관계없이 가능하다.<br>
						공간의 카테고리, 게시물의 평점순, 최신순의 정렬조건을 두어 사용자 친화적 서비스를 제공한다.<br>
						공간마다 keyword를 두어 사용자가 원하는 공간을 쉽게 찾을 수 있게 돕고 <br> 
						평점을 기반으로한 추천 서비스를 제공한다.<br>
						회원은 원하는 공간을 추후에 확인 할 수 있도록 찜하기 기능을 제공한다.<br>
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
							3. 예약 신청 · 취소 · 조회 · 거부 · 결제</a>
                </div>
                <div id="collapseThree" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      	회원은 공간을 예약하거나 이용일의 3일 전까지 신청 취소 할 수 있으며 예약 조회가 가능하다.<br>
						공간 제공자는 요청된 예약을 조회하고 승인하거나 거부할 수 있다.<br>
						예약의   신청 · 취소 · 조회 · 거부가 발생한 경우 메일으로 알림을 준다.<br>
						카카오페이를 통해 결제를 할 수 있다.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
							4. 평점 및 후기작성 </a>
                </div>
                <div id="collapseFour" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      	후기를 이용일로 부터 일주일이내에 작성 할 수 있도록 하여 유용하고 신뢰감 있는 정보를 제공한다.<br>
                      	또 이를 기반으로 공간의 등급 및 제공자의 등급을 매기도록 한다.<br>
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFive">
							5. 크레딧 부여 </a>
                </div>
                <div id="collapseFive" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                     	 공간 이용 완료 후기를 쓴 작성자에게 크레딧을 부여하고 다음 예약에서 사용할 수 있도록 한다.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </section>