package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.FaqDTO;

@Repository
public interface InquiryDAO {

	@Select("select * from faqBoard order by idx")
	List<FaqDTO> selectList();

	@Insert("insert into faqboard (title, answer) values (#{title}, #{answer})")
	int insert(FaqDTO dto);

	@Delete("delete faqboard where idx = #{idx}")
	int delete(int idx);
	
	

	

	

	
}
