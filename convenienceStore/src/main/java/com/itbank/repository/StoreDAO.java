package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.StoreDTO;
import com.itbank.model.StoreReviewDTO;

@Repository
public interface StoreDAO {
	
	@Select("select * from store where address like #{search}")
	List<StoreDTO> selectList(String search);
	
	@Select("select * from store where address like #{gu} and address like #{dong}")
	List<StoreDTO> selectListByDong(@Param("gu") String gu, @Param("dong") String dong);
	
	@Select("select * from store where address like #{search} or name like #{search}")
	List<StoreDTO> selectListBySearch(String search);
	
	@Select("select * from store")
	List<StoreDTO> selectListAll();
	
	@Select("select * from store where idx = #{idx}")
	StoreDTO selectOne(int idx);
	
	@Select("select count(*) from storeLike where store_idx = #{idx} and userid = #{userid}")
	int selectLike(@Param("idx") int idx, @Param("userid") String userid);
	
	@Insert("insert into storeLike (userid, store_idx) "
			+ "	values (#{userid}, #{store_idx})")
	int insertLike(@Param("userid") String userid, @Param("store_idx") String store_idx);
	
	@Delete("delete from storeLike "
			+ "	where userid = #{userid} and store_idx = #{store_idx}")
	int deleteLike(@Param("userid") String userid, @Param("store_idx") String store_idx);
	
	@Select("select * from storeReview where store_idx = #{store_idx} order by idx desc")
	List<StoreReviewDTO> selectReview(int store_idx);
	
	@Select("select * from storeReview where store_idx = #{store_idx} and userid = #{userid}")
	StoreReviewDTO selectMyReview(@Param("store_idx") int store_idx,@Param("userid") String userid);
	
	@Insert("insert into storeReview (userid, store_idx, score, content) "
			+ "	values(#{userid}, #{store_idx}, #{score}, #{content})")
	int insertReview(@Param("userid") String userid, @Param("store_idx") String store_idx, 
					 @Param("score") String score,@Param("content") String content);
	
	@Delete("delete from storeReview where userid = #{userid} and store_idx = #{store_idx}")
	int deleteReview(@Param("userid") String userid, @Param("store_idx") String store_idx);
	
	@Update("update storeReview set score=#{score}, content=#{content} "
			+ "	where store_idx = #{store_idx} and userid = #{userid}")
	int updateReview(@Param("userid") String userid, @Param("store_idx") String store_idx, 
					 @Param("score") String score, @Param("content") String content);
	
	@Select("SELECT store.*, s.likeCount"
			+ " FROM store"
			+ " JOIN ("
			+ "    SELECT store_idx, COUNT(*) AS likeCount"
			+ "    FROM storeLike"
			+ "    GROUP BY store_idx"
			+ "    ORDER BY COUNT(*) DESC"
			+ "    FETCH FIRST 1 ROWS ONLY"
			+ " )s ON store.idx = s.store_idx")
	StoreDTO selectStoreLikeTop();
}
