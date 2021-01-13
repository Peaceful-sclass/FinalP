package com.wv.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.ComunityBiz;
import com.wv.root.model.dto.ComunityDto;
import com.wv.root.model.dto.CpDto;

@Controller
public class ComunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComunityController.class);
	
	@Autowired
	private ComunityBiz combiz;
	
/*	@RequestMapping(value = "", method = RequestMethod.GET)
	public String comunityMain(Model model, String category) {
		logger.info("[comunity main]");
		List<ComunityDto> list = null;
		if(category!=null) {
//			list = combiz.selectAll(category);
		} else {
			category = "전체";
//			list = combiz.selectAll(category);
		}
		System.out.println("test 카테고리값 >>> "+category);
		System.out.println("test list값 >>> "+list);
		
		CpDto cpdto = new CpDto(list.size(), 1);
		cpdto.setCategory(category);
		System.out.println("test cpdto값 >>> "+cpdto);
		
		model.addAttribute("cpdto", cpdto);
		model.addAttribute("list", list );

		return "comunity";
	}
	*/
	@RequestMapping(value= "comunity.do", method=RequestMethod.GET)
	public String cmPageChange(Model model, @ModelAttribute CpDto oldcpdto) {
		logger.info("[comunity main]");						//초기에 category, currentpage포함
		List<ComunityDto> list = null;
		CpDto cpdto = null;
		
//		if(oldcpdto.getCategory() != null) {
//			cpdto = new CpDto(combiz.selectAll(oldcpdto).size(), oldcpdto.getCurrentPage());
//			list = combiz.selectAll(cpdto);
//		} else {
//			oldcpdto.setCategory("전체");
//			cpdto = new CpDto(combiz.selectAll(oldcpdto).size(), oldcpdto.getCurrentPage());
//			list = combiz.selectAll(cpdto);
//		}
		
		cpdto = new CpDto(combiz.countList(oldcpdto), oldcpdto.getCurrentPage());
		cpdto.setCategory(oldcpdto.getCategory());
		
		list = combiz.selectAll(cpdto);
		System.out.println(list.size());
		System.out.println(cpdto);
		
		model.addAttribute("cpdto", cpdto);
		model.addAttribute("list", list);
		
		return "comunity";
	}
	

	@RequestMapping(value = "comsidemenu.do", method = RequestMethod.POST)
	public String comsidemenu(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "comsidemenu";
	}
	
}
