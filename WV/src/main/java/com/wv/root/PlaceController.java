package com.wv.root;

import java.util.HashMap;
import java.util.Map;

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

@Controller
public class PlaceController {

	private Logger logger = LoggerFactory.getLogger(ContestController.class);
	
	@Autowired
	private PlaceBiz biz;
	
	@RequestMapping(value="/placeinsert.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> placeInsert(@RequestBody PlaceDto dto) {
		dto.setMemberno(1);
		System.out.println("소켓"+dto.getSoket());
		System.out.println("컴퓨터"+dto.getCom());
		System.out.println("피플"+dto.getPeople());
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
}