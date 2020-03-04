package org.springframework.ozo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.ozo.dao.MemberDao;
import org.springframework.ozo.domain.Credit;
import org.springframework.ozo.domain.Member;
import org.springframework.ozo.mybatis.mapper.JjimMapper;
import org.springframework.ozo.mybatis.mapper.MemberMapper;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	public Member getMemberBymemId(String memId) throws DataAccessException {
		return sqlSession.getMapper(MemberMapper.class).getMemberBymemId(memId);
	}

	public Member getMemberBymemIdAndPw(String memId, String password) throws DataAccessException {
		return sqlSession.getMapper(MemberMapper.class).getMemberBymemIdAndPw(memId, password);
	}

	public Integer insertMember(Member member) throws DataAccessException {
		Integer result = sqlSession.getMapper(MemberMapper.class).insertMember(member);
		return result;
	}

	public Integer  updateMember(Member member) throws DataAccessException {
		Integer result = sqlSession.getMapper(MemberMapper.class).updateMember(member);
		return result;
	}
	
	public Integer updateProfileImg(String memId, String file) throws DataAccessException {
		Integer result = sqlSession.getMapper(MemberMapper.class).updateProfileImg(memId, file);
		return result;
	}

	public List<Credit> getCreditHistory(String memId) {
		return sqlSession.getMapper(MemberMapper.class).getCreditHistory(memId);
	}

	public void insertCreditHistory(Credit credit) {
		sqlSession.getMapper(MemberMapper.class).insertCreditHistory(credit);
	}
	
	public Member getMemberIdByEmail(String name, String email, String phone) throws DataAccessException {
		return sqlSession.getMapper(MemberMapper.class).getMemberIdByEmail(name, email, phone);
	}
	
	public Integer checkJjim(String memId, int space_id) {
		return sqlSession.getMapper(JjimMapper.class).checkJjim(memId, space_id);
	}

}