package com.wv.root;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.wv.root.model.dto.TeamDto;
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
		if(res == 11) {
			pw.println("<script>toastr.success('같은 팀명이 있습니다.','팀이름 중복',{timeOut:5000});</script>");
			pw.flush();
			return "teamcreate";
		}
		
		if(res == 22) {
			request.getSession().setAttribute("team", teambiz.getTeamInfo(dto));//만든팀까지 합해서 갱신
		}
		model.addAttribute("createTeamRes", res);
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
		
		return "teamin";
	}
	
	@RequestMapping(value ="teamcreateBT.do", method = RequestMethod.GET)
	public String teamcreateBT(Model model, @RequestParam("member_id")String member_id) {
		logger.info("[TEAM MAIN: Team Create BTClick]");
		
		return "teamcreate";
	}
	
	@RequestMapping(value ="teaminvite.do", method = RequestMethod.POST)
	public String teamInvite(Model model, @RequestParam("member_id")String member_id, @RequestParam("email")String email) {
		
		
		return "teamin";
	}
	
	//팀아이콘 클릭시 session에 전달해줄 정보(멤버리스트,팀번호/이름)
	@RequestMapping(value ="teamicon.do", method = RequestMethod.POST)
	@ResponseBody
	public void teamIcon(Model model, @RequestBody TeamMemberDto dto, HttpServletRequest request) {
		System.out.println("[dto]: "+dto);
		List<TeamMemberDto> tmdto = teambiz.getTeamMember(dto);
		TeamDto tmdtoinfo = new TeamDto();
		tmdtoinfo.setTeam_no(dto.getTeam_no());
		tmdtoinfo.setTeam_name(dto.getTeam_name());
		request.getSession().setAttribute("teamMember", tmdto);//팀멤버리스트
		request.getSession().setAttribute("teamInfo", tmdtoinfo);//팀번호/이름
		//return "통신성공";
	}

	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String RegisterPost(TeamDto team,Model model,RedirectAttributes rttr) throws Exception{
//    
//        System.out.println("regesterPost 진입 ");
//        teambiz.regist(team);
//        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
//        return "redirect:/";
//    }
//
//    //이메일 인증 코드 검증
//    @RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
//    public String emailConfirm(TeamDto team,Model model,RedirectAttributes rttr) throws Exception { 
//        
//        System.out.println("cont get user"+team);
//        TeamDto dto = null;
//        dto = teambiz.userAuth(team);
//        if(dto == null) {
//            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
//            return "redirect:/";
//        }
//        //System.out.println("usercontroller vo =" +vo);
//        model.addAttribute("login",dto);
//        return "/user/emailConfirm";
//    }


		
	
}
