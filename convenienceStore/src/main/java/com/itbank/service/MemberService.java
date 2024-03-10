package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberRepository;

@Service
public class MemberService {

	@Autowired private MemberRepository mr;
	@Autowired private HashComponent hashComponent;

	public MemberDTO login(MemberDTO dto) {
		dto.setUserpw(hashComponent.getHash(dto.getUserpw()));
		return mr.login(dto);
	}

	public int join(MemberDTO dto) {
		dto.setUserpw(hashComponent.getHash(dto.getUserpw()));
		dto.setRole(3);		// 일반 사용자 회원가입
		return mr.join(dto);
	}
	
}
