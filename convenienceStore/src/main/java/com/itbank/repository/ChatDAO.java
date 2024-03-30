package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.ChatRoomDTO;
import com.itbank.model.MessageDTO;

@Repository
public interface ChatDAO {

	@Insert("insert into message (chat_idx, writer, content) values (#{chat_idx}, #{writer}, #{content})")
	int insertChat(MessageDTO dto);

	@Insert("insert into chat (userid1) values (#{userid}) ")
	int createRoom(String userid);

	@Select("select * from chat where userid1 = #{userid} and status = 0 order by idx desc")
	List<ChatRoomDTO> selectRoom(String userid);

	@Select("select userid1 from chat group by userid1")
	List<String> chatList();

	@Update("update chat set status = 1 where userid1 = #{userid}")
	int exit(String userid);

	@Select("select S.*, M.nickname from message S join member M on S.writer = M.userid where chat_idx = #{chat_idx}")
	List<MessageDTO> getMsg(int chat_idx);

	@Select("select idx from chat where status = 0 and userid1 = #{userid}")
	int getIdx(String userid);

	
}
