package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;

@Repository
public interface MemberRepository {

	@Select("select * from member where userid = #{userid} and userpw = #{userpw}")
	MemberDTO login(MemberDTO dto);

	@Insert("insert into member (userid, userpw, email, nickname, pnum, role)"
			+ "values (#{userid}, #{userpw}, #{email}, #{nickname},#{pnum}, #{role})")
	int join(MemberDTO dto);

	
	
}
