package com.kks.trashpedia.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.report.model.vo.Report;

@Repository
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate session;

	@Autowired
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@Override
	public int emailCheck(String userEmail) {
		return session.selectOne("memberMapper.emailCheck", userEmail);
	}

	@Override
	public int joinMember(Member m) {
		int result = session.insert("memberMapper.joinMember", m);
		return result;
	}

	@Override
	public int updateMember(Member m) {

		System.out.println("매개 m: "+m);
		
		Member member = session.selectOne("memberMapper.getMember", m);
		System.out.println("기존 member: "+member);
		
		// 회원 정보 업데이트
		if(m.getUserPwd() == null || m.getUserPwd().equals("")) {
			member.setUserPwd(member.getUserPwd());
		}else {
			member.setUserPwd(passwordEncoder.encode(m.getUserPwd()));
		}
	
		// 회원 정보 업데이트
		member.setUserName(m.getUserName());
		member.setUserNickname(m.getUserNickname());
		member.setPhone(m.getPhone().replaceAll("[^0-9]", ""));
		member.setZipcode(m.getZipcode());
		member.setAddress1(m.getAddress1());
		member.setAddress2(m.getAddress2());
		member.setAddress3(m.getAddress3());
		System.out.println("업데이트된 member: "+member);
		// 회원 정보 업데이트 실행
		return session.update("memberMapper.updateMember", member);

	}

	// 탈퇴
	@Override
	public int deleteMember(Member m) {
		// 회원 정보 가져오기
		Member member = session.selectOne("memberMapper.getMember", m);
		return session.update("memberMapper.deleteMember", member);
	}

	@Override
	public int idCheck(String userEmail) {
		return session.selectOne("memberMapper.idCheck", userEmail);
	}

	// 마이페이지
	// 내 게시판
	@Override
	public List<Board> pledgeList(int userNo) {
		return session.selectList("memberMapper.pledgeList", userNo);
	}

	// 내 댓글
	@Override
	public List<Board> commentList(int userNo) {
		return session.selectList("memberMapper.commentList", userNo);
	}
	
	// 내 신고 리스트
	@Override
	public List<Report> reportList(int userNo) {
		return session.selectList("memberMapper.reportList", userNo);
	}

	@Override
	public Member findEmail(String userName, String phone) {
		Map<String, Object> param = new HashMap<>();
		param.put("userName", userName);
		param.put("phone", phone);
		return session.selectOne("memberMapper.findEmail",param);
	}

	@Override
	public int checkEmail(String userEmail, String phone) {
		Map<String, Object> param = new HashMap<>();
		param.put("userEmail", userEmail);
		param.put("phone", phone);
		return session.selectOne("memberMapper.checkEmail", param);
	}

	@Override
	public int joinSocialMember(Member m, Long socialId, String socialType) {
		Map<String, Object> param = new HashMap<>();
		param.put("socialId", socialId);
		param.put("socialType", socialType);
		int result = session.insert("memberMapper.joinMember", m);
		if(result > 0) {
			Member member = session.selectOne("memberMapper.findMember",m);
			param.put("userNo", member.getUserNo());
			result = session.insert("auth.joinMemberSocial",param);
		}
		return result;
	}

	@Override
	public Member getMember(Member m) {
		return session.selectOne("memberMapper.getMember",m);
	}


}
