package com.wv.root;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import com.wv.root.model.biz.ContestBiz;
import com.wv.root.model.dto.ContestDto;


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
	
	@RequestMapping("/insertContest.do")
	public String insertcontest(MultipartHttpServletRequest mtfRequest, Model model, ContestDto dto) {
		String path = mtfRequest.getSession().getServletContext().getRealPath("/contestfile"); 
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
			String posterName = uid2;
			System.out.println("path:"+ path);
			File uploadFile = new File(path+File.separator+posterName+"_"+oriFileName);
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
		dto.setMemberno(1);
		int res = biz.insert(dto);
		if(res>0) {
			return "redirect:home.do";
		}else {
			return "redirect:contestinsert.do";
		}
	}
	
	
}