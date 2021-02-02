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

import com.wv.root.model.biz.CodeBiz;
import com.wv.root.model.dto.CodeDto;


@Controller
public class CodeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CodeBiz biz; //객체로 만들지 않는 이유는 Autowired로 주입시킬 거라!!
	
	@RequestMapping("/list.do")
	public String list(Model model) {
		logger.info("[SELECT LIST]");
		model.addAttribute("list",biz.selectList());
		
		return "codelist"; //view의 이름. mvclist
	}
	
	@RequestMapping("/detail.do")
	public String detail(Model model,int myno) {
		logger.info("[SELECT ONE]");
		model.addAttribute("dto", biz.selectOne(myno)); 
		return "code";
	}
	
	@RequestMapping("/code.do")
	public String code(Model model) {
		
		return "codecate";
	}
	
	@RequestMapping("/insertform.do")
	public String insertForm() {
		logger.info("[INSERT FORM]");
		
		return "codeinsert";
	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(CodeDto dto) {
		logger.info("[INSERT RES]");
		
		int res = biz.insert(dto);
		if(res>0) {
			return "redirect:list.do";
		}else {
			return "redirect:insertform.do";
		}
	}
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int myno) {
		logger.info("[UPDATE FORM]");
		
		model.addAttribute("dto", biz.selectOne(myno));
		
		return "codeupdate";
	}
	
	@RequestMapping("/updateres.do")
	public String updateRes(CodeDto dto) {
		logger.info("[UPDATE RES]");
		
		int res = biz.update(dto);
		if(res>0) {
			return "redirect:detail.do?myno="+dto.getMyno();
		}else {
			return "redirect:updateform.do?myno="+dto.getMyno();
		}
		
	}
	@RequestMapping("/delete.do")
	public String delete(int myno) {
		logger.info("[DELETE]");
		
		int res= biz.delete(myno);
		if(res>0) {
			return "redirect:list.do";
		}else {
			return "redirect:list.do";
		}
		
	}
	
}