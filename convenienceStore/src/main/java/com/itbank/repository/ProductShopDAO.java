package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.ProductDTO;

@Repository
public interface ProductShopDAO {
	
	@Select("select count(*) from product where name like '%' || #{name} || '%' and category_idx like '%' || #{category_idx} || '%'")
	int selectCount(HashMap<String,Object> param);
	
	@Select("select * from product where name like '%' || #{name} || '%' and category_idx like '%' || #{category_idx} || '%' order by idx desc offset #{paging.offset} rows fetch next #{paging.fetch} rows only")
	List<ProductDTO> searchList(HashMap<String, Object> param);

	@Select("select * from product where idx = #{idx}")
	ProductDTO detail(int idx);

}
