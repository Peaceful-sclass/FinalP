package com.wv.root;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wv.root.model.biz.ShareBoardBiz;
import com.wv.root.model.dto.ShareBoardDto;

@Controller
public class ShareBoardController {
	
	private Logger logger = LoggerFactory.getLogger(ShareBoardController.class);
	
	@Autowired
	private ShareBoardBiz biz;
	
	
	
	//게시판 목록 조회
	@RequestMapping("shareBoardList.do")
	public String list(Model model) {
		logger.info("list");
		
		//지금들어온 팀의 팀번호를 넘겨줘야함
		int team_no=1;
		
		model.addAttribute("list", biz.list(team_no));
		
		return "shareBoardList";
	}
	
	//게시판 조회
	@RequestMapping("shareBoardDetail.do")
	public String detail(ShareBoardDto dto, Model model) {
		logger.info("detail");
		
		model.addAttribute("dto", biz.selectOne(dto.getBno()));
		
		return "shareBoardDetail";
	}
	
	//게시판 글 작성 화면
	@RequestMapping(value = "shareBoardwriteView.do", method = RequestMethod.GET)
	public String writeView() {
		logger.info("writeView");
			
		return "shareBoardwriteView";
	}
		
	//게시판 글 작성
	@RequestMapping(value = "shareBoardWrite.do",method = RequestMethod.POST)
	public String write(ShareBoardDto dto) {
		logger.info("write");
			
		//지금 들어온 팀의 팀번호와 로그인한계정의 id를 가져와서 써줘야함
		dto.setTeam_no(1);
		dto.setWriter("user");
			
		int res = biz.write(dto);
			
		//성공시(나중에 바꿀것)
		if(res>0) {
			return "redirect:home.do";
		}
		//실패시
		else {
			return "redirect:home.do";
		}
			
	}
	
	
	//%%%%수정 삭제에 글쓴이인지 확인하는거 추가해야함
	//게시판 수정 화면
	@RequestMapping(value = "shareBoardupdateView.do", method = RequestMethod.GET)
	public String updateView(ShareBoardDto dto, Model model) {
		logger.info("updateView");
		
		model.addAttribute("dto", biz.selectOne(dto.getBno()));
		
		return "shareBoardupdateView";
	}
	
	//게시판 수정
	@RequestMapping(value = "shareBoardupdate.do",method = RequestMethod.POST)
	public String update(ShareBoardDto dto) {
		logger.info("update");
		
		int res = biz.update(dto);
		
		//성공시(나중에 바꿀것)
		if(res>0) {
			return "redirect:home.do";
		}
		//실패시
		else {
			return "redirect:home.do";
		}
	}
	
	//게시판 삭제
	@RequestMapping(value = "shareBoardDelete.do",method = RequestMethod.POST)
	public String delete(ShareBoardDto dto) {
		logger.info("delete");
		
		int res = biz.delete(dto.getBno());
		
		//성공시(나중에 바꿀것)
		if(res>0) {
			return "redirect:home.do";
		}
		//실패시
		else {
			return "redirect:home.do";
		}
	}

}
