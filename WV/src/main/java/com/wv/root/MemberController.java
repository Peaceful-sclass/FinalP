package com.wv.root;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.MemberBiz;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Controller
public class MemberController {
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
@Inject
MemberBiz biz;

// 회원가입 get 회원가입폼으로 이동할때
@RequestMapping(value = "register.do", method = RequestMethod.GET)
public void getRegister() throws Exception {
	logger.info("get register");
}

// 회원가입 post 회원가입 버튼눌렀을때
@RequestMapping(value = "register.do", method = RequestMethod.POST)
public String postRegister(MemberDto dto) throws Exception {
	logger.info("post register");
	biz.register(dto);

	return "home";
}

//로그인
@RequestMapping(value = "login.do", method = RequestMethod.POST)

public String login(MemberDto dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
	/*rttr.addFlashAttribute로 전달한 값은 url뒤에 붙지 않는다. 
            일회성이라 리프레시할 경우 데이터가 소멸한다.
            또한 2개이상 쓸 경우, 데이터는 소멸한다. 
            따라서 맵을 이용하여 한번에 값전달해야한다.*/
	/*rttr.addAttribute로 전달한 값은 url뒤에  붙으며, 
            리프레시해도 데이터가 유지된다.*/

public String login(MemberDto vo, TeamDto teamdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{

	logger.info("post login");
	
	HttpSession session = req.getSession();
	MemberDto login = biz.login(vo);
	
	if(login == null) {
		session.setAttribute("member", null);
		rttr.addFlashAttribute("msg", false);    //컨트롤러값 header로 뿌리기
	}else {
		session.setAttribute("member", login);
		List<TeamMemberDto> team = biz.teamInfo(login.getMember_no()).getTmlist();
		session.setAttribute("team", team); //로그인하면서 팀정보 추가
	}
	
	return "redirect:/";
	// "redirect:/" /로 돌아가기
}

@RequestMapping(value = "logout.do", method = RequestMethod.GET)
public String logout(HttpSession session) throws Exception{
	
	session.invalidate();
	
	return "redirect:/";
}

//수정
@RequestMapping(value="test.do", method = RequestMethod.GET)
public String registerUpdateView() throws Exception{
	
	return "memberUpdateView";
}

//수정버튼 눌렀을때
@RequestMapping(value="memberUpdate.do", method = RequestMethod.POST)
public String registerUpdate(MemberDto dto, HttpSession session) throws Exception{
	
	biz.memberUpdate(dto);
	
	session.invalidate();
	
	return "redirect:/";
}

// 회원 탈퇴 get
@RequestMapping(value="dest.do", method = RequestMethod.GET)
public String memberDeleteView() throws Exception{
	
	return "memberDeleteView";
}

// 회원 탈퇴 post
@RequestMapping(value="memberDelete.do", method = RequestMethod.POST)
                                                         
public String memberDelete(MemberDto dto, HttpSession session, RedirectAttributes rttr) throws Exception{
	
	// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
	MemberDto member = (MemberDto) session.getAttribute("member");
	// 세션에있는 비밀번호
	String sessionPass = member.getMember_pw();
	// vo로 들어오는 비밀번호
	String voPass = dto.getMember_pw();
	
	if(!(sessionPass.equals(voPass))) {
		rttr.addFlashAttribute("msg", false);
		return "redirect:memberDeleteView";
	}
	biz.memberDelete(dto);
	session.invalidate();
	return "redirect:/";
}

//탈퇴 비번확인
   @ResponseBody
   @RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int passChk(MemberDto dto) throws Exception {
		int result = biz.passChk(dto);
		return result;
	
   }
   

}
