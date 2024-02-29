package com.kks.trashpedia.auth.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kks.trashpedia.auth.model.dao.AuthDao;
import com.kks.trashpedia.auth.model.dto.User;
import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{

	private final AuthDao authDao;
	
	@Override
	public User loadUserByUsername(String socialId) throws UsernameNotFoundException {
		
		return authDao.loadUserByUsername(socialId);
	}
	
	// 이메일과 비밀번호를 사용하여 회원 인증 및 권한 정보 조회
	@Transactional(readOnly = true)
    public User authenticateByEmail(String userEmail, String userPwd , PasswordEncoder passwordEncoder) {
        // 이메일과 비밀번호를 사용하여 회원 정보 조회
        Member member = authDao.findMemberByEmail(userEmail);
        if (member == null || !passwordEncoder.matches(userPwd, member.getUserPwd())) {
            // 회원이 존재하지 않거나 비밀번호가 일치하지 않는 경우 예외 처리
            throw new UsernameNotFoundException("Invalid email or password.");
        }

        // 회원 정보가 존재하고 비밀번호가 일치하는 경우 권한 정보 조회
        return authDao.loadUserByUsername(member.getSocialId());
    }
}
