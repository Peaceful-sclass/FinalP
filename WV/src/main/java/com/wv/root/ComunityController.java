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
import com.wv.root.model.dto.CpDto.Search;

@Controller
public class ComunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComunityController.class);
	
	@Autowired
	private ComunityBiz combiz;
	
//	@RequestMapping(value= "comunity1.do", method=RequestMethod.GET)
//	public String cmPageChange(Model model, CpDto oldcpdto, @ModelAttribute("schdto") CpDto.Search schdto) {
//		logger.info("[comunity main]");						//초기에 category, currentpage포함
//		List<ComunityDto> list = null;
//		CpDto cpdto = null;
//		
//		cpdto = new CpDto(combiz.countList(oldcpdto), oldcpdto.getCurrentPage());
//		cpdto.setCategory(oldcpdto.getCategory());
//		
//		list = combiz.selectAll(cpdto);
//		System.out.println(list.size());
//		System.out.println(cpdto);
//		
//		model.addAttribute("cpdto", cpdto);
//		model.addAttribute("list", list);
//		
//		return "comunity";
//	}
	
	@RequestMapping(value = "comunity.do", method = RequestMethod.GET)
	public String comunityMain(Model model, CpDto dto, @ModelAttribute("schdto") Search schdto) {
		logger.info("[comunity Main]");
		List<ComunityDto> list = null;
		dto.setSearch(schdto); //전달하면 dto 쓰임 끝 
		System.out.println("Test sch--->"+ dto.getSearch());
		
		CpDto cpdto = new CpDto(combiz.countList(dto), dto);
		cpdto.setSearch(schdto); //위의 dto와 다르므로 다시 받아야함 
		System.out.println("Test cpdto값 >>> "+cpdto);
		System.out.println("Test schdto값 >>> "+schdto);
		
		list = combiz.selectAll(cpdto);
		model.addAttribute("cpdto", cpdto );
		model.addAttribute("list", list );

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
