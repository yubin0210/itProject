package com.itbank.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.mylocationDTO;
import com.itbank.repository.HomeDAO;

@Service
public class HomeService {
	
	@Autowired private HomeDAO dao;

	public mylocationDTO selectLocation(int member_idx) {
		return dao.selectLocation(member_idx);
	}

	public int setLocation(mylocationDTO dto) {
		return dao.setLocation(dto);
	}

	public int updateLocation(mylocationDTO dto) {
		return dao.updateLocation(dto);
	}

}
