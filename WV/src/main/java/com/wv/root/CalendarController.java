package com.wv.root;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.ShareCalendarBiz;
import com.wv.root.model.dto.CalendarDto;
import com.wv.root.model.dto.MemberDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;

@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Autowired
	private ShareCalendarBiz biz;
	
	//일정 가져오기
	@RequestMapping(value = "/shareCalendarList.do", method = RequestMethod.GET)
	public String shareCalendarList(Locale locale, Model model, HttpServletRequest httpServletRequest) {
		logger.info("Calendar List");
		HttpSession session = httpServletRequest.getSession();
		int mem_no = ((MemberDto) session.getAttribute("member")).getMember_no();
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		CalendarDto dto = new CalendarDto(team_no, mem_no);
		
		String result = biz.selectTeamGrade(dto);
		
		System.out.println("등급"+result);
		
		if(result.equals("팀장")) {
			model.addAttribute("list", biz.selectEvent(team_no));
			return "shareCalendar";
		}else {
			model.addAttribute("list", biz.selectEvent(team_no));
			return "shareCalendar2";
		}
		
		
		//팀 넘버가 1일 경우

	}
	
	//일정 추가하기
	@RequestMapping(value = "/shareCalendarInsert.do", method = RequestMethod.GET)
	public String shareCalendarInsert(HttpServletRequest httpServletRequest, Model model) {
		logger.info("Calendar Insert");
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		
		String month = httpServletRequest.getParameter("start").substring(4,7);
		System.out.println("month 값:"+month+"이거임");
		String transMonth=null;
		if(month.equals("Jan")) {
			transMonth = "01";
		}else if(month.equals("Feb")) {
			transMonth = "02";
		}else if(month.equals("Mar")) {
			transMonth = "03";
		}else if(month.equals("Apr")) {
			transMonth = "04";
		}else if(month.equals("May")) {
			transMonth = "05";
		}else if(month.equals("Jun")) {
			transMonth = "06";
		}else if(month.equals("Jul")) {
			transMonth = "07";
		}else if(month.equals("Aug")) {
			transMonth = "08";
		}else if(month.equals("Sep")) {
			transMonth = "09";
		}else if(month.equals("Oct")) {
			transMonth = "10";
		}else if(month.equals("Nov")) {
			transMonth = "11";
		}else if(month.equals("Dec")) {
			transMonth = "12";
		}
		System.out.println(transMonth);
		
		
		String day = httpServletRequest.getParameter("start").substring(8,10);
		String year = httpServletRequest.getParameter("start").substring(11,15);
		
		String transform =year+"-" + transMonth + "-" + day;
		
		System.out.println("title= " + httpServletRequest.getParameter("title"));
		System.out.println("start= " + transform);
		
		CalendarDto dto = new CalendarDto(0, team_no, httpServletRequest.getParameter("title"), transform);
		
		biz.insert(dto);
		

		return "redirect:shareCalendarList.do";
	}
	
	@RequestMapping(value = "/shareCalendarDelete.do", method = RequestMethod.GET)
	public String shareCalendarDelete(HttpServletRequest httpServletRequest, Model model) {
		logger.info("Calendar Delete");
		HttpSession session = httpServletRequest.getSession();
		
		int team_no= ((TeamMemberDto)session.getAttribute("teamInfo")).getTeam_no();
		
		
		CalendarDto dto = new CalendarDto(0, team_no, httpServletRequest.getParameter("start"), null);
		
		System.out.println("start 값:"+httpServletRequest.getParameter("start"));
		

		
		
		int res = biz.delete(dto);
		
		if(res>0) {
			return "redirect:shareCalendarList.do";
		}else {
			return "redirect:shareCalendarList.do";
		}

		

	}
	
	
	
}