package com.wv.root.model.dao;

import java.util.List;

import com.wv.root.model.dto.ChatDto;
import com.wv.root.model.util.chatajax;
import com.wv.root.model.util.chatajaxres;

public interface ChatDao {
	String NAMESPACE = "chat.";
	
	//메시지 보내기
	public void msg_send(ChatDto dto);
	
	//채팅방 클릭시
	public List<ChatDto> chatList(int chatting_no);
	
	public List<chatajaxres> chatajax(chatajax chatajax);

}
