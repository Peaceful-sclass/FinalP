package com.wv.root;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.MemberBiz;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;
import com.wv.root.model.util.MailHandler;

@Controller
public class MemberController {
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
@Inject
MemberBiz biz;
@Inject
private JavaMailSender mailSender;


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

	return "home";
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
		rttr.addFlashAttribute("msg", false);    //컨트롤러값 header로 뿌리기
	}else {
		session.setAttribute("member", login);
		session.setAttribute("teamInfo", null);
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
   //아이디 비번찾기 화면
   @RequestMapping(value="findform.do", method = RequestMethod.GET)
   public String findform() throws Exception{   	
	   return "findmember";
   }
   
   @RequestMapping(value="findid.do", method = RequestMethod.POST)
   @ResponseBody
   	public Boolean findid(String member_email) throws Exception{
	   	List <String> res = biz.findid(member_email);
		MailHandler sendMail = new MailHandler(mailSender);
		if(res.isEmpty()) {
			return false;
		}else {
		sendMail.setSubject("[WV] 계정 아이디 찾기 ");
		sendMail.setText(
		new StringBuffer().append("<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\"\r\n" + 
				"				border=\"0\" bgcolor=\"#ffffff\"\r\n" + 
				"				style=\"max-width: 640px; margin: 0 auto; border: 1px solid #cccccc;\"><link rel=\"preconnect\" href=\"https://fonts.gstatic.com\">\r\n" + 
				"<link href=\"https://fonts.googleapis.com/css2?family=Lexend+Mega&display=swap\" rel=\"stylesheet\">\r\n" + 
				"\r\n" + 
				"				<tbody>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"						<td width=\"88%\" height=\"25\" bgcolor=\"#DB631F\"><h1 style=\"font-size: 2rem;letter-spacing: 0.125em;font-weight: 300;font-family: 'Lexend Mega', sans-serif;color:#fff;\">WORKING VILLAGE</h1></td>\r\n" + 
				"						<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\"\r\n" + 
				"							style=\"font-size: 18px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; font-weight: bold; color: #1e1e1e\">"+member_email+" 으로 가입된 회원님의 아이디는 총 "+res.size()+"개 입니다.</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"25\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\"\r\n" + 
				"							style=\"font-size: 14px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"						</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\">\r\n" + 
				"\r\n" + 
				"							<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
				"								style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"\r\n" + 
				"								<tbody>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"25\" colspan=\"5\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"3%\"></td>\r\n" + 
				"										<th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\"\r\n" + 
				"											width=\"22%\" style=\"font-size: 14px; font-weight: normal\">아이디</th>\r\n" + 
				"										<td width=\"2%\"></td>\r\n" + 
				"										<td valign=\"top\" width=\"70%\"\r\n" + 
				"											style=\"font-size: 14px; font-weight: bold; word-break: break-all\">"+res+"</td>\r\n" + 
				"										<td width=\"3%\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"8\" colspan=\"5\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"3%\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"27\" colspan=\"5\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"									<tr>\r\n" + 
				"										<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
				"									</tr>\r\n" + 
				"								</tbody>\r\n" + 
				"\r\n" + 
				"							</table>\r\n" + 
				"\r\n" + 
				"						</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"30\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\">\r\n" + 
				"\r\n" + 
				"							<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
				"								bgcolor=\"#f8f8f8\"\r\n" + 
				"								style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"							</table>\r\n" + 
				"\r\n" + 
				"						</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"24\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"58\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"1\" colspan=\"3\" bgcolor=\"#e6e6e6\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"16\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"						<td width=\"88%\"\r\n" + 
				"							style=\"font-size: 12px; line-height: 18px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '돋움', Dotum; letter-spacing: -1px; color: #767676\">\r\n" + 
				"\r\n" + 
				"							본 메일은 발신전용입니다.</td>\r\n" + 
				"						<td width=\"6%\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"					<tr>\r\n" + 
				"						<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
				"					</tr>\r\n" + 
				"				</tbody>\r\n" + 
				"\r\n" + 
				"			</table>").toString());		
		sendMail.setFrom("sjeys14@gmail.com", "WV-SERVICE ");		
		sendMail.setTo(member_email); //초대할ID의 email조회
		sendMail.send();
		return true;
		}
   }
   @RequestMapping(value="findpw.do", method = RequestMethod.POST)
   @ResponseBody
   public Boolean findpw(MemberDto dto) throws Exception {
	   String pw = biz.findpw(dto);
	   MailHandler sendMail = new MailHandler(mailSender);
	   if(pw==null || pw=="") {
		   return false;
	   }else {
		   sendMail.setSubject("[WV] 비밀번호 찾기 ");
		   sendMail.setText(new StringBuffer().append("<table align=\"center\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\" style=\"max-width: 640px; margin: 0 auto; border: 1px solid #cccccc;\">\r\n" + 
		   		"		<tbody>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
		   		"				<td width=\"88%\" height=\"25\" bgcolor=\"#DB631F\"><h1 style=\"font-size: 2rem; letter-spacing: 0.125em; font-weight: 300; font-family: 'Lexend Mega', sans-serif; color: #fff;\">WORKING VILLAGE</h1></td>\r\n" + 
		   		"				<td width=\"6%\" height=\"25\" bgcolor=\"#DB631F\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"45\" colspan=\"3\" bgcolor=\"#DB631F\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"35\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"				<td width=\"88%\" style=\"font-size: 18px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; font-weight: bold; color: #1e1e1e\">회원님의 비밀번호 입니다.</td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"25\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"				<td width=\"88%\"\r\n" + 
		   		"					style=\"font-size: 14px; line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
		   		"				</td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"				<td width=\"88%\">\r\n" + 
		   		"					<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
		   		"						<tbody>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"25\" colspan=\"5\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"3%\"></td>\r\n" + 
		   		"								<th align=\"left\" colspan=\"1\" rowspan=\"1\" valign=\"top\" width=\"22%\" style=\"font-size: 14px; font-weight: normal\">비밀번호</th>\r\n" + 
		   		"								<td width=\"2%\"></td>\r\n" + 
		   		"								<td valign=\"top\" width=\"70%\" style=\"font-size: 14px; font-weight: bold; word-break: break-all\">"+pw+"</td>\r\n" + 
		   		"								<td width=\"3%\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"8\" colspan=\"5\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"3%\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"27\" colspan=\"5\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"							<tr>\r\n" + 
		   		"								<td width=\"100%\" height=\"1\" colspan=\"5\" bgcolor=\"#bebebe\"></td>\r\n" + 
		   		"							</tr>\r\n" + 
		   		"						</tbody>\r\n" + 
		   		"					</table>\r\n" + 
		   		"				</td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"30\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"				<td width=\"88%\">\r\n" + 
		   		"\r\n" + 
		   		"					<table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"\r\n" + 
		   		"						bgcolor=\"#f8f8f8\"\r\n" + 
		   		"						style=\"line-height: 22px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '굴림', gulim; letter-spacing: -1px; color: #1e1e1e\">\r\n" + 
		   		"					</table>\r\n" + 
		   		"				</td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"24\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"58\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"1\" colspan=\"3\" bgcolor=\"#e6e6e6\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"16\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"				<td width=\"88%\" style=\"font-size: 12px; line-height: 18px; font-family: Apple SD Gothic Neo, sans-serif, '맑은고딕', Malgun Gothic, '돋움', Dotum; letter-spacing: -1px; color: #767676\">\r\n" + 
		   		"				본 메일은 발신전용입니다.</td>\r\n" + 
		   		"				<td width=\"6%\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"			<tr>\r\n" + 
		   		"				<td width=\"100%\" height=\"18\" colspan=\"3\"></td>\r\n" + 
		   		"			</tr>\r\n" + 
		   		"		</tbody>\r\n" + 
		   		"\r\n" + 
		   		"	</table>").toString());
		   sendMail.setFrom("sjeys14@gmail.com", "WV-SERVICE ");
		   sendMail.setTo(dto.getMember_email()); //초대할ID의 email조회
		   sendMail.send();
		   return true;
	   }
   }

}
