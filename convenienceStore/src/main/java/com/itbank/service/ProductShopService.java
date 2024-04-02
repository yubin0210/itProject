package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.CntDTO;
import com.itbank.model.ProductShopDTO;
import com.itbank.repository.ProductShopDAO;

@Service
public class ProductShopService {
	
	@Autowired private ProductShopDAO dao;
	
	public int selectCount(HashMap<String,Object> param) {
		return dao.selectCount(param);
	}
	
	public List<ProductShopDTO> searchList(HashMap<String, Object> param) {
		return dao.searchList(param);
	}

	public ProductShopDTO detail(HashMap<String, Object> param) {
		return dao.detail(param);
	}

	public int updateCnt(CntDTO dto) {
		return dao.updateCnt(dto);
	}

}
