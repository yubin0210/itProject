package com.itbank.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.FileComponent;
import com.itbank.model.ProductAdminDTO;
import com.itbank.repository.ProductAdminDAO;

@Service
public class ProductAdminService {

	@Autowired private FileComponent fc;
	@Autowired private ProductAdminDAO dao;

	public List<ProductAdminDTO> selectList() {
		return dao.selectList();
	}

	public int selectCount(HashMap<String,Object> param) {
		return dao.selectCount(param);
	}
	
	public List<ProductAdminDTO> searchList(HashMap<String, Object> param) {
		return dao.searchList(param);
	}

	public ProductAdminDTO detail(int idx) {
		return dao.detail(idx);
	}
	
	public ProductAdminDTO thisName(String name) {
		return dao.thisName(name);
	}
	
	public int add(ProductAdminDTO dto) {
		MultipartFile f = dto.getUpload();
		String result = "";
		result += fc.upload(f);
		dto.setImage(result);
		dto.setUpload(null);
		return dao.add(dto);
		
	}

	public int update(ProductAdminDTO dto) {
		if(dto.getUpload().isEmpty() == false ) {
			File fD = new File("C:\\upload", dto.getImage());
			if(fD.exists()) {fD.delete(); }
			dto.setImage(null);
			MultipartFile f = dto.getUpload();
			String result = "";
			result += fc.upload(f);
			dto.setImage(result);
		}
		return dao.update(dto);
	}

	public int delete(int idx) {
		ProductAdminDTO dto = dao.detail(idx);
		File fD = new File("C:\\upload", dto.getImage());
		if(fD.exists()) {fD.delete(); }
		dto.setImage(null);
		return dao.delete(idx);
	}

	public int addInv(int idx) {
		return dao.addInv(idx);
	}

	public int deleteInv(int idx) {
		return dao.deleteInv(idx);
	}

}