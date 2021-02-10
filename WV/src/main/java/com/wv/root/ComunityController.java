package com.wv.root;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.ComunityBiz;
import com.wv.root.model.dto.ComCommentDto;
import com.wv.root.model.dto.ComunityDto;
import com.wv.root.model.dto.CpDto;
import com.wv.root.model.dto.CpDto.Search;

@Controller
public class ComunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(ComunityController.class);
	
	@Autowired
	private ComunityBiz combiz;
	
	
	@RequestMapping(value = "comunity.do", method = RequestMethod.GET)
	public String comunityMain(Model model, CpDto dto, @ModelAttribute("schdto") Search schdto, HttpServletRequest request) {
		logger.info("[comunity Main]");
		List<ComunityDto> list = null;
		dto.setSearch(schdto); //전달하면 dto 쓰임 끝 
		System.out.println("Test sch--->"+ dto.getSearch());
		
		CpDto cpdto = new CpDto(combiz.countList(dto), dto);
		cpdto.setSearch(schdto); //위의 dto와 다르므로 다시 받아야함 
		System.out.println("Test cpdto값 >>> "+cpdto);
		System.out.println("Test schdto값 >>> "+schdto);
		
		list = combiz.selectAll(cpdto);
		List cnolist = new ArrayList(); 
		for(int i=0; i<list.size(); i++) {
			cnolist.add(list.get(i).getCno()); 
		}
		model.addAttribute("cnolist",combiz.cmtCount(cnolist));
		
		model.addAttribute("cpdto", cpdto );
		model.addAttribute("list", list );
		model.addAttribute("res", request.getParameter("res"));

		return "comunity";
	}
	
	@RequestMapping(value = "cmwriteform.do", method = RequestMethod.GET)
	public String cmwriteForm() {
		logger.info("[comunity Write form]");
		
		return "comunitywrite";
	}
	
	@RequestMapping(value = "cmwrite.do", method = RequestMethod.POST)
	public String cmwrite(Model model, ComunityDto dto, RedirectAttributes reat) {
		logger.info("[comunity Write]");
		int res = combiz.comInsert(dto);
		
		reat.addAttribute("category", "전체"); //get과 동일방식
		reat.addAttribute("res", res);
		return "redirect:comunity.do";

	}
	
	@RequestMapping(value = "cmdetail.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> cmDetail(Model model, @RequestBody ComunityDto dto) {
		logger.info("[comunity Detail]");
		System.out.println("dto.getCno: "+dto.getCno());
		ComunityDto res = combiz.selectOne(dto.getCno());
		List<ComCommentDto> res2 = combiz.cmtselectAll(dto.getCno());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", res);
		map.put("cmt", res2);
//		System.out.println("[comunity Detail] : "+map.get("dto") );
		return map;
	}
	
	@RequestMapping(value = "cmdelete.do", method= RequestMethod.POST)
	@ResponseBody
	public int cmDelete(Model model, int cno) {
		logger.info("[comunity Delete]");
//		Map<String,Object> map = new HashMap<String,Object>();
		int res = combiz.comDelete(cno);
		
		return res;
	}
	
	@RequestMapping(value = "cmupdateform.do", method= RequestMethod.GET)
	public String cmupdateForm(Model model, @RequestParam(value="cno") int cno) {
		logger.info("[comunity updateform]");
		ComunityDto dto = combiz.selectOne(cno);
		model.addAttribute("dto", dto);
		return "comunitywrite";
	}
	
	@RequestMapping(value = "cmupdate.do", method= RequestMethod.POST)
	public String cmUpdate(Model model, @ModelAttribute ComunityDto dto, RedirectAttributes reat) {
		logger.info("[comunity update]");
		int res = combiz.comUpdate(dto);
		
		reat.addAttribute("category", "전체");
		reat.addAttribute("res", res);
		return "redirect:comunity.do";
	}
	
	@RequestMapping(value = "cmtreply.do", method=RequestMethod.POST)
	@ResponseBody
	public int cmtReply(@RequestBody ComCommentDto dto){
		logger.info("[comment select]");
		System.out.println("comment dto: "+dto);
		int res = 0;
		if(new Integer(dto.getComcmtgroupno()) == 1) { //임시적으로 담긴 번호 1:answer 2:del 3:reply
			res = combiz.cmtAnswer(dto);
		} else if(new Integer(dto.getComcmtgroupno()) == 2) {
			res = combiz.cmtDelete(dto.getComcmtno());
		} else if(new Integer(dto.getComcmtgroupno()) == 3 ) {
			res = combiz.cmtInsert(dto);
		} else {
			System.out.println("없나?");
		}
		return res;
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
