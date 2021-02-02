package com.wv.root;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.ShareCalendarBiz;
import com.wv.root.model.dto.CalendarDto;

@Controller
public class CalendarController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Autowired
	private ShareCalendarBiz biz;
	
	//일정 가져오기
	@RequestMapping(value = "/shareCalendarList.do", method = RequestMethod.GET)
	public String shareCalendarList(Locale locale, Model model) {
		logger.info("Calendar List");
		
		//팀 넘버가 1일 경우
		model.addAttribute("list", biz.selectEvent(1));

		return "shareCalendar";
	}
	
	//일정 추가하기
	@RequestMapping(value = "/shareCalendarInsert.do", method = RequestMethod.GET)
	public String shareCalendarInsert(HttpServletRequest httpServletRequest, Model model) {
		logger.info("Calendar Insert");
		
		
		
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
		
		CalendarDto dto = new CalendarDto(0, 1, httpServletRequest.getParameter("title"), transform);
		
		biz.insert(dto);
		

		return "redirect:shareCalendarList.do";
	}
	
	@RequestMapping(value = "/shareCalendarDelete.do", method = RequestMethod.GET)
	public String shareCalendarDelete(HttpServletRequest httpServletRequest, Model model) {
		logger.info("Calendar Delete");
		
		
		System.out.println("start 값:"+httpServletRequest.getParameter("start"));
		

		
		
		int res = biz.delete(httpServletRequest.getParameter("start"));
		
		if(res>0) {
			return "redirect:shareCalendarList.do";
		}else {
			return "redirect:shareCalendarList.do";
		}

		

	}
	
	
	
}