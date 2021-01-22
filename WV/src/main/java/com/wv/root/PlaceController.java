package com.wv.root;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wv.root.model.biz.PlaceBiz;
import com.wv.root.model.dto.PlaceDto;
import com.wv.root.model.dto.Place_likeDto;
import com.wv.root.model.dto.Place_commentDto;

@Controller
public class PlaceController {

	private Logger logger = LoggerFactory.getLogger(ContestController.class);
	
	@Autowired
	private PlaceBiz biz;
	//모임장소 글쓰기
	@RequestMapping(value="/placeinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> placeInsert(@RequestBody PlaceDto dto) {
		dto.setPlike(0);
		int res = biz.insert(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(res>0) {
			map.put("insert", true);
			return map;
		}else {
			map.put("insert", false);
			return map;
		}
	}
	//모임장소글 목록
	@RequestMapping(value="/placeselect.do", method=RequestMethod.POST)
	@ResponseBody
	public List<PlaceDto> select() {
		return biz.placeSelect();
	}
	//모임장소 디테일
	@RequestMapping(value="/placedetail.do", method=RequestMethod.POST)
	@ResponseBody
	public PlaceDto detail(int pno) {
		return biz.placeDetail(pno);		
	}
	//좋아요 여부 확인
	@RequestMapping(value="/likecheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int likecheck(@RequestBody Place_likeDto dto) {
		return biz.likecheck(dto);		
	}
	//좋아요 처음 누를때
	@RequestMapping(value="/likeinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> likeinsert(@RequestBody Place_likeDto dto) {
		dto.setLikecheck(1);
		int res = biz.likeinsert(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(res>0) {
			map.put("insert", true);
			return map;
		}else {
			map.put("insert", false);
			return map;
		}	
	}
	//좋아요 취소
	@RequestMapping(value="/likecancel.do", method=RequestMethod.POST)
	@ResponseBody
	public int likecancel(@RequestBody Place_likeDto dto) {
		return biz.likecancel(dto);		
	}
	//좋아요 다시 누를때
	@RequestMapping(value="/likeupdate.do", method=RequestMethod.POST)
	@ResponseBody
	public int likeupdate(@RequestBody Place_likeDto dto) {
		return biz.likeupdate(dto);		
	}
	//모임장소 댓글 추가
	@RequestMapping(value="/Pcommentinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> commentinsert(@RequestBody Place_commentDto dto) {
		String str = dto.getPcwriter().substring(0, 3)+"****";
		dto.setPcwriter(str);
		int res = biz.commentinsert(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(res>0) {
			map.put("insert", true);
			return map;
		}else {
			map.put("insert", false);
			return map;
		}
	}
	//댓글 리스트
	@RequestMapping(value="/pcommentlist.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Place_commentDto> pcommentlist(int pno) {
		return biz.pcommentlist(pno);
	}
	//댓글 수정
	@RequestMapping(value="/updatePcomment.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> updatePcomment(@RequestBody Place_commentDto dto) {
		int res = biz.commentupdate(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(res>0) {
			map.put("insert", true);
			return map;
		}else {
			map.put("insert", false);
			return map;
		}
	}
	//댓글 삭제
	@RequestMapping(value="/deletePcomment.do", method=RequestMethod.POST)
	@ResponseBody
	public int deletePcomment(int pcno) {
		return biz.commentdelete(pcno);		
	}
	
}