package org.springframework.ozo.controller.reserve;
import java.text.SimpleDateFormat;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.domain.Reserve;
import org.springframework.ozo.domain.Space;
import org.springframework.stereotype.Controller;



@Controller
public class SendMailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm"); 
	

	
	public void ComReserToPro(Space space, Reserve reserve) {
		
		Member provider = space.getMember();
		String content = "<h1>안녕하세요 <strong>" + provider.getName() +"</strong>님:D </h1><hr>"
				+"Project OZO 입니다!<br><br>"
				+ sdf.format(reserve.getCreate_date()).toString() +"일자로 등록하신 공간 " + space.getTitle() + "에 새로운 예약이 접수되었습니다.<br><br><br>"
				+"<ul>예약 정보</ul>"
				+"<li> 예약 일정 : " + sdf.format(reserve.getStartDate()).toString() + "   ~   " + sdf.format(reserve.getEndDate()).toString() +"</li>"
				+"<li> 예약 인원수 : " + reserve.getPeoplenum() +"</li>"
				+"<li> 청구가격 : " + reserve.getTotal_cost() +"</li>"
				+ reserve.getMember().getName() +" 님께서 기다리고 계시니 예약 확정 또는 거부를 서둘러주세요 :D<br><br><br>"
				+"<ul>OZO 일개미 목록</ul>"
				+"<li>20150711 권지민</li> <li>20141119 조송이</li> <li>20160939 김유정</li> <li>20160953 박보람</li>"
				+"동덕여자대학교 소프트웨어시스템개발 01분반 05팀 팀프로젝트OZO<br>";    

		try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom("ddprojectozo@gmail.com");  
				messageHelper.setTo(provider.getEmail());     
				messageHelper.setSubject(space.getTitle() + "에 대한 새로운 예약"); 
				messageHelper.setText(content, true);  
				mailSender.send(message);
				
		} catch(Exception e){
			System.out.println(e);
		}

	}
	
	
	public void ComReserToCus(Member customer, Reserve reserve) {
		String content = "<h1>안녕하세요 <strong>" + customer.getName() +"</strong>님:D </h1><hr>"
				+"Project OZO 입니다!<br><br>"
				+ reserve.getSpace().getTitle() + "에 예약이 완료되었습니다<br>"
				+"<ul>예약 정보</ul>"
				+"<li> 예약 일정 : " + sdf.format(reserve.getStartDate()).toString() + "   ~   " + sdf.format(reserve.getEndDate()).toString() +"</li>"
				+"<li> 예약 인원수 : " + reserve.getPeoplenum() +"</li>"
				+"<li> 청구가격 : " + reserve.getTotal_cost() +"</li>"
				+"<em>" + sdf.format(reserve.getCreate_date()).toString() +"에 예약 완료되었습니다</em>"
				+" 햄볶는 시간 보내시길 바랍니다 :D<br><br><br><br>"
				+"<ul>OZO 일개미 목록</ul>"
				+"<li>20150711 권지민</li> <li>20141119 조송이</li> <li>20160939 김유정</li> <li>20160953 박보람</li>"
				+"동덕여자대학교 소프트웨어시스템개발 01분반 05팀 팀프로젝트OZO<br>";    

		try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom("ddprojectozo@gmail.com");  
				messageHelper.setTo(customer.getEmail());     
				messageHelper.setSubject(reserve.getSpace().getTitle() + "예약 완료"); 
				messageHelper.setText(content, true);  
				mailSender.send(message);
				
		} catch(Exception e){
			System.out.println(e);
		}

	}

}
