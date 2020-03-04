package org.springframework.ozo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import org.springframework.ozo.dao.MemberDao;
import org.springframework.ozo.domain.Credit;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.mybatis.mapper.MemberMapper;


@Service
@Transactional
public class OzoFacadeImpl implements OzoFacade { 
	
	@Autowired
	private MemberDao memberDao;
	
	private int nextMemberId = 0;
	private Map<String, Member> memberMap = new HashMap<String, Member>();
	

	public Member getMemberBymemId(String memId) {
		return memberDao.getMemberBymemId(memId);

	}

	public Member getMember(String memId, String password) {
		return memberMap.get(memId);
	}

	public void insertMember(Member member) {
		memberDao.insertMember(member);
		nextMemberId++;
	    memberMap.put(member.getMemId(), member);
	}

	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}
	
	public void updateProfileImg(String memId, String file) {
		memberDao.updateProfileImg(memId, file);
	}
	
	public List<Member> getMembers() {
	      return new ArrayList<Member>(memberMap.values());
	   }

	@Override
	public List<Credit> getCreditHistory(String memId) {
		return memberDao.getCreditHistory(memId);
	}
	
	public void insertCreditHistory(Credit credit) {
		memberDao.insertCreditHistory(credit);
	}

	public Member getMemberIdByEmail(String name, String email, String phone) {
		return memberDao.getMemberIdByEmail(name, email, phone);
	}
	
	public Integer checkJjim(String memId, int space_id) {
		return memberDao.checkJjim(memId, space_id);
	}
}