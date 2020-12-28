package com.wv.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.OutsourcingBiz;

@Controller
public class OutsourcingController {
	
	private static final Logger logger = LoggerFactory.getLogger(OutsourcingController.class);
	
	@Autowired
	private OutsourcingBiz outbiz;
	
	
	@RequestMapping(value = "outsourcing.do", method = RequestMethod.GET)
	public String outMain(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "outsourcing";
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
