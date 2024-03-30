package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.CartDTO;
import com.itbank.model.MylocationDTO;
import com.itbank.model.ProductDTO;
import com.itbank.model.StoreDTO;
import com.itbank.model.ProductReviewDTO;

@Repository
public interface ProductDAO {
	
	@Select("select product.* from product"
			+ "	join inventory"
			+ "	on product.idx = inventory.product_idx"
			+ "	where inventory.store_idx=#{idx} and inventory.cnt > 0 order by product.idx")
	List<ProductDTO> selectProductListByStore(int idx);
	
	@Select("select product.* from product"
			+ "	join inventory"
			+ "	on product.idx = inventory.product_idx"
			+ "	where inventory.store_idx=#{store_idx} and inventory.cnt > 0 and product.name like #{search} order by product.idx")
	List<ProductDTO> selectProductSearchListByStore(@Param("store_idx") String store_idx, @Param("search") String search);
	
	@Select("select * from product where idx = #{product_idx}")
	ProductDTO selectOne(@Param("product_idx") String product_idx);
	
	@Select("select cnt from inventory where product_idx = #{product_idx} and store_idx = #{store_idx}")
	int InventoryCount(@Param("store_idx") String store_idx, @Param("product_idx") String product_idx);
	
	@Select("select count(*) from cart where userid = #{userid}")
	int selectCartListCount(String userid);
	
	@Insert("insert into cart (userid, store_idx, product_idx, cnt, eventCnt)"
			+ "	values (#{userid}, #{store_idx}, #{product_idx}, #{count}, #{eventCount})")
	int insertCart(@Param("userid") String userid, @Param("store_idx") String store_idx, 
			       @Param("product_idx") String product_idx, @Param("count") int count, @Param("eventCount") int eventCount);
	
	@Update("update cart set cnt = #{count}, eventcnt = #{eventCount}"
			+ " where userid = #{userid} and store_idx = #{store_idx} and product_idx = #{product_idx}")
	int updateCart(@Param("userid") String userid, @Param("store_idx") String store_idx, 
			       @Param("product_idx") String product_idx, @Param("count") int count, @Param("eventCount") int eventCount);
	
	@Delete("delete from cart where userid = #{userid}")
	int deleteAllCart(@Param("userid") String userid);
	
	@Select("select store_idx from cart where userid= #{userid} order by idx desc fetch FIRST 1 rows only")
	Integer selectCartStore(String userid);	
	
	@Select("select event from product where idx = #{product_idx}")
	String selectProductEvent(String product_idx);
	
	@Select("select * from cart where userid = #{userid}")
	List<CartDTO> selectCart(@Param("userid") String userid);
	
	@Select("select * from product")
	List<ProductDTO> selectProductList();
	
	@Select("select * from product where name like #{search}")
	List<ProductDTO> selectProductListBySearch(@Param("search") String search);
	
	@Select("select count(*) from productLike where product_idx = #{idx} and userid = #{userid}")
	int selectLike(@Param("idx") String idx, @Param("userid") String userid);
	
	@Select("select * from productReview where product_idx = #{idx}")
	List<ProductReviewDTO> selectReview(String idx);
	
	@Select("select count(*) from productLike where product_idx = #{idx}")
	int selectProductLikeCount(String idx);
	
	@Select("SELECT store.*,"
			+ "       SQRT("
			+ "           POWER(store.lat - myloc.lat, 2) + "
			+ "           POWER(store.lng - myloc.lng, 2)"
			+ "       ) AS distance"
			+ "	FROM store"
			+ "	CROSS JOIN (SELECT lat, lng "
			+ "            FROM mylocation "
			+ "            WHERE member_idx = #{member_idx}) myloc"
			+ "	JOIN Inventory ON Inventory.store_idx = store.idx"
			+ "	WHERE Inventory.product_idx = #{idx} AND Inventory.cnt > 0"
			+ "	ORDER BY distance ASC")
	List<StoreDTO> selectStoreListByInventoryAndMyLoc(@Param("member_idx") int member_idx, @Param("idx") String idx);
	
	@Select("select store.* from store join Inventory on inventory.store_idx = store.idx"
			+ "			where inventory.product_idx = #{idx} and inventory.cnt > 0 "
			+ "			order by store.idx")
	List<StoreDTO> selectStoreListByInventory(String idx);
	
	@Insert("insert into productLike (userid, product_idx)"
			+ "	values (#{userid}, #{product_idx})")
	int insertProductLike(@Param("userid") String userid, @Param("product_idx") String product_idx);
	
	@Delete("delete from productLike where userid = #{userid} and product_idx = #{product_idx}")
	int deleteProductLike(@Param("userid") String userid, @Param("product_idx") String product_idx);
	
	@Insert("insert into productReview (userid, score, content, product_idx) "
			+ "	values (#{userid}, #{score}, #{content}, #{product_idx})")
	int insertProductReview(@Param("userid") String userid, @Param("score") String score, 
							@Param("content") String content, @Param("product_idx")String product_idx);
	
	@Select("select * from productReview where product_idx = #{idx} and userid = #{userid}")
	ProductReviewDTO selectMyReview(@Param("idx") String idx, @Param("userid") String userid);
	
	@Delete("delete from productReview where userid = #{userid} and product_idx = #{product_idx}")
	int deleteProductReview(@Param("userid") String userid, @Param("product_idx") String product_idx);
	
	@Select("select * from mylocation where member_idx = #{member_idx}")
	MylocationDTO selectMyLocation(int member_idx);
	
	@Select("SELECT product.*, p.likeCount "
			+ " FROM product"
			+ " JOIN ("
			+ "    SELECT product_idx, COUNT(*) AS likeCount"
			+ "    FROM productLike"
			+ "    GROUP BY product_idx"
			+ "    ORDER BY COUNT(*) DESC"
			+ "    FETCH FIRST 10 ROWS ONLY"
			+ ")p ON product.idx = p.product_idx")
	List<ProductDTO> selectProductLikeTop();

}






