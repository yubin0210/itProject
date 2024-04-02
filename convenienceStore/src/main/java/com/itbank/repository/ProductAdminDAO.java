package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.ProductAdminDTO;

@Repository
public interface ProductAdminDAO {
	
	List<ProductAdminDTO> selectList();
	
	int selectCount(HashMap<String,Object> param);
	
	List<ProductAdminDTO> searchList(HashMap<String, Object> param);
	
	ProductAdminDTO detail(int idx);
	
	ProductAdminDTO thisName(String name);
	
	int add(ProductAdminDTO dto);
	
	int addInv(int idx);

	int update(ProductAdminDTO dto);

	int delete(int idx);
	
	int deleteInv(int idx);
	
}
