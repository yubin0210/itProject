package com.itbank.repository;

import org.springframework.stereotype.Repository;

import com.itbank.model.MylocationDTO;

@Repository
public interface HomeDAO {

	MylocationDTO selectLocation(int member_idx);

	int setLocation(MylocationDTO dto);
	
	int updateLocation(MylocationDTO dto);

}
