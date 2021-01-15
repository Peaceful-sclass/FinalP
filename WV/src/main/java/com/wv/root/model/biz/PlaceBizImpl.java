package com.wv.root.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wv.root.model.dao.PlaceDao;
import com.wv.root.model.dto.PlaceDto;

@Service
public class PlaceBizImpl implements PlaceBiz{
	
	@Autowired
	private PlaceDao dao; 
	
	@Override
	public int insert(PlaceDto dto) {
		return dao.insert(dto);
	}

	@Override
	public List<PlaceDto> placeSelect() {		
		return dao.placeSelect();
	}

}
