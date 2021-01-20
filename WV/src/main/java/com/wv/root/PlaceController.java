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

@Controller
public class PlaceController {

	private Logger logger = LoggerFactory.getLogger(ContestController.class);
	
	@Autowired
	private PlaceBiz biz;
	
	@RequestMapping(value="/placeinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> placeInsert(@RequestBody PlaceDto dto) {
		dto.setMemberno(1);
		dto.setPlike(0);
		int res = biz.insert(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(res>0) {
			map.put("check", true);
			return map;
		}else {
			map.put("check", false);
			return map;
		}
	}
	
	@RequestMapping(value="/placeselect.do", method=RequestMethod.POST)
	@ResponseBody
	public List<PlaceDto> select() {
		return biz.placeSelect();
	}
	
	@RequestMapping(value="/placedetail.do", method=RequestMethod.POST)
	@ResponseBody
	public PlaceDto detail(int pno) {
		return biz.placeDetail(pno);		
	}
	
	@RequestMapping(value="/likecheck.do", method=RequestMethod.POST)
	@ResponseBody
	public int likecheck(@RequestBody Place_likeDto dto) {
		return biz.likecheck(dto);		
	}
	
	@RequestMapping(value="/likeinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> likeinsert(@RequestBody Place_likeDto dto) {
		dto.setLikecheck(1);
		int res = biz.likeinsert(dto);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		if(res>0) {
			map.put("check", true);
			return map;
		}else {
			map.put("check", false);
			return map;
		}	
	}
	
	@RequestMapping(value="/likecancel.do", method=RequestMethod.POST)
	@ResponseBody
	public int likecancel(@RequestBody Place_likeDto dto) {
		return biz.likecancel(dto);		
	}
	
	@RequestMapping(value="/likeupdate.do", method=RequestMethod.POST)
	@ResponseBody
	public int likeupdate(@RequestBody Place_likeDto dto) {
		return biz.likeupdate(dto);		
	}
}