package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.mylocationDTO;

@Repository
public interface HomeDAO {

	@Select("select * from mylocation where member_idx = #{member_idx}")
	mylocationDTO selectLocation(int member_idx);

	@Insert("insert into mylocation (member_idx, address, lat, lng) values (#{member_idx}, #{address}, #{lat}, #{lng})")
	int setLocation(mylocationDTO dto);
	
	@Update("update mylocation set address = #{address}, lat = #{lat}, lng = #{lng} where member_idx = #{member_idx}")
	int updateLocation(mylocationDTO dto);

}
