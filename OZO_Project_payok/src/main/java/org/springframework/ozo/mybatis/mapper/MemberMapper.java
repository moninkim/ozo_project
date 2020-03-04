package org.springframework.ozo.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.ozo.domain.Credit;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.domain.Space;

public interface MemberMapper {
	
	@Select("SELECT memid AS memId, password, name, email, phone, grade, profile, memtype AS memberType " +
	   	    "FROM MEMBER " +
			"WHERE memid = #{memId}")
	Member getMemberBymemId(String memId);
	
	Member getMemberBymemIdAndPw(String memId, String password);
	
	Integer insertMember(Member member);
	
	@Update("UPDATE MEMBER SET " +
	   	    "PASSWORD = #{password}, NAME = #{name}, PHONE = #{phone}" +
			"WHERE memid = #{memId}")
	Integer updateMember(Member member);
	
	@Update("UPDATE MEMBER SET " +
	   	    "profile = #{param2}" +
			"WHERE memid = #{param1}")
	Integer updateProfileImg(String memId, String file);
	
	List<Credit> getCreditHistory(String memId);
	
	public void insertCreditHistory(Credit credit);
	
	@Select("SELECT memid AS memId, password " +
	   	    "FROM MEMBER " +
			"WHERE name = #{param1} AND "
			+ "email = #{param2} AND "
			+ "phone = #{param3}"
			)
	Member getMemberIdByEmail(String name, String email, String phone);
	
	

}
