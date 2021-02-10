package com.wv.root;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.common.interceptor.SessionConfig;
import com.wv.root.model.biz.MemberBiz;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Controller
public class MemberController {
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
@Inject
MemberBiz biz;



@RequestMapping(value = "rehome.do", method = RequestMethod.GET)
public String reHome() throws Exception {
	logger.info("rehome.do");
	return "redi";
}


// 회원가입 get 회원가입폼으로 이동할때
@RequestMapping(value = "register.do", method = RequestMethod.GET)
public void getRegister() throws Exception {
	logger.info("get register");
}

// 회원가입 post 회원가입 버튼눌렀을때
@RequestMapping(value = "register.do", method = RequestMethod.POST)
public String postRegister(MultipartHttpServletRequest mtfRequest, Model model, MemberDto dto) throws Exception {
	logger.info("post register");
	MultipartFile pfimg = mtfRequest.getFile("member_pfimg");	
	int result = biz.idChk(dto);
	try {
		if(result == 1) {
			return "register.do";
		}else if(result == 0) {
			if(pfimg.isEmpty()==false) {//이미지 있는지 확인
				String path = mtfRequest.getSession().getServletContext().getRealPath("/images"); //경로설정
				String uid = UUID.randomUUID().toString().replaceAll("-", ""); //이미지이름 중복방지
				String oriFileName = pfimg.getOriginalFilename(); //이미지 원래이름
				String svaeFileName = uid +"_"+ oriFileName; //db에 경로저장할 이름
				File uploadFile = new File(path+File.separator+svaeFileName);
				try {
					pfimg.transferTo(uploadFile);
					dto.setMember_photo("images/"+svaeFileName); //객체에 이미지 경로 담아줌
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}else {
				String defaultimg = "images/user-profile.png";
				dto.setMember_photo(defaultimg); // 디폴트이미지 설정
				System.out.println(dto.getMember_photo());
			}
			biz.register(dto);
		}
		// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
		// 존재하지 않는다면 -> register
	} catch (Exception e) {
		throw new RuntimeException();
	}
	return "redirect:/";
	//redirect와 forward차이점
	//redirect:redirect를 사용하여 응답 페이지를 부르면 사용자가 실수 혹은 고의로 글쓰기 응답 페이지에서 새로고침을 누른다고 하더라도, 처음의 요청 정보는 존재하지 않으므로 게시물이 여러 번 등록되지 않습니다. 
	// 그렇기 때문에 시스템에 변화가 생기는 요청(회원가입, 글쓰기 등)의 경우에는 redirection을 사용
	//forward:Foward는 다음으로 이동 할 URL로 요청정보를 그대로 전달합니다. 그렇기 때문에 사용자가 최초로 요청한 요청정보는 다음 URL에서도 유효합니다.
	//시판을 제작하는 과정에서는 시스템에 변화가 생기지 않는 단순 조회 요청(글 목록 보기, 검색)의 경우 forward로 응답
}

//로그인
@RequestMapping(value = "login.do", method = RequestMethod.POST)
public String login(MemberDto dto, TeamDto teamdto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
	/*rttr.addFlashAttribute로 전달한 값은 url뒤에 붙지 않는다. 
            일회성이라 리프레시할 경우 데이터가 소멸한다.
            또한 2개이상 쓸 경우, 데이터는 소멸한다. 
            따라서 맵을 이용하여 한번에 값전달해야한다.*/
	/*rttr.addAttribute로 전달한 값은 url뒤에  붙으며, 
            리프레시해도 데이터가 유지된다.*/
	logger.info("post login");
	
	HttpSession session = req.getSession();
	MemberDto login = biz.login(dto);
	
	if(login == null) {
		session.setAttribute("member", null);
		rttr.addFlashAttribute("msg", false); //컨트롤러값 header로 뿌리기
	}else {
		session.setAttribute("member", login);
		session.setAttribute("teamInfo", null);
		List<TeamMemberDto> team = biz.teamInfo(login.getMember_no()).getTmlist();
		session.setAttribute("team", team); //로그인하면서 팀정보 추가
		System.out.println("[member]  "+session.getId());
		
		//OnlineTM 설정
		SessionConfig.setOnlineTM(session.getId(), login.getMember_id());
	}
	String referer = req.getHeader("Referer"); //원래 페이지로 이동
	
	return "redirect:"+referer;
	// "redirect:/" /로 돌아가기
}



@RequestMapping(value = "logout.do", method = RequestMethod.GET)
public String logout(HttpSession session, HttpServletRequest request) throws Exception{
	
	session.invalidate();
	request.getSession(true); //세션을 제거 후 새로운 세션적용
	
	return "redirect:/";
}

//수정
@RequestMapping(value="test.do", method = RequestMethod.GET)
public String registerUpdateView() throws Exception{
	
	return "memberUpdateView";
}

//수정버튼 눌렀을때
@RequestMapping(value="memberUpdate.do", method = RequestMethod.POST)
public String registerUpdate(MultipartHttpServletRequest mtfRequest, Model model, MemberDto dto, HttpSession session) throws Exception{
	MultipartFile pfimg = mtfRequest.getFile("member_pfimg");	
	if(pfimg.isEmpty()==false) {
		String path = mtfRequest.getSession().getServletContext().getRealPath("/images");
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		String oriFileName = pfimg.getOriginalFilename(); 
		String svaeFileName = uid +"_"+ oriFileName; 
		File uploadFile = new File(path+File.separator+svaeFileName);
		try {
			pfimg.transferTo(uploadFile);
			dto.setMember_photo("images/"+svaeFileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
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

 //아이디 중복체크
   @ResponseBody
   @RequestMapping(value="idChk.do", method = RequestMethod.POST)
   public int idChk(MemberDto dto) throws Exception {
   	int result = biz.idChk(dto);
   	return result;
   }   
   //아이디 비번찾기 화면
   @RequestMapping(value="findform.do", method = RequestMethod.GET)
   public String findform() throws Exception{   	
	   return "findmember";
   }
   
   @RequestMapping(value="findid.do", method = RequestMethod.POST)
   @ResponseBody
   	public Boolean findid(String member_email) throws Exception{
	   	List <String> res = biz.findid(member_email);
		if(res.isEmpty()) {
			return false;
		}else {
			biz.sendid(member_email, res);		
			return true;
		}
   }
   @RequestMapping(value="findpw.do", method = RequestMethod.POST)
   @ResponseBody
   public Boolean findpw(MemberDto dto) throws Exception {
	   String pw = biz.findpw(dto);
	   if(pw==null || pw=="") {
		   return false;
	   }else {
		   biz.sendpw(dto, pw);		   
		   return true;
	   }
   }

}
