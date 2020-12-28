package com.wv.root;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.MemberBiz;
import com.wv.root.model.dto.MemberDto;

@Controller
public class MemberController {
private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz biz;
	
	BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/login.do")  //사이트주소값(이거때문에틀림
	public String loginform() {
		logger.info("[LOGINFORM]");
		return "login";       //리턴할 jsp이름 login
	}
	
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	public Map<String, Boolean> ajaxLogin(HttpSession session, @RequestBody MemberDto dto){
		/*
		 * @ResponseBody : 응답시 java객체를 response객체에 binding
		 * @RequestBody : 요청시 request객체로 넘어오는 데이터를 java 객체로
		 */
		
		logger.info("[LOGIN]");
		
		MemberDto res =biz.login(dto);
		boolean check = false;
		if(res!= null) {
			if(passwordEncoder.matches(dto.getMemberpw(), res.getMemberpw())){ //비번같은지
			session.setAttribute("login", res);
		    check=true;
			}
		}
		
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map;
	}
	
	@RequestMapping("/registerform.do")
	public String memberInsertForm() {
		return "register";    //리턴할jsp파일이름 register
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String memberInsert(HttpSession session, @RequestBody MemberDto dto) {
		int res = 0;
		System.out.println(dto.getMemberpw());
		dto.setMemberpw(passwordEncoder.encode(dto.getMemberpw()));
		System.out.println(dto.getMemberpw());
		res = biz.insert(dto);             //biz로보내기
		
		if(res>0) {
			return "redirect:loginform.do";     //회원가입되었으면 로그인페이지
		}else {
			return "redirect:registerform.do";   //안되었으면 회원가입페이지 
		}
	}
}
