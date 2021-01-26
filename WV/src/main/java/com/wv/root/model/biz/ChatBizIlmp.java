package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.ChatDao;
import com.wv.root.model.dto.ChatDto;
import com.wv.root.model.util.chatajax;
import com.wv.root.model.util.chatajaxres;

@Service
public class ChatBizIlmp implements ChatBiz{

	@Autowired
	private ChatDao dao;

	@Override
	public void msg_send(ChatDto dto) {
		// TODO Auto-generated method stub
		
		dao.msg_send(dto);
	}

	@Override
	public List<ChatDto> chatList(int chatting_no) {
		// TODO Auto-generated method stub
		return dao.chatList(chatting_no);
	}

	@Override
	public List<chatajaxres> chatajax(chatajax chatajax) {
		// TODO Auto-generated method stub
		return dao.chatajax(chatajax);
	}
}
