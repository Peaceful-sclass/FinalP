package com.wv.root.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wv.root.model.dto.ChatDto;
import com.wv.root.model.util.chatajax;
import com.wv.root.model.util.chatajaxres;

@Repository
public class ChatDaoImpl implements ChatDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void msg_send(ChatDto dto) {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE+"msg_send", dto);
	}

	@Override
	public List<ChatDto> chatList(int chatting_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"chatList", chatting_no);
	}

	@Override
	public List<chatajaxres> chatajax(chatajax chatajax) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"chatajax", chatajax);
	}

}
