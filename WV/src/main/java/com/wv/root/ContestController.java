package com.wv.root;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.wv.root.model.biz.ContestBiz;
import com.wv.root.model.dto.ContestDto;
import com.wv.root.model.util.PagingVO;


@Controller
public class ContestController {
private Logger logger = LoggerFactory.getLogger(ContestController.class);
	
	@Autowired
	private ContestBiz biz;
	
	@RequestMapping("/contestinsert.do")
	public String loginform() {
		logger.info("[contestinsert]");
		return "contestinsert";      
	}
	@RequestMapping("/contestlist.do")
	public String boardList(Model model, String nowPage, String cntPerPage, String category, String catTitle) {
		logger.info("[contestlist]"); 
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} 	
		
		if(catTitle==null) {
			int total = biz.countContest();
			PagingVO vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("Clist", biz.selectContest(vo));
			model.addAttribute("paging", vo);			
		}else {
			int total = 0;
			PagingVO vo = null;
			switch (Integer.parseInt(catTitle)) {
			case 1:	
				total = biz.countField(category);
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				vo.setCategory(category);
				model.addAttribute("Clist", biz.fieldcontestList(vo));
				model.addAttribute("paging", vo);
				model.addAttribute("catTitle", catTitle);
				break;
			case 2:
				total = biz.countTarget(category);
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				vo.setCategory(category);
				model.addAttribute("Clist",biz.targetcontestList(vo));
				model.addAttribute("paging", vo);
				model.addAttribute("catTitle", catTitle);
				break;
			case 3: 
				total = biz.countCompany(category);
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				vo.setCategory(category);
				model.addAttribute("Clist",biz.companycontestList(vo));
				model.addAttribute("paging", vo);
				model.addAttribute("catTitle", catTitle);
				break;
			case 4: 
				total = biz.countReward(category);
				vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				vo.setCategory(category);
				model.addAttribute("Clist",biz.rewardcontestList(vo));
				model.addAttribute("paging", vo);
				model.addAttribute("catTitle", catTitle);
				break;
			}
		}
		return "contestlist";
	}
	@RequestMapping("/fieldlist.do")
	public String fieldcontestList(Model model, String category) {
		logger.info("[contestlist]");		
		int total = biz.countField(category);
		int	nowPage = 1;
		int	cntPerPage = 20;
		PagingVO vo = new PagingVO(total, nowPage, cntPerPage);
		vo.setCategory(category);
		model.addAttribute("paging", vo);
		model.addAttribute("Clist",biz.fieldcontestList(vo));
		model.addAttribute("catTitle", "1");
		return "contestlist";      
	}
	@RequestMapping("/targetlist.do")
	public String tagetcontestList(Model model, String category) {
		logger.info("[contestlist]");
		int total = biz.countTarget(category);
		int	nowPage = 1;
		int	cntPerPage = 20;
		PagingVO vo = new PagingVO(total, nowPage, cntPerPage);
		vo.setCategory(category);
		model.addAttribute("paging", vo);
		model.addAttribute("Clist",biz.targetcontestList(vo));
		model.addAttribute("catTitle", "2");
		return "contestlist";      
	}
	@RequestMapping("/companylist.do")
	public String companycontestList(Model model, String category) {
		logger.info("[contestlist]");
		int total = biz.countCompany(category);
		int	nowPage = 1;
		int	cntPerPage = 20;
		PagingVO vo = new PagingVO(total, nowPage, cntPerPage);
		vo.setCategory(category);
		model.addAttribute("paging", vo);
		model.addAttribute("Clist",biz.companycontestList(vo));
		model.addAttribute("catTitle", "3");
		return "contestlist";      
	}
	@RequestMapping("/rewardlist.do")
	public String rewardcontestList(Model model, String category) {
		logger.info("[contestlist]");
		int total = biz.countReward(category);
		int	nowPage = 1;
		int	cntPerPage = 20;
		PagingVO vo = new PagingVO(total, nowPage, cntPerPage);
		vo.setCategory(category);
		model.addAttribute("paging", vo);
		model.addAttribute("Clist",biz.rewardcontestList(vo));
		model.addAttribute("catTitle", "4");
		return "contestlist";      
	}
	
	@RequestMapping("/insertContest.do")
	public String insertcontest(MultipartHttpServletRequest mtfRequest, Model model, ContestDto dto) {
		String path = mtfRequest.getSession().getServletContext().getRealPath("/images"); 
		MultipartFile file = mtfRequest.getFile("file");
		MultipartFile poster = mtfRequest.getFile("poster");
		String uid = UUID.randomUUID().toString().replaceAll("-", "");		
		String uid2 = UUID.randomUUID().toString().replaceAll("-", "");
		if(file != null){
			String oriFileName = file.getOriginalFilename();
			String svaeFileName = uid +"_"+ oriFileName;
			System.out.println(file.getOriginalFilename());
			System.out.println("path:"+ path);
			File uploadFile = new File(path+File.separator+svaeFileName);
			try {
				file.transferTo(uploadFile);
				dto.setContestsvaefilename(svaeFileName);
				dto.setContestorifilename(oriFileName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(poster != null){
			String oriFileName = poster.getOriginalFilename();
			String posterName = uid2+"_"+ oriFileName;
			System.out.println("path:"+ path);
			File uploadFile = new File(path+File.separator+posterName);
			try {
				poster.transferTo(uploadFile);
				dto.setContestposter(posterName);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int res = biz.insert(dto);
		if(res>0) {
			return "redirect:home.do";
		}else {
			return "redirect:contestinsert.do";
		}
	}
	
	@RequestMapping("/contestDetail.do")
	public String contestDetail(Model model, int contestnum) {
		logger.info("[CONTEST DETAIL]");
		model.addAttribute("contest", biz.detailpage(contestnum));
		return "contestdetail";
	}
	
	@RequestMapping("/downcontestfile.do")
	@ResponseBody
	public byte[] fileDownload(HttpServletRequest request, HttpServletResponse response, String name) {
		System.out.println("tsex");
		byte[] down = null;
		try {
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/images");
			File file = new File(path+"/"+name);
			
			down = FileCopyUtils.copyToByteArray(file);
			String filename =  new String(file.getName().substring(file.getName().indexOf("_")+1).getBytes(),"8859_1");
			
			response.setHeader("Content-Disposition", "attachment;filename=\""+filename+"\"");
			response.setContentLength(down.length);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return down;
	}
	
}