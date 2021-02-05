package com.wv.root;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.TeamBiz;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.Email;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Controller
public class TeamController {

	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	private TeamBiz teambiz;
	//@Autowired
	//private JavaMailSender mailSender;
	

	@RequestMapping(value = "teamcreateform.do", method = RequestMethod.POST)
	public String teamcreateForm(Model model) {
		logger.info("[Team Create Form]");
		
		return "teamcreate";
	}
	
	@RequestMapping(value = "teamcreate.do", method = RequestMethod.POST)
	public String teamCreate(Model model, TeamMemberDto dto, RedirectAttributes reat, HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("[Team Create]");
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter pw = response.getWriter();
		int res = teambiz.createTeam(dto);
		model.addAttribute("createTeamRes", res);
		if(res == 11) { //팀명중복.
//			pw.println("<script>toastr.success('같은 팀명이 있습니다.','팀이름 중복',{timeOut:5000});</script>");
			pw.println("<script>alert('같은 팀명이 있습니다.');</script>");
			pw.flush();
			return "teamcreate";
		}
		
		if(res == 22) { //팀생성됨.
			request.getSession().setAttribute("team", teambiz.getTeamInfo(dto));//만든팀까지 합해서 갱신
		}
//		pw.println("<script>alert('팀을 만들었습니다.');</script>");
		//pw.println("<script>toastr.success('팀을 만들었습니다.','팀생성',{timeOut:5000});</script>");
		//pw.flush();
		
		return "teamcreate";
		//return "teamin";
	}
	
	@RequestMapping(value = "team.do", method = RequestMethod.POST)
	public String teamIN(Model model, TeamMemberDto dto, HttpServletRequest request) {
		logger.info("[Team Inner]");
		//팀원초대 신청(팀넘버/초대할아이디) - mail컨트롤러(조회:보낼 이메일주소,)
		//- 코드발송 - 코드확인 - 코드입력(팀메뉴초기생성메뉴에서 코드로 팀가입)
		//- 코드가 저장될 테이블이 필요?(pk, id[받은파람:input], mailcode, 해당팀no[받은파람]
		// table검증은 id,code,teamno 3가지 컬럼값을 and조건으로 다 가지고 있으면 초대한 것으로 확인.
		
		//String sessionval = (String)request.getSession().getAttribute("member.member_id");
		if(request.getSession().getAttribute("member") == null) {//세션확인 후 로그인해제상태면 홈으로...
			//System.out.println("sessionval: "+request.getSession().getAttribute("member"));
			return "redirect:home.do";
		}
		
		//멤버의 팀리스트를 갱신/로드(member_no필요)
		request.getSession().setAttribute("team", teambiz.getTeamInfo(dto));//만든팀까지 합해서 갱신
		//첫페이지 진입시 필요한 기본 팀넘버,이름(멤버의 첫번째 팀을 강제로 선택)
		TeamMemberDto tmdto = teambiz.getTeamInfo(dto).get(0);
		if(tmdto != null) {
			request.getSession().setAttribute("teamInfo", tmdto);
			System.out.println("[con:teamIN]teamInfo.team_no: "+tmdto.getTeam_no());
			//request.getSession().setAttribute("teamMember", teambiz.getTeamMember(tmdto));//기본팀의 멤버리스트(tema_no) 또한 같이 추가
		} else {
			request.getSession().setAttribute("teamInfo", "");
		}
		
		return "teamin";
	}
	
	//팀메인의 버튼
	@RequestMapping(value ="teamcreateBT.do", method = RequestMethod.GET)
	public String teamcreateBT(Model model, @RequestParam("member_id")String member_id) {
		logger.info("[TEAM MAIN: Team Create BTClick]");
		
		return "teamcreate";
	}
	
//	@RequestMapping(value ="teaminvite.do", method = RequestMethod.POST)
//	public String teamInvite(Model model, @RequestParam("member_id")String member_id, @RequestParam("email")String email) {
//		return "teamin";
//	}
	
	//팀아이콘 클릭시 session에 전달해줄 정보(멤버리스트,팀번호/이름)
	@RequestMapping(value ="teamicon.do", method = RequestMethod.POST)
	@ResponseBody
	public TeamMemberDto teamIcon(Model model, @RequestBody TeamMemberDto dto, HttpServletRequest request) {
		System.out.println("[dto]: "+dto);			//team_no,team_name
		List<TeamMemberDto> tmdto = teambiz.getTeamMember(dto);
		TeamMemberDto tmdtoinfo = new TeamMemberDto();
		tmdtoinfo.setTeam_no(dto.getTeam_no());
		tmdtoinfo.setTeam_name(dto.getTeam_name());
		request.getSession().setAttribute("teamMember", tmdto);//팀멤버리스트
		request.getSession().setAttribute("teamInfo", tmdtoinfo);//팀번호/이름
		System.out.println("[teamicon.do] "+tmdtoinfo);
		return tmdtoinfo;
	}

	//초대시 자신이 팀장인지 체크
	@RequestMapping(value = "/chkteamLD.do", method = RequestMethod.GET)
	@ResponseBody
	public int chkteamLD(String member_id, int team_no){ //currId,teamno
		logger.info("[Invite chkteamLD]");
		Email edto = new Email();
		edto.setMember_id(member_id);
		edto.setTeam_no(team_no);
		int res = teambiz.chkteamLD(edto); //팀장 체크
		return res;
	}
	
	@RequestMapping(value = "invite.do", method = RequestMethod.POST)
	@ResponseBody
    public int invite(Email edto, HttpServletRequest request){
		logger.info("[Invite Email]");//edto.getMember_id:초대받는ID
		if(request.getSession().getAttribute("teamInfo") instanceof TeamDto ) {
			TeamDto currentTeam = (TeamDto)request.getSession().getAttribute("teamInfo");//현재 선택팀
			edto.setTeam_no(currentTeam.getTeam_no());//현재선택된Team
		} else if(request.getSession().getAttribute("teamInfo") instanceof Integer) {
			edto.setTeam_no((int)request.getSession().getAttribute("teamInfo"));//현재선택된Team
		}
		
		int res = teambiz.chkISidinTeam(edto); //member_id,team_no //팀초대장 중복확인
        try {
        	if(res > 0) { //1이상이면 중복초대
        		return res;
        	}
			teambiz.invite(edto); //member_id,team_no
		} catch (UnsupportedEncodingException e) {
			System.out.println("[invite.do:mail] 잘못된 인코딩 오류");
			e.printStackTrace();
		} catch (MessagingException e) {
			System.out.println("[invite.do:mail] 메세징오류");
			e.printStackTrace();
		}
        return res;
    }

    //이메일 인증 코드 검증
    @RequestMapping(value = "emailConfirm.do", method = RequestMethod.GET)
    public String emailConfirm(Email edto,Model model,RedirectAttributes rttr) throws Exception { 
    	logger.info("[emailConfirm]");
        int res = 0;
        res = teambiz.emailConfirm(edto);
        if(res == 0) {
            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
            System.out.println("[ct:eamilConfirm] 초대실패");
            return "redirect:/";
        }
        return "home";
    }

    //팀정보누를시 팀원 목록
    @RequestMapping(value= "teamManage.do", method= RequestMethod.POST)
    @ResponseBody
    public List<TeamMemberDto> teamManage(@RequestBody TeamMemberDto tmdto){
    	logger.info("[con:teamManage]");				//memid,teamno
    	List<TeamMemberDto> list = teambiz.getTeamMember(tmdto);
    	
    	return list;
    }
		
	
}
