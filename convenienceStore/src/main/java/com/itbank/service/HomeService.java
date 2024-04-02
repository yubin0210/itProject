package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.itbank.model.MylocationDTO;
import com.itbank.repository.HomeDAO;

@Service
public class HomeService {
	
	@Autowired private HomeDAO dao;

	public MylocationDTO selectLocation(int member_idx) {
		return dao.selectLocation(member_idx);
	}

	public int setLocation(MylocationDTO dto) {
		return dao.setLocation(dto);
	}

	public int updateLocation(MylocationDTO dto) {
		return dao.updateLocation(dto);
	}

}
