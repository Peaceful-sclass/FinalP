package com.wv.root;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.TeamBiz;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Controller
public class TeamController {

	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@Autowired
	private TeamBiz teambiz;
	

	@RequestMapping(value = "teamcreateform.do", method = RequestMethod.POST)
	public String teamcreateForm(Model model) {
		logger.info("[Team Create Form]");
		
		return "teamcreate";
	}
	
	@RequestMapping(value = "teamcreate.do", method = RequestMethod.POST)
	public String teamCreate(Model model, TeamMemberDto dto, RedirectAttributes reat, HttpServletRequest request) {
		logger.info("[Team Create]");
		int res = teambiz.createTeam(dto);
		if(res > 0) {
			request.getSession().setAttribute("team", teambiz.getTeamInfo(dto));
		}
		reat.addFlashAttribute("createTeamRes", res);
		
		return "teamcreate";
	}
	
	@RequestMapping(value = "team.do", method = RequestMethod.POST)
	public String teamIN(Model model) {
		logger.info("[Team Inner]");
		//팀원초대 신청(팀넘버/초대할아이디) - mail컨트롤러(조회:보낼 이메일주소,)
		//- 코드발송 - 코드확인 - 코드입력(팀메뉴초기생성메뉴에서 코드로 팀가입)
		//- 코드가 저장될 테이블이 필요?(pk, id[받은파람:input], mailcode, 해당팀no[받은파람]
		// table검증은 id,code,teamno 3가지 컬럼값을 and조건으로 다 가지고 있으면 초대한 것으로 확인.
		
		return "teamin";
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
