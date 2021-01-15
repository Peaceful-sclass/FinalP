package com.wv.root;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.MemberBiz;
import com.wv.root.model.dto.MemberDto;

@Controller
public class MemberController {
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
@Inject
MemberBiz biz;

// 회원가입 get 회원가입폼으로 이동할때
@RequestMapping(value = "/register.do", method = RequestMethod.GET)
public void getRegister() throws Exception {
	logger.info("get register");
}

// 회원가입 post 회원가입 버튼눌렀을때
@RequestMapping(value = "/register.do", method = RequestMethod.POST)
public String postRegister(MemberDto dto) throws Exception {
	logger.info("post register");
	
	biz.register(dto);
	
	return "home";
}

//로그인
@RequestMapping(value = "/login.do", method = RequestMethod.POST)
public String login(MemberDto vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
	logger.info("post login");
	
	HttpSession session = req.getSession();
	MemberDto login = biz.login(vo);
	
	if(login == null) {
		session.setAttribute("member", null);
		rttr.addFlashAttribute("msg", false);
	}else {
		session.setAttribute("member", login);
	}
	
	return "redirect:/";
}

@RequestMapping(value = "/logout", method = RequestMethod.GET)
public String logout(HttpSession session) throws Exception{
	
	session.invalidate();
	
	return "redirect:/";
}
}
