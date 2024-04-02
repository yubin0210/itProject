package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.CntDTO;
import com.itbank.model.ProductShopDTO;

@Repository
public interface ProductShopDAO {
	
	int selectCount(HashMap<String,Object> param);
	
	List<ProductShopDTO> searchList(HashMap<String, Object> param);

	ProductShopDTO detail(HashMap<String, Object> param);

	int updateCnt(CntDTO dto);

}
