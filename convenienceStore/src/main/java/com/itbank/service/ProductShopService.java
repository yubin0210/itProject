package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.ProductDTO;
import com.itbank.repository.ProductShopDAO;

@Service
public class ProductShopService {
	
	@Autowired private ProductShopDAO dao;
	
	public int selectCount(HashMap<String,Object> param) {
		return dao.selectCount(param);
	}
	
	public List<ProductDTO> searchList(HashMap<String, Object> param) {
		return dao.searchList(param);
	}

	public ProductDTO detail(int idx) {
		return dao.detail(idx);
	}

}
