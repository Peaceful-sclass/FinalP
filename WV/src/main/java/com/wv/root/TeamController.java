package com.wv.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class TeamController {

	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "team.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("[Team]");



		model.addAttribute("serverTime", "a");

		return "team";
	}

	@RequestMapping(value = "sidemenuex.do", method = RequestMethod.GET)
	public String sidemenuex(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "sidemenuex";
	}
		
	
}
