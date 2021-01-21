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

import com.wv.root.model.biz.ExcelBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ExcelController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Autowired
	private ExcelBiz biz;

	
	
	@RequestMapping(value = "shareDocumentList.do", method = RequestMethod.GET)
	public String sidemenuex(Locale locale, Model model) {
		logger.info("Excel List");
		
		model.addAttribute("list", biz.selectCol(1));


		return "shareDocumentList";
	}
		
	
}
