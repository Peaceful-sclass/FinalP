package com.wv.root;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wv.root.model.biz.ChatBiz;
import com.wv.root.model.dto.ChatDto;
import com.wv.root.model.util.chatajax;
import com.wv.root.model.util.chatajaxres;


@Controller
public class ChatController {
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatBiz biz;
	@RequestMapping(value = "Chatting.do", method = RequestMethod.GET)
	public String chatting(Model model) {
		logger.info("chat");
		
		//지금 클릭한 채팅방 번호 넘겨줘야함
		int chatting_no = 1;
		
		model.addAttribute("chatList", biz.chatList(chatting_no));
		
		
		return "chat";
	}
	
	@ResponseBody
	@RequestMapping(value = "msg_send.do", method = RequestMethod.POST)
	public void chat(@RequestBody Map<String, Object> map){
		logger.info("msg_send");
		
		ChatDto dto = new ChatDto();
		dto.setChatting_no( Integer.parseInt(String.valueOf(map.get("chatting_no"))));
		dto.setMember_id( String.valueOf(map.get("member_id")));
		dto.setContent( String.valueOf(map.get("content")));
		
		biz.msg_send(dto);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "read_ajax.do", method = RequestMethod.POST)
	public JSONArray read_ajax(@RequestBody Map<String, Object> map){
		logger.info("read_ajax");
		
		String date =  String.valueOf(map.get("date"));
		int chatting_no = Integer.parseInt(String.valueOf(map.get("chatting_no")));
		chatajax tmp = new chatajax(chatting_no, date);
		
		List<chatajaxres> rlist = biz.chatajax(tmp);

		JSONArray jlist = new JSONArray();
		if(rlist.size()==0) {
			return jlist;
		}else {
			for(int i=0; i<rlist.size(); i++) {
				JSONObject ojt = new JSONObject();
				ojt.put("member_id", rlist.get(i).getMember_id());
				ojt.put("content", rlist.get(i).getContent());
				ojt.put("regdate", rlist.get(i).getRegdate());
				
				jlist.add(ojt);
			}
			return jlist;
		}
		
	}

}
