package org.springframework.ozo.service;


import java.util.List;
import java.util.Map;

import org.springframework.ozo.domain.Credit;
import org.springframework.ozo.domain.Member;

public interface OzoFacade {
	
   Member getMemberBymemId(String memId);
   
   List<Credit> getCreditHistory(String memId); 
   
   Member getMember(String memId, String password);
   
   void insertMember(Member member);

   void updateMember(Member member);
   
   void updateProfileImg(String memId, String file);
   
   Member getMemberIdByEmail(String memName, String memEmail, String memPhone);
   
   public void insertCreditHistory(Credit credit);
   
   public Integer checkJjim(String memId, int space_id);

}