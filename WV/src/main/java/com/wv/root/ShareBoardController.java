package com.wv.root;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.SBCommentBiz;
import com.wv.root.model.biz.ShareBoardBiz;
import com.wv.root.model.dto.SBCommentDto;
import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.util.PageMaker;
import com.wv.root.model.util.SearchCriteria;

@Controller
public class ShareBoardController {
	
	private Logger logger = LoggerFactory.getLogger(ShareBoardController.class);
	
	@Autowired
	private ShareBoardBiz biz;
	
	@Autowired
	private SBCommentBiz commentBiz;
	
	
	
	//게시판 목록 조회
	@RequestMapping(value = "shareBoardList.do", method = RequestMethod.GET)
	public String list(Model model,@ModelAttribute("scri") SearchCriteria scri) {
		logger.info("list");
		
		//지금들어온 팀의 팀번호를 넘겨줘야함
		int team_no=1;
		
		scri.setTeam_no(team_no);
		
		model.addAttribute("list", biz.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(biz.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		return "shareBoardList";
	}
	
	//게시판 조회
	@RequestMapping(value = "shareBoardDetail.do", method = RequestMethod.GET)
	public String detail(ShareBoardDto dto, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		logger.info("detail");
		
		model.addAttribute("dto", biz.selectOne(dto.getBno()));
		model.addAttribute("scri", scri);
		
		List<SBCommentDto> commentList = commentBiz.comment(dto.getBno());
		model.addAttribute("commentList", commentList);
		
		List<Map<String, Object>> fileList = biz.selectFileList(dto.getBno());
		model.addAttribute("file", fileList);
		
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
	public String write(ShareBoardDto dto,MultipartHttpServletRequest mpRequest) {
		logger.info("write");
			
		//지금 들어온 팀의 팀번호 가져와서 써줘야함
		dto.setTeam_no(1);
			
		int res = biz.write(dto,mpRequest);
			
		//성공시
		if(res>0) {
			return "redirect:shareBoardList.do";
		}
		//실패시
		else {
			return "redirect:shareBoardList.do";
		}
			
	}
	
	//게시판 수정 화면
	@RequestMapping(value = "shareBoardupdateView.do", method = RequestMethod.GET)
	public String updateView(ShareBoardDto dto, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		logger.info("updateView");
		
		model.addAttribute("dto", biz.selectOne(dto.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = biz.selectFileList(dto.getBno());
		model.addAttribute("file", fileList);
		
		return "shareBoardupdateView";
	}
	
	//게시판 수정
	@RequestMapping(value = "shareBoardupdate.do",method = RequestMethod.POST)
	public String update(ShareBoardDto dto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr,
			@RequestParam(value="fileNoDel[]") String[] files, @RequestParam(value = "fileNameDel[]") String[] fileNames, MultipartHttpServletRequest mpRequest) {
		logger.info("update");
		
		int res = biz.update(dto, files, fileNames, mpRequest);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		//성공시
		if(res>0) {
			return "redirect:shareBoardList.do";
		}
		//실패시
		else {
			return "redirect:shareBoardList.do";
		}
	}
	
	//게시판 삭제
	@RequestMapping(value = "shareBoardDelete.do",method = RequestMethod.POST)
	public String delete(ShareBoardDto dto, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) {
		logger.info("delete");
		
		
		int res = biz.delete(dto.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		//성공시
		if(res>0) {
			return "redirect:shareBoardList.do";
		}
		//실패시
		else {
			return "redirect:shareBoardList.do";
		}
	}
	
	//댓글 작성
	@RequestMapping(value = "SBCommentWrite.do",method = RequestMethod.POST)
	public String commentWrite(SBCommentDto dto,SearchCriteria scri, RedirectAttributes rttr) {
		logger.info("comment Write");
		
		
		commentBiz.writeComment(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:shareBoardDetail.do";
	}
	
	//댓글 삭제
	@RequestMapping(value = "SBCommentDelete.do",method = RequestMethod.GET)
	public String commentDelete(SBCommentDto dto,SearchCriteria scri, RedirectAttributes rttr) {
		logger.info("comment delete");
		
		commentBiz.deleteComment(dto);
		
		rttr.addAttribute("bno", dto.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:shareBoardDetail.do";
	}
	
	//첨부파일 다운
	@RequestMapping(value = "SBFileDown.do")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws IOException {
		Map<String, Object> resultMap = biz.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String)resultMap.get("ORG_FILE_NAME");
		
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}

}
