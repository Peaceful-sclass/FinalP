package com.wv.root;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wv.root.model.biz.SBCommentBiz;
import com.wv.root.model.biz.ShareBoardBiz;
import com.wv.root.model.dto.SBCommentDto;
import com.wv.root.model.dto.ShareBoardDto;
import com.wv.root.model.dto.TeamDto;
import com.wv.root.model.dto.TeamDto.TeamMemberDto;
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
	public String list(Model model,@ModelAttribute("scri") SearchCriteria scri,HttpServletRequest request) {
		logger.info("list");
		
		HttpSession session = request.getSession();
		
		//지금들어온 팀의 팀번호를 넘겨줘야함
		TeamMemberDto tdto = (TeamMemberDto)session.getAttribute("teamInfo");
		if(tdto==null ) {
			return "redirect:team.do";
		}
		int team_no= tdto.getTeam_no();
		System.out.println("[con:ShareBoard] team_no:  "+team_no);
		System.out.println("[con:ShareBoard] team_no:  "+tdto);
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
	public String write(ShareBoardDto dto,MultipartHttpServletRequest mpRequest,HttpServletRequest request) {
		logger.info("write");
		
		HttpSession session = request.getSession();
		
		//int team_no= ((TeamDto)session.getAttribute("teamInfo")).getTeam_no();
		
		TeamMemberDto tdto = (TeamMemberDto)session.getAttribute("teamInfo");
		int team_no= tdto.getTeam_no();
		
		dto.setTeam_no(team_no);
			
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
	
	@RequestMapping(value = "SBImageUpload.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception{
		// 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        
        try{
            
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            
            //이미지 경로 생성
            String path = "C:\\\\mp\\\\file\\\\ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
            
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          printWriter.flush();
            
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        
        return;

	}
	
	@RequestMapping(value="ckImgSubmit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName
                            , HttpServletRequest request, HttpServletResponse response)
 throws ServletException, IOException{
        
        //서버에 저장된 이미지 경로
        String path = "C:\\\\mp\\\\file\\\\ckImage/";
    
        String sDirPath = path + uid + "_" + fileName;
    
        File imgFile = new File(sDirPath);
        
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
                
            }catch(IOException e){
                
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }


}
