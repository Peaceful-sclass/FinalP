package com.wv.root.model.biz;

import java.util.List;

import com.wv.root.model.dto.ChatDto;
import com.wv.root.model.util.chatajax;
import com.wv.root.model.util.chatajaxres;

public interface ChatBiz {

	public void msg_send(ChatDto dto);
	
	public List<ChatDto> chatList(int chatting_no);
	
	public List<chatajaxres> chatajax(chatajax chatajax);
}
