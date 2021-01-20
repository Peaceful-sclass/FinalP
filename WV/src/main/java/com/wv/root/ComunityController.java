package com.wv.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.ComunityBiz;
import com.wv.root.model.dto.ComunityDto;
import com.wv.root.model.dto.CpDto;
import com.wv.root.model.dto.CpDto.Search;

@Controller
public class ComunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComunityController.class);
	
	@Autowired
	private ComunityBiz combiz;
	
	
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
	
	@RequestMapping(value = "cmwriteform.do", method = RequestMethod.GET)
	public String cmwriteForm() {
		logger.info("[comunity Write form]");
		
		return "comunitywrite";
	}
	
	@RequestMapping(value = "cmwrite.do", method = RequestMethod.GET)
	public String cmwrite(Model model, ComunityDto dto, RedirectAttributes reat) {
		logger.info("[comunity Write]");
		int res = combiz.comInsert(dto);
		
		
		if(res > 0) {
			reat.addAttribute("category", "전체"); //get과 동일방식
//			reat.addFlashAttribute("category", "전체"); //session에 잠시 담고 redirect끝나면 소멸
			return "redirect:comunity.do";
		} else {
			reat.addAttribute("category", "전체");
			reat.addAttribute("result", "false");
			return "redirect:comunity.do";
		}
	}
	
	@RequestMapping(value = "cmdetail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cmDetail(Model model, @RequestBody ComunityDto dto) {
		logger.info("[comunity Detail]");
		ComunityDto res = combiz.selectOne(dto.getCno());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", res);
		return map;
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
