package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.FaqDTO;
import com.itbank.repository.InquiryDAO;

@Service
public class InquiryService {

	@Autowired private InquiryDAO ir;
	
	public List<FaqDTO> selectList() {
		return ir.selectList();
	}

	public int insert(FaqDTO dto) {
		return ir.insert(dto);
	}

	public int delete(int idx) {
		return ir.delete(idx);
	}



	

}
