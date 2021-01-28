package com.wv.root;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TeamController {

	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);

	@RequestMapping(value = "team.do", method = RequestMethod.GET)
	public String team(Model model, HttpServletRequest request) {
		logger.info("[Team Select]");


		model.addAttribute("serverTime", 1);

		return "team";
	}


		
	
}
