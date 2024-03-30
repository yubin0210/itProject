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

}
