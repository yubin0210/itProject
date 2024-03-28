package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.ProductDTO;

@Repository
public interface ProductAdminDAO {
	
	@Select("select * from product order by idx desc")
	List<ProductDTO> selectList();
	
	@Select("select count(*) from product where name like '%' || #{name} || '%' and category_idx like '%' || #{category_idx} || '%'")
	int selectCount(HashMap<String,Object> param);
	
	@Select("select * from product where name like '%' || #{name} || '%' and category_idx like '%' || #{category_idx} || '%' order by idx desc offset #{paging.offset} rows fetch next #{paging.fetch} rows only")
	List<ProductDTO> searchList(HashMap<String, Object> param);
	
	@Select("select * from product where idx = #{idx}")
	ProductDTO detail(int idx);
	
	@Select("select * from product where name = #{name}")
	ProductDTO thisName(String name);
	
	int add(ProductDTO dto);

	int update(ProductDTO dto);

	@Delete("delete from product where idx = #{idx}")
	int delete(int idx);
	
}
