package com.wv.root;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.CodeBiz;
import com.wv.root.model.dto.CodeDto;
import com.wv.root.model.dto.MemberDto;


@Controller
public class CodeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CodeBiz biz; //객체로 만들지 않는 이유는 Autowired로 주입시킬 거라!!
	
	@RequestMapping("/list.do")
	public String list(Model model,int myco) {
		logger.info("[SELECT LIST]");
		model.addAttribute("list",biz.selectGroup(myco));
		model.addAttribute("mycode",myco);
		
		return "codelist"; //view의 이름. mvclist
	}
	@RequestMapping("/listAll.do")
	public String list(Model model) {
		logger.info("[SELECT LIST]");
		model.addAttribute("list",biz.selectList());
		
		return "codelist"; //view의 이름. mvclist
	}
	
	@RequestMapping("/codemain.do")
	public String lis111t(Model model) {
		model.addAttribute("listcode",biz.selectList());
		model.addAttribute("listcode1",biz.selectGroup(1));
		model.addAttribute("listcode2",biz.selectGroup(2));
		model.addAttribute("listcode3",biz.selectGroup(3));
		model.addAttribute("listcode4",biz.selectGroup(4));
		model.addAttribute("listcode5",biz.selectGroup(5));
		model.addAttribute("listcode6",biz.selectGroup(6));
		model.addAttribute("listcode7",biz.selectGroup(7));
		model.addAttribute("listcode8",biz.selectGroup(8));
		
		return "codemain"; //view의 이름. mvclist
	}
	
	@RequestMapping("/detail.do")
	public String detail(Model model,int myno,int myco) {
		logger.info("[SELECT ONE]");
		model.addAttribute("dto", biz.selectOne(myno));
		switch(myco) {
		case 1 :  return "codejavadetail"; 
		case 2 : return "codejavadetail";
		case 3 : return "codejavadetail";
		case 4 : return "codejavadetail";
		case 5 : return "codesql";
		case 6 : return "codejs";
		case 7 : return "codecss";
		case 8 : return "codehtml";
		case 9 : return "code";
		}
		return null;
	}
	
	@RequestMapping("/code.do")
	public String code(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("[SELECT GROUP]");
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto) session.getAttribute("member");
		if(member != null) {
		System.out.println(member.getMember_id());
		return "codecate";
		}
		
		return "home";
		
	}
	
	@RequestMapping("/insertform.do")
	public String insertForm(Model model,int mycode) {
		logger.info("[INSERT FORM]");
		System.out.println(mycode);
		model.addAttribute("myco", mycode);
		switch(mycode) {
		case 1 :  return "codejavainsert"; 
		case 2 : return "codeinsert";
		case 3 : return "codeinsert";
		case 4 : return "codeinsert";
		case 5 : return "codesqlinsert";
		case 6 : return "codejsinsert";
		case 7 : return "codecssinsert";
		case 8 : return "codehtmlinsert";
		case 9 : return "codeinsert";
		}
		return null;

	}
	
	@RequestMapping("/insertres.do")
	public String insertRes(CodeDto dto) {
		logger.info("[INSERT RES]");
		
		int res = biz.insert(dto);
		if(res>0) {
			return "redirect:codemain.do";
		}else {
			return "redirect:insertform.do";
		}
	}
	@RequestMapping("/updateform.do")
	public String updateForm(Model model, int myno,int myco) {
		logger.info("[UPDATE FORM]");
		
		model.addAttribute("dto", biz.selectOne(myno));
		switch(myco) {
		case 1 :  return "codejavaupdate"; 
		case 2 : return "codeupdate";
		case 3 : return "codeupdate";
		case 4 : return "codeupdate";
		case 5 : return "codesqlupdate";
		case 6 : return "codejsupdate";
		case 7 : return "codecssupdate";
		case 8 : return "codehtmlupdate";
		case 9 : return "codeupdate";
		}
		return null;
		
	}
	
	@RequestMapping("/updateres.do")
	public String updateRes(CodeDto dto) {
		logger.info("[UPDATE RES]");
		
		int res = biz.update(dto);
		if(res>0) {
			return "redirect:codemain.do";
		}else {
			return "redirect:updateform.do?myno="+dto.getMyno();
		}
		
	}
	@RequestMapping("/delete.do")
	public String delete(int myno,int myco) {
		logger.info("[DELETE]");
		
		int res= biz.delete(myno);
		if(res>0) {
			return "redirect:list.do?myco="+myco;
		}else {
			return "redirect:list.do";
		}
		
	}
	
}